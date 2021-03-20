sap.ui.define([
	"sap/ui/test/opaQunit",
	"./pages/App"
], function (opaTest) {
	"use strict";

	QUnit.module("Navigation");

	opaTest("Should see the app view", function (Given, When, Then) {
		// Arrangements
		Given.iStartMyFLPApp({intent : "Products-display"});

		// Assertion
		Then.onTheAppPage.iShouldSeeTheApp();

		// Cleanup
		Then.iLeaveMyFLPApp();
	});
});
