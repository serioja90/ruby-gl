
module Ruby
  class GL
    class Timer
      include Celluloid

      def initialize(interval, &block)
        @callback = block
        @timer = Timers::Group.new
        @timer.every(interval) { @callback.call }
        
        async.run!
      end

      def run!
        loop { @timer.wait }
      end
    end
  end
end