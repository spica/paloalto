# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
  $('#answer_answer_6_1').change () ->
    window.open("/answers/avr", "_blank", "scrollbars=1,resizable=1,height=471,width=1134")
  $('#show_agreement').click () ->
    window.open("/answers/agreement", "_blank", "scrollbars=1,resizable=1,height=632,width=905")
  $('form').submit (e) ->
    console.log("submit!")
    company_name = $('#answer_company_name').val()
    if company_name == ""
      alert ("회사명을 입력하세요.")
      return false
    m_name = $('#answer_manager_name').val()
    if m_name == ""
      alert ("담당자명을 입력하세요.")
      return false
    department = $('#answer_department').val()
    if department == ""
      alert ("부서명을 입력하세요.")
      return false
    phone = $('#answer_phone').val()
    if phone == ""
      alert ("전화번호를 입력하세요.")
      return false
    cellp = $('#answer_cellphone').val()
    if cellp == ""
      alert ("휴대폰 번호를 입력하세요.")
      return false
    email = $('#answer_email').val()
    if email == ""
      alert ("이메일을 입력하세요.")
      return false
    work_lev = $('#answer_work_level').val()
    if work_lev == ""
      alert ("직책을 입력하세요.")
      return false
    if $('input[name="answer[answer_1]"]:checked').length == 0
      alert ("1번 문항 답변을 선택하세요.")
      return false
    if $('input[name="answer[answer_2]"]:checked').length == 0
      alert ("2번 문항 답변을 선택하세요.")
      return false
    if $('input[name="answer[answer_3]"]:checked').length == 0
      alert ("3번 문항 답변을 선택하세요.")
      return false
    if $('input[name="answer[answer_4]"]:checked').length == 0
      alert ("4번 문항 답변을 선택하세요.")
      return false
    if $('input[name="answer[answer_5]"]:checked').length == 0
      alert ("5번 문항 답변을 선택하세요.")
      return false
    if $('input[name="answer[answer_6]"]:checked').length == 0
      alert ("6번 문항 답변을 선택하세요.")
      return false
    if $('input[name="agreement"]:checked').length == 0
      alert ("개인 정보 처리에 동의 하셔야 합니다.")
      return false
    return true
