using { WM.model.cat.Product        as Product,
        WM.model.cat.UOM            as UOM_Data,
        WM.model.cat.Location       as Location,
        WM.model.doc.docReceive     as docReceive,
        WM.model.doc.docIssue       as docIssue,
        WM.model.doc.docMovement    as docMovement,
        WM.model.reg.Stock          as _Stock
         } from '../db/schema';


service wmappsrv {

    //Vocabularies
    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity Products 
        @( odata.draft.enabled : true )    
        as projection on Product;
        
    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity UOM
        @( odata.draft.enabled : true )       
        as select from UOM_Data;

    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity Locations    
        @( odata.draft.enabled : true )    
        as select from Location;


    //Documents
    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity Receive  
        @( odata.draft.enabled : true )     
        as projection on docReceive;

    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity Issue        
        @( odata.draft.enabled : true )    
        as projection on docIssue;

    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ]) 
    entity Movement     
        @( odata.draft.enabled : true )
        as projection on docMovement;


    //Registry
    @(restrict : [
        {
            grant : [ 'READ' ],
            to : [ 'WMViewer' ]
        },
        {
            grant : [ '*' ],
            to : [ 'WMAdmin' ]
        }
    ])    
    entity Stock 
        @(readonly:true)
        as projection on _Stock;
}
