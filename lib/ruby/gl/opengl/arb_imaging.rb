
module Ruby
  class GL
    module OpenGL
      module ARBImaging
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'

        # ARB Imaging
        attach_function :glColorTable,                [GLenum, GLenum, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glColorSubTable,             [GLenum, GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glColorTableParameteriv,     [GLenum, GLenum, :pointer], :void
        attach_function :glColorTableParameterfv,     [GLenum, GLenum, :pointer], :void
        attach_function :glCopyColorSubTable,         [GLenum, GLsizei, GLint, GLint, GLsizei], :void
        attach_function :glCopyColorTable,            [GLenum, GLenum, GLint, GLint, GLsizei], :void
        attach_function :glGetColorTable,             [GLenum, GLenum, GLenum, :pointer], :void
        attach_function :glGetColorTableParameterfv,  [GLenum, GLenum, :pointer], :void
        attach_function :glGetColorTableParameteriv,  [GLenum, GLenum, :pointer], :void
        attach_function :glBlendEquation,             [GLenum], :void
        attach_function :glBlendColor,                [GLclampf, GLclampf, GLclampf, GLclampf], :void
        attach_function :glHistogram,                 [GLenum, GLsizei, GLenum, GLboolean], :void
        attach_function :glResetHistogram,            [GLenum], :void
        attach_function :glGetHistogram,              [GLenum, GLboolean, GLenum, GLenum, :pointer], :void
        attach_function :glGetHistogramParameterfv,   [GLenum, GLenum, :pointer], :void
        attach_function :glGetHistogramParameteriv,   [GLenum, GLenum, :pointer], :void
        attach_function :glMinmax,                    [GLenum, GLenum, GLboolean], :void
        attach_function :glResetMinmax,               [GLenum], :void
        attach_function :glGetMinmax,                 [GLenum, GLboolean, GLenum, GLenum, :pointer], :void
        attach_function :glGetMinmaxParameterfv,      [GLenum, GLenum, :pointer], :void
        attach_function :glGetMinmaxParameteriv,      [GLenum, GLenum, :pointer], :void
        attach_function :glConvolutionFilter1D,       [GLenum, GLenum, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glConvolutionFilter2D,       [GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, :pointer], :void
        attach_function :glConvolutionParameterf,     [GLenum, GLenum, GLfloat], :void
        attach_function :glConvolutionParameterfv,    [GLenum, GLenum, :pointer], :void
        attach_function :glConvolutionParameteri,     [GLenum, GLenum, GLint], :void
        attach_function :glConvolutionParameteriv,    [GLenum, GLenum, :pointer], :void
        attach_function :glCopyConvolutionFilter1D,   [GLenum, GLenum, GLint, GLint, GLsizei], :void
        attach_function :glCopyConvolutionFilter2D,   [GLenum, GLenum, GLint, GLint, GLsizei, GLsizei], :void
        attach_function :glGetConvolutionFilter,      [GLenum, GLenum, GLenum, :pointer], :void
        attach_function :glGetConvolutionParameterfv, [GLenum, GLenum, :pointer], :void
        attach_function :glGetConvolutionParameteriv, [GLenum, GLenum, :pointer], :void
        attach_function :glSeparableFilter2D,         [GLenum, GLenum, GLsizei, GLsizei, GLenum, GLenum, :pointer, :pointer], :void
        attach_function :glGetSeparableFilter,        [GLenum, GLenum, GLenum, :pointer, :pointer, :pointer], :void

      end
    end
  end
end