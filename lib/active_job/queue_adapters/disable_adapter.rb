require 'active_job'

module ActiveJob
  module QueueAdapters
    class DisableAdapter
      def enqueue(*)
        raise ActiveJob::Disable::DisabledError
      end

      def enqueue_at(*)
        raise ActiveJob::Disable::DisabledError
      end
    end
  end
end
