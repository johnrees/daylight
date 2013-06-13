class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :ordinal
      t.string :name
      t.string :logo
      t.string :slug
      t.text :description

      t.timestamps
    end
    add_index :clients, :ordinal
  end
end
