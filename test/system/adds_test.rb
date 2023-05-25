require "application_system_test_case"

class AddsTest < ApplicationSystemTestCase
  setup do
    @add = adds(:one)
  end

  test "visiting the index" do
    visit adds_url
    assert_selector "h1", text: "Adds"
  end

  test "should create add" do
    visit adds_url
    click_on "New add"

    fill_in "Contact", with: @add.contact
    fill_in "Email", with: @add.email
    fill_in "First name", with: @add.first_name
    fill_in "Last name", with: @add.last_name
    fill_in "Phone number", with: @add.phone_number
    click_on "Create Add"

    assert_text "Add was successfully created"
    click_on "Back"
  end

  test "should update Add" do
    visit add_url(@add)
    click_on "Edit this add", match: :first

    fill_in "Contact", with: @add.contact
    fill_in "Email", with: @add.email
    fill_in "First name", with: @add.first_name
    fill_in "Last name", with: @add.last_name
    fill_in "Phone number", with: @add.phone_number
    click_on "Update Add"

    assert_text "Add was successfully updated"
    click_on "Back"
  end

  test "should destroy Add" do
    visit add_url(@add)
    click_on "Destroy this add", match: :first

    assert_text "Add was successfully destroyed"
  end
end
