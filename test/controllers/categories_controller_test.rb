require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get :new
    assert_response :success
  end

  test "should get show" do
    get(:show, params: {'id' => @category})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    sign_in_as(@user, "password")
    assert_no_difference 'Category.count' do
      post(:create, params: {category: {name: "sports"}})
    end
    assert_redirected_to categories_path
  end
end