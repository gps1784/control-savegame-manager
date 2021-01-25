require "control_savegame_manager/file_finder/epic"
require "control_savegame_manager/file_finder/manual"
require "control_savegame_manager/file_finder/steam"

module ControlSavegameManager
  module FileFinder
    DEFAULT_FILE_HASH = {
      'global'      => false, # global data?
      'meta'        => false, # meta data?
      'persistent'  => false, # persistent data?
      'hub'         => false, # executive sector?
      'maintenance' => false, # maintenence sector
      'research'    => false, # research sector
      'containment' => false, # containment sector
      'expedition'  => false, # jukebox?
      'foundation'  => nil,   # DLC 1: Foundation
      'awe'         => nil,   # DLC 2: AWE
    }
    def self.inspect(hash = DEFAULT_FILE_HASH)
      str = ""
      hash.each_pair do |slotid, hash2|
        str += "#{TRI_SMALL} savegame-slot-#{slotid}:\t"
        hash2.each_pair do |key,value|
          if( value == true )
            if( COLOR )
              str += ColorizedString["✓ #{key} "].green
            else
              str += "✓ #{key} "
            end
          elsif( value == false )
            if( COLOR )
              str += ColorizedString["✗ #{key} "].red
            else
              str += "✗ #{key} "
            end
          end
        end # hash.each_pair
        str += "\n"
      end # hash.each_pair
      return str
    end # self.inspect
  end # module FileFinder
end # module ControlSavegameManager
