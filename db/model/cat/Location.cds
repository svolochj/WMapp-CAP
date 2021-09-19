namespace WM.model.cat;

using { cuid, managed} from '@sap/cds/common';

entity Location : cuid, managed {
    Code        : String(23);
    Name        : String(200);

    Description : String;
}

annotate Location.Data with @( 
    UI : {
        
        Identification: [ {Value: ID} ],
        
        LineItem   : [
            {
                Value : Code,
                Label : 'Code'
            },
            {
                Value : Name,
                Label : 'Name'
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
                Value: Name
            },
            {
                Value: Description
            }
        ]
    }
    
});