class AddArticleTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :article_title, :string
  end
end
