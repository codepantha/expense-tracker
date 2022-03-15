# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
