require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    @category1 = categories(:category1)
    @category2 = categories(:category2)
    @operation1 = operations(:operation1)
    @operation2 = operations(:operation2)
    @operation3 = operations(:operation3)
  end

  test "should generate report by dates" do
    get :report_by_dates, params: { start_date: '2023-05-24', end_date: '2023-06-24' }
    assert_response :success
    
    assert_not_nil assigns(:operations)
    
    assert_not_nil assigns(:odate)
    assert_not_nil assigns(:amount)
    
    assert_equal 3, assigns(:operations).size
    assert_equal 30, assigns(:total_amount)
    assert_equal ['2023-05-26', '2023-05-25','2023-05-24'], assigns(:odate)
    assert_equal [10,10, 10.0], assigns(:amount)
  end
end