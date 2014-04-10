class AdminsController < ApplicationController
  before_filter :set_questions_and_answers
  layout 'admins'
  def index
    @answers = Answer.all
  end

  def index_question
    @answers = Answer.all
  end
end
