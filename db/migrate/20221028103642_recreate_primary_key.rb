class RecreatePrimaryKey < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :id, :primary_key, auto_increment: true
  end
end
