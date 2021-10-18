namespace WM.model.doc;

using { WM.model.doc.Header   as WMDoc } from './common';

entity docMovement : WMDoc { }

annotate WM.model.doc.docMovement_Items with @(
        UI.LineItem : [
        {
            Value: ID,
            Label: 'ID'
        },
        {
            Value: Linenr,
            Label: 'Line Nr.'
        },
        {
            Value: Product.Name,
            Label: 'Product'
        },
        {
            Value: Quantity,
            Label: 'Quantity'
        },
        {
            Value: UOM.name,
            Label: 'UOM'
        },
        {
            Value: LocationFrom.Name,
            Label: 'Issue location'
        },
        {
            Value: LocationTo.Name,
            Label: 'Receive location'
        }
    ]
);

annotate WM.model.doc.docMovement with @(
    UI.Identification: [ {Value: Number} ],

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Movements',
        TypeNamePlural : 'Movements',
        Title          : {Value : Number}
    },

    UI.LineItem : [
        {
            Value: Number,
            Label: 'Number'
        }
    ],
        
    UI.Facets : [
        {
            $Type :     'UI.ReferenceFacet',
            Target :    '@UI.FieldGroup#PostData',
            Label :     'Post data'
        },
        {
            $Type :     'UI.ReferenceFacet',
            Target :    '@UI.FieldGroup#AdministrativeData',
            Label :     'Admin data'
        },
        {
            $Type :     'UI.ReferenceFacet',
            Target :    'Items/@UI.LineItem',
            Label:      'Items'
        }
    ],

    UI.FieldGroup #AdministrativeData : {
        Label : '{i18n>Admin}',
        Data  : [
            {Value : createdBy},
            {Value : createdAt},
            {Value : modifiedBy},
            {Value : modifiedAt}
        ]
    },

    UI.FieldGroup #PostData : {
        Label : 'Post data',
        Data  : [
            {   Value : PostDate,
                Label : 'Post Date' }
        ]
    }
);