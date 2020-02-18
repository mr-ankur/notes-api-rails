class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :type
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
