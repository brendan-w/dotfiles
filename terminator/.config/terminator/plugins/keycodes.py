from terminatorlib.terminal import Terminal

# This file doesn't actually define a plugin, but putting it here lets it
# monkey patch on startup.
available = AVAILABLE = []

# Add handlers for custom keycodes that don't have proper representations/escape codes.
# Assign these names (without the "key_" prefix) in your keybinding config

# On a Ctrl-Backspace, we want to emulate Alt-Backspace, which is almost always ESC DEL ("\x1b\x7f").
setattr(Terminal, 'key_custom_ctrl_backspace', lambda self: self.vte.feed_child('\x1b\x7f'))

# Square brackets don't play well with escape codes, so map them to somthing custom
setattr(Terminal, 'key_custom_ctrl_bracket_left', lambda self: self.vte.feed_child('\x1bbracketleft'))
setattr(Terminal, 'key_custom_ctrl_bracket_right', lambda self: self.vte.feed_child('\x1bbracketright'))

# For some reason, Terminator transmits Ctrl-Shift-Left and Ctrl-Shift-Right, but not the up and down
setattr(Terminal, 'key_custom_ctrl_shift_up', lambda self: self.vte.feed_child('\x1b[1;6A'))
setattr(Terminal, 'key_custom_ctrl_shift_down', lambda self: self.vte.feed_child('\x1b[1;6B'))