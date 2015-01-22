class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question

      t.integer :order
      t.text :text

      t.timestamps null: false
    end
  end
end
