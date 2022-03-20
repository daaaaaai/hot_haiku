require "test_helper"

class HaikusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @haiku = haikus(:one)
  end

  test "should get index" do
    get haikus_url
    assert_response :success
  end

  test "should create haiku" do
    assert_difference("Haiku.count") do
      post haikus_url, params: { haiku: { author_name: @haiku.author_name, content: @haiku.content } }
    end

    assert_redirected_to haikus_url
  end

  test "should show haiku" do
    get haiku_url(@haiku)
    assert_response :success
  end
end
