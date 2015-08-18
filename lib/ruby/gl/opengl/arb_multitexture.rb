
module Ruby
  class GL
    module OpenGL
      module ARBMultitexture
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # ARB Multitexture
        attach_function :glActiveTextureARB,       [GLenum], :void
        attach_function :glClientActiveTextureARB, [GLenum], :void
        attach_function :glMultiTexCoord1dARB,     [GLenum, GLdouble], :void
        attach_function :glMultiTexCoord1dvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1fARB,     [GLenum, GLfloat], :void
        attach_function :glMultiTexCoord1fvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1iARB,     [GLenum, GLint], :void
        attach_function :glMultiTexCoord1ivARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1sARB,     [GLenum, GLshort], :void
        attach_function :glMultiTexCoord1svARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2dARB,     [GLenum, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord2dvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2fARB,     [GLenum, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord2fvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2iARB,     [GLenum, GLint, GLint], :void
        attach_function :glMultiTexCoord2ivARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2sARB,     [GLenum, GLshort, GLshort], :void
        attach_function :glMultiTexCoord2svARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3dARB,     [GLenum, GLdouble, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord3dvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3fARB,     [GLenum, GLfloat, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord3fvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3iARB,     [GLenum, GLint, GLint, GLint], :void
        attach_function :glMultiTexCoord3ivARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3sARB,     [GLenum, GLshort, GLshort, GLshort], :void
        attach_function :glMultiTexCoord3svARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4dARB,     [GLenum, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord4dvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4fARB,     [GLenum, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord4fvARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4iARB,     [GLenum, GLint, GLint, GLint, GLint], :void
        attach_function :glMultiTexCoord4ivARB,    [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4sARB,     [GLenum, GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glMultiTexCoord4svARB,    [GLenum, :pointer], :void

      end
    end
  end
end