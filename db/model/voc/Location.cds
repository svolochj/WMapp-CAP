using { cuid, managed} from '@sap/cds/common';

namespace WM.model.voc;

context Location  {
    entity Data : cuid, managed {
        Code        : String(23);
        Name        : String(200);

        Description : String;
    }
}

annotate Location.Data with @( 
    UI : {
        
        Identification: [ {Value: ID} ],
        
        LineItem   : [
            {
                Value : ID,
                Label : 'ID'
            },
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

    Facets  : [
        {
            $Type: 'UI.ReferenceFacet', 
            Target : '@UI.FieldGroup#AdministrativeData', 
            Label: 'Admin'
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
    }
});