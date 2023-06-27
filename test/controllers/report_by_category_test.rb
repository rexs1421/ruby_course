require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @category1 = categories(:category1)
    @category2 = categories(:category2)
    @operation1 = operations(:operation1)
    @operation2 = operations(:operation2)
    @operation3 = operations(:operation3)
  end

  test "should generate report by category" do
    get :report_by_category, params: { start_date: '2023-4-01', end_date: '2023-06-30' }
    assert_response :success
    
    assert_not_nil assigns(:operations)
    assert_not_nil assigns(:total_amount)
    assert_not_nil assigns(:odate)
    assert_not_nil assigns(:amount)
    
    assert_equal 2, assigns(:operations).size
    assert_equal 39.96, assigns(:total_amount)
    assert_equal ['Category1', 'Category2'], assigns(:odate)
    assert_equal [19.98, 19.98], assigns(:amount)
  end
end