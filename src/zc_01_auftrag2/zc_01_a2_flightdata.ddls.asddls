@AbapCatalog.sqlViewName: 'ZC01A2FLIGHTDATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: FlightData'
@Metadata.allowExtensions: true
@OData.publish: true 


define view ZC_01_A2_FLIGHTData as select from ZI_01_A2_FLIGHTData as data
association [1..*] to ZC_01_A2_Flights as _flights
    on data.Connid = _flights.Connid and
    data.Carrid = _flights.Carrid
     {
     key data.Carrid,
     key data.Connid,
     data.Countryfr as CountryFrom,
     data.Cityfrom,
     data.Airpfrom,
     data.Countryto as CountryTo,
     data.Cityto,
     data.Airpto,
     _flights.Fldate
 
}
