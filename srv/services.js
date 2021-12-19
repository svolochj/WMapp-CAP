const cds = require ('@sap/cds')

class WMappService extends cds.ApplicationService {
    /** register custom handlers */
    init(){

        this.on(["PostDocument"], async function(req) {
            console.log(req.data);
        });

        this.on(["PostReceive"],"Receive",function(req) {
            //Get Documment Data 
            //Use DB procedure to calculate stock
            console.log(req.data)
        });

        return super.init()
   }

}

module.exports =  WMappService