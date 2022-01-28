@AbapCatalog.sqlViewName: 'ZC01FLIGHTS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Flights'
@Metadata.allowExtensions: true

@OData.publish: true

@Search.searchable: true


define view ZC_01_FLIGHTS

  as select from ZI_01_FLIGHTSTP as flightstp
  association [*] to ZC_01_BOOKINGS as _bookings on  $projection.Carrid = _bookings.Carrid
                                                 and $projection.Connid = _bookings.Connid
                                                 and $projection.Fldate = _bookings.Fldate

{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
  key flightstp.Carrid,
  
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
  key flightstp.Connid,
  
  key flightstp.Fldate,
  
      @Semantics.amount.currencyCode: 'Currency'
      flightstp.Price,
      
      @Semantics.currencyCode: true
      flightstp.Currency,
      flightstp.Planetype,
      flightstp.Seatsmax,
      flightstp.Seatsocc,
      
      @Semantics.amount.currencyCode: 'Currency'
      flightstp.Paymentsum,
      
      flightstp.SeatsmaxB,
      flightstp.SeatsoccB,
      flightstp.SeatsmaxF,
      flightstp.SeatsoccF,
      flightstp.SeatsMaxSum,
      flightstp.SeatsOccSum,
      _connecion.deptime,
      _connecion.arrtime,
      _connecion.airpfrom,
      _connecion.airpto,
      _connecion.cityfrom,
      _connecion.cityto,
      _connecion.countryfr,
      _connecion.countryto,
      
      @Semantics.quantity.unitOfMeasure: 'occupancyRateUnit'
      DIVISION( (flightstp.SeatsOccSum)*100, flightstp.SeatsMaxSum, 2) as OccupiedCapacity,
      //concat_with_space( cast( DIVISION( (flightstp.SeatsOccSum)*100, flightstp.SeatsMaxSum, 2) as abap.char(16) ),'%' , 1 ) as OccupiedCapacity,
      
      @Semantics.unitOfMeasure: true
      cast(' %' as abap.unit) as occupancyRateUnit,
      // pass on Bookings Association
      _bookings
}
where
  // only show future flights
  flightstp.Fldate > $session.system_date
