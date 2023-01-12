class CreateCorpEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :corp_events do |t|
      t.string :name
      t.string :date

      t.timestamps
    end
  end
end
