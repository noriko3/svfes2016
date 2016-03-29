class CreateSheep < ActiveRecord::Migration
  def change
    create_table :sheep do |t|
      t.column :flag, :tinyint, default: 0
      t.timestamps null: false
    end
  end
end
