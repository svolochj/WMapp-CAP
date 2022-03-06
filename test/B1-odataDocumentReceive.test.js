const cds = require('@sap/cds/lib')
const { GET, POST, expect } = cds.test(__dirname+'/..')

describe( "OData service tests - Documents / actions / stock", () => {

    const aID = {
        UOM: '',
        Location: '',
        Product: '',

        Receive: ''
    };

    beforeAll( async () => {
        //Create related data

        //UOM 
        const { status: statusCreateUOM, data: draftUOM } = await POST `/wmappsrv/UOM ${{ Code:"00001", Name:"Name UOM", Description:"Description UOM"}}`;

        expect(statusCreateUOM).to.be.equal(201);
        
        aID.UOM = draftUOM.ID;

        try {

            // const { status: statusDraftPrepare } = await POST `/wmappsrv/UOM(ID=${aID.UOM},IsActiveEntity=false)/wmappsrv.draftPrepare`;

            // expect(statusDraftPrepare).to.equal(201);
    
            const { status: statusDraftActivate } = await POST `/wmappsrv/UOM(ID=${aID.UOM},IsActiveEntity=false)/wmappsrv.draftActivate`;
    
            expect(statusDraftActivate).to.equal(201);

        } catch (e) {
            console.log(e);
        }

    //     //Location  
    //     const { status: statusCreateLocation, data: draftLocation } = await POST `/wmappsrv/Locations ${{ Code:"00001", Name:"Name Location", Description:"Description Location"  }}`;

    //     expect(statusCreateLocation).to.be.equal(201);

    //     aID.Location = draftLocation.ID;

    //     const { status: statusPostLcoation } = await POST `/wmappsrv/Locations(ID=${aID.Location},IsActiveEntity=false)/wmappsrv.draftActivate`;
            
    //     expect(statusPostLcoation).to.equal(201);

    //     //Product
    //     const { status: statusCreateProduct, data: draftProduct } = await POST `/wmappsrv/Products ${{ Code:"00001", Name:"Name Product", Description:"Description Product", UOM_ID: aID.UOM }}`;
    
    //     expect(statusCreateProduct).to.be.equal(201);

    //     aID.Product = draftProduct.ID;

    //     const { status: statusDraftPrepare } = await POST `/wmappsrv/Products(ID=${aID.Product},IsActiveEntity=false)/wmappsrv.draftPrepare`;

    //     expect(statusPatch).to.equal(201);

    //     const { status: statusDraftActivate } = await POST `/wmappsrv/Products(ID=${aID.Product},IsActiveEntity=false)/wmappsrv.draftActivate`;
            
    //     expect(statusPatch).to.equal(201);
    });

    it("should create draft record of Document Receive and activate it", async()=>{

        // try {

            const { status: statusCreateReceive, data: draftReceive } = await POST `/wmappsrv/Receive ${{ "Number" : "0000000001"}}`;

            // expect(statusCreateReceive).to.equal(201);

            // //expect(draftReceive.ID).not.to.be('');

            // const { status: stratusCreateReceiveItems, data: draftItems } = await POST `/wmappsrv/Receive_Items ${{ "up__ID": draftReceive.ID, "Linenr" : 1, "Product_ID" : aID.Product, "Quantity" : 1 , "UOM_ID" : aID.UOM , "LocationTo_ID" : aID.Location }}`;
            
            // expect(stratusCreateReceiveItems).to.equal(201);

            // // Activate
            // const { status: statusActiveReceive } = await POST `/wmappsrv/Receive(ID=${draftReceive.ID},IsActiveEntity=false)/wmappsrv.draftActivate`;

            // expect(statusActiveReceive).to.be.equal(201);
    
            // // Post
            // const { status: statusPostReceive } = await POST `/wmappsrv/Receive(ID=${draftReceive.ID},IsActiveEntity=true)/wmappsrv.PostReceive`;
    
            // expect(statusPostReceive).to.be.equal(200);
    
            // aID.Receive = draftReceive.ID;
        // } catch (e) {
        //     console.log(e);
        // }

    });

    // it("Movement registry should contain receive record ",async()=>{

    //     const { status: readRegMovementStatus, data: dataRegMovements } = await GET `/wmappsrv/RegMovements?$filter=Action eq 'REC' and Document eq '${aID.Receive}'`;

    //     expect(readRegMovementStatus).to.be.equal(200);

    //     expect(dataRegMovements).to.be.an.array();

    //     expect(dataRegMovements).toHaveLength(1);

    // });

    // it("Stock registry should contain record", async ()=> {       

    //     const { status: readRegStocktatus, data: dataRegStock } = await GET `/wmappsrv/RegStock?$filter=Location eq '${aID.Location}'`;

    //     expect(readRegStocktatus).to.be.equal(200);

    //     expect(dataRegStock).to.be.an.array();

    //     expect(dataRegStock).toHaveLength(1);

    // });

})