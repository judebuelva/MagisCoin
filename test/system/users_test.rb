require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Balance", with: @user.balance
    fill_in "Birthday", with: @user.birthday
    fill_in "Contact num", with: @user.contact_num
    fill_in "Email", with: @user.email
    fill_in "F name", with: @user.f_name
    fill_in "L name", with: @user.l_name
    fill_in "Merchant name", with: @user.merchant_name
    fill_in "Owner fname", with: @user.owner_fname
    fill_in "Owner lname", with: @user.owner_lname
    fill_in "Role", with: @user.role
    fill_in "User type", with: @user.user_type
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Balance", with: @user.balance
    fill_in "Birthday", with: @user.birthday
    fill_in "Contact num", with: @user.contact_num
    fill_in "Email", with: @user.email
    fill_in "F name", with: @user.f_name
    fill_in "L name", with: @user.l_name
    fill_in "Merchant name", with: @user.merchant_name
    fill_in "Owner fname", with: @user.owner_fname
    fill_in "Owner lname", with: @user.owner_lname
    fill_in "Role", with: @user.role
    fill_in "User type", with: @user.user_type
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
