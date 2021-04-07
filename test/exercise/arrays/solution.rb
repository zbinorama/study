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

      def search(_array, _query)
        0
      end
    end
  end
end
