
module Ruby
  class GL
    module SDL
      class Surface < FFI::Struct
        layout :flags, :uint,
               :w,     :int,
               :h,     :int,
               :pitch, :int,
               :locked, :int
      end
    end
  end
end