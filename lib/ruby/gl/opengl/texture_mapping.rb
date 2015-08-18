
module Ruby
  class GL
    module OpenGL
      module TextureMapping
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # Texture Mapping
        attach_function :glTexGend,                [GLenum, GLenum, GLdouble], :void
        attach_function :glTexGenf,                [GLenum, GLenum, GLfloat], :void
        attach_function :glTexGeni,                [GLenum, GLenum, GLint], :void
        attach_function :glTexGendv,               [GLenum, GLenum, :pointer], :void
        attach_function :glTexGenfv,               [GLenum, GLenum, :pointer], :void
        attach_function :glTexGeniv,               [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexGendv,            [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexGenfv,            [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexGeniv,            [GLenum, GLenum, :pointer], :void
        attach_function :glTexEnvf,                [GLenum, GLenum, GLfloat], :void
        attach_function :glTexEnvi,                [GLenum, GLenum, GLint], :void
        attach_function :glTexEnvfv,               [GLenum, GLenum, :pointer], :void
        attach_function :glTexEnviv,               [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexEnvfv,            [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexEnviv,            [GLenum, GLenum, :pointer], :void
        attach_function :glTexParameterf,          [GLenum, GLenum, GLfloat], :void
        attach_function :glTexParameteri,          [GLenum, GLenum, GLint], :void
        attach_function :glTexParameterfv,         [GLenum, GLenum, :pointer], :void
        attach_function :glTexParameteriv,         [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexParameterfv,      [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexParameteriv,      [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexLevelParameterfv, [GLenum, GLint, GLenum, :pointer], :void
        attach_function :glGetTexLevelParameteriv, [GLenum, GLint, GLenum, :pointer], :void
        attach_function :glTexImage1D,             [GLenum, GLint, GLint, GLsizei, GLint, GLenum, GLenum,:pointer], :void
        attach_function :glTexImage2D,             [GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, :pointer], :void
        attach_function :glGetTexImage,            [GLenum, GLint, GLenum, GLenum, :pointer], :void

        # OpenGL 1.1
        attach_function :glGenTextures,         [GLsizei, :pointer], :void
        attach_function :glDeleteTextures,      [GLsizei, :pointer], :void
        attach_function :glBindTexture,         [GLenum, GLuint], :void
        attach_function :glPrioritizeTextures,  [GLsizei, :pointer, :pointer], :void
        attach_function :glAreTexturesResident, [GLsizei, :pointer, :pointer], GLboolean
        attach_function :glIsTexture,           [GLuint], GLboolean
        attach_function :glTexSubImage1D,       [GLenum, GLint, GLint, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glTexSubImage2D,       [GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glCopyTexImage1D,      [GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint], :void
        attach_function :glCopyTexImage2D,      [GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint], :void
        attach_function :glCopyTexSubImage1D,   [GLenum, GLint, GLint, GLint, GLint, GLsizei], :void
        attach_function :glCopyTexSubImage2D,   [GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei], :void

        # OpenGL 1.2
        attach_function :glTexImage3D,        [GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, :pointer], :void
        attach_function :glTexSubImage3D,     [GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glCopyTexSubImage3D, [GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei], :void

        # OpenGL 1.3
        attach_function :glActiveTexture,           [GLenum], :void
        attach_function :glClientActiveTexture,     [GLenum], :void
        attach_function :glCompressedTexImage1D,    [GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, :pointer], :void
        attach_function :glCompressedTexImage2D,    [GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, :pointer], :void
        attach_function :glCompressedTexImage3D,    [GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, :pointer], :void
        attach_function :glCompressedTexSubImage1D, [GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, :pointer], :void
        attach_function :glCompressedTexSubImage2D, [GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, :pointer], :void
        attach_function :glCompressedTexSubImage3D, [GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, :pointer], :void
        attach_function :glGetCompressedTexImage,   [GLenum, GLint, :pointer], :void
        attach_function :glMultiTexCoord1d,         [GLenum, GLdouble], :void
        attach_function :glMultiTexCoord1dv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1f,         [GLenum, GLfloat], :void
        attach_function :glMultiTexCoord1fv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1i,         [GLenum, GLint], :void
        attach_function :glMultiTexCoord1iv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord1s,         [GLenum, GLshort], :void
        attach_function :glMultiTexCoord1sv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2d,         [GLenum, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord2dv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2f,         [GLenum, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord2fv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2i,         [GLenum, GLint, GLint], :void
        attach_function :glMultiTexCoord2iv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord2s,         [GLenum, GLshort, GLshort], :void
        attach_function :glMultiTexCoord2sv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3d,         [GLenum, GLdouble, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord3dv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3f,         [GLenum, GLfloat, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord3fv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3i,         [GLenum, GLint, GLint, GLint], :void
        attach_function :glMultiTexCoord3iv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord3s,         [GLenum, GLshort, GLshort, GLshort], :void
        attach_function :glMultiTexCoord3sv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4d,         [GLenum, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glMultiTexCoord4dv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4f,         [GLenum, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glMultiTexCoord4fv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4i,         [GLenum, GLint, GLint, GLint, GLint], :void
        attach_function :glMultiTexCoord4iv,        [GLenum, :pointer], :void
        attach_function :glMultiTexCoord4s,         [GLenum, GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glMultiTexCoord4sv,        [GLenum, :pointer], :void

      end
    end
  end
end