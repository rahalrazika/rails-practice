class CreateRegestrations < ActiveRecord::Migration[6.1]
  def change
    create_table :regestrations do |t|
      t.string :name
      t.string :email
      t.string :how_heard
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
