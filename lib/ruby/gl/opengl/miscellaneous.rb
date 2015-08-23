
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


        ##############
        # OpenGL 1.3 #
        ##############

        attach_function :_glSampleCoverage, :glSampleCoverage, [GLclampf, GLboolean], :void
        def glSampleCoverage(value, invert)
          _glSampleCoverage(value, to_glbool(invert))
        end

        attach_function :_glColorMask, :glColorMask, [GLboolean, GLboolean, GLboolean, GLboolean], :void
        def glColorMask(red, green, blue, alpha)
          r, g, b, a = [red, green, blue, alpha].map{|col| to_glbool(col) }
          _glColorMask(r, g, b, a)
        end

        attach_function :_glEdgeFlag,  :glEdgeFlag,  [GLboolean], :void
        def glEdgeFlag(arg)
          case arg
          when Fixnum
            _glEdgeFlag(arg)
          when TrueClass, FalseClass
            _glEdgeFlag(to_glbool(arg))
          when Array
            _glEdgeFlagv(arg)
          else
            raise "Invalid argument type (#{arg.class}) for glEdgeFlag()"
          end
        end

        attach_function :_glEdgeFlagv, :glEdgeFlagv, [:pointer], :void
        def glEdgeFlagv(arg)
          pointer = FFI::MemoryPointer.new GLboolean, 1
          pointer.put_uchar 0, (arg[0] ? (arg[0] == GL_TRUE) : GL_FALSE)
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


        ##############
        # OpenGL 1.4 #
        ##############

        attach_function :glBlendFuncSeparate, [GLenum, GLenum, GLenum, GLenum], :void
        attach_function :_glMultiDrawArrays, :glMultiDrawArrays, [GLenum, :pointer, :pointer, GLsizei], :void

        def glMultiDrawArrays(mode, first, count, drawcount)
          _glMultiDrawArrays(mode, array_to_pointer(first, GLint), array_to_pointer(count, GLsizei), drawcount)
        end

        attach_function :_glMultiDrawElements, :glMultiDrawElements, [GLenum, :pointer, GLenum, :pointer, GLsizei], :void

        def glMultiDrawElements(mode, count, type, indices, drawcount)
          indices_pointer = FFI::MemoryPointer.new :pointer, indices.size
          indices.each_with_index do |item, i|
            pointer = FFI::MemoryPointer.new GLint, item.size
            pointer.write_array_of_int item
            indices_pointer.put_pointer i, pointer
          end
          _glMultiDrawElements(mode, array_to_pointer(count, GLsizei), type, indices, drawcount)
        end

        attach_function :glPointParameterf,       [GLenum, GLfloat], :void
        attach_function :_glPointParameterfv, :glPointParameterfv, [GLenum, :pointer], :void

        def glPointParameterfv(pname, params)
          _glPointParameterfv(pname, array_to_pointer(params, GLfloat))
        end

        attach_function :glPointParameteri,       [GLenum, GLint], :void
        attach_function :_glPointParameteriv, :glPointParameteriv, [GLenum, :pointer], :void

        def glPointParameteriv(pname, params)
          glPointParameteriv(pname, array_to_pointer(params, GLint))
        end

        attach_function :glFogCoordf,             [GLfloat], :void
        attach_function :_glFogCoordfv, :glFogCoordfv, [:pointer], :void

        def glFogCoordfv(coord)
          _glFogCoordfv(array_to_pointer(coord, GLfloat))
        end

        attach_function :glFogCoordd,             [GLdouble], :void
        attach_function :_glFogCoorddv, :glFogCoorddv, [:pointer], :void

        def glFogCoorddv(coord)
          _glFogCoorddv(array_to_pointer(coord, GLdouble))
        end

        attach_function :_glFogCoordPointer, :glFogCoordPointer, [GLenum, GLsizei, :pointer], :void

        def glFogCoordPointer(type, stride, data)
          data_type = (type == GL_FLOAT ? GLfloat : GLdouble)
          _glFogCoordPointer(type, stride, array_to_pointer(data, data_type))
        end

        attach_function :glSecondaryColor3b,      [GLbyte, GLbyte, GLbyte], :void
        attach_function :_glSecondaryColor3bv, :glSecondaryColor3bv, [:pointer], :void

        def glSecondaryColor3bv(color)
          _glSecondaryColor3bv(array_to_pointer(color, GLbyte))
        end

        attach_function :glSecondaryColor3d ,     [GLdouble, GLdouble, GLdouble], :void
        attach_function :_glSecondaryColor3dv, :glSecondaryColor3dv, [:pointer], :void

        def glSecondaryColor3dv(color)
          _glSecondaryColor3dv(array_to_pointer(color, GLdouble))
        end

        attach_function :glSecondaryColor3f,      [GLfloat, GLfloat, GLfloat], :void
        attach_function :_glSecondaryColor3fv, :glSecondaryColor3fv, [:pointer], :void

        def glSecondaryColor3fv(color)
          _glSecondaryColor3fv(array_to_pointer(color, GLfloat))
        end

        attach_function :glSecondaryColor3i,      [GLint, GLint, GLint], :void
        attach_function :_glSecondaryColor3iv, :glSecondaryColor3iv, [:pointer], :void

        def glSecondaryColor3iv(color)
          _glSecondaryColor3iv(array_to_pointer(color, GLint))
        end

        attach_function :glSecondaryColor3s,      [GLshort, GLshort, GLshort], :void
        attach_function :_glSecondaryColor3sv, :glSecondaryColor3sv, [:pointer], :void

        def glSecondaryColor3sv(color)
          _glSecondaryColor3sv(array_to_pointer(color, GLshort))
        end

        attach_function :glSecondaryColor3ub,     [GLubyte, GLubyte, GLubyte], :void
        attach_function :_glSecondaryColor3ubv, :glSecondaryColor3ubv, [:pointer], :void

        def glSecondaryColor3ubv(color)
          _glSecondaryColor3ubv(array_to_pointer(color, GLubyte))
        end

        attach_function :glSecondaryColor3ui,     [GLuint, GLuint, GLuint], :void
        attach_function :_glSecondaryColor3uiv, :glSecondaryColor3uiv, [:pointer], :void

        def glSecondaryColor3uiv(color)
          _glSecondaryColor3uiv(array_to_pointer(color, GLuint))
        end

        attach_function :glSecondaryColor3us,     [GLushort, GLushort, GLushort], :void
        attach_function :_glSecondaryColor3usv, :glSecondaryColor3usv, [:pointer], :void

        def glSecondaryColor3usv(color)
          _glSecondaryColor3usv(array_to_pointer(color, GLushort))
        end

        attach_function :_glSecondaryColorPointer, :glSecondaryColorPointer, [GLint, GLenum, GLsizei, :pointer], :void

        def glSecondaryColorPointer(size, type, stride, pointer)
          data_type = case type
          when GL_BYTE          then GLbyte
          when GL_UNSIGNED_BYTE then GLubyte
          when GL_SHORT         then GLshort
          when GL_UNSIGNED_SHORT then GLushort
          when GL_INT            then GLint
          when GL_UNSIGNED_INT   then GLuint
          when GL_DOUBLE         then GLdouble
          else
            GLfloat
          end
          _glSecondaryColorPointer(size, type, stride, array_to_pointer(pointer, data_type))
        end

        attach_function :glWindowPos2d,           [GLdouble, GLdouble], :void
        attach_function :_glWindowPos2dv, :glWindowPos2dv, [:pointer], :void

        def glWindowPos2dv(coords)
          _glWindowPos2dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :glWindowPos2f,           [GLfloat, GLfloat], :void
        attach_function :_glWindowPos2fv, :glWindowPos2fv, [:pointer], :void

        def glWindowPos2fv(coords)
          _glWindowPos2fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :glWindowPos2i,           [GLint, GLint], :void
        attach_function :_glWindowPos2iv, :glWindowPos2iv, [:pointer], :void

        def glWindowPos2iv(coords)
          _glWindowPos2iv(array_to_pointer(coords, GLint))
        end

        attach_function :glWindowPos2s,           [GLshort, GLshort], :void
        attach_function :_glWindowPos2sv, :glWindowPos2sv, [:pointer], :void

        def glWindowPos2sv(coords)
          _glWindowPos2sv(array_to_pointer(coords, GLshort))
        end

        attach_function :glWindowPos3d,           [GLdouble, GLdouble, GLdouble], :void
        attach_function :_glWindowPos3dv, :glWindowPos3dv, [:pointer], :void

        def glWindowPos3dv(coords)
          _glWindowPos3dv(array_to_pointer(coords, GLdouble))
        end

        attach_function :glWindowPos3f,           [GLfloat, GLfloat, GLfloat], :void
        attach_function :_glWindowPos3fv, :glWindowPos3fv, [:pointer], :void

        def glWindowPos3fv(coords)
          _glWindowPos3fv(array_to_pointer(coords, GLfloat))
        end

        attach_function :glWindowPos3i,           [GLint, GLint, GLint], :void
        attach_function :_glWindowPos3iv, :glWindowPos3iv, [:pointer], :void

        def glWindowPos3iv(coords)
          _glWindowPos3iv(array_to_pointer(coords, GLint))
        end

        attach_function :glWindowPos3s,           [GLshort, GLshort, GLshort], :void
        attach_function :_glWindowPos3sv, :glWindowPos3sv, [:pointer], :void

        def glWindowPos3sv(coords)
          _glWindowPos3sv(array_to_pointer(coords, GLshort))
        end

        attach_function :glBlendColor,            [GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glBlendEquation,         [GLenum], :void


        ##############
        # OpenGL 1.5 #
        ##############

        attach_function :_glGenQueries, :glGenQueries, [GLsizei, :pointer], :void

        def glGenQueries(num)
          pointer = FFI::MemoryPointer.new GLuint, num
          _glGenQueries(num, pointer)

          return pointer.read_array_of_uint num
        end

        attach_function :_glDeleteQueries, :glDeleteQueries, [GLsizei, :pointer], :void

        def glDeleteQueries(ids)
          _glDeleteQueries(ids.size, array_to_pointer(ids, GLint))
        end

        attach_function :_glIsQuery, :glIsQuery, [GLuint], GLboolean

        def glIsQuery(id)
          return (_glIsQuery(id) == GL_TRUE)
        end

        attach_function :glBeginQuery,           [GLenum, GLuint], :void
        attach_function :glEndQuery,             [GLenum], :void
        attach_function :_glGetQueryiv, :glGetQueryiv, [GLenum, GLenum, :pointer], :void

        def glGetQueryiv(target, pname)
          pointer = FFI::MemoryPointer.new GLint
          _glGetQueryiv(target, pname, pointer)

          return pointer.get_int 0
        end

        attach_function :_glGetQueryObjectiv, :glGetQueryObjectiv, [GLuint, GLenum, :pointer], :void

        def glGetQueryObjectiv(id, pname)
          pointer = FFI::MemoryPointer.new GLint
          _glGetQueryObjectiv(id, pname, pointer)

          return pointer.get_int 0
        end

        attach_function :_glGetQueryObjectuiv, :glGetQueryObjectuiv, [GLuint, GLenum, :pointer], :void

        def glGetQueryObjectuiv(id, pname)
          pointer = FFI::MemoryPointer.new GLuint
          _glGetQueryObjectuiv(id, pname, pointer)

          return pointer.get_uint 0
        end

        attach_function :glBindBuffer,           [GLenum, GLuint], :void
        attach_function :_glDeleteBuffers, :glDeleteBuffers, [GLsizei, :pointer], :void

        def glDeleteBuffers(buffers)
          _glDeleteBuffers(buffers.size, array_to_pointer(buffers, GLuint))
        end

        attach_function :_glGenBuffers, :glGenBuffers, [GLsizei, :pointer], :void

        def glGenBuffers(num)
          pointer = FFI::MemoryPointer.new GLuint, num
          _glGenBuffers(num, pointer)

          return pointer.read_array_of_uint num
        end

        attach_function :_glIsBuffer, :glIsBuffer, [GLuint], GLboolean

        def glIsBuffer(buffer)
          return (_glIsBuffer(buffer) == GL_TRUE)
        end

        attach_function :_glBufferData, :glBufferData, [GLenum, GLsizei, :pointer, GLenum], :void

        # This implementation of glBufferData() is a little bit different from the
        # original one implemented in OpenGL, because it requires data type instead
        # of data size. Use one of types defined under Types module to specify
        # the type of data. Also the size of data will be returned.
        def glBufferData(target, type, data, usage)
          size = FFI.find_type(type).size * data.size
          _glBufferData(target, size, array_to_pointer(data, type), usage)

          return size
        end

        attach_function :_glBufferSubData, :glBufferSubData, [GLenum, GLsizei, GLsizei, :pointer], :void

        def glBufferSubData(target, offset, type, data)
          size = FFI.find_type(type).size * data.size
          _glBufferSubData(target, offset, size, array_to_pointer(data, type))

          return size
        end

        attach_function :_glGetBufferSubData, :glGetBufferSubData, [GLenum, GLsizei, GLsizei, :pointer], :void

        def glGetBufferSubData(target, offset, type, data)
          size = FFI.find_type(type).size * data.size
          _glGetBufferSubData(target, offset, size, array_to_pointer(data, type))

          return size
        end

        attach_function :glMapBuffer,            [GLenum, GLenum], :void
        attach_function :_glUnmapBuffer, :glUnmapBuffer, [GLenum], GLboolean

        def glUnmapBuffer(target)
          return (_glUnmapBuffer(target) == GL_TRUE)
        end

        attach_function :_glGetBufferParameteriv, :glGetBufferParameteriv, [GLenum, GLenum, :pointer], :void

        def glGetBufferParameteriv(target, value)
          pointer = FFI::MemoryPointer.new GLint
          _glGetBufferParameteriv(target, value, pointer)

          return pointer.get_int 0
        end

        attach_function :glGetBufferPointerv,     [GLenum, GLenum, :pointer], :void


        ##############
        # OpenGL 2.0 #
        ##############

        attach_function :glBlendEquationSeparate,    [GLenum, GLenum], :void
        attach_function :_glDrawBuffers, :glDrawBuffers, [GLsizei, :pointer], :void

        def glDrawBuffers(buffers)
          _glDrawBuffers(buffers.size, array_to_pointer(buffers, GLenum))
        end

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
        attach_function :_glGetActiveAttrib, :glGetActiveAttrib, [GLuint, GLuint, GLsizei, :pointer, :pointer, :pointer, :pointer], :void

        def glGetActiveAttrib(program, index, buff_size)
          length = FFI::MemoryPointer.new GLsizei
          size   = FFI::MemoryPointer.new GLint
          type   = FFI::MemoryPointer.new GLenum
          name   = FFI::MemoryPointer.new GLchar, buff_size
          _glGetActiveAttrib(program, index, buff_size, length, size, type, name)

          return {
            length: length.get_int(0),
            size:   size.get_int(0),
            type:   type.get_uint(0),
            name:   name.read_string
          }
        end


        attach_function :_glGetActiveUniform, :glGetActiveUniform, [GLuint, GLuint, GLsizei, :pointer, :pointer, :pointer, :pointer], :void

        def glGetActiveUniform(program, index, buff_size)
          length = FFI::MemoryPointer.new GLsizei
          size   = FFI::MemoryPointer.new GLint
          type   = FFI::MemoryPointer.new GLenum
          name   = FFI::MemoryPointer.new GLchar, buff_size
          _glGetActiveUniform(program, index, buff_size, length, size, type, name)

          return {
            length: length.get_int(0),
            size:   size.get_int(0),
            type:   type.get_uint(0),
            name:   name.read_string
          }
        end

        attach_function :_glGetAttachedShaders, :glGetAttachedShaders, [GLuint, GLsizei, :pointer, :pointer], :void

        def glGetAttachedShaders(program, max_count)
          count   = FFI::MemoryPointer.new GLsizei
          shaders = FFI::MemoryPointer.new GLuint, max_count
          _glGetAttachedShaders(program, max_count, count, shaders)

          return shaders.read_array_of_uint count
        end

        attach_function :glGetAttribLocation,        [GLuint, :string], GLint
        attach_function :_glGetProgramiv, :glGetProgramiv, [GLuint, GLenum, :pointer], :void

        def glGetProgramiv(program, pname)
          params = FFI::MemoryPointer.new GLint
          _glGetProgramiv(program, pname, params)

          return params.read_int
        end

        attach_function :_glGetProgramInfoLog, :glGetProgramInfoLog, [GLuint, GLsizei, :pointer, :pointer], :void

        def glGetProgramInfoLog(program, max_length)
          length = FFI::MemoryPointer.new GLsizei
          log    = FFI::MemoryPointer.new GLchar, max_length
          _glGetProgramInfoLog(program, max_length, length, log)

          return log.read_string.force_encoding('UTF-8')
        end

        attach_function :_glGetShaderiv, :glGetShaderiv, [GLuint, GLenum, :pointer], :void

        def glGetShaderiv(shader, pname)
          params = FFI::MemoryPointer.new GLint
          _glGetShaderiv(shader, pname, params)

          return params.read_int
        end


        attach_function :_glGetShaderInfoLog, :glGetShaderInfoLog, [GLuint, GLsizei, :pointer, :pointer], :void

        def glGetShaderInfoLog(shader, max_length)
          length  = FFI::MemoryPointer.new GLsizei
          log     = FFI::MemoryPointer.new GLchar, max_length
          _glGetShaderInfoLog(shader, max_length, length, log)

          return log.read_string.force_encoding('UTF-8')
        end

        attach_function :_glGetShaderSource, :glGetShaderSource, [GLuint, GLsizei, :pointer, :pointer], :void

        def glGetShaderSource(shader, buffer_size)
          length = FFI::MemoryPointer.new GLsizei
          source = FFI::MemoryPointer.new GLchar, buffer_size
          _glGetShaderSource(shader, buffer_size, length, source)

          return source.read_string.force_encoding('UTF-8')
        end

        attach_function :glGetUniformLocation,       [GLuint, :string], GLint
        attach_function :glGetUniformfv,             [GLuint, GLint, :pointer], :void
        attach_function :glGetUniformiv,             [GLuint, GLint, :pointer], :void
        attach_function :glGetVertexAttribdv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribfv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribiv,        [GLuint, GLenum, :pointer], :void
        attach_function :glGetVertexAttribPointerv,  [GLuint, GLenum, :pointer], :void
        attach_function :_glIsProgram, :glIsProgram, [GLuint], GLboolean

        def glIsProgram(program)
          return (_glIsProgram(program) == GL_TRUE)
        end

        attach_function :_glIsShader, :glIsShader, [GLuint], GLboolean

        def glIsShader(shader)
          return (_glIsShader(shader) == GL_TRUE)
        end

        attach_function :glLinkProgram,              [GLuint], :void
        attach_function :_glShaderSource, :glShaderSource, [GLuint, GLsizei, :pointer, :pointer], :void

        def glShaderSource(shader, source)
          sources = [source] if source.is_a?(String)
          sources_ptr = FFI::MemoryPointer.new :pointer, sources.size
          length      = FFI::MemoryPointer.new GLint, sources.size
          sources.each do |source|
            sources_ptr.write_pointer FFI::MemoryPointer.from_string(source)
            length.write_int source.length
          end
          _glShaderSource(shader, sources.size, sources_ptr, length)
        end

        attach_function :glUseProgram,               [GLuint], :void
        attach_function :glUniform1f,                [GLint, GLfloat], :void
        attach_function :glUniform2f,                [GLint, GLfloat, GLfloat], :void
        attach_function :glUniform3f,                [GLint, GLfloat, GLfloat, GLfloat], :void
        attach_function :glUniform4f,                [GLint, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :glUniform1i,                [GLint, GLint], :void
        attach_function :glUniform2i,                [GLint, GLint, GLint], :void
        attach_function :glUniform3i,                [GLint, GLint, GLint, GLint], :void
        attach_function :glUniform4i,                [GLint, GLint, GLint, GLint, GLint], :void
        attach_function :_glUniform1fv, :glUniform1fv, [GLint, GLsizei,:pointer], :void

        def glUniform1fv(location, value)
          _glUniform1fv(location, value.count, array_to_pointer(value, GLfloat))
        end

        attach_function :_glUniform2fv, :glUniform2fv, [GLint, GLsizei,:pointer], :void

        def glUniform2fv(location, value)
          _glUniform2fv(location, value.count, array_to_pointer(value, GLfloat))
        end

        attach_function :_glUniform3fv, :glUniform3fv, [GLint, GLsizei,:pointer], :void

        def glUniform3fv(location, value)
          _glUniform3fv(location, value.count, array_to_pointer(value, GLfloat))
        end

        attach_function :_glUniform4fv, :glUniform4fv, [GLint, GLsizei,:pointer], :void

        def glUniform4fv(location, value)
          _glUniform4fv(location, value.count, array_to_pointer(value, GLfloat))
        end

        attach_function :_glUniform1iv, :glUniform1iv, [GLint, GLsizei,:pointer], :void

        def glUniform1iv(location, value)
          _glUniform1iv(location, value.count, array_to_pointer(value, GLint))
        end

        attach_function :_glUniform2iv, :glUniform2iv, [GLint, GLsizei,:pointer], :void

        def glUniform2iv(location, value)
          _glUniform2iv(location, value.count, array_to_pointer(value, GLint))
        end

        attach_function :_glUniform3iv, :glUniform3iv, [GLint, GLsizei,:pointer], :void

        def glUniform3iv(location, value)
          _glUniform3iv(location, value.count, array_to_pointer(value, GLint))
        end

        attach_function :_glUniform4iv, :glUniform4iv, [GLint, GLsizei,:pointer], :void

        def glUniform4iv(location, value)
          _glUniform4iv(location, value.count, array_to_pointer(value, GLint))
        end

        attach_function :_glUniformMatrix2fv, :glUniformMatrix2fv, [GLint, GLsizei, GLboolean, :pointer], :void

        def glUniformMatrix2fv(location, transpose, value)
          flat_value = value.flatten
          _glUniformMatrix2fv(location, flat_value.count, to_glbool(transpose), array_to_pointer(flat_value, GLfloat))
        end

        attach_function :_glUniformMatrix3fv, :glUniformMatrix3fv, [GLint, GLsizei, GLboolean, :pointer], :void

        def glUniformMatrix3fv(location, transpose, value)
          flat_value = value.flatten
          _glUniformMatrix3fv(location, flat_value.count, to_glbool(transpose), array_to_pointer(flat_value, GLfloat))
        end

        attach_function :_glUniformMatrix4fv, :glUniformMatrix4fv, [GLint, GLsizei, GLboolean, :pointer], :void

        def glUniformMatrix4fv(location, transpose, value)
          flat_value = value.flatten
          _glUniformMatrix4fv(location, flat_value.count, to_glbool(transpose), array_to_pointer(flat_value, GLfloat))
        end

        attach_function :glValidateProgram,          [GLuint], :void
        attach_function :glVertexAttrib1d,           [GLuint, GLdouble], :void
        attach_function :_glVertexAttrib1dv, :glVertexAttrib1dv, [GLuint, :pointer], :void

        def glVertexAttrib1dv(index, value)
          _glVertexAttrib1dv(index, array_to_pointer(value, GLdouble))
        end

        attach_function :glVertexAttrib1f,           [GLuint, GLfloat], :void
        attach_function :_glVertexAttrib1fv, :glVertexAttrib1fv, [GLuint, :pointer], :void

        def glVertexAttrib1fv(index, value)
          _glVertexAttrib1fv(index, array_to_pointer(value, GLfloat))
        end

        attach_function :glVertexAttrib1s,           [GLuint, GLshort], :void
        attach_function :_glVertexAttrib1sv, :glVertexAttrib1sv, [GLuint, :pointer], :void

        def glVertexAttrib1sv(index, value)
          _glVertexAttrib1sv(index, array_to_pointer(value, GLshort))
        end

        attach_function :glVertexAttrib2d,           [GLuint, GLdouble, GLdouble], :void
        attach_function :_glVertexAttrib2dv, :glVertexAttrib2dv, [GLuint, :pointer], :void

        def glVertexAttrib2dv(index, value)
          _glVertexAttrib2dv(index, array_to_pointer(value, GLdouble))
        end

        attach_function :glVertexAttrib2f,           [GLuint, GLfloat, GLfloat], :void
        attach_function :_glVertexAttrib2fv, :glVertexAttrib2fv, [GLuint, :pointer], :void

        def glVertexAttrib2fv(index, value)
          _glVertexAttrib2fv(index, array_to_pointer(value, GLfloat))
        end

        attach_function :glVertexAttrib2s,           [GLuint, GLshort, GLshort], :void
        attach_function :_glVertexAttrib2sv, :glVertexAttrib2sv, [GLuint, :pointer], :void

        def glVertexAttrib2sv(index, value)
          _glVertexAttrib2sv(index, array_to_pointer(value, GLshort))
        end

        attach_function :glVertexAttrib3d,           [GLuint, GLdouble, GLdouble, GLdouble], :void
        attach_function :_glVertexAttrib3dv, :glVertexAttrib3dv, [GLuint, :pointer], :void

        def glVertexAttrib3dv(index, value)
          _glVertexAttrib3dv(index, array_to_pointer(value, GLdouble))
        end

        attach_function :glVertexAttrib3f,           [GLuint, GLfloat, GLfloat, GLfloat], :void
        attach_function :_glVertexAttrib3fv, :glVertexAttrib3fv, [GLuint, :pointer], :void

        def glVertexAttrib3fv(index, value)
          _glVertexAttrib3fv(index, array_to_pointer(value, GLfloat))
        end

        attach_function :glVertexAttrib3s,           [GLuint, GLshort, GLshort, GLshort], :void
        attach_function :_glVertexAttrib3sv, :glVertexAttrib3sv, [GLuint, :pointer], :void

        def glVertexAttrib3sv(index, value)
          _glVertexAttrib3sv(index, array_to_pointer(value, GLshort))
        end

        attach_function :_glVertexAttrib4Nbv, :glVertexAttrib4Nbv, [GLuint, :pointer], :void

        def glVertexAttrib4Nbv(index, value)
          _glVertexAttrib4Nbv(index, array_to_pointer(value, GLbyte))
        end

        attach_function :_glVertexAttrib4Niv, :glVertexAttrib4Niv, [GLuint, :pointer], :void

        def glVertexAttrib4Niv(index, value)
          _glVertexAttrib4Niv(index, array_to_pointer(value, GLint))
        end

        attach_function :_glVertexAttrib4Nsv, :glVertexAttrib4Nsv, [GLuint, :pointer], :void

        def glVertexAttrib4Nsv(index, value)
          _glVertexAttrib4Nsv(index, array_to_pointer(value, GLshort))
        end

        attach_function :glVertexAttrib4Nub,         [GLuint, GLubyte, GLubyte, GLubyte, GLubyte], :void
        attach_function :_glVertexAttrib4Nubv, :glVertexAttrib4Nubv, [GLuint, :pointer], :void

        def glVertexAttrib4Nubv(index, value)
          _glVertexAttrib4Nubv(index, array_to_pointer(value, GLubyte))
        end

        attach_function :_glVertexAttrib4Nuiv, :glVertexAttrib4Nuiv, [GLuint, :pointer], :void

        def glVertexAttrib4Nuiv(index, value)
          _glVertexAttrib4Nuiv(index, array_to_pointer(value, GLuint))
        end

        attach_function :_glVertexAttrib4Nusv, :glVertexAttrib4Nusv, [GLuint, :pointer], :void

        def glVertexAttrib4Nusv(index, value)
          _glVertexAttrib4Nusv(index, array_to_pointer(value, GLushort))
        end

        attach_function :_glVertexAttrib4bv, :glVertexAttrib4bv, [GLuint, :pointer], :void

        def glVertexAttrib4bv(index, value)
          _glVertexAttrib4bv(index, array_to_pointer(value, GLbyte))
        end

        attach_function :glVertexAttrib4d,           [GLuint, GLdouble, GLdouble, GLdouble, GLdouble], :void
        attach_function :_glVertexAttrib4dv, :glVertexAttrib4dv, [GLuint, :pointer], :void

        def glVertexAttrib4dv(index, value)
          _glVertexAttrib4dv(index, array_to_pointer(value, GLdouble))
        end

        attach_function :glVertexAttrib4f,           [GLuint, GLfloat, GLfloat, GLfloat, GLfloat], :void
        attach_function :_glVertexAttrib4fv, :glVertexAttrib4fv, [GLuint, :pointer], :void

        def glVertexAttrib4fv(index, value)
          _glVertexAttrib4fv(index, array_to_pointer(value, GLfloat))
        end

        attach_function :_glVertexAttrib4iv, :glVertexAttrib4iv, [GLuint, :pointer], :void

        def glVertexAttrib4iv(index, value)
          _glVertexAttrib4iv(index, array_to_pointer(value, GLint))
        end

        attach_function :glVertexAttrib4s,           [GLuint, GLshort, GLshort, GLshort, GLshort], :void
        attach_function :_glVertexAttrib4sv, :glVertexAttrib4sv, [GLuint, :pointer], :void

        def glVertexAttrib4sv(index, value)
          _glVertexAttrib4sv(index, array_to_pointer(value, GLshort))
        end

        attach_function :_glVertexAttrib4ubv, :glVertexAttrib4ubv, [GLuint, :pointer], :void

        def glVertexAttrib4ubv(index, value)
          _glVertexAttrib4ubv(index, array_to_pointer(value, GLubyte))
        end

        attach_function :_glVertexAttrib4uiv, :glVertexAttrib4uiv, [GLuint, :pointer], :void

        def glVertexAttrib4uiv(index, value)
          _glVertexAttrib4uiv(index, array_to_pointer(value, GLuint))
        end

        attach_function :_glVertexAttrib4usv, :glVertexAttrib4usv, [GLuint, :pointer], :void

        def glVertexAttrib4usv(index, value)
          _glVertexAttrib4usv(index, array_to_pointer(value, GLushort))
        end

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