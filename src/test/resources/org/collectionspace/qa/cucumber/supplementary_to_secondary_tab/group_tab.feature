#Created by Forest Yang 1/6/2016

@supplementarysecondary
Feature: Group Secondary Tab

  #Test1
  Scenario: Basic Secondary Tab Testing
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Cataloging"
      And enters "Gnerar" in the "Cataloging" "Identification Number" field
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Group" tab
    Then "No related record selected" should be displayed
      And clicks the "+ Add Record" button
      And clicks the "Create" button
    Then an empty form should be present
    Then "Creating a new record..." should be displayed
    Then the "Cancel changes" button at the bottom of the record "should not" be clickable
    Then the "Cancel changes" button at the top of the record "should not" be clickable
    Then the "Delete this relation." button at the bottom of the record "should not" be clickable
    Then the "Delete this relation." button at the top of the record "should not" be clickable
      And enters "transpleb" in the "Cataloging" "Title" field
    Then the "Cancel changes" button at the bottom of the record "should" be clickable
    Then the "Cancel changes" button at the top of the record "should" be clickable
    Then "transpleb" should be in the "Cataloging" "Title" field
      And fills out required fields
      And enters "ian" in the "Cataloging" "Group Owner" vocab field
      And adds "ian" to "Local Persons"
      And clicks the "Save" button
    Then the record entry should be displayed under "Related Group Records"
      And clicks on related record entry "transpleb"
    Then the "Cancel changes" button at the bottom of the record "should not" be clickable
    Then the "Cancel changes" button at the top of the record "should not" be clickable
    Then the "Delete this relation." button at the bottom of the record "should" be clickable
    Then the "Delete this relation." button at the top of the record "should" be clickable
      And selects the "Current Record" tab
      And clicks the "Save" button
    Then the record is successfully saved
      And enters "Gnerar" in the top nav search field 
      And selects "Cataloging" from top nav search record type select field
      And clicks on result with text "Gnerar"
    Then the titlebar should contain "Cataloging"
    Then "transpleb" should appear in the "Procedures" area
      And clicks on "transpleb" from "Procedures" area
    Then the titlebar should contain "Group" 
    Then "Gnerar" should appear in the "Cataloging" area
      And clicks on "Gnerar" from "Cataloging" area
    Then the titlebar should contain "Cataloging"
  #Test3: Search to relate Dialog
      And selects the "Group" tab
      And clicks the "+ Add Record" button
      And presses the "Esc" key
    Then no changes to the record should occur
      And clicks the "+ Add Record" button
      And clicks the search button
    Then a list of records should appear
      And marks two records
      And clicks the "Add to Current Record" button
    Then the dialog should be dismissed
    Then the newly added records should be displayed under "Related Group Records"
    Then the newly added records should be in the "Procedures" area
      And clicks on a newly added record 
    Then an "Edit Record" form for the newly added record should be displayed
    Then close the browser

