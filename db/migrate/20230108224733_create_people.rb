class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :company
      t.string :sex
      t.string :notes

      t.timestamps
    end
  end
end
