namespace WM.model.cat;

using { cuid, managed} from '@sap/cds/common';

entity Location : cuid, managed {
    Code        : String(23)    @(title : 'Code');
    Name        : String(200)   @(title : 'Name');

    Description : String        @(title : 'Description');
}

annotate Location with {
    ID  @UI: { Hidden : true }
        @Common : {
            Text:               Name, 
            TextArrangement:    #TextOnly };
};

annotate Location with @( 
    UI : {
        
        Identification: [ {Value: ID} ],
        
        LineItem   : [
            {
                Value : Code,
            },{
                Value : Name,
            },{
                Value: Description,
            }
        ],

        HeaderInfo : {
            $Type          : 'UI.HeaderInfoType',
            TypeName       : 'Location',
            TypeNamePlural : 'Locations',
            Title          : {Value : Name},
            Description    : {Value : Description}
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
                    Value : Code,
                },{
                    Value : Name,
                },{
                    Value: Description,
                }
            ]
        }
    }
);