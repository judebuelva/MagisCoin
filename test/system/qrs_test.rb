require "application_system_test_case"

class QrsTest < ApplicationSystemTestCase
  setup do
    @qr = qrs(:one)
  end

  test "visiting the index" do
    visit qrs_url
    assert_selector "h1", text: "Qrs"
  end

  test "creating a Qr" do
    visit qrs_url
    click_on "New Qr"

    fill_in "User", with: @qr.user_id
    click_on "Create Qr"

    assert_text "Qr was successfully created"
    click_on "Back"
  end

  test "updating a Qr" do
    visit qrs_url
    click_on "Edit", match: :first

    fill_in "User", with: @qr.user_id
    click_on "Update Qr"

    assert_text "Qr was successfully updated"
    click_on "Back"
  end

  test "destroying a Qr" do
    visit qrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Qr was successfully destroyed"
  end
end
