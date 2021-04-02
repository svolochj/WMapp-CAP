//const cds = require('@sap/cds')

module.exports = async (srv) => { 

    srv.on("calculateStock", async ()=>{
        return 23;
    });

}