*&---------------------------------------------------------------------*
*& Report z01_view_passenger
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_view_passenger.

*DATA passenger_data TYPE TABLE OF z01_a2_passengers.
*
*SELECT FROM sflight as sf
*Fields sf~carrid, sf~connid, sf~fldate, sf~price, sf~currency, sf~planetype, sf~seatsmax, sf~seatsocc, sf~paymentsum
* INTO TABLE @passenger_data.
*IF sy-subrc <> 0.
*  WRITE 'No Data'.
*ENDIF.
*
**Display Passengers
*CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*   EXPORTING
*      i_structure_name = 'z01_a2_passengers'
*   TABLES
*       t_outtab = passenger_data
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

cl_salv_gui_table_ida=>create_for_cds_view(`Zc_01_A2_PASSENGERS`)->fullscreen( )->display( ).
  endmethod.
endclass.

start-of-selection.

lcl_main=>create( )->run( ).
