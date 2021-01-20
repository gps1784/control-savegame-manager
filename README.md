# *Control* Savegame Manager

A little project (originally Ruby, I might massage this into compliable C/C++) that can import, export, and zip savegame files for Remedy's 2019 title "*Control*". I originally created this because I enjoyed *Control* and wanted to be able to play through it again with my wife on PC, but the game only supports a single save slot, despite, apparently, having multiple save files on my version (on Steam). While this tool will not make it "recognize" more than `savegame-slot-00_`, we can at least manipulate the contents of the `savegame-slot-00_` files to coldswap between savefiles.

**NOTE:** I *heavily* discourage modifying the contents in your `savegame-slot-00_` files while the game is open. This easily corrupts the fragile gamestate, which Remedy "solves" by nuking the `00` savefile. TL;DR: *hotswapping can delete your save*. This tool is provided without any guarantees - if you wipe your own savefiles, sorry, but I cannot be held responsible.

# Additional Notes

I've not seen anywhere that the savefile binary format is well understood. If this is untrue and the `savegame-slot-` is well understood, let me know. Otherwise, I will work on deconstructing and altering the `savegame` files so that players can "cheat" (as much as anyone can in a single-player game). More info to come if I have time to deconstruct the binary format and experiment.
