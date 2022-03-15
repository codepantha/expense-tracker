class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_groups
  has_many :groups, through: :expense_groups

  validates :name, presence: true
  validates :amount, numericality: true
  validates :amount, presence: { message: 'How much did you spend?' }
end
