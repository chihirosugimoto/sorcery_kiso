class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM posts;'
    add_reference :posts, :user, null: false
  end

  def down
    remove_reference :posts, :user
  end
end
