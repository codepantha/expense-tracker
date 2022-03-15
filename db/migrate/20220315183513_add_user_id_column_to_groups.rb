# frozen_string_literal: true

class AddUserIdColumnToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :user_id, :integer
    add_index :groups, :user_id
    add_foreign_key :groups, :users
  end
end
