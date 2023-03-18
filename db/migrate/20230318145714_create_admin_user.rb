class CreateAdminUser < ActiveRecord::Migration[7.0]
  def up
    User.create!(
      name: "admin",
      email: "admin@gmail.com",
      password: "admin123",
      role: 1
    )
  end
  
end
