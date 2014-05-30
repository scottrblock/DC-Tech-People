require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { angellist_url: @user.angellist_url, bio: @user.bio, facebook_url: @user.facebook_url, follower_count: @user.follower_count, id: @user.id, image_url: @user.image_url, name: @user.name, online_bio_url: @user.online_bio_url, twitter_url: @user.twitter_url }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { angellist_url: @user.angellist_url, bio: @user.bio, facebook_url: @user.facebook_url, follower_count: @user.follower_count, id: @user.id, image_url: @user.image_url, name: @user.name, online_bio_url: @user.online_bio_url, twitter_url: @user.twitter_url }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
