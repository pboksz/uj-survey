class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :survey

      t.integer :order
      t.string :kind
      t.text :text

      t.timestamps null: false
    end
  end
end
