class AddAttributeToNote < ActiveRecord::Migration[6.0]
  def change
    rename_column :notes, :description, :body
    add_column :notes, :label, :string
    add_column :notes, :title, :string
  end
end
