#created by Forest Yang on Christmas Day 2015

@supplementarysecondary
Feature: Object Exit Secondary Tab

  #Test 1
  Scenario: Basic Secondary Tab Testing
    Given user is on the "Create New" page
      And selects the "Cataloging" radio button on the Create New page
      And clicks on the Create button
      And enters "1234321" in the "Cataloging" "Identification Number" field
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Object Exit" tab
    Then "No related record selected" should be displayed
      And clicks the "+ Add Record" button
      And clicks the "Create" button
    Then an empty form should be present
    Then "Creating new record..." should be displayed
    Then the "Cancel changes" button at the "top" of the page "should not" be clickable
    Then the "Cancel changes" button at the "bottom" of the page "should not" be clickable
    Then the "Delete this relation." button at the "top" of the page "should not" be clickable
    Then the "Delete this relation." button at the "bottom" of the page "should not" be clickable
      And clicks the "Select number pattern" button
      And selects something from dropdown in "Exit Number" row
    Then the "Cancel changes" button at the "top" of the page "should" be clickable
    Then the "Cancel changes" button at the "bottom" of the page "should" be clickable
    Then the "Delete this relation." button at the "top" of the page "should" be clickable
    Then the "Delete this relation." button at the "bottom" of the page "should" be clickable
      And fills out required fields
      And clicks the "Save" button
    Then the record entry should be displayed under "Related Object Exit Records"
      And clicks the newly created record 
    Then the "Cancel changes" button at the "top" of the page "should not" be clickable
    Then the "Cancel changes" button at the "bottom" of the page "should not" be clickable
    Then the "Delete this relation." button at the "top" of the page "should" be clickable
    Then the "Delete this relation." button at the "bottom" of the page "should" be clickable
      And selects the "Current Record" tab
      And clicks the "Save" button
    Given user is on the "My Collectionspace" page
      And enters "1234321" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on result with text "1234321"
    Then the related record should appear in the sidebar
      And clicks on the related record
    Then "1234321" should appear in the sidebar
    Then close the browser

  #Test 3
  Scenario: Search to Relate Dialog
    Given user is on the "My Collectionspace" page
      And enters "1234231" in the top nav search field
      And selects "Cataloging" from the top nav search record type select field
      And clicks on result with text "1234231"
      And selects the "Object Exit" tab
      And clicks the "+ Add Record" button
      And presses the "Esc" key
    Then no changes to the record should occur
      And clicks the "+ Add Record" button
      And clicks the search button
    Then a list of records should appear
      And marks two records
      And clicks the "Add to Current Record" button
    Then the dialog should be dismissed
    Then the newly added records should be displayed under "Related Object Exit Records"
    Then the newly added records should appear in the sidebar
      And clicks on a newly added record
    Then an "Edit Record" form for the newly added record should be displayed
    Then close the browser


