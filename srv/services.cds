using { WM.model.cat.Product        as Product,
        WM.model.cat.UOM            as UOM_Data,
        WM.model.cat.Location       as Location,
        WM.model.doc.docReceive     as docReceive,
        WM.model.doc.docIssue       as docIssue,
        WM.model.doc.docMovement    as docMovement,
        WM.model.reg.Stock          as regStock,
        WM.model.reg.Movement       as regMovement
         } from '../db/schema';


service wmappsrv {

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
        as projection on docReceive
        actions {
            action PostReceive() returns Boolean
        };

    entity Issue        
        @( odata.draft.enabled : true )    
        as projection on docIssue
        actions {
            action PostIssue() returns Boolean
        };
 
    entity Movement     
        @( odata.draft.enabled : true )
        as projection on docMovement
        actions {
            action PostMovement() returns Boolean
        };

    action PostDocument(ID:UUID) returns Boolean;

    //Registry 
    entity RegStock
        @(readonly:true)
        as projection on regStock;

    entity RegMovements
        @(readonly:true)
        as projection on regMovement;
}
