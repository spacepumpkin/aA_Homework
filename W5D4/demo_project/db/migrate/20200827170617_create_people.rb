class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
    end
    
    add_index(:people, :house_id, {unique: true} )

  end
end


