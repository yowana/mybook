require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "login" do
    rue = users(:rue)
    post :login, :name => rue.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal rue.id, session[:user_id]
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "index without user" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end

end
