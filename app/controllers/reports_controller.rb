class ReportsController < ApplicationController
  def index
    @categories_name = Category.all.map{ |u| [u.name, u.id]}
    @categories = Category.all
  end

  def report_by_category
    category_expenses = Category.pluck(:id)
    @operations = Operation.select(:amount, :category_id)
                          .where(category_id: category_expenses, odate: params[:start_date]..params[:end_date])
                          .group(:name)
                          .joins(:category)
                          .sum(:amount)
    @total_amount = @operations.values.sum
      operations_chart = @operations.map { |name, amount| [name, amount] }
    @odate = operations_chart.map {|e| e[0]}
    @amount = operations_chart.map {|e| e[1]}
       end

  def report_by_dates
      @operations = Operation.select(:odate, :'categories.name',:category_id)
                         .joins(:category)
                         .where(odate: params[:start_date]..params[:end_date])
                         .group(:odate, :'categories.name',:description,)
                         .sum(:amount)
                         @total_amount = @operations.values.sum
    operations_chart = Operation.select(:odate, :amount)
      .where(odate: params[:start_date]..params[:end_date]).map {|r| [r.odate.to_s, r.amount]}
    @odate = operations_chart.map {|e| e[0]}
    @amount = operations_chart.map {|e| e[1]}
   
  end
end
