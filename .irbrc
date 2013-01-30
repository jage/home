IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:LOAD_MODULES] = []  unless IRB.conf.key?(:LOAD_MODULES)
unless IRB.conf[:LOAD_MODULES].include?('irb/completion')
  IRB.conf[:LOAD_MODULES] << 'irb/completion'
end 
unless IRB.conf[:LOAD_MODULES].include?('irb/ext/save-history')
  IRB.conf[:LOAD_MODULES] << 'irb/ext/save-history'
end
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = '~/.irb-history'
