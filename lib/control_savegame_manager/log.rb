require 'control_savegame_manager/constants'

module ControlSavegameManager
  module Log
    def self.log(str, **opts)
      STDOUT.puts("[CTRL SGM #{Time.now}] #{TRI_LARGE}  #{str}")
    end # log
  end # module Log

  def Log(str) # NOTE: figure out how to shorthand this
    Log.log(str)
  end # log()
end # module ControlSavegameManager
