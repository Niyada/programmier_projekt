@AbapCatalog.sqlViewName: 'ZI01FLIGHTSTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@VDM.viewType: #TRANSACTIONAL
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Transactional View: Flights'

define view ZI_01_FLIGHTSTP
  as select from ZI_01_FLIGHTS
  
  // REMOVE IN WORST CASE
  association to spfli as _connecion on  $projection.Carrid = _connecion.carrid
                                     and $projection.Connid = _connecion.connid
{
  key Carrid,
  key Connid,
  key Fldate,
      Price,
      Currency,
      Planetype,
      Paymentsum,
      Seatsmax,
      Seatsocc,
      SeatsmaxB,
      SeatsoccB,
      SeatsmaxF,
      SeatsoccF,
      Seatsmax + SeatsmaxB + SeatsmaxF as SeatsMaxSum, // sum of maximum seats available
      Seatsocc + SeatsoccB + SeatsoccF as SeatsOccSum, // sum of all occupied seats
      
      // REMOVE IN WORST CASE
      _connecion
}
