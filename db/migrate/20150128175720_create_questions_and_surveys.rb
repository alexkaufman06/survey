class CreateQuestionsAndSurveys < ActiveRecord::Migration
  def change
    create_table :questions_surveys, id: false do |t|
      t.belongs_to :question, index: true
      t.belongs_to :survey, index: true
    end
  end
end
