# NP001_M11
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for giftcard acceptance criteria

Background:
	Given I am logged in the app

Scenario: Giftcard acceptance criteria
	Given I am on "Betalen" screen with a regular product (ID: 897009000986004)
	When I don't have a giftcard added
		And I see module "Cadeaucard"
		And I tap on field "Voeg cadeaucard toe"
			And I see "Cadeaucard" screen
				And I see the proper page title
					And I can go back via the UI back button
					(iOS) And I can go back via the swipe back gesture
					(Android) And I can go back via the system "back" button (bottom bar or gestures)
				And the keyboard is auto-open 
				And the keyboard is open in numeric input mode
				And I cannot input any other values that numbers	//Correct?
				And I see the code input field hint
				And I can input the 24 digit code
				And I can longpress to copy/cut/paste 
				And I can delete input via (x) at the end of the input field 
				And I see a confirmation popup if I try to go back after I have made any input
				And I don't see condirmation popup id I try to go back wihtout any input
				And I see button "Activeer"
				And the button "Activeer" is not active until I have the full 24 digit intput
				And I see button "Controleer saldo"
				And the button "Controleer saldo" is not active until I have the full 24 digit intput
				And I see wrong code message only after I have put in the 24th digit
				And I don't see any confirmation if the code is correct after input of 24th digit
				And I see loading indicator if I tap on button "Activeer"
				And I see loading indicator if I tap on button "Controleer saldo"
				And if I tap "Activeer"
//TODO I'm not 100% clear what the rules for "Activeer" are
//TODO I'm not 100% clear what the rules for PIN are, when is it shown and when not
//TODO I'm not 100% clear what the rules for "Controleer saldo" are
				And if there is remaining saldo, I see button "Activeer"
				And if I tap on "Activeer", I go back to "Betalen" screen
				And if remaining amount is zero I see button "Plaats bestelling"
				And if remaining amount is zero I see button "Annuleren"
				And if I tap on button "Plaats bestelling", I see webview orfer conformation page
				And if I tap on button "Annuleren", I see confirmation popup
				And if I tap on OK on confrirmation popup, I go back to "Betalen" screen
			And on "Betalen screen" I see module "Cadeaucard" 
				And I see the added giftcard
				And I can tap on field "Voeg cadeaucard toe" to add another giftcard
				And I see giftcard details element
					And I see the giftcard amount as a negative currency value
					And I see the giftcard last 4 digits
					And I see the remaining giftcard saldo after purchase payment
					And I see option to remove giftcard from payment process
					And I see confirmation dialog if I want to remove an added giftcard
				And I can scroll to see multiple giftcards details if added
//TODO how to generate an error case?
				And I see error message if an error occurs 
				And I can close the error messave via [x] button
			And I can continue the payment by adding Bijenkorf punten
			And I can continue the payment by paying chosing payment method
				And that payment method can be iDeal
				And that payment method can be Credit Card
				And that payment method can be PayPal
			And I see module "Artikelen" with correct data
			And I see item price and shipping cost and method
				And the "Totaal" value reflects the added giftcards
			And see button "Betalen [amount]"
				And I verify the correct amount is displayed
			And I can continue to finish payment
	Then acceptance criteria for giftcard have been met