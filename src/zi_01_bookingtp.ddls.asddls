@AbapCatalog.sqlViewName: 'ZI01BOOKINGTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@VDM.viewType: #TRANSACTIONAL
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional View: Bookings'

@ObjectModel.transactionalProcessingEnabled: true

@ObjectModel.updateEnabled: true
@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true

//@ObjectModel:{
//    modelCategory: #BUSINESS_OBJECT,
//    compositionRoot: true,
//    transactionalProcessingEnabled: true,
//    writeActivePersistence: 'ZC01BOOKING_V',
//    
//    
//    semanticKey: ['Carrid','Connid','Fldate','Bookid'],
//    representativeKey: ['Carrid','Connid','Fldate','Bookid'],
//    
//    createEnabled: true,
//    updateEnabled: true,
//    deleteEnabled: true
//    
//}



define view ZI_01_BOOKINGTP
  as select from ZI_01_BOOKINGS
{
  key Carrid,
  key Connid,
  key Fldate,
  key Bookid,
      Customid,
      case Custtype
          when 'B' then 'Business'
          when 'P' then 'Private'
          else 'Unkown'
      end  as Custtype,
      Smoker,
      Luggweight,
      Wunit,
      Invoice,
      case Class
          when 'Y' then 'Economy'
          when 'C' then 'Business'
          when 'F' then 'First'
          else 'Unkown'
      end  as Class,
      Forcuram,
      Forcurkey,
      Loccuram,
      Loccurkey,
      OrderDate,
      Counter,
      Agencynum,
      Cancelled,
      Reserved,
      Passname,
      Passform,
      Passbirth
}
