class ExpensesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses
    @total_expenses = 0
    @expenses.each { |expense| @total_expenses += expense.amount }
  end

  def new
  end

  def create
  end

  def expense_params
    params.require(:expense).permit(:user_id, :name, :amount)
  end
end
