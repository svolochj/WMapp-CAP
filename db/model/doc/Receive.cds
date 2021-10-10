namespace WM.model.doc;

using { WM.model.doc.Header   as WMDoc } from './common';

entity docReceive : WMDoc {  } 

annotate WM.model.doc.docReceive_Items with {
    ID @UI : {  Hidden : true };

    Quantity @Measures : { Unit : UOM_ID };

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

    LocationTo @Common : {

        Text : LocationTo.Name, 
        TextArrangement : #TextOnly, 

        ValueList : {          
            $Type : 'Common.ValueListType',
            CollectionPath : 'Locations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : LocationTo_ID,
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

    UOM_ID @Common : { 
        IsUnit: true, 
        
        Text : UOM.name, 
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
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
            ],
        } 
    };
}

annotate WM.model.doc.docReceive_Items with @(

    UI.Identification: [ { Value: ID } ],

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
            Value: LocationTo_ID,
            Label: 'Receive location'
        }
    ]
);

annotate WM.model.doc.docReceive with {
    ID @UI : {  Hidden }
};

annotate WM.model.doc.docReceive with @(
    UI.Identification: [ {Value: ID} ],

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Receives',
        TypeNamePlural : 'Receives',
        Title          : {Value : Number},
    },

    UI.LineItem : [
        {
            Value: Number,
            Label: 'Number'
        },
        {
            Value: PostDate,
            Label: 'Post date'
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
            Label:      'Items',
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