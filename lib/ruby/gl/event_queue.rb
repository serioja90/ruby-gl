
module Ruby
  class GL
    class EventQueue
      include Singleton
      include Celluloid
      include SDL::Events

      def initialize
        @listeners = ThreadSafe::Array.new
        every(0.01) { async.get_events }
      end

      def on_event(&block)
        @listeners << block if block_given?
      end

      private

      def get_events
        event_pointer = SDL::Event.create_pointer
        while SDL::poll_event(event_pointer) != 0
          event = SDL::Event.create_event(event_pointer)
          handle_event event
        end
      end

      def handle_event(event)
        @listeners.each do |listener|
          listener.call event
        end
      end

      class << self
        def method_missing(name, *args, &block)
          instance.send name, *args, &block
        end
      end
    end
  end
end