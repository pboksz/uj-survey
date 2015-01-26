class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :survey

      t.string :name

      t.timestamps null: false
    end
  end
end
