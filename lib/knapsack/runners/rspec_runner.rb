module Knapsack
  module Runners
    class RSpecRunner
      def self.run(args)
        allocator = Knapsack::AllocatorBuilder.new(Knapsack::Adapters::RSpecAdapter).allocator

        Knapsack.logger.info
        Knapsack.logger.info 'Report specs:'
        Knapsack.logger.info allocator.report_node_tests
        Knapsack.logger.info
        Knapsack.logger.info 'Leftover specs:'
        Knapsack.logger.info allocator.leftover_node_tests
        Knapsack.logger.info
        Knapsack.logger.info Knapsack::Config::Env.shuffle_files ? "Shuffling order of files" : "Not shuffling order of files"

        cmd = %Q[bundle exec rspec #{args} --default-path #{allocator.test_dir} -- #{allocator.stringify_node_tests}]

        exec(cmd)
      end
    end
  end
end
