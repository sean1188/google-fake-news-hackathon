module Quickmaths
  # Main
  def rank_sources(scores, weights)
    nodes = scores.zip(weights.map{|weight| weight/weights.sum.to_r})
    # puts nodes.inspect

    score = calculate_score(nodes, scores)
    shift_weights = shift_weights (nodes, scores, weights)
    new_weights = weights.zip(shift_weights).map do |weight, shift|
      weight + shift
    end
    puts "\nScore: #{score}" 
    puts "New weights #{new_weights}\n\n"

    return new_weights

  end

  private

  def calculate_score(nodes, scores)
     # Weighted Score
     weighted_score = nodes.map do |score, weight|  
      score * weight 
    end.sum
    # puts "Weighted scores: #{weighted_score}"

    # Unweighted Score
    unweighted_score = scores.map do |score| 
      score * 1/nodes.length
    end.sum

    return [unweighted_score, weighted_score].sum/2.to_r
  end

  def shift_weights(nodes, scores, weights)
    nodes.map do |score, weight| 
      correctness = (score > scores.mean ? 1:-1) * 1 - (score - scores.mean).abs
      correctness * weight * (1 - (weight - weights.mean).abs)
    end
  end 

end

# Extends
module Enumerable

  def mean
    self.sum/self.length.to_f
  end

  def standard_deviation
    m = self.sum/self.length.to_f
    sum = self.inject(0){|accum, i| accum +(i-m)**2 }
    return Math.sqrt(sum/(self.length - 1).to_f)
  end
end


# Testing

class TestInstance
  include Quickmaths

  @@weights = [1,1,1,1,1,1,1]

  def test(iter, scores)
    for i in (0..iter) do
        @@weights = rank_sources(scores, @@weights)
    end
  end

end

# TestInstance.new.rank_sources [1, 0.5, 0.7], [1,1,1]
# TestInstance.new.test(100, [0.9, 0.3, 0.2, 0.124,0.5, 0.78, 0.45])
