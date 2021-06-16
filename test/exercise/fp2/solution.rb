module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        first, *rest = self

        block.call(first)
        MyArray.new(rest).my_each(&block) unless rest.empty?

        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        func = ->(acc, el) { MyArray.new([*acc, block.call(el)]) }
        my_reduce MyArray.new, &func
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(acc, el) { el.nil? ? acc : MyArray.new([*acc, el]) }
        my_reduce MyArray.new, &func
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        first, *rest = self
        new_acc = acc.nil? ? first : block.call(acc, first)

        if rest.empty?
          new_acc
        else
          MyArray.new(rest).my_reduce(new_acc, &block)
        end
      end
    end
  end
end
