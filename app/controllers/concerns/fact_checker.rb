module FactChecker
  def self.perform(article)
    checkers = Checker.all
    article_scores =
        checkers.map do |checker|
          mock_request(checker.id, article.content.to_i)
        end
    old_checker_scores =
        checkers.map do |checker|
          checker.score
        end

    new_checker_scores = Quickmaths.rank_sources(article_scores, old_checker_scores)
    checkers.each_with_index do |checker, index|
      Check.create(article.id, checker.id, old_checker_scores[index], new_checker_scores[index])
      checker.update(score: new_checker_scores[index])
    end
    return article_scores

  end

  private
  def mock_request(id, content)
    case id
      when 1
        case content
          when 1
            return 1
          when 2
            return 1
          when 3
            return 1
          when 4
            return 0
          when 5
            return 0
        end
      when 2
        case content
          when 1
            return 1
          when 2
            return 1
          when 3
            return 1
          when 4
            return 0
          when 5
            return 0
        end
      when 3
        case content
          when 1
            return 1
          when 2
            return 1
          when 3
            return 1
          when 4
            return 0
          when 5
            return 0
        end
      when 4
        case content
          when 1
            return 1
          when 2
            return 1
          when 3
            return 1
          when 4
            return 0
          when 5
            return 0
        end
      when 5
        case content
          when 1
            return 1
          when 2
            return 1
          when 3
            return 1
          when 4
            return 0
          when 5
            return 0
        end

    end

  end
end
