*&---------------------------------------------------------------------*
*& Report z01_view_inital
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_view_inital.

SELECTION-SCREEN:BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
*SELECTION-SCREEN SKIP 1.
" 4 VIEW BUTTONS
SELECTION-SCREEN PUSHBUTTON 01(23) text-010 USER-COMMAND view1.
SELECTION-SCREEN PUSHBUTTON 26(23) text-020 USER-COMMAND view2.
SELECTION-SCREEN PUSHBUTTON 51(23) text-030 USER-COMMAND view3.
SELECTION-SCREEN PUSHBUTTON 76(23) text-040 USER-COMMAND view4.

SELECTION-SCREEN END OF BLOCK b1.

AT SELECTION-SCREEN.

"MESSAGE i888(sabapdemos) WITH text-001 sscrfields-ucomm.

 CASE sy-ucomm.
    WHEN 'VIEW1'.
      SUBMIT Z01_VIEW_AIRLINE AND RETURN.
    WHEN 'VIEW2'.
      SUBMIT Z01_VIEW_DESTATIS AND RETURN.
    WHEN 'VIEW3'.
      SUBMIT Z01_VIEW_PASSENGER AND RETURN.
    WHEN 'VIEW4'.
      SUBMIT Z01_VIEW_TRAVELAGENCY AND RETURN.
  ENDCASE.
