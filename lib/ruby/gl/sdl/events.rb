
module Ruby
  class GL
    module SDL
      module Events
        extend FFI::Library
        ffi_lib 'SDL2'

        EventType = enum(
          :firstevent,               0,
          :quit,                     0x100,
          :app_terminating,
          :app_lowmemory,
          :app_willenterbackground,
          :app_didenterbackground,
          :app_willenterforeground,
          :app_didenterforeground,
          :windowevent,              0x200,
          :syswmevent,
          :keydown,                  0x300,
          :keyup,
          :textediting,
          :textinput,
          :mousemotion,              0x400,
          :mousebuttondown,
          :mousebuttonup,
          :mousewheel,
          :joyaxismotion,            0x600,
          :joyballmotion,
          :joyhatmotion,
          :joybuttondown,
          :joybuttonup,
          :joydeviceadded,
          :joydeviceremoved,
          :controlleraxismotion,     0x650,
          :controllerbuttondown,
          :controllerbuttonup,
          :controllerdeviceadded,
          :controllerdeviceremoved,
          :controllerdeviceremapped,
          :fingerdown,               0x700,
          :fingerup,
          :fingermotion,
          :dollargesture,            0x800,
          :dollarrecord,
          :multigesture,
          :clipboardupdate,          0x900,
          :dropfile,                 0x1000,
          :render_targets_reset,     0x2000,
          :render_device_reset,
          :userevent,                0x8000,
          :lastevent,                0xFFFF
        )

        WindowEventId = enum(
          :none,
          :shown,
          :hidden,
          :exposed,
          :moved,
          :resized,
          :size_changed,
          :minimized,
          :maximized,
          :restored,
          :enter,
          :leave,
          :focus_gained,
          :focus_lost,
          :close
        )
      end
    end
  end
end