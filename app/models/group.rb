class Group < ApplicationRecord
  belongs_to :user
  has_many :expense_groups
  has_many :expenses, through: :expense_groups
end
