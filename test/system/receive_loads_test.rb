require "application_system_test_case"

class ReceiveLoadsTest < ApplicationSystemTestCase
  setup do
    @receive_load = receive_loads(:one)
  end

  test "visiting the index" do
    visit receive_loads_url
    assert_selector "h1", text: "Receive Loads"
  end

  test "creating a Receive load" do
    visit receive_loads_url
    click_on "New Receive Load"

    fill_in "Amount", with: @receive_load.amount
    fill_in "Date time", with: @receive_load.date_time
    fill_in "Recv", with: @receive_load.recv_id
    fill_in "Send", with: @receive_load.send_id
    click_on "Create Receive load"

    assert_text "Receive load was successfully created"
    click_on "Back"
  end

  test "updating a Receive load" do
    visit receive_loads_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @receive_load.amount
    fill_in "Date time", with: @receive_load.date_time
    fill_in "Recv", with: @receive_load.recv_id
    fill_in "Send", with: @receive_load.send_id
    click_on "Update Receive load"

    assert_text "Receive load was successfully updated"
    click_on "Back"
  end

  test "destroying a Receive load" do
    visit receive_loads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receive load was successfully destroyed"
  end
end
