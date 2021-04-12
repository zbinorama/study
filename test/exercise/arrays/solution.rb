module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array[0]
        array.each do |el|
          max = el if el > max
        end

        array.map { |el| el.abs == el ? max : el }
      end

      def search(array, query)
        i_left = 0
        i_right = array.length - 1

        binary_search(array, i_left, i_right, query)
      end

      private

      def binary_search(array, i_left, i_right, query)
        return -1 if i_left > i_right

        i_mid = (i_left + i_right) / 2
        if array[i_mid] == query
          i_mid
        elsif array[i_mid] > query
          binary_search(array, i_left, i_mid - 1, query)
        else
          binary_search(array, i_mid + 1, i_right, query)
        end
      end
    end
  end
end
