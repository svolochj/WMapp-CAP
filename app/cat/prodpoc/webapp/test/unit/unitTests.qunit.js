/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"wm/cat/prodpoc/prodpoc/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
