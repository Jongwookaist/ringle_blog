class AddWriterToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :writer, :string
  end
end
