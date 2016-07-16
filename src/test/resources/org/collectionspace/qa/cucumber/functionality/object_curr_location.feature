#Created by Forest Yang

@functionality
Feature: Object Current Location

  #Test 1a
  Scenario: Object Current Location is updated from the ojbect's related Loc/Mov/Inv record(s)
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page 
      And clicks on the Create button
    Then the titlebar should contain "Cataloging"
      And enters "34234" in the "Cataloging" "Identification Number" field
      And enters "Tango Object" in the "Cataloging" "Title" field
      And clicks the "Save" button
    Then the titlebar should contain "34234 - Tango Object"
      And selects the "Loc/Mov/Inv" tab
      And clicks the "Add Record" button
  #not a stepdef
    Then an "Add Related Location/Movement/Inventory Record" dialog should appear
      And clicks the "Create" button
      And enters "Alpha Location" in the "Location/Movement/Inventory" "Current Location" field
    Then a dropdown list should appear in the "Location/Movement/Inventory" "Current Location" row
      And selects "Offsite Storage Locations" from dropdown in "Location/Movement/Inventory" "Current Location" row
      And enters "1700-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Save" button
    Then a confirmation dialog should appear
  #not a stepdef
      And clicks on the "Save" button in the confirmation dialog
      And enters "Tango Object" in the top nav search field
      And clicks on the top nav search submit button
  #not a stepdef
      And clicks the link to "Tango Object" on the Find and Edit page
    Then "Alpha Location" should appear in the "Procedures" area
    Then "Alpha Location" should appear in the "Terms Used" area
    Then "Alpha Location" should be in the "Computed Current Location" field
    Then close the browser

  #Test 1b
  Scenario: Object Current Location is updated from the object's related Loc/Mov/Inv record(s)
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Location/Movement/Inventory" 
      And enters "Bravo Location" in the "Location/Movement/Inventory" "Current Location" field
    Then a dropdown list should appear in the "Location/Movement/Inventory" "Current Location" row
      And selects "Offsite Storage Locations" from dropdown in "Location/Movement/Inventory" "Current Location" row
      And enters "1800-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Save" button
    Then a confirmation dialog should appear
      And clicks on the "Save" button in the confirmation dialog
      And enters "Tango Object" in the top nav search field
      And clicks on the top nav search submit button
      And clicks the link to "Tango Object" on the Find and Edit page
  #not a stepdef
      And clicks the "Add" button in the "Procedures" area
  #probably replace this one
    Then a confirmation dialog should appear
      And selects "Location/Movement/Inventory" from dropdown in "Search Existing" row
  #probably not how secondary search stepdefs are implemented, if they even are implemented
      And enters "Bravo" in the "search" field
      And clicks the "search" button
      And checks "Bravo Location" in search results
      And clicks the "Add to Current Record" button
    Then "Bravo Location" should appear in the "Procedures" area
    Then "Alpha Location" should be in the "Computed Current Location" field
      And reloads the page
    Then "Bravo Location" should be in the "Computed Current Location" field
    Then "Bravo Location" should appear in the "Terms Used" area
    Then close the browser

  #Test 1c
  Scenario: Object Current Location is updated from the object's related Loc/Mov/Inv record(s) (3)
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "Charlie Organization" in the "Location/Movement/Inventory" "Current Location" field
    Then a dropdown list should appear in the "Location/Movement/Inventory" "Current Location" row
      And selects "Offsite Storage Locations" from dropdown in "Location/Movement/Inventory" "Current Location" row
      And enters "1900-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Save" button
    Then a confirmation dialog should appear 
      And clicks on the "Save" button in the confirmation dialog
      And enters "Tango Object" in the top nav search field
      And clicks on the top nav search submit button
      And clicks the link to "Tango Object" on the Find and Edit page
      And selects the "Loc/Mov/Inv" tab
      And clicks the "Add Record" button
      And enters "Charlie" in the "search" field
      And clicks the "search" button
      And checks "Charlie Organization" in search results
      And clicks the "Add to Current Record" button
      And selects the "Current Record" tab
    Then "Charlie Organization" should appear in the "Procedures" area
    Then "Alpha Location" should appear in the "Procedures" area
    Then "Bravo Location" should appear in the "Procedures" area
    Then "Bravo Location" should be in the "Computed Current Location" field
    Then "Bravo Location" should appear in the "Terms Used" area
      And reloads the page
    Then "Charlie Organization" should be in the "Computed Current Location" field
    Then "Charlie Organization" should appear in the "Terms Used" area

  #Test 2 continues from above: Object Current Location is updated when a related Location/Movement/Inventory record is updated
      And enters "Alpha Location" in the top nav search field
      And selects "Location/Movement/Inventory" from top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "Alpha Location" on the Find and Edit page
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "2000-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Save" button
    Then a confirmation dialog should appear
      And clicks on the "Save" button in the confirmation dialog
  # probably not a stepdef
      And clicks "Tango Object" in the "Cataloging" area
    Then "Alpha Location" should appear in the "Terms Used" area
    Then "Alpha Location" should be in the "Computed Current Location" field

  #Test3 continues from above: Object Current Location is updated when a related Location/Movement/Inventory record is deleted
      And clicks "Alpha Location" in the "Procedures" area
      And clicks the "Delete" button 
    Then a confirmation dialog should appear
      And clicks the "Delete" button in the confirmation dialog
    Then a confirmation dialog should appear
      And clicks the "OK" button in the confirmation dialog
      And enters "Tango Object" in the top nav search field
      And clicks on the top nav search submit button
      And clicks the link to "Tango Object" 
    Then "Charlie Organization" should appear in the "Procedures" area
    Then "Bravo Location" should appear in the "Procedures" area
    Then "Alpha Location" should not appear in the "Procedures" area
    Then "Charlie Organization" should be in the "Computed Current Location" field
    Then "Charlie Organization" should appear in the "Terms Used" area

  #Test4 continues from above: Object Current Location is updated when a relationship to a "Location/Movement/Inventory" record is deleted
      And selects the "Loc/Mov/Inv" tab
      And clicks the "x" button next to "Charlie Organization"
    Then a confirmation dialog should appear
      And clicks the "Delete" button in the confirmation dialog
    Then a confirmation dialog should appear
      And clicks the "OK" button in the confirmation dialog
      And enters "Tango Object" in the top nav search field
      And clicks on the top nav search submit button
      And clicks the link to "Tango Object"
    Then "Bravo Location" should appear in the "Procedures" area
    Then "Alpha Location" should not appear in the "Procedures" area
    Then "Charlie Organization" should not appear in the "Procedures" area
    Then "Bravo Location" should be in the "Computed Current Location" field
    Then "Bravo Location" should appear in the "Terms Used" area
    Then close the browser



