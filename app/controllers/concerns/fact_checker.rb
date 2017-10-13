module FactChecker
  def self.perform(article)
    old_rating =
        Checker.all.map do |checker|
          checker.score
        end

    new_rating =
        Checker.all.map do |checker|

        end

  end
end
