namespace WM.model.cat;

using {cuid, managed, sap.common.CodeList as CodeList} from '@sap/cds/common';

entity UOM : cuid, managed, CodeList, {}

annotate UOM with {
    ID  @UI : { Hidden }             
        @Common : {   
            IsUnit :            true, 
            Text:               name, 
            TextArrangement:    #TextOnly };

    // name @Common : { IsUnit : true };
};

annotate UOM with @(
    
    UI: {
        Identification  : [
            { Value: ID }
        ],

        LineItem  : [
            {Value:name,    Label:'Name'},
            {Value:descr,   Label:'Description'} 
        ],
    
        HeaderInfo : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : 'UOM',
            TypeNamePlural : 'UOM',
            Title          : {Value : name},
            Description    : {Value : descr}
        },

        HeaderFacets  : [
            {
                $Type: 'UI.CollectionFacet',
                Facets: [
                    {  
                        $Type:      'UI.ReferenceFacet', 
                        Target :    '@UI.FieldGroup#AdministrativeData',
                        Label: '    Administrative data' 
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
                    Value: name
                },
                {
                    Value: descr
                }
            ]
        }
    }
);