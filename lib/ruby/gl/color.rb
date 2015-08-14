
module Ruby
  class GL
    class Color

      attr_reader :r, :g, :b, :a

      def initialize(options = {})
        @r = options[:r] || options[:red]   || 0
        @g = options[:g] || options[:green] || 0
        @b = options[:b] || options[:blue]  || 0
        @a = options[:a] || options[:alpha] || 0

        from_hex(options[:hex]) if options[:hex]
      end

      def r=(red)
        @r = red.to_i % 256
      end

      def g=(green)
        @g = green.to_i % 256
      end

      def b=(blue)
        @b = blue.to_i % 256
      end

      def a=(alpha)
        @a = alpha.to_i % 256
      end

      def hex=(str)
        from_hex(str)

        str
      end

      def to_a
        [@r, @g, @b, @a].map{|c| c.to_f / 255 }
      end

      private

      def from_hex(str)
        hex    = str.to_s.dup.gsub("#", "")
        raise "Invalid hex color! #{str}" if hex.length < 6 or hex.length > 8
        chunks = []
        hex.split("").each_slice(2) do |slice|
          chunks << slice.join.to_i(16)
        end

        @r, @g, @b, @a = chunks
        @a ||= 0
      end
    end

    class Color
      BLACK = Ruby::GL::Color.new(hex: "#000000")
      WHITE = Ruby::GL::Color.new(hex: "#FFFFFF")
    end
  end
end