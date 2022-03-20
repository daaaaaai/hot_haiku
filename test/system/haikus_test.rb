require "application_system_test_case"

class HaikusTest < ApplicationSystemTestCase
  setup do
    @haiku = haikus(:one)
  end

  test "トップページが俳句一覧" do
    visit root_url
    assert_selector "h1", text: "HotHaiku"
  end

  test "俳句を読める" do
    visit haikus_url

    fill_in "author_name", with: @haiku.author_name
    fill_in "content", with: @haiku.content
    click_on "俳句を詠む"

    assert_text "俳句を投稿しました"
  end

  test "should create haiku" do
    visit haikus_url

    fill_in "content", with: @haiku.content
    click_on "俳句を詠む"

    assin haiku = @haiku

    assert_text "俳句を投稿しました"

    assert_equal "詠み人知らず", Haiku.last.author_name
  end

end
