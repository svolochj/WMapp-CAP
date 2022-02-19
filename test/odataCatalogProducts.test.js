const cds = require('@sap/cds/lib')
const { GET, POST, DELETE, expect } = cds.test(__dirname+'/..')

describe( "OData service tests", () => {

    let uuidProduct = '';

    
    beforeAll( async () => {
        //Create related data
    });

    afterAll( async () => {
        //Delete related data 
    });

    it("should create draft record of catalog Products and activate it", async()=>{

        // Creates a draft entry as Entity is draft enabled
        const { status: statusCreate, data: draftProduct } = await POST `/wmappsrv/Products ${{ Code:"00001", Name:"Name Product", Description:"Description Product"  }}`;

        expect(statusCreate).to.equal(201);

        expect(draftProduct).to.be.an('object');

        // Get ID 
        uuidProduct = draftProduct.ID;

        expect(uuidProduct).to.be.a('string');

        //expect(uuidProduct).to.be.a.uuid();

        expect(draftProduct.IsActiveEntity).to.equal(false);

        // Activate entry
        try {
            const { status: statusPatch, data: activeUOM } = await POST `/wmappsrv/Products(ID=${uuidProduct},IsActiveEntity=false)/wmappsrv.draftActivate`;
            
            expect(statusPatch).to.equal(201);

            expect(activeUOM.IsActiveEntity).to.equal(true);
        } catch (e) {
            console.log(e);
        }
    }); 

    it("should read from catalog Products created and activaed entry", async()=>{

        expect(uuidProduct).to.be.not.equal('');

        const { status, data } = await GET `/wmappsrv/Products(ID=${uuidProduct},IsActiveEntity=true)`;

        expect(status).to.equal(200);

        expect(data).to.be.an('object');

        expect(data).to.have.property('Code','00001');
    });

    it("should delete from catalog Products created and activaed entry", async()=>{

        expect(uuidProduct).to.be.not.equal('');

        const { status } = await DELETE `/wmappsrv/Products(ID=${uuidProduct},IsActiveEntity=true)`;

        expect(status).to.equal(204);
    });
})