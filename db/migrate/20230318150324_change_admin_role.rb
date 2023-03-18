class ChangeAdminRole < ActiveRecord::Migration[7.0]
  def change
    user = User.find_by(email: 'admin@gmail.com')
    user.update(role: 'admin') if user
  end
end
