@AbapCatalog.sqlViewName: 'ZI001A2FLIGHDATA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Flight Data'
define view ZI_01_A2_FLIGHTData as select from spfli {
    key carrid as Carrid,
    key connid as Connid,
    countryfr as Countryfr,
    cityfrom as Cityfrom,
    airpfrom as Airpfrom,
    countryto as Countryto,
    cityto as Cityto,
    airpto as Airpto,
    deptime as DepartureTime,
    arrtime as ArrivalTime

}
