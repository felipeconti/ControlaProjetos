require 'test_helper'

class MeetingItemsControllerTest < ActionController::TestCase
  setup do
    @meeting_item = meeting_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meeting_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meeting_item" do
    assert_difference('MeetingItem.count') do
      post :create, meeting_item: {  }
    end

    assert_redirected_to meeting_item_path(assigns(:meeting_item))
  end

  test "should show meeting_item" do
    get :show, id: @meeting_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meeting_item
    assert_response :success
  end

  test "should update meeting_item" do
    put :update, id: @meeting_item, meeting_item: {  }
    assert_redirected_to meeting_item_path(assigns(:meeting_item))
  end

  test "should destroy meeting_item" do
    assert_difference('MeetingItem.count', -1) do
      delete :destroy, id: @meeting_item
    end

    assert_redirected_to meeting_items_path
  end
end
