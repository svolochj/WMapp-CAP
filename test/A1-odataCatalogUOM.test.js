const cds = require('@sap/cds/lib')
const { GET, POST, DELETE, expect } = cds.test(__dirname+'/..')

describe( "OData service tests - Catalog UOM", () => {

    // let uuidUOM = '';

    it("should create draft record of catalog UOM and activate it", async()=>{

        // Creates a draft entry as Entity is draft enabled
        const { status: statusCreate, data: draftUOM } = await POST `/wmappsrv/UOM ${{ Code:"00001", Name:"Name UOM", Description:"Description UOM" }}`;

        expect(statusCreate).to.equal(201);
        expect(draftUOM).to.be.an('object');
        expect(draftUOM.IsActiveEntity).to.equal(false);

        // Activate entry
        try {

            const { status: statusDraftPrepare } = await POST `/wmappsrv/UOM(ID=${ draftUOM.ID },IsActiveEntity=false)/wmappsrv.draftPrepare`;

            expect(statusDraftPrepare).to.equal(201);

            const { status: statusDraftActivate, data: activeUOM } = await POST `/wmappsrv/UOM(ID=${ draftUOM.ID },IsActiveEntity=false)/wmappsrv.draftActivate`;
            
            expect(statusDraftActivate).to.equal(201);

            expect(activeUOM.IsActiveEntity).to.equal(true);

        } catch (e) {
            console.log(e);
        }
    }); 

    // it("should read from catalog UOM created and activaed entry", async()=>{

    //     expect(uuidUOM).to.be.not.equal('');

    //     const { status, data } = await GET `/wmappsrv/UOM(ID=${uuidUOM},IsActiveEntity=true)`;

    //     expect(status).to.equal(200);

    //     expect(data).to.be.an('object');

    //     expect(data).to.have.property('Code','00001');
    // });

    // it("should delete from catalog UOM created and activaed entry", async()=>{

    //     expect(uuidUOM).to.be.not.equal('');

    //     const { status } = await DELETE `/wmappsrv/UOM(ID=${uuidUOM},IsActiveEntity=true)`;

    //     expect(status).to.equal(204);
    // }); 
})