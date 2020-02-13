# DB001_M01_Android
# ==================================
# Author: Emil Doychev
# Reviewer: Emil Doychev
# Date: 13 February 2020
# Precondition: User is logged in
# Precondition: Basket is empty
# Precondition: Content is assumed to be consistent/mocked for reusability purposes
# Test data: any suitable account
# ==================================

@Regression @Manualtest @Android @Basket

Feature: Add a product to the Basket

Background:
	Given I am logged in the app

Scenario: Add a product to the Basket from home screen
	Given I am on Home screen with title "HEREN"
	When I tap on button "Bekijk het aanbod"
		And I see screen "ODE AAN DE KLASSIEKERS"
			And I tap on first item in list ("BURBERRY Westminster trechcoat met raglanmouw")
		And I see product details screen
			And I scroll page to see button "In winkelmand"
			And I tap button "In winkelmand"
			And I select 50 from the "Selectreet maat" menu
			And I see toast message "Artikel toegevoegd aan winkelmand"
		And I tap on bottom menu item Basket
			And I see Basket screen with my selected item added in correct color, size and amount
			And I see bottom menu item Basket has badge "1" 
	Then I have successfully added product to the Basket from home screen