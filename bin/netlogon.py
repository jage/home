#!/usr/bin/python
#-*- coding: utf-8 -*-

import urllib2
import urllib
import getpass
import sys
import getopt
from HTMLParser import HTMLParser

class ParseResult(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self._title = 0
        self.title = ""
        self.message = ""
        self._i = 0
        self.dfl_type = "lysator"
        self.dfl_user = ""
        self.dfl_save = 0
    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag.lower() == "title":
            self._title = 1
        elif tag.lower() == "i":
            self._i = 1
        if tag.lower() == "option":
            if "selected" in attrs:
                self.dfl_type = attrs['value']
        if tag.lower() == "input":
            if not 'name' in attrs:
                return
            if attrs['name'] == "user":
                self.dfl_user = attrs['value']
            elif attrs['name'] == "save":
                self.dfl_save = "checked" in attrs
    def handle_endtag(self, tag):
        if tag.lower() == "title":
            self._title = 0
        elif tag.lower() == "i":
            self._i = 0
    def handle_data(self, data):
        if self._title == 1:
            self.title = data
        if self._i == 1:
            self.message = data


def help():
    print """Användning: %s [flaggor] [användarnamn]

Flaggor:
	-t typ, --type	Specifierar kontotyp. Typ är något av:
        		  ldap: Centralt användarnamn (studenter och anställda)
                          epost: Konto på epost.liu.se
                          lysator: Lysator-användare
                          ifm: IFM/IKP/ISY modemanvändare
                          ida: IDA-användare (forskardomänen)
                          temp: Tillfälligt konto
        -i, --in	Påloggning (förvalt)
        -o, --out	Avloggning
        -s, --save	Spara informationen på Netlogon-servern (ej lösenord)
        -n, --nosave	Spara inte informationen på Netlogon-servern

Om typ, användarnamn eller save inte specifieras så används serverns sparade värden om de finns.
""" % sys.argv[0]
    
# List of legal account types
types = ["ldap", "epost", "lysator", "ifm", "ida", "temp"]

opt = getopt.getopt(sys.argv[1:], "t:iohsn", ("in", "out", "type=", "help", "save", "nosave"))
options = dict(opt[0])

if "-h" in options or "--help" in options:
    help()
    sys.exit(0)

        
url = "https://netlogon.liu.se/logon.cgi"
p = ParseResult()
a = urllib2.urlopen(url)
p.feed(a.read())

#Retrieve the default values
type = p.dfl_type
user = p.dfl_user
save = p.dfl_save
#Check for save flag
if "-s" in options or "--save" in options:
    save = 1
if "-n" in options or "--nosave" in options:
    save = 0

    
if "-o" in options or "--out" in options:
    #Logout specified
    if "-i" in options or "--in" in options:
        #Can't log both log in and out!
        print "Bestäm dig! Vill du logga in eller ut?"
        sys.exit(1)
    action = "logout"
else:
    action = "login"
    t = None
    if "-t" in options: 
        t = options['-t']
    elif "--type" in options:
        t = options['--type']
    if t:
        if t in types:
            type = t
        else:
            print "Ogiltig kontotyp."
            help()
            sys.exit(1)
    if len(opt[1]) > 1:
        print "Felaktigt antal argument"
        help()
        sys.exit(1)
    if len(opt[1]) == 1:
        user = opt[1][0]

if p.title == "Netlogon: avloggning":
    inloggad = 1
else:
    inloggad = 0

if action == "login":
    if inloggad == 1:
        #Already logged in
        print "Kan inte logga in, du är redan inloggad!"
        sys.exit(1)

    print "Loggar in %s med typ %s. Sparar%s värdena." % (user, type,
                                                          not save and " inte" or "")
    fields = {'type': type,
              'user': user,
              'password': getpass.getpass(),
              'lang': 'sv',
              'func': 'logon'}
    if save:
        fields['save'] = '1'

    d = urllib.urlencode(fields)
    a = urllib2.urlopen(url, d)
    
    result = a.read()
    p.feed(result)
    print p.title
    if p.title != "Netlogon: påloggning klar":
        print p.message
        
elif action == "logout":
    if inloggad == 0:
        #Not logged in
        print "Kan inte logga ut, du är inte inloggad!"
        sys.exit(1)

    d = urllib.urlencode({'func': 'logoff'})
    a = urllib2.urlopen(url, d)
    result = a.read()
    p.feed(result)
    print p.title
    if p.title != "Netlogon: avloggning klar":
        print p.message
