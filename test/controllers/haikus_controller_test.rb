require "test_helper"

class HaikusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @haiku = haikus(:one)
  end

  test "should get index" do
    get haikus_url
    assert_response :success
  end

  test "should get new" do
    get new_haiku_url
    assert_response :success
  end

  test "should create haiku" do
    assert_difference("Haiku.count") do
      post haikus_url, params: { haiku: { author_name: @haiku.author_name, content: @haiku.content } }
    end

    assert_redirected_to haiku_url(Haiku.last)
  end

  test "should show haiku" do
    get haiku_url(@haiku)
    assert_response :success
  end

  test "should get edit" do
    get edit_haiku_url(@haiku)
    assert_response :success
  end

  test "should update haiku" do
    patch haiku_url(@haiku), params: { haiku: { author_name: @haiku.author_name, content: @haiku.content } }
    assert_redirected_to haiku_url(@haiku)
  end

  test "should destroy haiku" do
    assert_difference("Haiku.count", -1) do
      delete haiku_url(@haiku)
    end

    assert_redirected_to haikus_url
  end
end
