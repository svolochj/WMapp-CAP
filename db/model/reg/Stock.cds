namespace WM.model.reg;

using { cuid } from '@sap/cds/common';
using { WM.model.voc.Product.Data as product } from '../voc/Product';
using { WM.model.voc.UOM.Data as uom } from '../voc/UOM';
using { WM.model.voc.Location.Data as location } from '../voc/Location';

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