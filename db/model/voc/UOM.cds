using {managed, sap.common.CodeList as CodeList} from '@sap/cds/common';

namespace WM.model.voc;

context UOM {
    entity Data : managed, CodeList {
        key id  : UUID;
    }
}

annotate UOM.Data with @(
    UI: {
        LineItem  : [
            {Value:id,      Label:'ID'},
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
            Target :    '@UI.FieldGroup#MainData', 
            Label:      'Main datat'
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

    FieldGroup #MainData : {
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

    },
);