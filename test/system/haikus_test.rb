require "application_system_test_case"

class HaikusTest < ApplicationSystemTestCase
  setup do
    @haiku = haikus(:one)
  end

  test "visiting the index" do
    visit haikus_url
    assert_selector "h1", text: "Haikus"
  end

  test "should create haiku" do
    visit haikus_url
    click_on "New haiku"

    fill_in "Author name", with: @haiku.author_name
    fill_in "Content", with: @haiku.content
    click_on "Create Haiku"

    assert_text "Haiku was successfully created"
    click_on "Back"
  end

  test "should update Haiku" do
    visit haiku_url(@haiku)
    click_on "Edit this haiku", match: :first

    fill_in "Author name", with: @haiku.author_name
    fill_in "Content", with: @haiku.content
    click_on "Update Haiku"

    assert_text "Haiku was successfully updated"
    click_on "Back"
  end

  test "should destroy Haiku" do
    visit haiku_url(@haiku)
    click_on "Destroy this haiku", match: :first

    assert_text "Haiku was successfully destroyed"
  end
end
