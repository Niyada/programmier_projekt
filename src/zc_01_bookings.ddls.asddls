@AbapCatalog.sqlViewName: 'ZC01BOOKINGS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View: Bookings'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION

@ObjectModel:{
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZC01BOOKING_V',


    semanticKey: ['Carrid','Connid','Fldate','Bookid'],
    representativeKey: ['Carrid','Connid','Fldate','Bookid'],

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true

}

//@ObjectModel:{
//
//  semanticKey: ['Carrid','Connid','Fldate','Bookid'],
//  representativeKey: ['Carrid','Connid','Fldate','Bookid'],
//  
//  // delegate processing to Transactional View
//  transactionalProcessingDelegated: true,
//  // enable crud
//  createEnabled: true,
//  updateEnabled: true,
//  deleteEnabled: true
//}

@Search.searchable: true
@OData.publish: true

define view ZC_01_BOOKINGS
  as select from ZI_01_BOOKINGTP
{
      @ObjectModel.mandatory: true
  key Carrid,
  key Connid,
  key Fldate,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
  key Bookid,
      @ObjectModel.readOnly: true
      Customid,
      Custtype,
      Smoker,
      @Semantics.quantity.unitOfMeasure: 'Wunit'
      Luggweight,
      @Semantics.unitOfMeasure: true
      Wunit,
      Invoice,
      Class,
      @Semantics.amount.currencyCode: 'Forcurkey'
      Forcuram,
      @Semantics.currencyCode: true
      Forcurkey,
      @Semantics.amount.currencyCode: 'Loccurkey'
      Loccuram,
      @Semantics.currencyCode: true
      Loccurkey,
      OrderDate,
      Counter,
      Agencynum,
      Cancelled,
      Reserved,
      Passname,
      Passform,
      Passbirth
      ,
      case Invoice
        when 'X' then 3
        when '' then 1
        else 0
      end as InvoiceCritically
}
//where
//    // only display datasets which are not cancelled
//    Cancelled <> 'X'
