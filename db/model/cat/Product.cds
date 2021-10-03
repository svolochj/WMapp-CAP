namespace WM.model.cat;

using { cuid, managed}      from '@sap/cds/common';
using { WM.model.cat.UOM }  from './UOM';

entity Product : cuid, managed {
    Code        : String(23)        @(title : 'Code');
    Name        : String(200)       @(title : 'Name');

    Description : String(1000)      @(title : 'Description');

    UOM         : Association to one UOM;    
}

annotate Product with {

    ID      @UI: { Hidden : true } 
            @Common : { Text : 'Name', TextArrangement : #TextOnly };

    UOM     @Common : { 
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
    }
    @(
        title:       'UOM',
        description: 'Unit of Measures'
    ); 
};


annotate Product with @(

    UI : {
    
        Identification: [ {Value: ID} ],
    
        LineItem   : [
            {  
                Value : Code
            },{     
                Value : Name
            },{
                Value : UOM_ID
            }
        ],

        HeaderInfo : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : 'Product',
            TypeNamePlural : 'Products',
            Title          : {Value : Name},
            Description    : {Value : Description}
        },

        HeaderFacets  : [
            {
                $Type: 'UI.CollectionFacet',
                Facets: [
                    {  
                        $Type: 'UI.ReferenceFacet', 
                        Target : '@UI.FieldGroup#AdministrativeData',
                        Label: 'Administrative data' 
                    }
                ]
            }
        ],

        Facets  : [
            {  
                $Type:      'UI.ReferenceFacet', 
                Target :    '@UI.FieldGroup#GeneralData', 
                Label:      'General data'
            }
        ],

        FieldGroup #AdministrativeData : {
            Label : '{i18n>Admin}',
            Data  : [
            {Value : createdBy},
            {Value : createdAt},
            {Value : modifiedBy},
            {Value : modifiedAt}
            ]
        },

        FieldGroup #GeneralData : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    Value: Code
                },{
                    Value: Name
                },{
                    Value: UOM_ID
                },
                {
                    Value: Description
                }
            ]
        }
    }
);
