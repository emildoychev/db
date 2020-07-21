# NP001_M12
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for Bijenkorf punten acceptance criteria

Background:
	Given I am logged in the app

Scenario: Bijenkorf punten acceptance criteria
	Given I am on "Betalen" screen with a regular product (ID: 897009000986004)
	When I don't have a Bijenkorf credit card added
		And I see module "Bijenkorf punten"
		And I tap on field "Voeg de Bijenkorf kaart"
			And I see "De Bijenkorf Creditcard" screen
				And I see the proper page title
					And I can go back via the UI back button
					(iOS) And I can go back via the swipe back gesture
					(Android) And I can go back via the system "back" button (bottom bar or gestures)
				And the keyboard is not open 
				And I see "Kaartnummer" input fielf with hint
					And I see camera icon there
					And when tapped, the the keyboard is open in numeric input mode
					And I cannot input any other values that numbers	//Correct?
					And I get auto-suggested values for credit card number if availble by system (iOS/Android)
					And I can longpress to copy/cut/paste
					And I can delete input via (x) at the end of the input field
					And the credit card number is properly formatted upon input in groups of 4
					And the credit card number is validated after the lst digit input 	//Is that correct? there is no screen with wrong credit card number like with the giftcard, do we valdiate upon inpit on ony on "gegevens ophalen"
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
				And I see a confirmation popup if I try to go back after I have made any input
				And I don't see condirmation popup id I try to go back wihtout any input
				And I see checkbox "Gebruik kaart voor betaling"
					And I can select/deselect the checkbox
				And I see button "Gegevens ophalen" is not active/grayed out until all the credit card data has been filled in
				And I see button "Gegevens ophalen" is active/black when all the credit card data has been filled in
					And I see loading indicator if I tap on button "Gegevens ophalen"
					And if I tap on "Gegevens ophalen", I go back to "Betalen" screen
				And I see text link privacy statement
					And I see webview with privacy statement if I tap on the link
		And I see screen "Betalen" after I have added a credit card
			And I see module "Bijenkorf punten" with name of the cardholder, card number and 3-dots menu 	//What does that do?
			And I see added points
			And I see available amount
			And I see button "Toepassen" that can be selected or deselected		//What does that do?
			And I see the 
			And I can continue the payment by adding giftcard		//Can that influence the points if I add the points first and the card later? What if the giftcard fully pays the purchase, what id it doesn't?
		And if I had selected checkbox "Gebruik kaart voor betaling", I see the credit card details pre-filled		//Correct?
		And if I had not selected checkbox "Gebruik kaart voor betaling", I can continue the payment by paying chosing payment method
			And that payment method can be iDeal
			And that payment method can be Credit Card
			And that payment method can be PayPal
		And I see module "Artikelen" with correct data
		And I see item price and shipping cost and method
			And the "Totaal" value reflects the added giftcards
		And see button "Betalen [amount]"
			And I verify the correct amount is displayed
		And I can continue to finish payment
	Then acceptance criteria for Bijenkorf punten have been met