class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :start_date
      t.string :duration
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.belongs_to :organizer, index: true

      t.timestamps
    end
  end
end
