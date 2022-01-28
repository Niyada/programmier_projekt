@AbapCatalog.sqlViewName: 'ZC01A2PASSENGERS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Passenger'
@Metadata.allowExtensions: true
@OData.publish: true 

define view ZC_01_A2_PASSENGERS as select from ZC_01_A2_Flights  as data
association [1..1] to ZI_01_A2_FLIGHTData as _spfli on data.Connid = _spfli.Connid and
    data.Carrid = _spfli.Carrid association [1..*] to ZI_01_A2_BOOKINGS as _book on data.Connid = _book.Connid and
    data.Carrid = _book.Carrid
{
    key Carrid as Carrid,
    key Connid as Connid,
    key Fldate as Fldate,
    _book.Bookid as BookingId,
    Price as Price,
    Currency as Currency,
    Planetype as Planetype,
    Seatsmax as Seatsmax,
    Seatsocc as Seatsocc,
    Paymentsum as Paymentsum,
    _spfli.Airpfrom as AirportFrom,
    _spfli.Airpto as AirportTo,
    _spfli.DepartureTime as DepartureTime,
    _book.Passname as PassengerName
    
   
}
