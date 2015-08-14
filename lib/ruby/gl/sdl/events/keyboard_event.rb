
module Ruby
  class GL
    module SDL
      module Events
        class Keysymbol < FFI::Struct
          include Ruby::GL::SDL::Keyboard

          layout :scancode, Scancode,
                 :sym,      :int,
                 :mod,      :uint16,
                 :unused,   :uint32

          attr_reader :key, :code, :modifier

          def initialize(pointer)
            super pointer

            @key      = self[:scancode]
            @code     = self[:sym]
            @modifier = KeyModifier[self[:mod]]
          end
        end

        class KeyboardEvent < FFI::Struct
          include SDL::Events

          layout :type,      :uint32,
                 :timestamp, :uint32,
                 :windowID,  :uint32,
                 :state,     :uint8,
                 :repeat,    :uint8,
                 :padding2,  :uint8,
                 :padding3,  :uint8,
                 :keysym,    Keysymbol

          attr_reader :type

          def initialize(pointer)
            super pointer
            @type    = EventType[self[:type]]
            @pressed = ( self[:state] == SDL::PRESSED )
            @repeat  = ( self[:repeat] > 0 )

            keysym    = self[:keysym]
            @key      = keysym.key
            @code     = keysym.code
            @modifier = keysym.modifier
          end

          def pressed?
            @pressed
          end

          def released?
            !@pressed
          end

          def repeat?
            @repeat
          end
        end
      end
    end
  end
end