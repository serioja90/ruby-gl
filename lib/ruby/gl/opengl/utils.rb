
module Ruby
  class GL
    module OpenGL
      module Utils
        GL_FALSE = 0
        GL_TRUE  = 1

        def array_to_pointer(target, type)
          pointer = FFI::MemoryPointer.new type, target.size
          pointer.send "write_array_of_#{type}", target
          return pointer
        end

        def to_glbool(value)
          value.is_a?(Fixnum) ? (value == GL_TRUE) : (value ? GL_TRUE : GL_FALSE)
        end
      end
    end
  end
end