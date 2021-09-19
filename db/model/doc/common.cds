namespace WM.model.doc;

using { managed, cuid } from '@sap/cds/common';
using { WM.model.cat.Product as product } from '../cat/Product';
using { WM.model.cat.UOM as uom } from '../cat/UOM';
using { WM.model.cat.Location as location } from '../cat/Location';


    
aspect Header : cuid , managed {
        Number  : docNumber;
        Posted  : cds.Boolean;
        PostDate: Timestamp;
        Items   : Composition of many Items ;
}

aspect Items 
: cuid {
    key Linenr      : Integer;
        Product     : Association to one product;
        Quantity    : Decimal(10,3);
        UOM         : Association to one uom;
        LocationFrom: Association to one location;
        LocationTo  : Association to one location;       
}

type docNumber: String(11);

type Quantity {
    Amount  : Decimal(10,3);
    UOM     : Association to one uom; 
}

// annotate common.Items with @(
//     UI.Identification: [ {Value: Linenr} ],

//     UI.HeaderInfo : {
//         $Type          : 'UI.HeaderInfoType',
//         TypeName       : 'Item',
//         TypeNamePlural : 'Items',
//         Title          : {Value : Linenr}
//     }
// );

// annotate common.Items.Product with @(
//     Common.FieldControl : #Mandatory,
//     Common.ValueList :{
//         CollectionPath: 'Products',
//         Parameters : [{
//             $Type:              'Common.ValueListParameterInOut',
//             LocalDataProperty   :'Product_ID',
//             ValueListProperty   :'ID'
//         },{
//             $Type               : 'Common.ValueListParameterDisplayOnly',
//             ValueListProperty   : 'Name'
//         }]
//     }
// );