class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :level
      t.integer :overall

      t.timestamps
    end
  end
end
