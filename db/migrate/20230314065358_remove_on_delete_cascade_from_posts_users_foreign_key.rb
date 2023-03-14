class RemoveOnDeleteCascadeFromPostsUsersForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, :users
    add_foreign_key :posts, :users
  end
end
