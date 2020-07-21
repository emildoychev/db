# NP001_M08
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 20 July 2020
# Precondition: User is logged in
# Test data: any suitable account
# ==================================

@Manualtest @NativePayment 

Feature: Native payment for regular product, address delivery, giftcard full amount

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
				And I tap on button "Activeer"
				And I see "Deze cadeaucard voltooit uw bestelling..."
// it seems like there are multiple options here some with PIN, some without may need to expand 
				And I tap on button "Plaats bestelling"
		And I see Webview with payment confirmation
	Then I have successfully executed native payment for regular product via giftcard