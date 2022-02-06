// cosnt  require('../srv/services');
const cds = require('@sap/cds/lib')
const { GET, expect } = cds.test('serve', '--in-memory', '--project', __dirname+'/..' )

describe( "Basic Querying", () => {

    it("should read from Catalog Products", async()=>{
        const { data: oProduct, status } = await GET `/Products`;

        expect(status).toBe(200);
        expect(oProduct).toBeTruthy();
    })

} )