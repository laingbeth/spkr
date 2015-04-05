class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :headline
      t.string :contact
      t.string :topic
      t.text :description

      t.timestamps null: false
    end
  end
end
