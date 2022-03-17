class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses
    @total_expenses = 0
    @expenses.each { |expense| @total_expenses += expense.amount }
  end

  def new
    @expense = Expense.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(user: current_user, name: params[:expense][:name],
                                      amount: params[:expense][:amount])

    if @expense.errors.none?
      redirect_to group_expenses_path, notice: "#{@expense.name} added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:user_id, :name, :amount)
  end
end
