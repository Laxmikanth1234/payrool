require 'test_helper'

class PayrollsControllerTest < ActionController::TestCase
  setup do
    @payroll = payrolls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payrolls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payroll" do
    assert_difference('Payroll.count') do
      post :create, payroll: { advance_salary: @payroll.advance_salary, basic: @payroll.basic, daily: @payroll.daily, employe: @payroll.employe, esi: @payroll.esi, gross: @payroll.gross, hra: @payroll.hra, medical: @payroll.medical, net_salary: @payroll.net_salary, other: @payroll.other, payroll_month: @payroll.payroll_month, pf: @payroll.pf, professional_tax: @payroll.professional_tax, tds: @payroll.tds, total_deductions: @payroll.total_deductions, total_working_days: @payroll.total_working_days, travel: @payroll.travel, variable: @payroll.variable, working_days: @payroll.working_days }
    end

    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should show payroll" do
    get :show, id: @payroll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payroll
    assert_response :success
  end

  test "should update payroll" do
    put :update, id: @payroll, payroll: { advance_salary: @payroll.advance_salary, basic: @payroll.basic, daily: @payroll.daily, employe: @payroll.employe, esi: @payroll.esi, gross: @payroll.gross, hra: @payroll.hra, medical: @payroll.medical, net_salary: @payroll.net_salary, other: @payroll.other, payroll_month: @payroll.payroll_month, pf: @payroll.pf, professional_tax: @payroll.professional_tax, tds: @payroll.tds, total_deductions: @payroll.total_deductions, total_working_days: @payroll.total_working_days, travel: @payroll.travel, variable: @payroll.variable, working_days: @payroll.working_days }
    assert_redirected_to payroll_path(assigns(:payroll))
  end

  test "should destroy payroll" do
    assert_difference('Payroll.count', -1) do
      delete :destroy, id: @payroll
    end

    assert_redirected_to payrolls_path
  end
end
