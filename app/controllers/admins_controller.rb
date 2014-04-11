#encoding: utf-8
class AdminsController < ApplicationController
  before_filter :set_questions_and_answers
  before_filter :auth_check, :except => [:sign_in, :authorize]
  layout 'bootstrap'

  def auth_check
    if session[:admin] == nil
      flash[:error] = "로그인 해 주세요."
      redirect_to "/admin"
    end
  end

  def sign_in

  end

  def authorize
    if params[:id] == "admin" and params[:password] == "2dProduct"
      session[:admin] = "admin"
      redirect_to "/admins/index"
    else
      flash[:error] = "아이디 혹은 비밀번호가 일치하지 않습니다."
      redirect_to "/admin"
    end
  end

  def index
    @answers = Answer.all
    render :layout => 'admins'
  end

  def index_question
    @total_num = Answer.count
    @analysis = []
    @analysis_1 = []
    @analysis_1 << Answer.where(:answer_1 => 1).count
    @analysis_1 << Answer.where(:answer_1 => 2).count
    @analysis_1 << Answer.where(:answer_1 => 3).count
    @analysis_1 << Answer.where(:answer_1 => 4).count
    @analysis_1 << Answer.where(:answer_1 => 5).count
    @analysis_2 = []
    @analysis_2 << Answer.where(:answer_2 => 1).count
    @analysis_2 << Answer.where(:answer_2 => 2).count
    @analysis_3 = []
    @analysis_3 << Answer.where(:answer_3 => 1).count
    @analysis_3 << Answer.where(:answer_3 => 2).count
    @analysis_3 << Answer.where(:answer_3 => 3).count
    @analysis_3 << Answer.where(:answer_3 => 4).count
    @analysis_4 = []
    @analysis_4 << Answer.where(:answer_4 => 1).count
    @analysis_4 << Answer.where(:answer_4 => 2).count
    @analysis_5 = []
    @analysis_5 << Answer.where(:answer_5 => 1).count
    @analysis_5 << Answer.where(:answer_5 => 2).count
    @analysis_6 = []
    @analysis_6 << Answer.where(:answer_6 => 1).count
    @analysis_6 << Answer.where(:answer_6 => 2).count
    @analysis << @analysis_1
    @analysis << @analysis_2
    @analysis << @analysis_3
    @analysis << @analysis_4
    @analysis << @analysis_5
    @analysis << @analysis_6
  end

  def show_question_detail
    answer = "answer_" + params[:qid]
    @answers = Answer.where("#{answer} = #{params[:aid]}")
    render :layout => 'fixed'
  end
end
