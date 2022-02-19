const cds = require('@sap/cds/lib')
const { GET, POST, DELETE, expect } = cds.test(__dirname+'/..')

describe( "OData service tests - Catalog Location", () => {

    let uuidLocation = '';

    it("should create draft record of catalog Lcoation and activate it", async()=>{

        // Creates a draft entry as Entity is draft enabled
        const { status: statusCreate, data: draftLocation } = await POST `/wmappsrv/Locations ${{ Code:"00001", Name:"Name Location", Description:"Description Location"  }}`;

        expect(statusCreate).to.equal(201);

        expect(draftLocation).to.be.an('object');

        // Get ID 
        uuidLocation = draftLocation.ID;

        expect(uuidLocation).to.be.a('string');

        //expect(uuidUOM).to.be.a.uuid();

        expect(draftLocation.IsActiveEntity).to.equal(false);

        // Activate entry
        try {
            const { status: statusPost, data: activeLocation } = await POST `/wmappsrv/Locations(ID=${uuidLocation},IsActiveEntity=false)/wmappsrv.draftActivate`;
            
            expect(statusPost).to.equal(201);

            expect(activeLocation.IsActiveEntity).to.equal(true);
        } catch (e) {
            console.log(e);
        }
    }); 

    it("should read from catalog Location created and activaed entry", async()=>{

        expect(uuidLocation).to.be.not.equal('');

        const { status, data } = await GET `/wmappsrv/Locations(ID=${uuidLocation},IsActiveEntity=true)`;

        expect(status).to.equal(200);

        expect(data).to.be.an('object');

        expect(data).to.have.property('Code','00001');
    });

    it("should delete from catalog Location created and activaed entry", async()=>{

        expect(uuidLocation).to.be.not.equal('');

        const { status } = await DELETE `/wmappsrv/Locations(ID=${uuidLocation},IsActiveEntity=true)`;

        expect(status).to.equal(204);
    }); 
})