class CreatePlaybacks < ActiveRecord::Migration
  def change
    create_table :playbacks do |t|
      t.string :name
      t.text :data

      t.timestamps null: false
    end
  end
end
