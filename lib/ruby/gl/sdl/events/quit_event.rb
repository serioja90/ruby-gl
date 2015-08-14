
module Ruby
  class GL
    module SDL::Events
      class QuitEvent < FFI::Struct
        layout :type,      :uint,
               :timestamp, :uint

        attr_reader :type, :timestamp

        def initialize(pointer)
          super(pointer)
          @type      = :quit
          @timestamp = self[:timestamp]
        end
      end
    end
  end
end