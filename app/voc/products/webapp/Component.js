sap.ui.define(['sap/fe/core/AppComponent'], function(AppComponent) {
    'use strict';

    return AppComponent.extend("wm.voc.products.Component", {
        metadata: {
            manifest: "json"    
        },

        onInit: function(){
            console.console.log('Hello product');  
        }

    });
});