
module Ruby
  class GL
    module SDL
      module Events
        class MouseMotionEvent < FFI::Struct
          layout :type, :uint32,
                 :timestamp, :uint32,
                 :windowID,  :uint32,
                 :which,     :uint32,
                 :state,     :uint32,
                 :x,         :int32,
                 :y,         :int32,
                 :xrel,      :int32,
                 :yrel,      :int32

          attr_reader :type, :window_id, :x, :y, :x_motion, :y_motion

          def initialize(pointer)
            super pointer

            @type      = EventType[self[:type]]
            @window_id = self[:windowID]
            @which     = self[:which]
            @state     = self[:state]
            @x         = self[:x]
            @y         = self[:y]
            @x_motion  = self[:xrel]
            @y_motion  = self[:yrel]
          end
        end
      end
    end
  end
end