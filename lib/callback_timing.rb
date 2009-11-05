module ActiveSupport
  module Callbacks
    class Callback
      def call_with_timing(*args)
        rv = nil
        real_time = Benchmark.realtime do
          rv = call_without_timing(*args)
        end
        RAILS_DEFAULT_LOGGER.info("Callback Timing (#{sprintf('%.1fms', real_time*1000)}) #{method.to_s}")
        return rv
      end
      alias_method_chain :call, :timing
    end
  end
end
