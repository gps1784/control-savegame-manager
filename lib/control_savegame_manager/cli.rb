require "optparse"

require "control_savegame_manager/constants"
require "control_savegame_manager/log"
require "control_savegame_manager/version"

module ControlSavegameManager
  module CLI
    def self.optparse()
      opts = {}
      op = OptionParser.new do |o|
        o.banner = "Usage: #{File.basename(__FILE__)} [options]"

        o.on('-s','--steam','Search for Steam version') do
          opts[:steam] = true
        end # --steam

        o.on('-e','--epic','Search for Epic version') do
          opts[:epic] = true
        end # --epic

        o.on('-dDIR','--dir=DIR','Search for savegame files in DIR') do |dir|
          opts[:manual] = dir
        end # --dir

        o.on('-q','--quiet','Supress logging to stdout') do
          opts[:quiet] = true
        end # --quiet

        o.on('-h','--help','Prints this message') do
          puts o
          exit
        end # --help
      end # OptionParser.new

      op.parse!(**opts)
      return opts
    end # self.optparse()

    def self.promptch(banner, choices, **opts)
      ch      = nil
      key     = nil
      valid   = false
      while( !valid )
        str_out = "#{banner}\n"
        choices.each_with_index do |(key, value), idx|
          if( COLOR )
            str_out += ColorizedString["   #{idx+1}"].bold + ". #{value}\n"
          else
            str_out += "   #{idx+1}. #{value}\n"
          end
        end # choices.each
        Log.log(str_out)
        STDOUT.print(" #{TRI_SMALL} ")
        ch   = STDIN.gets()[0]
        ch_i = ch.to_i
        if( ch_i.to_s == ch && ch_i > 0)
          key = choices.keys[ch.to_i-1]
        else
          key = ch.downcase()
        end
        if( choices[key] )
          return key
        else
          Log.log("Invalid: #{ch}")
        end
      end # while !valid
    end # self.promptch()

    def self.run()
      opts = optparse()
      Log.log("Control Savegame Manager  #{TRI_LARGE}")
      if( opts[:steam].nil? && opts[:epic].nil? && opts[:manual].nil? )
        prompt = "Select your version:"
        if( COLOR )
          choices = {
            "s" => "[" + ColorizedString["S"].bold + "]team version",
            "e" => "[" + ColorizedString["E"].bold + "]pic version",
            "m" => "[" + ColorizedString["M"].bold + "]anually locate directory",
          }
        else
          choices = {
            "s": "[S]team version",
            "e": "[E]pic version",
            "m": "[M]anually locate directory",
          }
        end
        version = promptch(prompt, choices)
        Log.log(version.inspect)
      end # if opts...
    end # self.run()
  end # module CLI
end # module ControlSavegameManager
