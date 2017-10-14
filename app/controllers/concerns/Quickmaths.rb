module Quickmaths
  # Main
  def self.rank_sources(scores, weights)
    nodes = scores.zip(weights.map {|weight| weight/weights.sum.to_r})
    # puts nodes.inspect

    score = calculate_score(nodes, scores)
    shift_weights = shift_weights(nodes, score, weights)
    new_weights = weights.zip(shift_weights).map do |weight, shift|
      # puts "shifting weight #{weight} by #{shift} ---> #{weight+shift}"
      weight + shift
    end

    new_weights_normalised = new_weights.map do |x|
      # puts "normalises #{x} ---> #{x/(new_weights.max  - new_weights.min)}"
      x/(new_weights.max  - new_weights.min)
    end

    # puts "New weights #{new_weights_normalised}\n\n"
    # puts "\nScore: #{score}"
    

    return new_weights_normalised, score

  end

  private

  def self.calculate_score(nodes, scores)
    # Weighted Score
    weighted_score = nodes.map do |score, weight|
      score * weight
    end.sum

    # Unweighted Score
    unweighted_score = scores.map do |score|
      score * 1/nodes.length
    end.sum

    return [unweighted_score, weighted_score].sum/2.to_r
  end

  
  def self.shift_weights(nodes, final_score, weights)
    # Normalised shift unit weights
    shift_weights = nodes.map do |score, weight| 
      correctness = (score > final_score ? 1:-1) * 1 - (score - final_score).abs
    end
    shift_weights.map do |x|
      (x  - shift_weights.min) / shift_weights.max - shift_weights.min
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
    sum = self.inject(0) {|accum, i| accum +(i-m)**2}
    return Math.sqrt(sum/(self.length - 1).to_f)
  end
end


# Testing

class TestInstance
  include Quickmaths

  @@weights = [1, 1, 1, 1, 1, 1, 1]

  def test(iter, scores)
    for i in (0..iter) do
      @@weights = rank_sources(scores, @@weights)
    end
  end

end

# TestInstance.new.rank_sources [1, 0.5, 0.7], [1,1,1]
# TestInstance.new.test(1000, [0.9, 0.3, 0.2, 0.124,0.5, 0.78, 0.45])
