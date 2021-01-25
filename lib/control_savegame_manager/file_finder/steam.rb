require 'pp'
require 'win32/registry'

require 'control_savegame_manager/log'

module ControlSavegameManager
  module FileFinder
    module Steam
      # 1. find all the files
      # 2. identify which steam user id to use
      # 3. return the folder
      def self.run()
        Log.log("Control Savegame Manager - Steam Version  #{TRI_LARGE}")
        'C:\Program Files (x86)\Steam\userdata\120317690\870780\remote'
        path = nil
        Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\WOW6432Node\Valve\Steam',
          Win32::Registry::KEY_READ) do |register|
          path = register['InstallPath']
        end # Win32::Registry
        dir_path = File.join(path.gsub('\\','/'),'userdata','*','870780','remote')
        Log.log(dir_path)
        files = Dir[ File.join(dir_path,'savegame-slot-*') ]
        sleep(1)
        if( files.count == 0 )
          return false
        else
          user_slot_hash = {}
          files.each do |file|
            # user_slot_hash[ steamid ][   slotid  ][ filename ]
            /userdata\/(.*)\/870780\/remote\/savegame-slot-(.*)_(\w*)$/.match(file) do |match|
              user_slot_hash[ match[1] ] ||= {}
              user_slot_hash[ match[1] ][ match[2] ] ||= DEFAULT_FILE_HASH.dup
              user_slot_hash[ match[1] ][ match[2] ][ match[3] ] = true
            end # .match()
          end # files.each
          user_slot_hash.each_pair do |steamid, hash|
            Log.log("Steam/userdata/#{steamid}:\n" + FileFinder.inspect(hash))
          end
          #Log.log( user_slot_hash.pretty_inspect() )
        end # if files.count
      end # self.run()
    end # module Steam
  end # module FileFinder
end # module ControlSavegameManager
