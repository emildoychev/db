# NP001_M06
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for regular product, address delivery, scan credit card payment

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
			And I see there is no filled in data
		And I see module "Bijenkorf Punten"
			And I see there is no filled in data
		And I see module "Betalen"
			And I select "Credit card" from dropdown options
			And I tap on the camera icon
			And I scan my credit card
			And I verify [credit card number]
			And I verify [name cardholder]
			And I verify [expiration date]
			And I manually input [CVC]
		And I see module "Artikelen"
			And I verify the correct product from my basket
		And I see item price and shipping cost and method
		And see button "Betalen [amount]"
			And I verify the correct amount is displayed
			And I tap button "Betalen [amount]"
		And I see Webview with payment confirmation
	Then I have successfully executed native payment for regular product via credit card