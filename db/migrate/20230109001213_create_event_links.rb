class CreateEventLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :event_links do |t|
      t.references :person
      t.references :corp_event

      t.timestamps
    end
  end
end
