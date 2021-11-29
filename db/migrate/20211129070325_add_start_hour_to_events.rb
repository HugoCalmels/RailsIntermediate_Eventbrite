class AddStartHourToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :start_hour, :string
  end
end
