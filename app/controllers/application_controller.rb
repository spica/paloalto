class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_questions_and_answers
    @questions = []
    @questions << "현재 사용 중인 데스크톱/노트북 대수는 어떻게 되십니까?"
    @questions << "차세대 방화벽에 대해서 알고 계시거나 소개를 받으신 적이 있습니까?"
    @questions << "현재 사용하고 계시는 방화벽에 대한 불만사항이 있다면 어떤 것이 있습니까?"
    @questions << "차세대 방화벽 구축 프로젝트에 대해서 방문컨설팅을 원하십니까?"
    @questions << "팔로알토 네트웍스 솔루션에 관한 제품정보, 신제품 출시, 세미나 초청 등 마케팅 관련 자료를 수신하겠습니까?"
    @questions << "팔로알토 네트웍스의 AVR(Application Visibility and Risk Report) 프로그램을 통해 귀사의 네트워크에 대한 건강 진단을 원하십니까?"

    @answer = {}
    answer = []
    answer << ""
    answer << "100대 미만"
    answer << "100대 이상~1,000대 미만"
    answer << "1,000대 이상~5,000대 미만"
    answer << "5,000대 이상~10,000대 미만"
    answer << "10,000대 이상"
    @answer[:answer_1] = answer
    answer = []
    answer << ""
    answer << "예"
    answer << "아니오"
    @answer[:answer_2] = answer
    answer = []
    answer << ""
    answer << "성능이슈"
    answer << "관리 편의성 부족"
    answer << "보안기능 미비"
    answer << "없음"
    @answer[:answer_3] = answer
    answer = []
    answer << ""
    answer << "예"
    answer << "아니오"
    @answer[:answer_4] = answer
    answer = []
    answer << ""
    answer << "예"
    answer << "아니오"
    @answer[:answer_5] = answer
    answer = []
    answer << ""
    answer << "예"
    answer << "아니오"
    @answer[:answer_6] = answer
  end
end
