namespace WM.model.reg;

using { cuid } from '@sap/cds/common';
using { WM.model.cat.Product as product } from '../cat/Product';
using { WM.model.cat.UOM as uom } from '../cat/UOM';
using { WM.model.cat.Location as location } from '../cat/Location';

entity Movement : cuid {
    Document        : UUID;
    Item            : UUID;
    Date            : Timestamp;
    Product         : Association to one product;
    LocationFrom    : Association to one location;
    LocationTo      : Association to one location;
    Quantity        : Decimal(17,3);
    UOM             : Association to one uom;
}