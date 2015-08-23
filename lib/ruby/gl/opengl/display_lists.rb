
module Ruby
  class GL
    module OpenGL
      module DisplayLists
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Display Lists
        attach_function :_glIsList, :glIsList, [GLuint], GLboolean

        def glIsList(list)
          return (_glIsList(list) == GL_TRUE)
        end

        attach_function :glDeleteLists, [GLuint, GLsizei], :void
        attach_function :glGenLists,    [GLsizei], GLuint
        attach_function :glNewList,     [GLuint, GLenum], :void
        attach_function :glEndList,     [], :void
        attach_function :glCallList,    [GLuint], :void
        attach_function :glCallLists,   [GLsizei, GLenum, :pointer], :void
        attach_function :glListBase,    [GLuint], :void

      end
    end
  end
end