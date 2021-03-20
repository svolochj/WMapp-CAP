using { cuid, managed} from '@sap/cds/common';

using { WM.model.voc.UOM.Data as UOM } from './UOM';

namespace WM.model.voc;

context Product  {
    entity Data : cuid, managed {
        Code        : String(23)        @(title : 'Code');
        Name        : String(200)       @(title : 'Name');

        Description : String            @(title : 'Description');

        UOM         : Association to one UOM
                                        @(title : 'UOM');    
    }
}

annotate Product.Data with @(

     cds.odata.valuelist,

    UI : {
        Identification: [ {Value: ID} ],
    LineItem   : [
    {
        ![@UI.Hidden],
        Value : ID,
        Label : 'ID'
    },
    {
        $Type : 'UI.DataField',    
        Value : Code,
        Label : 'Code'
    },
    {
        $Type : 'UI.DataField',     
        Value : Name,
        Label : 'Name'
    },
    {
        $Type : 'UI.DataField', 
        Value : UOM.name,
        Label : 'UOM'
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
                Value: Code
            },{
                Value: Name
            },{
                $Type:'UI.DataField',
                Value: UOM_id,
                Label: 'UOM',
                
            },{
                $Type:'UI.DataField',
                Value: UOM_id,
                Label: 'UOM ID'
            },
            {
                Value: Description
            }
        ]
    }
});
