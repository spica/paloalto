#encoding: utf-8
class AdminsController < ApplicationController
  before_filter :set_questions_and_answers
  before_filter :auth_check, :except => [:sign_in, :authorize]
  layout 'bootstrap', :except => :index
  layout 'admins', :only => :index

  def auth_check
    if session[:admin] == nil
      flash[:error] = "로그인 해 주세요."
      redirect_to "/admin"
    end
  end

  def sign_in

  end

  def authorize
    if params[:id] == "admin" and params[:password] == "jkl"
      session[:admin] = "admin"
      redirect_to "/admins/index"
    else
      flash[:error] = "아이디 혹은 비밀번호가 일치하지 않습니다."
      redirect_to "/admin"
    end
  end

  def index
    @answers = Answer.all.page params[:page]
    respond_to do |format|
      format.html
      format.xls {
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
        @idx = -1
        Axlsx::Package.new do |p|
          p.workbook.add_worksheet(:name => "전체보기") do |sheet|
            sheet.add_row ["회사명", "담당자", "부서명", "사무실 전화", "직책", "이메일", "휴대폰", @questions[0], @questions[1], @questions[2], @questions[3], @questions[4], @questions[5]]
            Answer.all.each do |ans|
              sheet.add_row [ans.company_name, ans.manager_name, ans.department, ans.phone, ans.work_level, ans.email, ans.cellphone, @answer[0][ans.answer_1], @answer[1][ans.answer_2], @answer[2][ans.answer_3],@answer[3][ans.answer_4],@answer[4][ans.answer_5],@answer[5][ans.answer_6] ]
            end
          end
          p.workbook.add_worksheet(:name => "질문으로 모아보기") do |sheet|
            sheet.add_row ["no", "질문", "답변 통계"]
            @questions.each do |q|
              @idx += 1
              0..@analysis[@idx].length.times do |i|
                if i == 0
                  sheet.add_row [ @idx + 1, q, @answer[@idx][i+1], @analysis[@idx][i], (@analysis[@idx][i].to_f * 100.0 / @total_num.to_f).round(2).to_s + " %"]
                else
                  sheet.add_row [ nil, nil, @answer[@idx][i+1], @analysis[@idx][i], (@analysis[@idx][i].to_f * 100.0 / @total_num.to_f).round(2).to_s + " %"]
                end
              end
            end
          end
          temp = Tempfile.new('test.xlsx')
          p.serialize(temp.path)
          send_file temp.path, :filename => "jkl.xlsx", :type => "application/xlsx"
        end
      }
    end
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
