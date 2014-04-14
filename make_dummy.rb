1..100.times.each do |i|
  answer = Answer.new
  answer.company_name = "test_#{i}"
  answer.manager_name = "kim_test_#{i}"
  answer.department = "depart#{i}"
  answer.work_level = "work_lev_#{i}"
  answer.phone = "13123123"
  answer.cellphone = "123123123"
  answer.email = "tset#{i}@email.com"
  answer.answer_1 = i % 5
  answer.answer_2 = i % 2
  answer.answer_3 = i % 4
  answer.answer_4 = i % 2
  answer.answer_5 = i % 2
  answer.answer_6 = i % 2
  if answer.save
    puts '#{i} save success'
  end
end
