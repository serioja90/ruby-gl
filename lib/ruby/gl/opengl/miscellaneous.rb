
module Ruby
  class GL
    module OpenGL
      module Miscellaneous
        include Ruby::GL::OpenGL::Types
        extend FFI::Library
        ffi_lib 'GL'


        attach_function :glClearIndex,         [GLfloat], :void
        attach_function :glClearColor,         [GLclampf, GLclampf, GLclampf, GLclampf], :void
        attach_function :glClear,              [GLbitfield], :void
        attach_function :glIndexMask,          [GLuint], :void
        attach_function :glColorMask,          [GLboolean, GLboolean, GLboolean, GLboolean], :void
        attach_function :glAlphaFunc,          [GLenum, GLclampf], :void
        attach_function :glBlendFunc,          [GLenum, GLenum], :void
        attach_function :glLogicOp,            [GLenum], :void
        attach_function :glCullFace,           [GLenum], :void
        attach_function :glFrontFace,          [GLenum], :void
        attach_function :glPointSize,          [GLfloat], :void
        attach_function :glLineWidth,          [GLfloat], :void
        attach_function :glLineStipple,        [GLint, GLushort], :void
        attach_function :glPolygonMode,        [GLenum, GLenum], :void
        attach_function :glPolygonOffset,      [GLfloat, GLfloat], :void
        attach_function :glPolygonStipple,     [:string], :void
        attach_function :glGetPolygonStipple,  [:string], :void
        attach_function :glEdgeFlag,           [GLboolean], :void
        attach_function :glEdgeFlagv,          [:pointer], :void
        attach_function :glScissor,            [GLint, GLint, GLsizei, GLsizei], :void
        attach_function :glClipPlane,          [GLenum, :pointer], :void
        attach_function :glGetClipPlane,       [GLenum, :pointer], :void
        attach_function :glDrawBuffer,         [GLenum], :void
        attach_function :glReadBuffer,         [GLenum], :void
        attach_function :glEnable,             [GLenum], :void
        attach_function :glDisable,            [GLenum], :void
        attach_function :glIsEnabled,          [GLenum], GLboolean
        attach_function :glEnableClientState,  [GLenum], :void
        attach_function :glDisableClientState, [GLenum], :void
        attach_function :glGetBooleanv,        [GLenum, :pointer], :void
        attach_function :glGetDoublev,         [GLenum, :pointer], :void
        attach_function :glGetFloatv,          [GLenum, :pointer], :void
        attach_function :glGetIntegerv,        [GLenum, :pointer], :void
        attach_function :glPushAttrib,         [GLbitfield], :void
        attach_function :glPopAttrib,          [], :void
        attach_function :glPushClientAttrib,   [GLbitfield], :void
        attach_function :glPopClientAttrib,    [], :void
        attach_function :glRenderMode,         [GLenum], GLint
        attach_function :glGetError,           [], GLenum
        attach_function :glGetString,          [GLenum], :string
        attach_function :glFinish,             [], :void
        attach_function :glFlush,              [], :void
        attach_function :glHint,               [GLenum, GLenum], :void

        # OpenGL 1.3
        attach_function :glSampleCoverage, [GLclampf, GLboolean], :void
      end
    end
  end
end