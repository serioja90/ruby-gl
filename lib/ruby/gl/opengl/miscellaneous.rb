
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


        # OpenGL 1.4
        attach_function :glBlendFuncSeparate, [GLenum, GLenum, GLenum, GLenum], :void

        attach_function :_glMultiDrawArrays, :glMultiDrawArrays, [GLenum, :pointer, :pointer, GLsizei], :void
        def glMultiDrawArrays(mode, first, count, drawcount)
          _glMultiDrawArrays(mode, array_to_pointer(first, GLint), array_to_pointer(count, GLsizei), drawcount)
        end

        attach_function :glMultiDrawElements,     [GLenum, :pointer, GLenum, :pointer, GLsizei], :void
        attach_function :glPointParameterf,       [GLenum, GLfloat], :void
        attach_function :glPointParameterfv,      [GLenum, :pointer], :void
        attach_function :glPointParameteri,       [GLenum, GLint], :void
        attach_function :glPointParameteriv,      [GLenum, :pointer], :void
        attach_function :glFogCoordf,             [GLfloat], :void
        attach_function :glFogCoordfv,            [:pointer], :void
        attach_function :glFogCoordd,             [GLdouble], :void
        attach_function :glFogCoorddv,            [:pointer], :void
        attach_function :glFogCoordPointer,       [GLenum, GLsizei, :pointer], :void
        attach_function :glSecondaryColor3b,      [GLbyte, GLbyte, GLbyte], :void
        attach_function :glSecondaryColor3bv,     [:pointer], :void
        attach_function :glSecondaryColor3d ,     [GLdouble, GLdouble, GLdouble], :void
        attach_function :glSecondaryColor3dv,     [:pointer], :void
        attach_function :glSecondaryColor3f,      [GLfloat, GLfloat, GLfloat], :void
        attach_function :glSecondaryColor3fv,     [:pointer], :void
        attach_function :glSecondaryColor3i,      [GLint, GLint, GLint], :void
        attach_function :glSecondaryColor3iv,     [:pointer], :void
        attach_function :glSecondaryColor3s,      [GLshort, GLshort, GLshort], :void
        attach_function :glSecondaryColor3sv,     [:pointer], :void
        attach_function :glSecondaryColor3ub,     [GLubyte, GLubyte, GLubyte], :void
        attach_function :glSecondaryColor3ubv,    [:pointer], :void
        attach_function :glSecondaryColor3ui,     [GLuint, GLuint, GLuint], :void
        attach_function :glSecondaryColor3uiv,    [:pointer], :void
        attach_function :glSecondaryColor3us,     [GLushort, GLushort, GLushort], :void
        attach_function :glSecondaryColor3usv,    [:pointer], :void
        attach_function :glSecondaryColorPointer, [GLint, GLenum, GLsizei, :pointer], :void
        attach_function :glWindowPos2d,           [GLdouble, GLdouble], :void
        attach_function :glWindowPos2dv,          [:pointer], :void
        attach_function :glWindowPos2f,           [GLfloat, GLfloat], :void
        attach_function :glWindowPos2fv,          [:pointer], :void
        attach_function :glWindowPos2i,           [GLint, GLint], :void
        attach_function :glWindowPos2iv,          [:pointer], :void
        attach_function :glWindowPos2s,           [GLshort, GLshort], :void
        attach_function :glWindowPos2sv,          [:pointer], :void
        attach_function :glWindowPos3d,           [GLdouble, GLdouble, GLdouble], :void
        attach_function :glWindowPos3dv,          [:pointer], :void
        attach_function :glWindowPos3f,           [GLfloat, GLfloat, GLfloat], :void
        attach_function :glWindowPos3fv,          [:pointer], :void
        attach_function :glWindowPos3i,           [GLint, GLint, GLint], :void
        attach_function :glWindowPos3iv,          [:pointer], :void
        attach_function :glWindowPos3s,           [GLshort, GLshort, GLshort], :void
        attach_function :glWindowPos3sv,          [:pointer], :void
        attach_function :glBlendColor,            [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glBlendEquation,         [GLenum], :void


        # OpenGL 1.5
        attach_function :glGenQueries,           [GLsizei, :pointer], :void
        attach_function :glDeleteQueries,        [GLsizei, :pointer], :void
        attach_function :glIsQuery,              [GLuint], GLboolean
        attach_function :glBeginQuery,           [GLenum, GLuint], :void
        attach_function :glEndQuery,             [GLenum], :void
        attach_function :glGetQueryiv,           [GLenum, GLenum, :pointer], :void
        attach_function :glGetQueryObjectiv,     [GLuint, GLenum, :pointer], :void
        attach_function :glGetQueryObjectuiv,    [GLuint, GLenum, :pointer], :void
        attach_function :glBindBuffer,           [GLenum, GLuint], :void
        attach_function :glDeleteBuffers,        [GLsizei, :pointer], :void
        attach_function :glGenBuffers,           [GLsizei, :pointer], :void
        attach_function :glIsBuffer,             [GLuint], GLboolean
        attach_function :glBufferData,           [GLenum, :pointer, :pointer, GLenum], :void
        attach_function :glBufferSubData,        [GLenum, :pointer, :pointer, :pointer], :void
        attach_function :glGetBufferSubData,     [GLenum, :pointer, :pointer, :pointer], :void
        attach_function :glMapBuffer,            [GLenum, GLenum], :void
        attach_function :glUnmapBuffer,          [GLenum], GLboolean
        attach_function :glGetBufferParameteriv, [GLenum, GLenum, :pointer], :void
        attach_function :glGetBufferPointerv,    [GLenum, GLenum, :pointer], :void


        # OpenGL 2.0
        attach_function :glBlendEquationSeparate,    [GLenum, GLenum], :void
        attach_function :glDrawBuffers,              [GLsizei, :pointer], :void
        attach_function :glStencilOpSeparate,        [GLenum, GLenum, GLenum, GLenum], :void
        attach_function :glStencilFuncSeparate,      [GLenum, GLenum, GLint, GLuint], :void
        attach_function :glStencilMaskSeparate,      [GLenum, GLuint], :void
        attach_function :glAttachShader,             [GLuint, GLuint], :void
        attach_function :glBindAttribLocation,       [GLuint, GLuint, :string], :void
        attach_function :glCompileShader,            [GLuint], :void
        attach_function :glCreateProgram,            [], GLuint
        attach_function :glCreateShader,             [GLenum], GLuint
        attach_function :glDeleteProgram,            [GLuint], :void
        attach_function :glDeleteShader,             [GLuint], :void
        attach_function :glDetachShader,             [GLuint, GLuint], :void
        attach_function :glDisableVertexAttribArray, [GLuint], :void
        attach_function :glEnableVertexAttribArray,  [GLuint], :void
        attach_function :glGetActiveAttrib,          [GLuint, GLuint, GLsizei, :pointer, :pointer, :pointer, :string], :void
        attach_function :glGetActiveUniform,         [GLuint, GLuint, GLsizei, :pointer, :pointer, :pointer, :string], :void
        attach_function :glGetAttachedShaders,       [GLuint, GLsizei, :pointer, :pointer], :void
        attach_function :glGetAttribLocation,        [GLuint, :string], GLint
        attach_function :glGetProgramiv,             [GLuint, GLenum, :pointer], :void
        attach_function :glGetProgramInfoLog,        [GLuint, GLsizei, :pointer, :string], :void
        attach_function :glGetShaderiv,              [GLuint, GLenum, :pointer], :void
        attach_function :glGetShaderInfoLog,         [GLuint, GLsizei, :pointer, :string], :void
        attach_function :glGetShaderSource,          [GLuint, GLsizei, :pointer, :string], :void
        attach_function :glGetUniformLocation,       [GLuint, :string], GLint
        attach_function :glGetUniformfv,             [GLuint, GLint, :pointer], :void
        attach_function :glGetUniformiv,             [GLuint, GLint, :pointer], :void
        attach_function :glGetVertexAttribdv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribfv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribiv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribPointerv,  [GLuint, GLenum, :pointer], :void
        attach_function :glIsProgram,                [GLuint], GLboolean
        attach_function :glIsShader,                 [GLuint], GLboolean
        attach_function :glLinkProgram,              [GLuint], :void
        attach_function :glShaderSource,             [GLuint, GLsizei, :string, :pointer], :void
        attach_function :glUseProgram,               [GLuint], :void
        attach_function :glUniform1f,                [GLint, GLfloat], :void
        attach_function :glUniform2f,                [GLint, GLfloat, GLfloat], :void
        attach_function :glUniform3f,                [GLint, GLfloat, GLfloat, GLfloat], :void
        attach_function :glUniform4f,                [GLint, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glUniform1i,                [GLint, GLint], :void
        attach_function :glUniform2i,                [GLint, GLint, GLint], :void
        attach_function :glUniform3i,                [GLint, GLint, GLint, GLint], :void
        attach_function :glUniform4i,                [GLint, GLint, GLint, GLint, GLint], :void
        attach_function :glUniform1fv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform2fv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform3fv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform4fv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform1iv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform2iv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform3iv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniform4iv,               [GLint, GLsizei,:pointer], :void
        attach_function :glUniformMatrix2fv,         [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix3fv,         [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix4fv,         [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glValidateProgram,          [GLuint], :void
        attach_function :glVertexAttrib1d,           [GLuint, GLdouble], :void
        attach_function :glVertexAttrib1dv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib1f,           [GLuint, GLfloat], :void
        attach_function :glVertexAttrib1fv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib1s,           [GLuint, GLshort], :void
        attach_function :glVertexAttrib1sv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib2d,           [GLuint, GLdouble, GLdouble], :void
        attach_function :glVertexAttrib2dv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib2f,           [GLuint, GLfloat, GLfloat], :void
        attach_function :glVertexAttrib2fv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib2s,           [GLuint, GLshort, GLshort], :void
        attach_function :glVertexAttrib2sv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib3d,           [GLuint, GLdouble, GLdouble, GLdouble], :void
        attach_function :glVertexAttrib3dv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib3f,           [GLuint, GLfloat, GLfloat, GLfloat], :void
        attach_function :glVertexAttrib3fv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib3s,           [GLuint, GLshort, GLshort, GLshort], :void
        attach_function :glVertexAttrib3sv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Nbv,         [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Niv,         [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Nsv,         [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Nub,         [GLuint, GLubyte, GLubyte, GLubyte, GLubyte], :void
        attach_function :glVertexAttrib4Nubv,        [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Nuiv,        [GLuint, :pointer], :void
        attach_function :glVertexAttrib4Nusv,        [GLuint, :pointer], :void
        attach_function :glVertexAttrib4bv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4d,           [GLuint, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :glVertexAttrib4dv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4f,           [GLuint, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glVertexAttrib4fv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4iv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4s,           [GLuint, GLshort, GLshort, GLshort, GLshort], :void
        attach_function :glVertexAttrib4sv,          [GLuint, :pointer], :void
        attach_function :glVertexAttrib4ubv,         [GLuint, :pointer], :void
        attach_function :glVertexAttrib4uiv,         [GLuint, :pointer], :void
        attach_function :glVertexAttrib4usv,         [GLuint, :pointer], :void
        attach_function :glVertexAttribPointer,      [GLuint, GLint, GLenum, GLboolean, GLsizei, :pointer], :void


        # OpenGL 2.1
        attach_function :glUniformMatrix2x3fv, [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix3x2fv, [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix2x4fv, [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix4x2fv, [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix3x4fv, [GLint, GLsizei, GLboolean, :pointer], :void
        attach_function :glUniformMatrix4x3fv, [GLint, GLsizei, GLboolean, :pointer], :void


        # OpenGL 3.0
        attach_function :glColorMaski,                          [GLuint, GLboolean, GLboolean, GLboolean, GLboolean], :void
        attach_function :glGetBooleani_v,                       [GLenum, GLuint, :pointer], :void
        attach_function :glGetIntegeri_v,                       [GLenum, GLuint, :pointer], :void
        attach_function :glEnablei,                             [GLenum, GLuint], :void
        attach_function :glDisablei,                            [GLenum, GLuint], :void
        attach_function :glIsEnabledi,                          [GLenum, GLuint], GLboolean
        attach_function :glBeginTransformFeedback,              [GLenum], :void
        attach_function :glEndTransformFeedback,                [], :void
        attach_function :glBindBufferRange,                     [GLenum, GLuint, GLuint, :pointer, :pointer], :void
        attach_function :glBindBufferBase,                      [GLenum, GLuint, GLuint], :void
        attach_function :glTransformFeedbackVaryings,           [GLuint, GLsizei, :string, GLenum], :void
        attach_function :glGetTransformFeedbackVarying,         [GLuint, GLuint, GLsizei, :pointer, :pointer, :pointer, :string], :void
        attach_function :glClampColor,                          [GLenum, GLenum], :void
        attach_function :glBeginConditionalRender,              [GLuint, GLenum], :void
        attach_function :glEndConditionalRender,                [], :void
        attach_function :glVertexAttribIPointer,                [GLuint, GLint, GLenum, GLsizei, :pointer], :void
        attach_function :glGetVertexAttribIiv,                  [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribIuiv,                 [GLuint, GLenum, :pointer], :void
        attach_function :glVertexAttribI1i,                     [GLuint, GLint], :void
        attach_function :glVertexAttribI2i,                     [GLuint, GLint, GLint], :void
        attach_function :glVertexAttribI3i,                     [GLuint, GLint, GLint, GLint], :void
        attach_function :glVertexAttribI4i,                     [GLuint, GLint, GLint, GLint, GLint], :void
        attach_function :glVertexAttribI1ui,                    [GLuint, GLuint], :void
        attach_function :glVertexAttribI2ui,                    [GLuint, GLuint, GLuint], :void
        attach_function :glVertexAttribI3ui,                    [GLuint, GLuint, GLuint, GLuint], :void
        attach_function :glVertexAttribI4ui,                    [GLuint, GLuint, GLuint, GLuint, GLuint], :void
        attach_function :glVertexAttribI1iv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI2iv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI3iv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI4iv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI1uiv,                   [GLuint, :pointer], :void
        attach_function :glVertexAttribI2uiv,                   [GLuint, :pointer], :void
        attach_function :glVertexAttribI3uiv,                   [GLuint, :pointer], :void
        attach_function :glVertexAttribI4uiv,                   [GLuint, :pointer], :void
        attach_function :glVertexAttribI4bv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI4sv,                    [GLuint, :pointer], :void
        attach_function :glVertexAttribI4ubv,                   [GLuint, :pointer], :void
        attach_function :glVertexAttribI4usv,                   [GLuint, :pointer], :void
        attach_function :glGetUniformuiv,                       [GLuint, GLint, :pointer], :void
        attach_function :glBindFragDataLocation,                [GLuint, GLuint, :string], :void
        attach_function :glGetFragDataLocation,                 [GLuint, :string], GLint
        attach_function :glUniform1ui,                          [GLint, GLuint], :void
        attach_function :glUniform2ui,                          [GLint, GLuint, GLuint], :void
        attach_function :glUniform3ui,                          [GLint, GLuint, GLuint, GLuint], :void
        attach_function :glUniform4ui,                          [GLint, GLuint, GLuint, GLuint, GLuint], :void
        attach_function :glUniform1uiv,                         [GLint, GLsizei, :pointer], :void
        attach_function :glUniform2uiv,                         [GLint, GLsizei, :pointer], :void
        attach_function :glUniform3uiv,                         [GLint, GLsizei, :pointer], :void
        attach_function :glUniform4uiv,                         [GLint, GLsizei, :pointer], :void
        attach_function :glTexParameterIiv,                     [GLenum, GLenum, :pointer], :void
        attach_function :glTexParameterIuiv,                    [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexParameterIiv,                  [GLenum, GLenum, :pointer], :void
        attach_function :glGetTexParameterIuiv,                 [GLenum, GLenum, :pointer], :void
        attach_function :glClearBufferiv,                       [GLenum, GLint, :pointer], :void
        attach_function :glClearBufferuiv,                      [GLenum, GLint, :pointer], :void
        attach_function :glClearBufferfv,                       [GLenum, GLint, :pointer], :void
        attach_function :glClearBufferfi,                       [GLenum, GLint, GLfloat, GLint], :void
        attach_function :glGetStringi,                          [GLenum, GLuint], :pointer
        attach_function :glIsRenderbuffer,                      [GLuint], GLboolean
        attach_function :glBindRenderbuffer,                    [GLenum, GLuint], :void
        attach_function :glDeleteRenderbuffers,                 [GLsizei, :pointer], :void
        attach_function :glGenRenderbuffers,                    [GLsizei, :pointer], :void
        attach_function :glRenderbufferStorage,                 [GLenum, GLenum, GLsizei, GLsizei], :void
        attach_function :glGetRenderbufferParameteriv,          [GLenum, GLenum, :pointer], :void
        attach_function :glIsFramebuffer,                       [GLuint], GLboolean
        attach_function :glBindFramebuffer,                     [GLenum, GLuint], :void
        attach_function :glDeleteFramebuffers,                  [GLsizei, :pointer], :void
        attach_function :glGenFramebuffers,                     [GLsizei, :pointer], :void
        attach_function :glCheckFramebufferStatus,              [GLenum], GLenum
        attach_function :glFramebufferTexture1D,                [GLenum, GLenum, GLenum, GLuint, GLint], :void
        attach_function :glFramebufferTexture2D,                [GLenum, GLenum, GLenum, GLuint, GLint], :void
        attach_function :glFramebufferTexture3D,                [GLenum, GLenum, GLenum, GLuint, GLint, GLint], :void
        attach_function :glFramebufferRenderbuffer,             [GLenum, GLenum, GLenum, GLuint], :void
        attach_function :glGetFramebufferAttachmentParameteriv, [GLenum, GLenum, GLenum, :pointer], :void
        attach_function :glGenerateMipmap,                      [GLenum], :void
        attach_function :glBlitFramebuffer,                     [GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum], :void
        attach_function :glRenderbufferStorageMultisample,      [GLenum, GLsizei, GLenum, GLsizei, GLsizei], :void
        attach_function :glFramebufferTextureLayer,             [GLenum, GLenum, GLuint, GLint, GLint], :void
        attach_function :glMapBufferRange,                      [GLenum, :pointer, :pointer, GLbitfield], :pointer
        attach_function :glFlushMappedBufferRange,              [GLenum, :pointer, :pointer], :void
        attach_function :glBindVertexArray,                     [GLuint], :void
        attach_function :glDeleteVertexArrays,                  [GLsizei, :pointer], :void
        attach_function :glGenVertexArrays,                     [GLsizei, :pointer], :void
        attach_function :glIsVertexArray,                       [GLuint], GLboolean
      end
    end
  end
end