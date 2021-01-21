# *Control* Savegame Manager

A little project (originally Ruby, I might massage this into compliable C/C++) that can import, export, and zip savegame files for Remedy's 2019 title "*Control*". I originally created this because I enjoyed *Control* and wanted to be able to play through it again with my wife on PC, but the game only supports a single save slot, despite, apparently, having multiple save files on my version (on Steam). While this tool will not make it "recognize" more than `savegame-slot-00_`, we can at least manipulate the contents of the `savegame-slot-00_` files to coldswap between savefiles.

**NOTE:** I *heavily* discourage modifying the contents in your `savegame-slot-00_` files while the game is open. This easily corrupts the fragile gamestate, which Remedy "solves" by nuking the `00` savefile. TL;DR: *hotswapping can delete your save*. This tool is provided without any guarantees - if you wipe your own savefiles, sorry, but I cannot be held responsible.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'control_savegame_manager'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install control_savegame_manager

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/control_savegame_manager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/control_savegame_manager/blob/master/CODE_OF_CONDUCT.md).

## Additional Notes

I've not seen anywhere that the savefile binary format is well understood. If this is untrue and the `savegame-slot-` is well understood, let me know. Otherwise, I will work on deconstructing and altering the `savegame` files so that players can "cheat" (as much as anyone can in a single-player game). More info to come if I have time to deconstruct the binary format and experiment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ControlSavegameManager project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/control_savegame_manager/blob/master/CODE_OF_CONDUCT.md).
