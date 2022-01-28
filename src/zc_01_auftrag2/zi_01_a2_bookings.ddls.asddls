@AbapCatalog.sqlViewName: 'ZI01A2BOOKINGS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Auftrag 2 Basic View Bookings'
define view ZI_01_A2_BOOKINGS as select from sbook {
    key carrid as Carrid,
    key connid as Connid,
    key fldate as Fldate,
    key bookid as Bookid,
    customid as Customid,
    custtype as Custtype,
    smoker as Smoker,
    luggweight as Luggweight,
    wunit as Wunit,
    invoice as Invoice,
    class as Class,
    forcuram as Forcuram,
    forcurkey as Forcurkey,
    loccuram as Loccuram,
    loccurkey as Loccurkey,
    order_date as OrderDate,
    counter as Counter,
    agencynum as Agencynum,
    cancelled as Cancelled,
    reserved as Reserved,
    passname as Passname,
    passform as Passform,
    passbirth as Passbirth
}
