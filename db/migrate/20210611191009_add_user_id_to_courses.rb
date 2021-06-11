class AddUserIdToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :user_id, :integer
  end
end
