class AnswerController < ApplicationController
  def index
    
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    
    if @answer.save
      Rails.logger.info("save success!")

    else
      Rails.logger.info("save fail!")

    end
  end

  def edit

  end

  def update

  end

  def show

  end

  def delete

  end

  def destroy

  end

end
