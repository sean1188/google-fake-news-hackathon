class CheckersController < ApplicationController
  def index
    @checkers = Checker.all.order(score: :desc)
  end

  def show
    @checker = Checker.find(params[:id])
  end

  def score_color(score)
    if score >= 7.5
      'success'
    elsif score <= 2.5
      'danger'
    else
      'warning'
    end
  end

  helper_method :score_color
end
