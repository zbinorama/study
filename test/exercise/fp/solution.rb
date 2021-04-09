module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]

      def rating(array)
        filtered_films = array.filter do |film|
          !film['rating_kinopoisk'].nil? && !film['rating_kinopoisk'].to_f.zero? &&
            !film['country'].nil? && film['country'].split(',').count >= 2
        end

        rating_sum = filtered_films.map do |film|
          film['rating_kinopoisk'].to_f
        end.reduce(:+)

        rating_sum / filtered_films.count
      end

      def chars_count(films, threshold)
        char = 'и'

        filtered_films = films.filter do |film|
          !film['rating_kinopoisk'].nil? &&
            film['rating_kinopoisk'].to_f >= threshold &&
            film['name'].chars.include?(char)
        end

        filtered_films.map { |film| film['name'].count(char) }.reduce(:+)
      end
    end
  end
end
