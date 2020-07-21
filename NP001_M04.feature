# NP001_M04
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for dropshipper product, address delivery, iDeal payment

Background:
	Given I am logged in the app
		And I have a dropshipper product in my basket (ID: 831701361800000)
		And I am on Basket screen
		And I tap on button "Bestellen"
		And I have selected default shipment address
		And I have added correct phone number
		And I tap on button "Naar betalen"

Scenario: Native payment for dropshipper product
	Given I am on "Betalen" screen
	When I see module "Bezorgen"
			And I see correct delivery address (see Background)
TODO		And I see correct delivery date and time (see Background)	// is this available for dropshipper, I don't see a design that has only address, but no date/dropshipper info on the payment screen
		And I see module "Cadeaucard"
			And I see there is no filled in data
		And I see module "Bijenkorf Punten"
			And I see there is no filled in data
		And I see module "Betalen"
			And I select "iDeal" from dropdown options
			And I select "ABN AMRO" from list of banks
		And I see module "Artikelen"
			And I verify the correct product from my basket
		And I see item price and shipping cost and method
		And see button "Betalen [amount]"
			And I verify the correct amount is displayed
			And I tap button "Betalen [amount]"
		And I am redirected to third party banking environment (app or website)
			And I follow steps to pay via selected bank
			And the payment is successful
			And I am redirected back to the Bijenkorf app
		And I see Webview with payment confirmation
	Then I have successfully executed native payment for regular product via iDeal payment