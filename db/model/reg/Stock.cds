namespace WM.model.reg;

using { cuid } from '@sap/cds/common';
using { WM.model.cat.Product as product } from '../cat/Product';
using { WM.model.cat.UOM as uom } from '../cat/UOM';
using { WM.model.cat.Location as location } from '../cat/Location';

entity Stock : cuid {
    Product     : Association to one product;
    Location    : Association to one location;
    Quantity    : Decimal(17,3);
    UOM         : Association to one uom;
}

annotate WM.model.reg.Stock with @(
        UI.LineItem : [
        {
            Value: ID,
            Label: 'ID'
        },
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
            Value: UOM.name,
            Label: 'UOM'
        }
    ]
);