
module Ruby
  class GL
    module OpenGL
      module Utils
        def array_to_pointer(target, type)
          pointer = FFI::MemoryPointer.new type, target.size
          pointer.send "write_array_of_#{type}", target
          return pointer
        end
      end
    end
  end
end