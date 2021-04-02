using { WM.model.cat.Product.Data   as Product,
        WM.model.cat.UOM.Data       as UOM_Data,
        WM.model.cat.Location.Data  as Location,
        WM.model.doc.docReceive     as docReceive,
        WM.model.doc.docIssue       as docIssue,
        WM.model.doc.docMovement    as docMovement,
        WM.model.reg.Stock          as _Stock
         } from '../db/schema';


service vsvappsrv {

    //Vocabularies
    entity Products 
        @( odata.draft.enabled : true )    
        as projection on Product;
    
    entity UOM
        @( odata.draft.enabled : true )       
        as select from UOM_Data;
    entity Locations    
        @( odata.draft.enabled : true )    
        as select from Location;

    //Documents
    entity Receive  
        @( odata.draft.enabled : true )     
        as projection on docReceive;
        action postReceiveDoc();
    entity Issue        
        @( odata.draft.enabled : true )    
        as projection on docIssue;
        // action postIssue();
    entity Movement     
        @( odata.draft.enabled : true )
        as projection on docMovement;
        // action postMovement();

    //Registry
    entity Stock 
        @(readonly:true)
        as projection on _Stock;
    //     action calculateStock();

    function calculateStock() returns Integer;    
}
