# Created by Cesar Villalobos on 12/27/2015

@recordssecondarytab
Feature: Loan In Tab 
  # Enter feature description here

#UI Layer
	Scenario: Test 1
	    Given user is on the "My CollectionSpace" page 
	   	
	   	And navigates to the record with identification number "CQA111_E"
	    And selects the "Loan In" tab 
	    Then the "Related Loan In Records" area should be empty

	    And navigates to the record with identification number "CQA111_NE"
	    And selects the "Loan In" tab 
	    Then "CQA111.1" should appear in the "Related Loan In Records" area

 

	Scenario: Test 3 -> Continued from Test 1
		And clicks the "Add record" button 
	    # Then  a pop-up window will appear with the option to add a relationship to an existing record or create a new record
	    And clicks the "close" button 
	    Then the "Related Loan In Records" area should only contain "CQA111.1"

	    And clicks the "Add record" button
	    And presses the "ESC" key 
	    Then the "Related Loan In Records" area should only contain "CQA111.1"
	
	Scenario: Test 5-> Searching and ading multiple Loan In records. Continued from Test 3
		And clicks the "Add record" button 
	    And clicks the "search" button
	    Then the search results should contain "CQA111.2"
	    Then the search results should contain "CQA111.3" 

	    And selects the box with result "CQA111.3"
	    And selects the box with result "CQA111.2"
	    And clicks the "Add to current record" button

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA111.2" should appear in the "Related Loan In Records" area   
	    Then "CQA111.3" should appear in the "Related Loan In Records" area   
	    Then "CQA111.2" should appear in the "Procedures" area   
	    Then "CQA111.3" should appear in the "Procedures" area   


	    And clicks on result with text "CQA111.2"
	    Then an "Edit Loan In Record" form should be displayed
	   	Then the "Loan In Number" field should contain "CQA111.2"

	   	And clicks on the result with text "CQA111.3"
	    Then an "Edit Loan In Record" form should be displayed
	    Then the "Loan In Number" field should contain "CQA111.3"


	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA111.3" should not appear in the "Related Loan In Records" area 

	    And clicks on result with text "CQA111.2"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear 
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA111.2" should not appear in the "Related Loan In Records" area 

	    Then close the browser

	Scenario: Test 7--> Warning when navigating away from new Loan In record
	    Given user is in the "My CollectionSpace" page
	   	And navigates to the record with identification number "CQA111_NE"
	    And selects the "Loan In" tab 
	    

	    And clicks the "Add record" button
	    And clicks on the Create button

	    Then the message "Creating new record..." should be displayed
	    Then the "Loan In Number" field should be empty
	    And enters "CQA111.4" in the "Loan In Number" field

		### VARIATION A	    
	    And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear 
	    And clicks close button 
	    Then the "Loan In Number" field should contain "CQA111.4"


	    ## VARIATION B
	    And selects the "Current Record" tab
	    Then the dialog should be dismissed 
	    And clicks cancel button 
	    Then the "Loan In Number" field should contain "CQA111.4"

	    ## Variation D
	    And selects the "Current Record" tab
	    And clicks the "Don't save" button 
	   	And selects the "Loan In" tab 
	    Then "CQA111.4" should not appear in the "Related Loan In Records" area


	    ## Variation C
	    And clicks the "Add record" button
	    And clicks on the Create button
	    And enters "CQA111.4" in the "Loan In Number" field 
	    And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear
	    And clicks on the "Save" button

	    And selects the "Loan In" tab 
	    Then "CQA111.4" should appear in the "Related Loan In Records" area 

	    ## Deleting records so we can reuse
	    And navigates to the record with identification number "CQA111.4"
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser



	Scenario: Test 9: Testing Cancel Changes button 
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA111_NE"
		
		And selects the "Loan In" tab
	    And clicks the "Add record" button 
	    And clicks the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable  
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable  
	    
	    And enters "CQA111.5" in the "Loan In Number" field
	    And clicks the "cancel changes" button 
    	Then the "Loan In Number" field should be empty

	    # Variation B
	    And enters "CQA111.5" in the "Loan In Number" field
	    And clicks on the "Save" button 
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
	    And clicks the "Go to record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks the confirmation delete button
	    Then the deletion should be confirmed in a dialog
	    Then close the browser



	# Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA111_NE"
        And selects the "Loan In" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify a Loan In Number" should appear 

        And enters "CQA111.11" in the "Loan In Number" field
        And clicks on the "Save" button

        Then the message "Relation successfully created." should appear
        Then "CQA111.11" should appear in the "Related Loan In Records" area


        And selects "Exhibition" from the "Loan Purpose" drop down        
        And enters "2016-01-27" in the "Loan Status Date" field
        And enters "CQA-111: Loan Status" in the "Loan Status Note" field
        And selects "Agreed" from the "Loan Status" drop down
        And enters "Cesar Villalobos" in the "Lender" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-01-01" in the "Authorization Date" field
        And enters "Cesar Villalobos" in the "Borrower's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Borrower's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-02-02" in the "Borrower's Authorization Date" field
        And enters "This \n Is \n A test \n for CQA-111" in the "Loan In Conditions" field
        And enters "CQA-111" in the "Loan In Note" field
        And enters "2015-03-05" in the "Loan In Date" field
        And enters "2016-05-03" in the "Loan Return Date" field
        And enters "2017-06-01" in the "Loan Renewal Application Date" field
        And clicks on the "Save" button

        Then the message "Loan In successfully saved" should appear


        Then the "Loan In Number" field should contain "CQA111.11"
        Then the "Loan In Purpose" field should contain "Exhibition"
        Then the "Loan Status Date" field should contain "2016-01-27"
        Then the "Loan Status Note" field should contain "CQA-111: Loan Status"
        Then the "Loan Status" field should contain "Agreed"
        Then the "Lender" field should contain "Cesar Villalobos"
        Then the "Lender's Contact" field should contain "Cesar Villalobos"
        Then the "Lender's Authorizer" field should contain "Cesar Villalobos"
        Then the "Authorization Date" field should contain "2016-01-01"
        Then the "Borrower's Contact" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorizer" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorization Date" field should contain "2016-02-02"
        Then the "Loan In Conditions" field should contain "This \n Is \n A test \n for CQA-111"
        Then the "Loan In Note" field should contain "CQA-111"
        Then the "Loan In Date" field should contain "2015-03-05"
        Then the "Loan Return Date" field should contain "2016-05-03"
        Then the "Loan Renewal Application Date" field should contain "2017-06-01"

        
	Scenario: Test 13-->
        And selects "Research" from the "Loan Purpose" drop down        
        And enters "2016-02-22" in the "Loan Status Date" field
        And enters "CQA-111: Loan Status Test 13" in the "Loan Status Note" field
        And selects "Authorized" from the "Loan Status" drop down
        And enters "Jennifer Be" in the "Lender" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Lender's Contact" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Lender's Authorizer" field
        And selects "Jennifer Be" from autocomplete options
        And enters "2002-02-02" in the "Authorization Date" field
        And enters "Jennifer Be" in the "Borrower's Contact" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Borrower's Authorizer" field
        And selects "Jennifer Be" from autocomplete options
        And enters "2016-03-03" in the "Borrower's Authorization Date" field
        And enters "This \n Is \n A test \n for CQA-111 Test 13" in the "Loan In Conditions" field
        And enters "CQA-111 Test 13" in the "Loan In Note" field
        And enters "2015-03-08" in the "Loan In Date" field
        And enters "2018-05-03" in the "Loan Return Date" field
        And enters "2017-06-01" in the "Loan Renewal Application Date" field
        And clicks on the "Save" button

        Then the message "Loan In successfully saved" should appear


        Then the "Loan In Number" field should contain "CQA111.11"
        Then the "Loan In Purpose" field should contain "Research"
        Then the "Loan Status Date" field should contain "2016-02-22"
        Then the "Loan Status Note" field should contain "CQA-111: Loan Status Test 13"
        Then the "Loan Status" field should contain "Authorized"
        Then the "Lender" field should contain "Jennifer Be"
        Then the "Lender's Contact" field should contain "Jennifer Be"
        Then the "Lender's Authorizer" field should contain "Jennifer Be"
        Then the "Authorization Date" field should contain "2002-02-02"
        Then the "Borrower's Contact" field should contain "Jennifer Be"
        Then the "Borrower's Authorizer" field should contain "Jennifer Be"
        Then the "Borrower's Authorization Date" field should contain "2016-03-03"
        Then the "Loan In Conditions" field should contain "This \n Is \n A test \n for CQA-111 Test 13"
        Then the "Loan In Note" field should contain "CQA-111 Test 13"
        Then the "Loan In Date" field should contain "2015-03-08"
        Then the "Loan Return Date" field should contain "2018-05-03"
        Then the "Loan Renewal Application Date" field should contain "2017-06-01"
        And clicks the "Go To Record" button        
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        
        Then close the browser


	Scenario: Test 23--> Testing links and "Go To Record" works
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA111_NE"
	    And selects the "Loan In" tab 
	    And clicks on result with text "CQA111.1"
	    Then the "Loan In Number" field should contain "CQA111.1"
	    And clicks the "Go to record" button
	    Then the titlebar should contain "CQA111.1"
	    Then the "Loan In Number" field should contain "CQA111.1"
	    Then close the browser		

	Scenario: Test 25--> Deleting relation via list
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA111_NE"
	    And selects the "Loan In" tab 

	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA111.6" in the "Loan In Number" field
	    And clicks the "Save" button

	    And clicks the "Delete Relation" button on the row that reads "CQA111.6"
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed 
	    Then the "Related Loan In Records" area should contain "CQA111.6"

	    And clicks the "Delete Relation" button on the row that reads "CQA111.6"
	    Then a delete confirmation dialog should appear
	    And clicks the "close" button
	    Then the dialog should be dismissed
	    Then the "Related Loan In Records" area should contain "CQA111.6"

	    And clicks the "Delete Relation" button on the row that reads "CQA111.6"
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

	    Then "CQA111.6" should not appear in the "Procedures" area
	    Then "CQA111.6" should not appear in the "Related Loan In Records" area

        And navigates to the record with identification number "CQA111.6"
        And selects the "Loan In" tab 
	    Then "CQA111_NE" should not appear in the "Related Loan In Records" area   
	    And selects the "Current Record" tab

	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	 

	Scenario: Test 27--> Deleting relation via record editor
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA111_NE"
	    Then "CQA111_NE" should be in the "Identification Number" field

	    And selects the "Loan In" tab 
	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA111.7" in the "Loan In Number" field
	    And clicks the "Save" button
	    And clicks on result with text "CQA111.7"

	    
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear  
	    And clicks cancel button
	    Then the dialog should be dismissed  
	    Then the "Related Loan In Records" area should contain "CQA111.7"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear  
	    And clicks close button
	    Then the dialog should be dismissed  
	    Then the "Related Loan In Records" area should contain "CQA111.7"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA111.7" should not appear in the "Procedures" area   
		Then "CQA111.7" should not appear in the "Related Loan In Records" area

	    And navigates to the record with identification number "CQA111.7"
	    And selects the "Loan In" tab 
	    Then the "Related Loan In Records" area should be empty
	    
	    And selects the "Current Record" tab 
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser 


