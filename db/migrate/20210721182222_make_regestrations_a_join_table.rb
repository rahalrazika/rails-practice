class MakeRegestrationsAJoinTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :regestrations, :name, :string
    remove_column :regestrations, :email, :string
    add_column :regestrations, :user_id, :integer
    Regestration.delete_all
  end
end
