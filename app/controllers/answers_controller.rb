class AnswersController < ApplicationController
  def index
    
  end

  def new
    @answer = Answer.new
  end

  def create
    Rails.logger.info(params[:answer])
    @answer = Answer.new
    @answer.company_name = params[:answer][:company_name]
    @answer.manager_name = params[:answer][:manager_name]
    @answer.phone = params[:answer][:phone]
    @answer.work_level = params[:answer][:work_level]
    @answer.email = params[:answer][:email]
    @answer.cellphone = params[:answer][:cellphone]
    @answer.department = params[:answer][:department]
    @answer.answer_1 = params[:answer][:answer_1].to_i
    @answer.answer_2 = params[:answer][:answer_2].to_i
    @answer.answer_3 = params[:answer][:answer_3].to_i
    @answer.answer_4 = params[:answer][:answer_4].to_i
    @answer.answer_5 = params[:answer][:answer_5].to_i
    @answer.answer_6 = params[:answer][:answer_6].to_i
    
    if @answer.save
      Rails.logger.info("save success!")
      redirect_to @answer
    else
      Rails.logger.info("save fail!")
      render :action => "new"
    end
  end

  def edit

  end

  def update

  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy

  end

  def agreement
    render :layout => false
  end

  def avr
    render :layout => false
  end
end
