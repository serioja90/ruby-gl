
module Ruby
  class GL
    module OpenGL
      module Miscellaneous
        extend FFI::Library
        ffi_lib 'GL'

        include Ruby::GL::OpenGL::Types
        include Ruby::GL::OpenGL::Utils

        GLError = enum(
          :no_error,          0,
          :invalid_enum,      0x0500,
          :invalid_value,     0x0501,
          :invalid_operation, 0x0502,
          :stack_overflow,    0x0503,
          :stack_underflow,   0x0504,
          :out_of_memory,     0x0505
        )

        attach_function :glClearIndex,         [GLfloat], :void
        attach_function :glClearColor,         [GLclampf, GLclampf, GLclampf, GLclampf], :void
        attach_function :glClear,              [GLbitfield], :void
        attach_function :glIndexMask,          [GLuint], :void
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
        attach_function :glScissor,            [GLint, GLint, GLsizei, GLsizei], :void
        attach_function :glDrawBuffer,         [GLenum], :void
        attach_function :glReadBuffer,         [GLenum], :void
        attach_function :glEnable,             [GLenum], :void
        attach_function :glDisable,            [GLenum], :void
        attach_function :glEnableClientState,  [GLenum], :void
        attach_function :glDisableClientState, [GLenum], :void
        attach_function :glPushAttrib,         [GLbitfield], :void
        attach_function :glPopAttrib,          [], :void
        attach_function :glPushClientAttrib,   [GLbitfield], :void
        attach_function :glPopClientAttrib,    [], :void
        attach_function :glRenderMode,         [GLenum], GLint

        attach_function :_glGetError, :glGetError, [], GLenum
        def glGetError
          error = _glGetError()
          return GLError[error]
        end

        attach_function :glGetString,          [GLenum], :string
        attach_function :glFinish,             [], :void
        attach_function :glFlush,              [], :void
        attach_function :glHint,               [GLenum, GLenum], :void

        # OpenGL 1.3
        attach_function :_glSampleCoverage, :glSampleCoverage, [GLclampf, GLboolean], :void
        def glSampleCoverage(value, invert)
          _glSampleCoverage(value, (invert ? GL_TRUE : GL_FALSE))
        end

        attach_function :_glColorMask, :glColorMask, [GLboolean, GLboolean, GLboolean, GLboolean], :void
        def glColorMask(red, green, blue, alpha)
          r, g, b, a = [red, green, blue, alpha].map{|col| col ? GL_TRUE : GL_FALSE }
          _glColorMask(r, g, b, a)
        end

        attach_function :_glEdgeFlag,  :glEdgeFlag,  [GLboolean], :void
        def glEdgeFlag(arg)
          case arg
          when Fixnum
            _glEdgeFlag(arg)
          when TrueClass, FalseClass
            _glEdgeFlag(arg ? GL_TRUE : GL_FALSE)
          when Array
            _glEdgeFlagv(arg)
          else
            raise "Invalid argument type (#{arg.class}) for glEdgeFlag()"
          end
        end

        attach_function :_glEdgeFlagv, :glEdgeFlagv, [:pointer], :void
        def glEdgeFlagv(arg)
          pointer = FFI::MemoryPointer.new GLboolean, 1
          pointer.put_uchar 0, (arg[0] ? GL_TRUE : GL_FALSE)
          _glEdgeFlagv(pointer)
        end

        attach_function :_glClipPlane, :glClipPlane, [GLenum, :pointer], :void
        def glClipPlane(plane, equation)
          _glClipPlane(plane, array_to_pointer(equation, GLdouble))
        end

        attach_function :_glGetClipPlane, :glGetClipPlane, [GLenum, :pointer], :void
        def glGetClipPlane(plane)
          pointer = FFI::MemoryPointer.new GLdouble, 4
          _glGetClipPlane(plane, pointer)
          return pointer.get_array_of_double 0, 4
        end

        attach_function :_glIsEnabled, :glIsEnabled, [GLenum], GLboolean
        def glIsEnabled(cap)
          return _glIsEnabled(cap) == GL_TRUE
        end

        attach_function :glGetBooleanv,        [GLenum, :pointer], :void
        attach_function :glGetDoublev,         [GLenum, :pointer], :void
        attach_function :glGetFloatv,          [GLenum, :pointer], :void
        attach_function :glGetIntegerv,        [GLenum, :pointer], :void
      end
    end
  end
end