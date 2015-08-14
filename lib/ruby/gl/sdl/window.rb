
module Ruby
  class GL
    module SDL
      class Window < FFI::Struct
        layout :magic, :pointer,
               :id,    :uint32,
               :title, :string,
               :icon,  :pointer,
               :x,     :int,
               :y,     :int,
               :w,     :int,
               :h,     :int,
               :min_w, :int,
               :min_h, :int,
               :max_w, :int,
               :max_h, :int,
               :flags, :uint32,
               :last_fullscreen_flags, :uint32,
               :windowed,              :pointer,
               :fullscreen_mode,       :pointer,
               :brightness,            :float,
               :gamma,                 :pointer,
               :saved_gamma,           :pointer,
               :surface,               :pointer,
               :surface_valid,         :bool

      end
    end
  end
end