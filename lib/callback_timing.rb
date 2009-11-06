module ActiveSupport
  module Callbacks
    class Callback
      def evaluate_method_with_timing(method, *args, &block)
        rv = nil
        real_time = Benchmark.realtime do
          rv = evaluate_method_without_timing(method, *args, &block)
        end
        RAILS_DEFAULT_LOGGER.info("Callback Timing (#{sprintf('%.1fms', real_time*1000)}) #{method.to_s}")
        return rv
      end
      alias_method_chain :evaluate_method, :timing
    end
  end
end
