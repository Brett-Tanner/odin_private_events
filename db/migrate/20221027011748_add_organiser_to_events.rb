class AddOrganiserToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :organiser, index: true
    add_foreign_key :events, :users, column: :id
  end
end
