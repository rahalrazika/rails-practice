class AddSlugToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :slug, :string
  end
end
