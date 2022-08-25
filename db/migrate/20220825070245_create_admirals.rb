class CreateAdmirals < ActiveRecord::Migration[5.2]
  def change
    create_table :admirals do |t|
      t.string :name
      t.integer :age
      t.string :rank
      t.boolean :killed_in_action

      t.timestamps
    end
  end
end
