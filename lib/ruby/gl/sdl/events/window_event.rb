
module Ruby
  class GL
    module SDL
      module Events
        class WindowEvent < FFI::Struct
          include SDL::Events

          layout :type,      :uint32,
                 :timestamp, :uint32,
                 :windowID,  :uint32,
                 :event,     :uint8,
                 :padding1,  :uint8,
                 :padding2,  :uint8,
                 :padding3,  :uint8,
                 :data1,     :int32,
                 :data2,     :int32

          attr_reader :type, :window_id, :padding1,
                      :padding2, :padding3, :data1, :data2

          def initialize(pointer)
            super pointer
            @type      = WindowEventId[self[:event]]
            @window_id = self[:windowID]
            @padding1  = self[:padding1]
            @padding2  = self[:padding2]
            @padding3  = self[:padding3]
            @data1     = self[:data1]
            @data2     = self[:data2]
          end
        end
      end
    end
  end
end