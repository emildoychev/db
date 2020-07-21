# NP001_M13
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for Credit card acceptance criteria

Background:
	Given I am logged in the app

Scenario: Credit card acceptance criteria
	Given I am on "Betalen" screen with a regular product (ID: 897009000986004)
	When I see module "Betalen"
		And have selected to finish purchase by credit card
		And I see "Kaartnummer" input fielf with hint
			And I see camera icon there
			And when tapped, the the keyboard is open in numeric input mode
			And I cannot input any other values that numbers	//Correct?
			And I get auto-suggested values for credit card number if availble by system (iOS/Android)
			And I can longpress to copy/cut/paste
			And I can delete input via (x) at the end of the input field
			And the credit card number is properly formatted upon input in groups of 4
			And the credit card number is validated after the last digit input 	//Is that correct? there is no screen with wrong credit card number like with the giftcard?
			And I see correct card logo upon card number inpit
			
		And I see "Naam kaarthouder" input fielf with hint
			And when tapped, the the keyboard is open in *every word starts with capital letter* mode
			And I get auto-suggested values for cardholder name if availble by system (iOS/Android)
			And I can longpress to copy/cut/paste
			And I can delete input via (x) at the end of the input field
		And I see "Vervaldatum" input fielf with hint
			And when tapped, datepicker view is open		//What kind of datepicker are we using? Or is it manual input?
			And the user can select/cancel input as defined by the system UI
			And I get auto-suggested values for credit card expiration date if availble by system (iOS/Android)		//Is that possible with a date picker view rather than text input view?
		And I see "CVC/CVV/CID" input fielf with hint
			And when tapped, the the keyboard is open in numeric input mode
			And I DON'T see any auto-suggested values for credit card CVC
			And I see (i) icon there
				And I see information dialog if I tap on the (i)
		And I can tap on the camera icon to scan the credit card details
			(iOS and Android 7+) And I get camera permisson popup if I haven't granted it previously
			And I scan my credit card
			And I verify [credit card number]
			And I verify [name cardholder]
			And I verify [expiration date]
			And I manually input [CVC]
		And I see a confirmation popup if I try to change the payment method (from credit card to iDeal or PayPal)		//Is that the riht way? or if we change the method and we go back to credit card, it's remembered?
		And I don't see confirmation popup if I change the payment method wihtout any input
//TODO what validations on credit card do we have, like number, expired, invalid, etc?
	Then acceptance criteria for Credit card have been met