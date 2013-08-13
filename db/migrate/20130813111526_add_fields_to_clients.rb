class AddFieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :person, :string
    add_column :clients, :website, :string
    add_reference :clients, :video, index: true
  end
end
