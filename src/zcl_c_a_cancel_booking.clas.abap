CLASS zcl_c_a_cancel_booking DEFINITION
  PUBLIC
  INHERITING FROM /bobf/cl_lib_a_supercl_simple
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.

  METHODS /bobf/if_frw_action~execute
    REDEFINITION .
PROTECTED SECTION.
PRIVATE SECTION.
ENDCLASS.



CLASS zcl_c_a_cancel_booking IMPLEMENTATION.

  METHOD /bobf/if_frw_action~execute.

    DATA lt_zc_01_bookings TYPE ztc01_bookings.

	io_read->retrieve(
    EXPORTING
      iv_node        = zif_c_01_bookings_c=>sc_node-zc_01_bookings
      it_key         = it_key
    IMPORTING
      eo_message = eo_message " pass on message object
      et_data = lt_zc_01_bookings " get data from node
      et_failed_key = et_failed_key ).  " pass on failures

    " Error Message handling
    IF eo_message IS INITIAL.
      eo_message = /bobf/cl_frw_factory=>get_message( ).
    ENDIF.

    " Loop through given data and change cancellation fag
    LOOP AT lt_zc_01_bookings REFERENCE INTO DATA(lt_zc_01_booking_dataset).
        IF lt_zc_01_booking_dataset->cancelled = ''.
            " IF booking is not marked is cancelled, mark it as so
            lt_zc_01_booking_dataset->cancelled = 'X'.
        ELSE.
            " IF Booking is already cancelled, switch back
            lt_zc_01_booking_dataset->cancelled = ''.
        ENDIF.

        " Update Data with the new data sets
        io_modify->update(
            EXPORTING
                iv_node = is_ctx-node_key
                iv_key = lt_zc_01_booking_dataset->key
                is_data = lt_zc_01_booking_dataset
        ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
