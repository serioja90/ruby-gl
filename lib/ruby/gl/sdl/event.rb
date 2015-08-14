
module Ruby
  class GL
    module SDL
      class Event < FFI::Union
        include Events

        require 'ruby/gl/sdl/events/common_event'
        require 'ruby/gl/sdl/events/window_event'
        require 'ruby/gl/sdl/events/keyboard_event'
        require 'ruby/gl/sdl/events/mouse_motion_event'
        require 'ruby/gl/sdl/events/mouse_button_event'
        require 'ruby/gl/sdl/events/quit_event'
        require 'ruby/gl/sdl/events/syswm_event'

        layout :type,     :uint32,
               :common,   Ruby::GL::SDL::Events::CommonEvent,
               :window,   Ruby::GL::SDL::Events::WindowEvent,
               :key,      Ruby::GL::SDL::Events::KeyboardEvent,
               :edit,     :pointer,
               :text,     :pointer,
               :motion,   Ruby::GL::SDL::Events::MouseMotionEvent,
               :button,   Ruby::GL::SDL::Events::MouseButtonEvent,
               :wheel,    :pointer,
               :jaxis,    :pointer,
               :jball,    :pointer,
               :jhat,     :pointer,
               :jbutton,  :pointer,
               :jdevice,  :pointer,
               :caxis,    :pointer,
               :cbutton,  :pointer,
               :cdevice,  :pointer,
               :quit,     Ruby::GL::SDL::Events::QuitEvent,
               :user,     :pointer,
               :syswm,    Ruby::GL::SDL::Events::SyswmEvent,
               :tfinger,  :pointer,
               :mgesture, :pointer,
               :dgesture, :pointer,
               :drop,     :pointer,
               :padding,  [:uint8, 56]

        attr_reader :type

        def initialize(pointer)
          super pointer

          @type = EventType[self[:type]]
        end

        def self.create_pointer
          FFI::MemoryPointer.new :pointer, Event.size
        end

        def self.create_event(pointer)
          event  = Event.new(pointer)
          result = nil

          case event[:type]
          when EventType[:windowevent]
            result = event[:window]

          when EventType[:keydown], EventType[:keyup]
            result = event[:key]

          when EventType[:mousemotion]
            result = event[:motion]

          when EventType[:mousebuttondown], EventType[:mousebuttonup]
            result = event[:button]

          when EventType[:quit]
            result = event[:quit]

          when EventType[:syswmevent]
            result = event[:syswm]

          else
            result = event
          end

          puts result.inspect

          result
        end
      end
    end
  end
end