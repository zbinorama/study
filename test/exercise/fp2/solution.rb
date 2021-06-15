module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in 0...size
          yield self[i]
        end

        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        func = ->(acc, el) { acc << block.call(el) }
        my_reduce MyArray.new, &func
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, el) { el.nil? ? acc : acc << el }
        my_reduce MyArray.new, &func
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        stop_index = size - 1
        start_index =
          if acc.nil?
            acc = self[0]
            1
          else
            0
          end

        for i in start_index..stop_index
          acc = block.call(acc, self[i])
        end

        acc
      end
    end
  end
end
