require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit people_url
    click_on "New Person"

    fill_in "Battesimo", with: @person.battesimo
    fill_in "Cap", with: @person.cap
    fill_in "Cellulare", with: @person.cellulare
    fill_in "Cognome", with: @person.cognome
    fill_in "Comune", with: @person.comune
    fill_in "Data di nascita", with: @person.data_di_nascita
    fill_in "Group", with: @person.group_id
    fill_in "Indirizzo", with: @person.indirizzo
    fill_in "Luogo di nascita", with: @person.luogo_di_nascita
    fill_in "Madre", with: @person.madre
    fill_in "Nome", with: @person.nome
    fill_in "Padre", with: @person.padre
    fill_in "Parrocchia", with: @person.parrocchia
    fill_in "Telefono", with: @person.telefono
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit people_url
    click_on "Edit", match: :first

    fill_in "Battesimo", with: @person.battesimo
    fill_in "Cap", with: @person.cap
    fill_in "Cellulare", with: @person.cellulare
    fill_in "Cognome", with: @person.cognome
    fill_in "Comune", with: @person.comune
    fill_in "Data di nascita", with: @person.data_di_nascita
    fill_in "Group", with: @person.group_id
    fill_in "Indirizzo", with: @person.indirizzo
    fill_in "Luogo di nascita", with: @person.luogo_di_nascita
    fill_in "Madre", with: @person.madre
    fill_in "Nome", with: @person.nome
    fill_in "Padre", with: @person.padre
    fill_in "Parrocchia", with: @person.parrocchia
    fill_in "Telefono", with: @person.telefono
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end
