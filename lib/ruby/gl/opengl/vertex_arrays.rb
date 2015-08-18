
module Ruby
  class GL
    module OpenGL
      module VertexArrays
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Vertex Arrays
        attach_function :glVertexPointer,     [GLint, GLenum, GLsizei, :pointer], :void
        attach_function :glNormalPointer,     [GLenum, GLsizei, :pointer], :void
        attach_function :glColorPointer,      [GLint, GLenum, GLsizei, :pointer], :void
        attach_function :glIndexPointer,      [GLenum, GLsizei, :pointer], :void
        attach_function :glTexCoordPointer,   [GLint, GLenum, GLsizei, :pointer], :void
        attach_function :glEdgeFlagPointer,   [GLsizei, :pointer], :void
        attach_function :glGetPointerv,       [GLenum, :pointer], :void
        attach_function :glArrayElement,      [GLint], :void
        attach_function :glDrawArrays,        [GLenum, GLint, GLsizei], :void
        attach_function :glDrawElements,      [GLenum, GLsizei, GLenum, :pointer], :void
        attach_function :glInterleavedArrays, [GLenum, GLsizei, :pointer], :void

        # Opengl 1.2
        attach_function :glDrawRangeElements, [GLenum, GLuint, GLuint, GLsizei, GLenum, :pointer], :void
      end
    end
  end
end