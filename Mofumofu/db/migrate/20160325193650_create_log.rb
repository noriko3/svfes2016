class CreateLog < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.column :data_type, :int, null: false
      t.timestamps null: false
    end
  end
end
