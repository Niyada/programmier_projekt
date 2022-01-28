
*&---------------------------------------------------------------------*
*& Report z01_view_travelagency
*&---------------------------------------------------------------------*
*& where sf~seatsocc <> sf~seatsmax AND sf~fldate = @systemdate
*&---------------------------------------------------------------------*
REPORT z01_view_travelagency.

**In travelagency
*data systemdate Type d.
**In Travelagency
*systemdate = sy-datum.
*
*DATA agency_data TYPE TABLE OF z01_a2_travelagencies.
*
*SELECT FROM sflight as sf right outer join spfli as sp on sf~carrid = sp~carrid and sf~connid = sp~connid
* FIELDS sf~Carrid, sf~Connid, sf~fldate, sf~price, sf~currency, sf~seatsmax, sf~seatsocc, sf~seatsmax_b, sf~seatsocc_b, sf~seatsmax_f, sf~seatsocc_b,  sp~arrtime, sp~deptime, Cityfrom, Cityto, Airpfrom, Airpto
*where sf~seatsocc <> sf~seatsmax AND sf~fldate = @systemdate
* INTO TABLE @agency_Data.
*IF sy-subrc <> 0.
*  WRITE 'No Data'.
* ENDIF.
*
*
**Display Travelagencies
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*   EXPORTING
*      i_structure_name = 'z01_a2_travelagencies'
*   TABLES
*       t_outtab = agency_data
*          EXCEPTIONS
*      program_error = 1
*      others = 2.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_main.

    methods run.

  protected section.
  private section.

endclass.

class lcl_main implementation.

  method create.
    create object r_result.
  endmethod.

  method run.

cl_salv_gui_table_ida=>create_for_cds_view(`Zc_01_A2_TRAVELAGENCIES`)->fullscreen( )->display( ).
  endmethod.
endclass.

start-of-selection.

lcl_main=>create( )->run( ).
