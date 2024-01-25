class AddIstutorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :istutor, :boolean
  end
end
