const cds = require('@sap/cds/lib')
const { GET, POST, expect } = cds.test(__dirname+'/..')

describe( "OData service tests", () => {

    // beforeAll( async () => {
    // })

    it("should read from Catalog UOM", async()=>{

        // const { status: statusCreate } = await POST `/wmappsrv/UOM ${{ Code:"00001", Name:"Name UOM", Description:"Description UOM"  }}`;

        // expect(statusCreate).to.equal(201);

        const { status: statusRead, data } = await GET `/wmappsrv/UOM`;

        expect(statusRead).to.equal(200);

        expect(data.value).to.be.an('array');

        // expect(data.value).to.have.lengthOf(1);

        // expect(data.value[0]).to.have.property('Code','00001');
    }); 

    it("should read from Catalog Products", async()=>{
        const { status } = await GET `/wmappsrv/Products`;

        expect(status).to.equal(200);
    });

    it("should read from Catalog Locations", async()=>{
        const { status } = await GET `/wmappsrv/Locations`;

        expect(status).to.equal(200);
    });

    it("should read from Documents Receive products", async()=>{
        const { status } = await GET `/wmappsrv/Receive`;

        expect(status).to.equal(200);
    });

    it("should read from Docuemnts Movement products", async()=>{
        const { status } = await GET `/wmappsrv/Movement`;

        expect(status).to.equal(200);
    });

    it("should read from Docuemnts Issue products", async()=>{
        const { status } = await GET `/wmappsrv/Issue`;

        expect(status).to.equal(200);
    });

})