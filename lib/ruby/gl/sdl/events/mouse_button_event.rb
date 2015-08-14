
module Ruby
  class GL
    module SDL
      module Events
        class MouseButtonEvent < FFI::Struct
          include SDL::Events

          layout :type,      :uint32,
                 :timestamp, :uint32,
                 :windowID,  :uint32,
                 :which,     :uint32,
                 :button,    :uint8,
                 :state,     :uint8,
                 :clicks,    :uint8,
                 :padding1,  :uint8,
                 :x,         :int32,
                 :y,         :int32

          attr_reader :type, :window_id, :button, :clicks, :x, :y
          def initialize(pointer)
            super pointer

            @type = EventType[self[:type]]
            @window_id = self[:windowID]
            @button    = MouseButton[self[:button]]
            @pressed   = ( self[:state] == SDL::PRESSED )
            @clicks    = self[:clicks]
            @x         = self[:x]
            @y         = self[:y]
          end

          def down?
            @type == :mousebuttondown
          end

          def up?
            @type == :mousebuttonup
          end

          def pressed?
            @pressed
          end

          def released?
            !@pressed
          end

          def left?
            @button == :left
          end

          def right?
            @button == :right
          end

          def middle?
            @button == :middle
          end

          def x1?
            @button == :x1
          end

          def x2?
            @button == :x2
          end
        end
      end
    end
  end
end