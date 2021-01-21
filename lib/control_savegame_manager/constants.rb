module ControlSavegameManager
  begin
    # NOTE: I prefer ColorizedString because
    # it does not patch the base behavior of Ruby's String.
    require('colorized_string')
    COLOR     = true
    TRI_LARGE = ColorizedString["▼"].red.on_black
    TRI_SMALL = ColorizedString["▾"].red.on_black
  rescue LoadError
    COLOR     = false
    TRI_LARGE = "▼"
    TRI_SMALL = "▾"
  end
end
