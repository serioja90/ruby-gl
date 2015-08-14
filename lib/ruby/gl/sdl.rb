require 'ffi'
require 'ruby/gl/sdl/keyboard'
require 'ruby/gl/sdl/events'
require 'ruby/gl/sdl/event'
require 'ruby/gl/sdl/window'
require 'ruby/gl/sdl/surface'
require 'ruby/gl/sdl/gl'

module Ruby
  class GL
    module SDL
      extend FFI::Library

      ffi_lib 'SDL2'

      INIT_TIMER          = 0x00000001
      INIT_AUDIO          = 0x00000010
      INIT_VIDEO          = 0x00000020
      INIT_JOYSTICK       = 0x00000200
      INIT_HAPTIC         = 0x00001000
      INIT_GAMECONTROLLER = 0x00002000
      INIT_EVENTS         = 0x00004000
      INIT_NOPARACHUTE    = 0x00100000
      INIT_EVERYTHING     = (INIT_TIMER | INIT_AUDIO | INIT_VIDEO | INIT_JOYSTICK | INIT_HAPTIC |
                             INIT_GAMECONTROLLER | INIT_EVENTS | INIT_NOPARACHUTE)

      WINDOW_FULLSCREEN         = 0x00000001
      WINDOW_OPENGL             = 0x00000002
      WINDOW_SHOWN              = 0x00000004
      WINDOW_HIDDEN             = 0x00000008
      WINDOW_BORDERLESS         = 0x00000010
      WINDOW_RESIZABLE          = 0x00000020
      WINDOW_MINIMIZED          = 0x00000040
      WINDOW_MAXIMIZED          = 0x00000080
      WINDOW_INPUT_GRABBED      = 0x00000100
      WINDOW_INPUT_FOCUS        = 0x00000200
      WINDOW_MOUSE_FOCUS        = 0x00000400
      WINDOW_FULLSCREEN_DESKTOP = ( WINDOW_FULLSCREEN | 0x00001000 )
      WINDOW_ALLOW_HIGHDPI      = 0x00002000
      WINDOW_MOUSE_CAPTURE      = 0x00004000

      RELEASED = 0
      PRESSED  = 1

      # SDL::init(init_flags)
      attach_function :init, :SDL_Init, [:uint], :int
      attach_function :create_window, :SDL_CreateWindow, [:string, :int, :int, :int, :int, :uint], Window
      attach_function :get_window_surface, :SDL_GetWindowSurface, [Window], Surface
      attach_function :poll_event, :SDL_PollEvent, [:pointer], :int
      attach_function :update_window_surface, :SDL_UpdateWindowSurface, [Window], :int
    end
  end
end