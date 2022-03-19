using wmappsrv as service from '../../../srv/services';

namespace WM.model.reg;

using { WM.model.cat.Product as product } from '../cat/Product';
using { WM.model.cat.UOM as uom } from '../cat/UOM';
using { WM.model.cat.Location as location } from '../cat/Location';

entity Stock {
    key Product     : Association to one product;
    key Location    : Association to one location;
    Quantity        : Decimal(17,3);
    key UOM         : Association to one uom;
}

annotate WM.model.reg.Stock with {
    UOM         @UI : {  Hidden : true };
    Product     @UI : {  Hidden : true };
    Location    @UI : {  Hidden : true };
};

annotate WM.model.reg.Stock with @(
       
    UI.LineItem : [
        {
            Value: Product.Name,
            Label: 'Product'
        },
        {
            Value: Location.Name,
            Label: 'Location'
        },
        {
            Value: Quantity,
            Label: 'Quantity'
        },
        {
            Value: UOM.Name,
            Label: 'UOM'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'wmappsrv.EntityContainer/recalculateStock',
            Label : 'Recalculate',
        },
    ]
);