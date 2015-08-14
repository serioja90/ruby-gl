
module Ruby
  class GL
    module SDL
      module Events
        class CommonEvent < FFI::Struct
          layout :type,      :uint32,
                 :timestamp, :uint32
        end
      end
    end
  end
end