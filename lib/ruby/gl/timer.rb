
module Ruby
  class GL
    class Timer
      include Celluloid

      def initialize(milliseconds, &block)
        @callback = block
        @timer = Timers::Group.new
        @timer.every(milliseconds.to_f / 1000 ) { @callback.call }
        
        async.run!
      end

      def run!
        loop { @timer.wait }
      end
    end
  end
end