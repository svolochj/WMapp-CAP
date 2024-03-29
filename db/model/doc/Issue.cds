namespace WM.model.doc;

using { WM.model.doc.Header   as WMDoc } from './common';

entity docIssue : WMDoc { }

annotate WM.model.doc.docIssue.Items with {
    ID @UI : {  Hidden : true };
    up_ @UI : { Hidden : true };
    Linenr @Common : { Label : 'Line number' };
    LocationTo_ID @UI : {  Hidden : true };
    LocationTo @UI : {  Hidden : true };
    LocationFrom_ID @UI : {  Hidden : true };
    UOM_ID @UI : {  Hidden : true };
    Editable @UI : { Hidden : true }; 

    Number @UI : { Label: 'Document number' };

    Product @Common : {
        Text : Product.Name, 
        TextArrangement : #TextOnly, 

        ValueList : {          
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : Product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Description',
                },
            ],
        } 
    };

    LocationFrom @Common : {
        Text : LocationFrom.Name, 
        TextArrangement : #TextOnly, 

        ValueList : {          
            $Type : 'Common.ValueListType',
            CollectionPath : 'Locations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : LocationFrom_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Description',
                },
            ],
        } 
    }; 

    UOM @Common : {
        Text : UOM.Name, 
        TextArrangement : #TextOnly, 

        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'UOM',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : UOM_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Description',
                },
            ],
        } 
    };

}

annotate WM.model.doc.docIssue.Items with @(

    Capabilities: { Deletable: up_.Editable, Updatable: up_.Editable, Insertable: up_.Editable },
    
    UI.Identification: [ { Value: ID } ],

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Item',
        TypeNamePlural : '',
        Title          : {Value : Product.Name},
        Description    : {Value : Linenr, Label: 'Line number' }
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

    UI.PresentationVariant : { SortOrder : [{ Property : Linenr }] },

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
    }
);

annotate WM.model.doc.docIssue with {
    ID @UI : {  Hidden };

    @readonly
    PostDate;
};

annotate WM.model.doc.docIssue with @(

    Capabilities : { Deletable : Editable, Updatable : Editable },
    
    UI.Identification: [
        {Value: Number},
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'wmappsrv.PostIssue',
            Label : 'Post',
            ![@UI.Hidden] : {$edmJson: {$Path: 'Posted'}}
        }    
    ],

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
            Label :     'General data'
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