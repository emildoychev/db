# NP001_M03
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for store pickup, iDeal payment

Background:
	Given I am logged in the app
		And I have a store pickup product in my basket (ID: 730719067200000)
		And I am on Basket screen
		And I tap on button "Bestellen"
		And I have selected store for pickup
		And I tap on button "Naar betalen"

Scenario: Native payment for store pickup product
	Given I am on "Betalen" screen
	When I see module "Bezorgen"
			And I see correct store for pickup (see Background)
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