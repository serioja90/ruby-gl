
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

          attr_reader :key, :code, :modifiers

          def initialize(pointer)
            super pointer

            @key       = self[:scancode]
            @code      = self[:sym]
            @modifiers = []
            unless self[:mod] == 0
              # we are sure that there're modifiers
              symbols = KeyModifier.symbols.dup
              symbols.delete :none
              symbols.delete :reserved

              symbols.each do |modifier|
                @modifiers << modifier if (KeyModifier[modifier] & self[:mod]) != 0
              end
            end
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

          attr_reader :type, :window_id, :key, :code, :modifiers

          def initialize(pointer)
            super pointer
            keysym     = self[:keysym]

            @type      = EventType[self[:type]]
            @window_id = self[:windowID]
            @pressed   = ( self[:state] == SDL::PRESSED )
            @repeat    = ( self[:repeat] > 0 )
            @key       = keysym.key
            @code      = keysym.code
            @modifiers = keysym.modifiers
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