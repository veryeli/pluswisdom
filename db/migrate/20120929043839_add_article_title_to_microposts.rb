class AddArticleTitleToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :article_title, :string
  end
end
