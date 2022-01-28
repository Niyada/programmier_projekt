*&---------------------------------------------------------------------*
*& Report z01_view_destatis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_view_destatis.

*DATA flight_Data TYPE TABLE OF z01_a2_flightdatas.
*
*" get data
*SELECT FROM spfli AS sp RIGHT OUTER JOIN sflight AS sf ON sf~carrid = sp~carrid AND sf~connid = sp~connid
* FIELDS sp~Carrid, sp~Connid, Countryfr, Countryto, Cityfrom, Cityto, Airpfrom, Airpto, sf~fldate
* INTO TABLE @flight_Data.
*IF sy-subrc <> 0.
*  WRITE 'No Data'.
*ENDIF.
*
**" Display DeStatis
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*   EXPORTING
*      i_structure_name = 'z01_a2_flightdatas'
*   TABLES
*       t_outtab = flight_data.
*
*
*
**cl_demo_output=>display( flight_Data ).


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

cl_salv_gui_table_ida=>create_for_cds_view(`Zc_01_A2_FLIGHTDATA`)->fullscreen( )->display( ).
  endmethod.
endclass.

start-of-selection.

lcl_main=>create( )->run( ).
