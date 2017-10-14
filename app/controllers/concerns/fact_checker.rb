module FactChecker
  def self.perform(article)
    checkers = Checker.all
    # Array
    article_scores =
        checkers.map do |checker|
          puts("Checker ID: #{checker.fake_id}, Article Content: #{article.content.to_i}")
          mock_request(checker.fake_id.to_i, article.content.to_i)
        end
    puts("Article Scores: #{article_scores}")
    # Array
    old_checker_weight =
        checkers.map do |checker|
          checker.score.to_f
        end
    puts("Old Checker Weight: #{old_checker_weight}")

    new_checker_weight, final_score = Quickmaths.rank_sources(article_scores, old_checker_weight)
    puts("New Checker Weight: #{new_checker_weight}")
    puts("Final Score: #{final_score}")
    checkers.each_with_index do |checker, index|
      Check.create(article_id: article.id, checker_id: checker.id, old_score: old_checker_weight[index], new_score: new_checker_weight[index])
      checker.update(score: new_checker_weight[index])
    end
    result = {'article_scores' => article_scores, 'old_checker_weight' => old_checker_weight, 'new_checker_weight' => new_checker_weight, 'score' => final_score}
    return result


  end

  private
  def self.mock_request(id, content)
    case id
      when 1
        case content
          when 1
            return 0.1
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
            return 0.2
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
            return 0.3
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
            return 0.4
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
            return 0.5
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
