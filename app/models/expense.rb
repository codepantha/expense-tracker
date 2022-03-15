class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_groups
  has_many :groups, through: :expense_groups
end
