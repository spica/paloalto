class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :company_name
      t.string :manager_name
      t.string :department #부서
      t.string :work_level # 직책
      t.string :phone
      t.string :cellphone
      t.string :email
      t.integer :answer_1
      t.integer :answer_2
      t.integer :answer_3
      t.integer :answer_4
      t.integer :answer_5
      t.integer :answer_6

      t.timestamps
    end
  end
end
