@AbapCatalog.sqlViewName: 'ZC01A2AIRLINES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Airlines'
@Metadata.allowExtensions: true

@OData.publish: true
define view Zc_01_A2_Airlines as select from ZC_01_A2_Flights {

    key Carrid,
    key Connid,
    key Fldate,
    Price,
    Currency,
    Planetype,
    Seatsmax,
    Seatsocc,
    Paymentsum,
    SeatsmaxB,
    SeatsoccB,
    SeatsmaxF,
    SeatsoccF
    }
