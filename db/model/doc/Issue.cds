namespace WM.model.doc;

using { WM.model.doc.Header   as WMDoc } from './common';

entity docIssue : WMDoc { }

annotate WM.model.doc.docIssue_Items with {
    ID @UI : {  Hidden : true };
    Linenr @Common : { Label : 'Line number' };
    LocationTo_ID @UI : {  Hidden : true };
    LocationFrom_ID @UI : {  Hidden : true };
    UOM_ID @UI : {  Hidden : true }; 
}

annotate WM.model.doc.docIssue_Items with @(
    UI.Identification: [ { Value: ID } ],

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Item',
        TypeNamePlural : '',
        Title          : {Value : Product.Name},
        Description    : {Value : Linenr, Label: 'Line number' }
    },

    UI.Facets :[
        {
            $Type :     'UI.ReferenceFacet',
            Target :    '@UI.FieldGroup#LineItemData',
            Label :     'Item data'
        },
    ],

    UI.FieldGroup #LineItemData : {
        Label : 'Item data',
        Data  : [
            {   Value : Product_ID,
                Label : 'Product' },
            {   Value : Quantity,
                Label : 'Quantity' },
            {   Value : UOM_ID,
                Label : 'UOM' },
            {   Value : LocationFrom_ID,
                Label : 'Issue location' }
        ]
    },

    UI.LineItem : [
        {
            Value: Linenr,
            Label: 'Line Nr.'
        },
        {
            Value: Product_ID,
            Label: 'Product'
        },
        {
            Value: Quantity,
            Label: 'Quantity'
        },
        {
            Value: UOM_ID,
            Label: 'UOM'
        },
        {
            Value: LocationFrom_ID,
            Label: 'Issue location'
        }
    ],
);

annotate WM.model.doc.docIssue with @(

    UI.Identification: [ {Value: Number} ],

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Issues',
        TypeNamePlural : 'Issues',
        Title          : {Value : Number}
    },

    UI.LineItem : [
        {
            Value: Number,
            Label: 'Number'
        },
        {Value : createdAt},
        {Value : createdBy},
        {
            Value: PostDate,
            Label: 'Post date'
        }
    ],
        
    UI.Facets : [
        {
            $Type :     'UI.ReferenceFacet',
            Target :    '@UI.FieldGroup#GeneralData',
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
            Label:      'Items',
        }
    ],

    UI.FieldGroup #AdministrativeData : {
        Label : '{i18n>Admin}',
        Data  : [
            {   Value : PostDate,
                Label : 'Post Date' },
            {Value : createdBy},
            {Value : createdAt},
            {Value : modifiedBy},
            {Value : modifiedAt}
        ]
    },

    UI.FieldGroup #GeneralData : {
        Label : 'General data',
        Data  : [
            {
                Value: Number,
                Label: 'Number'
            }    
        ]
    }
);