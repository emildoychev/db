# NP001_M09
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for regular product, address delivery, giftcard partial amount, iDeal payment

Background:
	Given I am logged in the app
		And I have a regular product in my basket (ID: 897009000986004)
		And I am on Basket screen
		And I tap on button "Bestellen"
		And I have selected default shipment address
		And I have selected [first available date] as delivery date
		And I tap on button "Naar betalen"

Scenario: Native payment for regular product
	Given I am on "Betalen" screen
	When I see module "Bezorgen"
			And I see correct delivery address (see Background)
			And I see correct delivery date and time (see Background)
		And I see module "Cadeaucard"
			And I tap on field "Voeg cadeaucard toe"
			And I see "Cadeaucard" screen
				And fill in [giftcard code]
				And I tap on button "Activeer"
				And I fill in [giftcard pin]
				And I see "Saldo..."
// it seems like there are multiple options here some with PIN, some without may need to expand 
				And I tap on button "Activeer"
		And I am back on "Betalen" screen
			And I see that I've added a giftcard
		And I see module "Bijenkorf Punten"
			And I see there is no filled in data
		And I see module "Betalen"
			And I select "iDeal" from dropdown options
			And I select "ABN AMRO" from list of banks
		And I see module "Artikelen"
			And I verify the correct product from my basket
		And I see item remaining price and shipping cost and method
		And see button "Betalen [amount]"
			And I verify the correct remaining amount is displayed
			And I tap button "Betalen [amount]"	
		And I am redirected to third party banking environment (app or website)
			And I follow steps to pay via selected bank
			And the payment is successful
			And I am redirected back to the Bijenkorf app
		And I see Webview with payment confirmation
	Then I have successfully executed native payment for regular product via giftcard partial amount and iDeal payment