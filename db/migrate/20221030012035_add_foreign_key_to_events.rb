class AddForeignKeyToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :organiser, null: false, index: true
    add_foreign_key :events, :users, column: :organiser_id
  end
end
