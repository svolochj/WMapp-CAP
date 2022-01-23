const cds       = require ('@sap/cds')
const dbClass   = require("sap-hdbext-promisfied")
const hdbext    = require("@sap/hdbext")

class WMappService extends cds.ApplicationService {
    /** register custom handlers */
    init() {
        this.on(["PostReceive"],"Receive", async req => {
            try {
                const db = await cds.connect.to('db')
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'actionPostReceive')
                const curDate = (new Date()).toISOString()
                await dbConn.callProcedurePromisified(sp, [req.params[0].ID, curDate])
                return true
           } catch (error) { 
                console.error(error)
                return false
           }
        });

        this.on(["PostMovement"],"Movement", async req => {
            try {
                const db = await cds.connect.to('db')
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'actionPostMovement')
                const curDate = (new Date()).toISOString()
                await dbConn.callProcedurePromisified(sp, [req.params[0].ID, curDate])
                return true
           } catch (error) { 
                console.error(error)
                return false
           }
        });

        this.on(["PostIssue"],"Issue", async req => {
            try {
                const db = await cds.connect.to('db')
                let dbConn = new dbClass(await dbClass.createConnection(db.options.credentials))
                const sp = await dbConn.loadProcedurePromisified(hdbext, null, 'actionPostIssue')
                const curDate = (new Date()).toISOString()
                await dbConn.callProcedurePromisified(sp, [req.params[0].ID, curDate])
                return true
           } catch (error) { 
                console.error(error)
                return false
           }
        });

        return super.init()
   }
}

module.exports = WMappService