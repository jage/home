" Vim syntax file
" Language:	eRuby
" Maintainer:	Doug Kearns <djkea2 at gus.gscit.monash.edu.au>
" Info:		$Id: eruby.vim,v 1.6 2005/09/13 04:26:56 dkearns Exp $
" URL:		http://vim-ruby.sourceforge.net
" Anon CVS:	See above site
" Licence:	GPL (http://www.gnu.org)
" Disclaimer:
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'eruby'
endif

if version < 600
  so <sfile>:p:h/html.vim
  syn include @rubyTop <sfile>:p:h/ruby.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
  syn include @rubyTop syntax/ruby.vim
endif

syn cluster erubyRegions contains=erubyOneLiner,erubyBlock,erubyExpression,erubyComment

syn region  erubyOneLiner   matchgroup=erubyDelimiter start="^%%\@!" end="$"  contains=@rubyTop	       containedin=ALLBUT,@erubyRegions keepend oneline
syn region  erubyBlock	    matchgroup=erubyDelimiter start="<%%\@!" end="%>" contains=@rubyTop	       containedin=ALLBUT,@erubyRegions
syn region  erubyExpression matchgroup=erubyDelimiter start="<%="    end="%>" contains=@rubyTop	       containedin=ALLBUT,@erubyRegions
syn region  erubyComment    matchgroup=erubyDelimiter start="<%#"    end="%>" contains=rubyTodo,@Spell containedin=ALLBUT,@erubyRegions keepend

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_eruby_syntax_inits")
  if version < 508
    let did_ruby_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink erubyDelimiter		Delimiter
  HiLink erubyComment		Comment

  delcommand HiLink
endif
let b:current_syntax = "eruby"

if main_syntax == 'eruby'
  unlet main_syntax
endif

" vim: nowrap sw=2 sts=2 ts=8 ff=unix:
