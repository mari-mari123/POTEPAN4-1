class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :start_date, :date
    add_column :posts, :end_date, :date
    add_column :posts, :whole_day, :boolean
  end
end
