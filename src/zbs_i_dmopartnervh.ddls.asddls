@EndUserText.label: 'Business Partner (Value Help)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable: true
define view entity ZBS_I_DMOPartnerVH
  as select from I_BusinessPartnerVH
{
      @Search.defaultSearchElement : true
      @ObjectModel.text.element: [ 'FirstName' ]
  key BusinessPartner,
      BusinessPartnerName,
      @Search.defaultSearchElement : true
      FirstName,
      @Search.defaultSearchElement : true
      LastName
}
