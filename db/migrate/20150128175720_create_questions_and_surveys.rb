class CreateQuestionsAndSurveys < ActiveRecord::Migration
  def change
    create_table :questions_surveys, id: false do |t|
      t.belongs_to :questions, index: true
      t.belongs_to :surveys, index: true
    end
  end
end
