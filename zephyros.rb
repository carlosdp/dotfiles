require '/Applications/Zephyros.app/Contents/Resources/libs/zephyros.rb'

API.bind "K", ["cmd"] do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  win.frame = frame
end

API.bind ".", ["cmd"] do
  win = API.focused_window
  frame = win.screen.next_screen.frame_without_dock_or_menu
  win.frame = frame
end

API.bind "L", ["cmd"] do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.w /= 2
  win.frame = frame
end

API.bind "L", ["cmd", "shift"] do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.w /= 2
  frame.x += frame.w
  win.frame = frame
end

wait_on_callbacks
