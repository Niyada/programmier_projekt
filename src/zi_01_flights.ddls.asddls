@AbapCatalog.sqlViewName: 'ZI01FLIGHTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Flights'

@VDM.viewType: #TRANSACTIONAL

//@ObjectModel: {
//    transactionalProcessingEnabled: true,
//    writeActivePersistence: 'ZC01FLIGHT_V',
//    createEnabled: false,
//    updateEnabled: false,
//    deleteEnabled: false,
//    
//    semanticKey: ['Carrid','Connid','Fldate'],
//    representativeKey: ['Carrid','Connid','Fldate']
//}


define view ZI_01_FLIGHTS
  as select from sflight
{
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    price as Price,
    currency as Currency,
    planetype as Planetype,
    seatsmax as Seatsmax,
    seatsocc as Seatsocc,
    paymentsum as Paymentsum,
    seatsmax_b as SeatsmaxB,
    seatsocc_b as SeatsoccB,
    seatsmax_f as SeatsmaxF,
    seatsocc_f as SeatsoccF
    
}
