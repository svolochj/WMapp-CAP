namespace WM.model.reg;

using { cuid } from '@sap/cds/common';
using { WM.model.cat.Product as product } from '../cat/Product';
using { WM.model.cat.UOM as uom } from '../cat/UOM';
using { WM.model.cat.Location as location } from '../cat/Location';

type action : String(3) enum { REC; MOV; ISS };

entity Movement : cuid {
    Action          : action;
    Document        : UUID;
    Item            : UUID;
    Date            : Timestamp;
    Product         : Association to one product;
    LocationFrom    : Association to one location;
    LocationTo      : Association to one location;
    Quantity        : Decimal(17,3);
    UOM             : Association to one uom;
}

annotate WM.model.reg.Movement with {
    ID              @UI : { Hidden };
    Document        @UI : { Hidden };
    Item            @UI : { Hidden };
    LocationFrom    @UI : { Hidden };
    LocationTo      @UI : { Hidden };
    Product         @UI : { Hidden };
    UOM             @UI : { Hidden };
}

annotate WM.model.reg.Movement with @(

    UI.LineItem : [
        { Value: Action, Label: 'Action' },
        { Value: Date, Label: 'Movement date' },
        { Value: Product.Name, Label: 'Product' },
        { Value: Quantity, Label: 'Quantity' },
        { Value: UOM.Name, Label: 'UOM' },
        { Value: LocationFrom.Name, Label: 'Location From' },
        { Value: LocationTo.Name, Label: 'Location To' }        
    ],

    UI.PresentationVariant : { SortOrder : [{ Property: Date }] }
);