
module Ruby
  class GL
    module OpenGL
      module RasterFunctions
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Raster Functions
        attach_function :glPixelZoom,      [GLfloat, GLfloat], :void
        attach_function :glPixelStoref,    [GLenum, GLfloat], :void
        attach_function :glPixelStorei,    [GLenum, GLint], :void
        attach_function :glPixelTransferf, [GLenum, GLfloat], :void
        attach_function :glPixelTransferi, [GLenum, GLint], :void
        attach_function :glPixelMapfv,     [GLenum, GLsizei, :pointer], :void
        attach_function :glPixelMapuiv,    [GLenum, GLsizei, :pointer], :void
        attach_function :glPixelMapusv,    [GLenum, GLsizei, :pointer], :void
        attach_function :glGetPixelMapfv,  [GLenum, :pointer], :void
        attach_function :glGetPixelMapuiv, [GLenum, :pointer], :void
        attach_function :glGetPixelMapusv, [GLenum, :pointer], :void
        attach_function :glBitmap,         [GLsizei, GLsizei, GLfloat, GLfloat, GLfloat, GLfloat, :pointer], :void
        attach_function :glReadPixels,     [GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glDrawPixels,     [GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glCopyPixels,     [GLint, GLint, GLsizei, GLsizei, GLenum], :void
      end
    end
  end
end