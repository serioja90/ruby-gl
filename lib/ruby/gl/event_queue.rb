
module Ruby
  class GL
    class EventQueue
      include Celluloid

      def initialize
        @listeners = ThreadSafe::Array.new
        @active    = false

        async.run!
      end

      def on_event(&block)
        @listeners << block if block_given?
      end

      private

      def run!
        @active = true
        while @active
          #event = SDL::Event.poll
          #handle_event event if event
        end
      end

      def handle_event(event)
        @listeners.each do |listener|
          listener.call event
        end
      end
    end
  end
end