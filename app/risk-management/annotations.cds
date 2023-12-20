using RiskService as service from '../../srv/risk-service';
using from '../../db/schema';

annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Owner}',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PriorityCode}',
            Value : prio_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PriorityDescription}',
            Value : descr,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : '{i18n>Description}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact',
            Label : '{i18n>BusinessPartner}',
        },
    ]
);
annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
        Label : 'Mitigation',
    }
};
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>RiskOverview}',
            ID : 'i18nRiskDetails',
            Target : '@UI.FieldGroup#i18nRiskDetails',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Mitigation}',
            ID : 'i18nMitigationDetails',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>MitigationDetails}',
                    ID : 'i18nMitigationDetails1',
                    Target : '@UI.FieldGroup#i18nMitigationDetails',
                },],
        },]
);
annotate service.Risks with @(
    UI.SelectionFields : [
        prio_code,
    ]
);
annotate service.Risks with {
    prio @Common.Label : '{i18n>Priority}'
};
annotate service.Risks with @(
    UI.HeaderInfo : {
        TypeName : '{i18n>RiskDetail}',
        TypeNamePlural : '{i18n>RiskDetails}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon//alert',
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nRiskDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : '{i18n>Title}',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : '{i18n>RiskDescription}',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : '{i18n>Owner}',
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },{
                $Type : 'UI.DataField',
                Value : criticality,
                Label : '{i18n>Criticality}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact1',
                Label : '{i18n>BusinessPartner}',
            },],
    }
);
annotate service.Risks with @(
    UI.FieldGroup #i18nMitigationDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti_ID,
                Label : '{i18n>Id}',
            },{
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : '{i18n>Description}',
            },{
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : '{i18n>Owner}',
            },{
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : '{i18n>Timeline}',
            },],
    }
);
annotate service.Risks with {
    miti @Common.Text : miti.descr
};
annotate service.Mitigations with {
    descr @Common.FieldControl : #ReadOnly
};
annotate service.Mitigations with {
    timeline @Common.FieldControl : #ReadOnly
};
annotate service.Risks with {
    miti @Common.ValueListWithFixedValues : true
};
annotate service.Mitigations with {
    ID @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.Risks with {
    descr @Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Risks with {
    descr @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Priority',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'descr',
                },
            ],
            Label : 'Priority Description',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Priority with {
    descr @Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly,
    }
};
annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
annotate service.BusinessPartners with @(
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    }
);
