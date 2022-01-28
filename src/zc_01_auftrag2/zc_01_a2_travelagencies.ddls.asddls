@AbapCatalog.sqlViewName: 'ZC01A2TRAVELAGS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Travel Agencies'
@Metadata.allowExtensions: true
@OData.publish: true 

define view ZC_01_A2_TRAVELAGENCIES
as select from ZC_01_A2_Flights as data
association [1..1] to ZI_01_A2_FLIGHTData as _spfli on data.Connid = _spfli.Connid and
    data.Carrid = _spfli.Carrid
{
    key Carrid as Carrid,
    key Connid as Connid,
    key Fldate as Fldate,
    Price,
    Currency,
    Planetype,
    Seatsmax,
    Seatsocc,
    Paymentsum,
    SeatsmaxB,
    SeatsoccB,
    SeatsmaxF,
    SeatsoccF,
    cur,
    _spfli.Airpfrom,
    _spfli.Airpto,
    _spfli.ArrivalTime,
    _spfli.DepartureTime
}
where
  Fldate >= cur and Fldate <= dats_add_days(cur, cast(3 as abap.int4), 'NULL') 
//  Fldate = cur
    
