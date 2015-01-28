class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :name, :string

      t.timestamps null: false
    end
  end
end
