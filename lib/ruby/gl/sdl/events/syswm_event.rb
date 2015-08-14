
module Ruby
  class GL
    module SDL
      module Events
        class SyswmEvent < FFI::Struct
          layout :type,      :uint32,
                 :timestamp, :uint32,
                 :msg,       :pointer

          attr_accessor :type, :timestamp

          def initialize(pointer)
            super pointer

            @type      = self[:type]
            @timestamp = self[:timestamp]
          end
        end
      end
    end
  end
end