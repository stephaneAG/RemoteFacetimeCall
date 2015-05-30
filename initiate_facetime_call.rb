#
# RemoteFacetimeCall - StephaneAG 2K12
#

#initiate_facetime_call.rb v1a

require 'rubygems'
require 'appscript'
include Appscript
require 'osax'
include OSAX

# 0 > open terminal
terminalApp = Appscript.app("/Applications/Utilities/Terminal.app")
terminalApp.activate

# 1 > use a terminal cmd to open the Facetime URL in Safari app
cmd = "/usr/bin/open -a Safari facetime://+33681382722" 
system (cmd)

# 2 > wait a little bit for Facetime to activate, then switch back to "previous app in front"[ it should be the empty safari tab], delete the tab (cmd + W), switch back to Facetime and initiate call by hitting Enter
sleep(5) #wait 5s

`osascript -e 'tell application "System Events" to keystroke (ASCII character 9) using command down'` # switch back to safari empty tab (the one that got opped up after opening the link from the terminal)

sleep(1) #wait 2s

`osascript -e 'tell application "System Events" to keystroke (ASCII character 119) using command down'` # delete the empty tab

sleep(1) #wait 0.5s

`osascript -e 'tell application "System Events" to keystroke (ASCII character 9) using command down'` # switch back to facetime

sleep(1) #wait 0.5s

`osascript -e 'tell application "System Events" to keystroke return'` # initiate call by "hitting Enter key" [^^!]

# 2 > Done! Your Mac should now be calling you
