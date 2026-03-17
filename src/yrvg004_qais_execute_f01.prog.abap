*&*
*&  Include           YRVG004_QAIS_EXECUTE_F01
*&*
*&*
*&      Form  VALIDATION
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM validation .
DATA: w_check_date TYPE d.
DATA : lv_percent TYPE char17 .
** SOC Commented by ritesh/priyanka on charm 200000236 on 14-05-2021 onspecial MQAIS scheme for 2021-2022
"Remove validation august onwards from program
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*  IF s_sptag-low+4(2) = '04' OR s_sptag-low+4(2) = '05' OR
*    s_sptag-low+4(2) = '06' OR s_sptag-low+4(2) = '07' OR s_sptag-high+4(2) = '04' OR
*    s_sptag-high+4(2) = '06' OR s_sptag-high+4(2) = '05' OR s_sptag-high+4(2) = '07'.
*    MESSAGE 'This year MQAIS will execute from August month only'TYPE 'I' DISPLAY LIKE 'E'.
*    LEAVE LIST-PROCESSING.
*  ENDIF.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
** EOC Commented by ritesh/priyanka on charm 200000236 on 14-05-2021 onspecial MQAIS scheme for 2021-2022
IF c_chk IS NOT INITIAL. "**SOC by ujjwal/priyanka on 22-10-2019 to bypass the below check for YRVR206
  lv_siml = 'X'.
ENDIF. "**EOC by ujjwal/priyanka on 22-10-2019 to bypass the below check for YRVR206
IF s_sptag-low IS INITIAL OR s_sptag-high IS INITIAL.
  MESSAGE 'Please enter From and To Date of period' TYPE 'E' .
ELSE.32
***SOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 1 Starts with May34
*    IF r_quater = 'X' AND ( ( s_sptag-low+4(4) NE '0501' OR s_sptag-high+4(4) NE '0630' ) AND "Commented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV36
  IF r_quater = 'X' AND ( ( s_sptag-low+4(4) NE '0401' OR s_sptag-high+4(4) NE '0630' ) AND "Uncommented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV38
***EOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 1 Starts with May40
** SOC by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
                    ( s_sptag-low+4(4) NE '0701' OR s_sptag-high+4(4)NE '0930' ) AND
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**                      ( s_sptag-low+4(4) NE '0701' OR s_sptag-high+4(4) NE '0930' ) AND
*                      ( s_sptag-low+4(4) NE '0801' OR s_sptag-high+4(4)NE '0930' ) AND
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-202147
** EOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
                          ( s_sptag-low+4(4) NE '1001' OR s_sptag-high+4(4) NE '1231' ) AND
                          ( s_sptag-low+4(4) NE '0101' OR s_sptag-high+4(4) NE '0331' )  ) .51
    MESSAGE 'Please enter valid quater period dates' TYPE 'E' .
  ELSEIF r_annual = 'X' AND54
** SOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-202256
***SOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE ANNUAL Starts with May
     ( s_sptag-low+4(4) NE '0401' OR  s_sptag-high+4(4) NE '0331' ) ."Uncommented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV59
*       ( s_sptag-low+4(4) NE '0501' OR  s_sptag-high+4(4) NE '0331' ) ."Commented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
***EOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE ANNUAL Starts with May62
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*      ( s_sptag-low+4(4) NE '0401' OR  s_sptag-high+4(4) NE '0331' ) .
*      ( s_sptag-low+4(4) NE '0801' OR  s_sptag-high+4(4) NE '0331' ) .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-202167
** EOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
    IF lv_siml NE 'X'.
      MESSAGE 'Please enter valid Financial year dates' TYPE 'E' .
    ENDIF.72
***SOC Adarsh/Archana against charm:4000006427 TR: DVRK9A12BV
  ELSEIF r_consis = 'X' AND
    ( s_sptag-low+4(4) NE '0401' OR  s_sptag-high+4(4) NE '0331' ) .
    IF lv_siml NE 'X'.
      MESSAGE 'Please enter valid Financial year dates' TYPE 'E' .
    ENDIF.
***EOC Adarsh/Archana against charm:4000006427 TR: DVRK9A12BV
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount81
*    ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ'X' OR r_rlld EQ 'X'.83
******SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*    ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'. " SOC Commenetd by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V8889
*    ELSEIF r_month = 'X' OR r_month1 = 'X' OR r_rpd EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    IF s_sptag-low+4(2) NE s_sptag-high+4(2).
      MESSAGE 'Please Enter Single Month Period' TYPE 'E'.
    ELSE.
      IF s_sptag-low+6(2) NE '01'.
        MESSAGE 'Please Enter Correct Month Period' TYPE 'E'.
      ELSE.
        CALL FUNCTION 'BKK_GET_MONTH_LASTDAY'
          EXPORTING
            i_date = s_sptag-low
          IMPORTING
            e_date = lv_date1.
        IF s_sptag-high NE lv_date1.
          IF lv_siml NE 'X'.
            MESSAGE 'Please Enter Correct Month Period' TYPE 'E'.
          ENDIF.
        ENDIF.
      ENDIF.
      CLEAR: w_q1,w_q2,w_q3,w_q4.
***SOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Starts with May
      IF s_sptag-low+4(4) GE '0401' AND s_sptag-low+4(4) LE '0601'  ."Uncommented by Adarsh/Archana Charm:-4000006427 TR:-DVRK9A12BV112
*        IF s_sptag-low+4(4) GE '0501' AND s_sptag-low+4(4) LE '0601'  ."Commented by Adarsh/Archana Charm:-4000006427 TR:-DVRK9A12BV
***EOC by ABHINAV JUYAL/PRIYANKA/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Starts with May
        w_q1 = 'X'.
        lv_q = 'Q1'.
      ELSEIF
** SOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
        s_sptag-low+4(4) GE '0701' AND s_sptag-low+4(4) LE '0901'  .
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**          s_sptag-low+4(4) GE '0701' AND s_sptag-low+4(4) LE '0901'  .
*          s_sptag-low+4(4) GE '0801' AND s_sptag-low+4(4) LE '0901'  .
**          lv_sptag-low+4(4) = '0401'.
        lv_sptag-low+0(4) =  s_sptag-low+0(4).
        lv_sptag-high+4(4) = '0601'.
        lv_sptag-high+0(4) =  s_sptag-low+0(4).
** EOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
        w_q2 = 'X' .
        lv_q = 'Q2'.
*          w_endda_prev  = s_sptag-low - 1  .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
      ELSEIF s_sptag-low+4(4) GE '1001' AND s_sptag-low+4(4) LE '1201'.
** SOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
        lv_sptag-low+4(4) = '0701'.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*          lv_sptag-low+4(4) = '0701'.
*          lv_sptag-low+4(4) = '0801'.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
** EOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
        lv_sptag-low+0(4) =  s_sptag-low+0(4).
        lv_sptag-high+4(4) = '0901'.
        lv_sptag-high+0(4) =  s_sptag-low+0(4).
        w_q3 = 'X' .
        lv_q = 'Q3'.
        w_endda_prev  = s_sptag-low - 1  .
      ELSEIF s_sptag-low+4(4) GE '0101' AND s_sptag-low+4(4) LE '0301'.
        lv_sptag-low+4(4) = '1001'.
        lv_sptag-low+0(4) =  s_sptag-low+0(4) - 1.
        lv_sptag-high+4(4) = '1201'.
        lv_sptag-high+0(4) =  s_sptag-low+0(4) - 1.
        w_q4 = 'X' .
        lv_q = 'Q4'.
        w_endda_prev  = s_sptag-low - 1  .
      ENDIF.
    ENDIF.
    IF lv_siml NE 'X'.
      IF s_sptag-high GT sy-datum.
        MESSAGE 'End date can not be Future date' TYPE 'E' .
      ENDIF.
    ENDIF.
  ELSEIF r_newcus = 'X' AND   "Vivek
      ( s_sptag-low+4(4) NE '0801' OR  s_sptag-high+4(4) NE '0331' ) .
    IF lv_siml NE 'X'.
      MESSAGE 'Please enter valid Financial year dates' TYPE 'E' .
    ENDIF.
  ENDIF.
  IF r_quater = 'X' .168
**  SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter  Starts with May
    IF s_sptag-low+4(4) EQ '0401' . "Uncommented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
*      IF s_sptag-low+4(4) EQ '0501' . "Commented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter  Starts with May173
      w_q1 = 'X'.
      lv_q = 'Q1'.
    ELSEIF
** SOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
       s_sptag-low+4(4) EQ '0701'  .
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*        s_sptag-low+4(4) EQ '0701'   .
*        s_sptag-low+4(4) EQ '0801'   .
** EOC  by ritesh/priyanka on charm 200000236 on 14-05-2021 on special MQAIS scheme for 2021-2022
      w_q2 = 'X' .
      lv_q = 'Q2'.
*        w_endda_prev  = s_sptag-low - 1  .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
    ELSEIF s_sptag-low+4(4) EQ '1001' .
      w_q3 = 'X'.
      lv_q = 'Q3'.        .
      w_endda_prev  = s_sptag-low - 1  .
    ELSEIF s_sptag-low+4(4) EQ '0101'.
      w_q4 = 'X' .
      lv_q = 'Q4'.
      w_endda_prev  = s_sptag-low - 1  .
    ENDIF.
  ENDIF.
ENDIF.
IF r_quater = 'X' .
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter Starts with May
*    IF s_sptag-low+4(2) LE '03' . "Commented by Adarsh/Archana againstcharm:4000006427 TR:DVRK9A12BV
  IF s_sptag-low+4(2) LE '04' . "Uncommented by Adarsh/Archana againstcharm:4000006427 TR:DVRK9A12BV
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 1 Starts with May
*      w_fiscal = s_sptag-low+2(2) - 1 . "Commented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
    w_fiscal = s_sptag-low+0(4) . "Added by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
    w_fiscal1 = s_sptag-high+2(2) + 1 . "Added by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
    CONDENSE: w_fiscal, w_fiscal1.  "Added by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
*      CONCATENATE w_fiscal s_sptag-high+2(2)  INTO w_fiscal SEPARATED BY '-' . "Commented by Adarsh/Archana against charm:4000006427 TR:DVRK9A12BV
    CONCATENATE w_fiscal w_fiscal1  INTO w_fiscal SEPARATED BY '-' .
  ELSE.
    w_fiscal = s_sptag-low+2(2) + 1 .
    CONDENSE w_fiscal.
    CONCATENATE s_sptag-low+2(2)  w_fiscal INTO w_fiscal SEPARATED BY'-' .
  ENDIF.
ELSE.
  CONCATENATE s_sptag-low+2(2) s_sptag-high+2(2) INTO  w_fiscal SEPARATED BY '-' .
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
IF s_sptag-low <  ls_yrva_cis_mstr-yy_start_date OR s_sptag-high >  ls_yrva_cis_mstr-yy_end_date.
  CLEAR: ls_monthn.
  ls_monthn = ls_yrva_cis_mstr-yy_start_date+0(4).
  ls_monthn =  ls_monthn + 1.
  CONCATENATE 'Please process with financial year' ls_yrva_cis_mstr-yy_start_date+0(4) '-' ls_monthn INTO ls_magt SEPARATED BY space.
  MESSAGE ls_magt TYPE 'E'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188226
ENDFORM.                    " VALIDATION
*&*
*&      Form  GET_DATA
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM get_data.
DATA lv_fname TYPE char20.
DATA lv_index1 TYPE sy-tabix.
DATA lv_mth1 TYPE yy_qais_month.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008766
CLEAR: ls_psdq.
**  IF s_sptag-low+4(2) = '08' AND s_sptag-low+0(4) = '2024' AND ( r_rlld IS NOT INITIAL OR r_rhd IS NOT INITIAL )." SOC Commenetd by ChilukuriTripura Reddy/Archna/Vishal Charm : 4000008973
****  IF s_sptag-low+4(2) = '10' AND s_sptag-low+0(4) = '2024' AND Soc Commented by Vaishnavi/Pawan Charm : 4000009111244
IF s_sptag-low+4(2) = '11' AND s_sptag-low+0(4) = '2024' AND        "Soc by Vaishnavi/Pawan Charm : 4000009111
( r_rlld IS NOT INITIAL OR r_rhd IS NOT INITIAL OR c_maint IS NOT INITIAL OR c_maint1 IS NOT INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
  ls_psdq = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008766
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
SELECT * FROM yrva_grade_cisd INTO TABLE lt_yrva_grade_cisd.
LOOP AT lt_yrva_grade_cisd INTO ls_yrva_grade_cisd.
  lt_kondm-sign = 'I'.
  lt_kondm-option = 'EQ'.
  lt_kondm-low = ls_yrva_grade_cisd-yy_grade.
  APPEND lt_kondm.
  CLEAR: ls_yrva_grade_cisd.
ENDLOOP.
IF lt_kondm IS NOT INITIAL.
  SORT lt_kondm[] BY low.
  DELETE ADJACENT DUPLICATES FROM lt_kondm COMPARING low.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050264
CLEAR lv_mth1.
CASE sy-datum+4(2).
  WHEN '1'.
    lv_mth1 = 'JAN'.
  WHEN '2'.
    lv_mth1 = 'FEB'.
  WHEN '3'.
    lv_mth1 = 'MAR'.
  WHEN '4'.
    lv_mth1 = 'APR'.
  WHEN '5'.
    lv_mth1 = 'MAY'.
  WHEN '6'.
    lv_mth1 = 'JUN'.
  WHEN '7'.
    lv_mth1 = 'JUL'.
  WHEN '8'.
    lv_mth1 = 'AUG'.
  WHEN '9'.
    lv_mth1 = 'SEP'.
  WHEN '10'.
    lv_mth1 = 'OCT'.
  WHEN '11'.
    lv_mth1 = 'NOV'.
  WHEN '12'.
    lv_mth1 = 'DEC'.
  WHEN OTHERS.
ENDCASE.
*  get the master waiver table
** -> Begin of changes by of Aditi on 05.12.2024 12:55:36 for ATC
*  SELECT SINGLE * FROM yrva_mstr_waiver
*    INTO wa_yrva_mstr_waiver
*  WHERE begda LE s_sptag-low AND endda GE s_sptag-high .
SELECT * FROM yrva_mstr_waiver
  INTO wa_yrva_mstr_waiver
  UP TO 1 ROWS
WHERE begda LE s_sptag-low AND endda GE s_sptag-high
  ORDER BY PRIMARY KEY.
ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 12:55:41 for ATC
IF sy-subrc NE 0 .
* SOC     min month % logic in QAIS
  wa_yrva_mstr_waiver-min_perc_m1 = 80.
  wa_yrva_mstr_waiver-min_perc_m2 = 80.
  wa_yrva_mstr_waiver-min_perc_m3 = 80.
  wa_yrva_mstr_waiver-min_perc_m4 = 80.
  wa_yrva_mstr_waiver-min_perc_m5 = 80.
  wa_yrva_mstr_waiver-min_perc_m6 = 80.
  wa_yrva_mstr_waiver-min_perc_m7 = 80.
  wa_yrva_mstr_waiver-min_perc_m8 = 80.
  wa_yrva_mstr_waiver-min_perc_m9 = 80.
  wa_yrva_mstr_waiver-min_perc_m10 = 80.
  wa_yrva_mstr_waiver-min_perc_m11 = 80.
  wa_yrva_mstr_waiver-min_perc_m12 = 80.
  wa_yrva_mstr_waiver-max_perc_m1 = 125.
  wa_yrva_mstr_waiver-max_perc_m2 = 125.
  wa_yrva_mstr_waiver-max_perc_m3 = 125.
  wa_yrva_mstr_waiver-max_perc_m4 = 125.
  wa_yrva_mstr_waiver-max_perc_m5 = 125.
  wa_yrva_mstr_waiver-max_perc_m6 = 125.
  wa_yrva_mstr_waiver-max_perc_m7 = 125.
  wa_yrva_mstr_waiver-max_perc_m8 = 125.
  wa_yrva_mstr_waiver-max_perc_m9 = 125.
  wa_yrva_mstr_waiver-max_perc_m10 = 125.
  wa_yrva_mstr_waiver-max_perc_m11 = 125.
  wa_yrva_mstr_waiver-max_perc_m12 = 125.
* EOC     min month % logic in QAIS
  wa_yrva_mstr_waiver-min_perc_q1 = 85 .
  wa_yrva_mstr_waiver-max_perc_q1 = 125 .
  wa_yrva_mstr_waiver-min_perc_q2 = 85 .
  wa_yrva_mstr_waiver-max_perc_q2 = 125 .
  wa_yrva_mstr_waiver-min_perc_q3 = 85 .
  wa_yrva_mstr_waiver-max_perc_q3 = 125 .
  wa_yrva_mstr_waiver-min_perc_q4 = 85 .
  wa_yrva_mstr_waiver-max_perc_q4 = 125 .
  wa_yrva_mstr_waiver-annual_min = 85 .
  wa_yrva_mstr_waiver-annual_max = 125 .
ENDIF.
MOVE-CORRESPONDING wa_yrva_mstr_waiver TO wa_yrva_mstr_waiver_temp.344
CLEAR wa_where_tab.
REFRESH it_where_tab.
CONCATENATE 'KUNNR' 'IN' 'S_PKUNAG' INTO wa_where_tab SEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab.
APPEND wa_where_tab TO it_where_tab1.351
CONCATENATE 'AND' 'VKBUR' 'IN' 'S_VKBUR' INTO wa_where_tab SEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab.
APPEND wa_where_tab TO it_where_tab1.356
CONCATENATE 'AND' 'yy_per_start' 'LE' 'S_SPTAG-LOW' INTO wa_where_tabSEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab.360
CONCATENATE 'AND' 'yy_per_start' 'LE' 'LV_SPTAG-LOW' INTO wa_where_tabSEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab1.364
CONCATENATE 'AND' 'yy_per_end' 'GE' 'S_SPTAG-HIGH' INTO wa_where_tab SEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab.368
CONCATENATE 'AND' 'yy_per_end' 'GE' 'LV_SPTAG-HIGH' INTO wa_where_tabSEPARATED BY space.
TRANSLATE wa_where_tab TO UPPER CASE.
APPEND wa_where_tab TO it_where_tab1.
IF r_month EQ 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZMIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.376
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.
ELSEIF r_month1 = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZAMS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.384
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.
ELSEIF r_quater = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.
ELSEIF r_annual = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZAIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.396
***SOC Adarsh/Archana against Charm:4000006427, TR:DVRK9A12BV
ELSEIF r_consis = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZACD' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.
***EOC Adarsh/Archana against Charm:4000006427, TR:DVRK9A12BV403
ELSEIF r_rpd = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZRPD' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
ELSEIF r_rhd = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_PE07' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.413
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.417
ELSEIF r_rlld = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_PE08' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.422
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount427
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
ELSEIF c_maint = 'X'.
**    CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZP21' INTO wa_where_tab SEPARATED BY space." SOC Commenetd by Chilukuri Tripura Reddy/Archna/VishalCharm : 4000008973
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_PE32' INTO wa_where_tab SEPARATED BY space." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.434
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF c_maint1 = 'X'.
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_PE31' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.444
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_ZQIS' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab1.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_newcus = 'X' . "VIVEK
  CONCATENATE 'AND' 'REB_COND' 'EQ' 'CO_PE12' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.
ENDIF.
SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
WHERE (it_where_tab).
IF sy-subrc EQ 0.
ENDIF.
IF r_rpd NE 'X'.
  SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate1
  WHERE (it_where_tab1).
  IF sy-subrc EQ 0.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount465466
*  IF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.468
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  IF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
IF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' ORr_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V473
*  IF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  s_sptag1-low+0(4) = s_sptag-low+0(4).
  s_sptag1-low+4(2) = s_sptag-low+4(2) - 1.
  s_sptag1-low+6(2) = 01.479
  CALL FUNCTION 'BKK_GET_MONTH_LASTDAY'
    EXPORTING
      i_date = s_sptag1-low
    IMPORTING
      e_date = s_sptag1-high.485
  APPEND s_sptag1.
  REFRESH: it_where_tab,it_where_tab3.
  CLEAR wa_where_tab.489
  CONCATENATE 'KUNNR' 'IN' 'S_PKUNAG' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.493
  CONCATENATE 'AND' 'KVGR2' 'IN' 'S_KVGR2' INTO wa_where_tab SEPARATEDBY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.497
  CONCATENATE 'AND' 'VKBUR' 'IN' 'S_VKBUR' INTO wa_where_tab SEPARATEDBY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.501
  it_where_tab4[] = it_where_tab[].
  CONCATENATE 'AND' 'MOU_BEGDA' 'LE' 'S_SPTAG-LOW' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab4.506
  CONCATENATE 'AND' 'MOU_ENDDA' 'GE' 'S_SPTAG-HIGH' INTO wa_where_tabSEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab4.510
  CONCATENATE 'AND' 'MOU_BEGDA' 'LE' 'S_SPTAG1-LOW' INTO wa_where_tabSEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.514
  CONCATENATE 'AND' 'MOU_ENDDA' 'GE' 'S_SPTAG1-HIGH' INTO wa_where_tabSEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.518
  it_where_tab3[] = it_where_tab[].520
  CASE s_sptag-low+4(2).
    WHEN '4'.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*      WHEN '4'.
*      WHEN '8'.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
      SELECT * FROM yrva_qais_data
       INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data
        WHERE kunnr IN s_pkunag
        AND kvgr2 IN s_kvgr2
        AND vkbur IN s_vkbur
        AND mou_begda LE s_sptag-low
      AND mou_endda GE s_sptag-high
** SOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
        AND module_identity = ''.
** EOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer             .
      IF sy-subrc EQ 0.
        IF r_rpd EQ 'X'.
          SELECT * FROM yrva_qais_data_s
         INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_s
         WHERE kunnr IN s_pkunag
         AND kvgr2 IN s_kvgr2
         AND vkbur IN s_vkbur
         AND mou_begda LE s_sptag-low
         AND mou_endda GE s_sptag-high .
          IF it_yrva_qais_data_m IS NOT INITIAL.
            LOOP AT it_yrva_qais_data_s INTO wa_yrva_qais_data_s.
              READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data WITHKEY kunnr = wa_yrva_qais_data_m-kunnr.
              IF sy-subrc EQ 0.
                DELETE it_yrva_qais_data WHERE kunnr = wa_yrva_qais_data_m-kunnr.
              ENDIF.
            ENDLOOP.
            CLEAR wa_yrva_qais_data_s.
          ENDIF.
        ELSE.
          SELECT * FROM yrva_qais_data_m
          INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m
          WHERE kunnr IN s_pkunag
          AND kvgr2 IN s_kvgr2
          AND vkbur IN s_vkbur
          AND mou_begda LE s_sptag-low
          AND mou_endda GE s_sptag-high .
          IF it_yrva_qais_data_m IS NOT INITIAL.
*565
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*               IF r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*              IF R_MONTH1 EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
            IF r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V571
*              DATA(gt_yrva_qais_data) = it_yrva_qais_data[].
*                DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data COMPARING qais_no kunnr.
              LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
                READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m WITH KEY qais_no = wa_yrva_qais_data-qais_no kunnr = wa_yrva_qais_data-kunnr.
                IF sy-subrc NE 0.
                  DELETE it_yrva_qais_data WHERE qais_no = wa_yrva_qais_data-qais_no AND kunnr = wa_yrva_qais_data-kunnr.
                ENDIF.
              ENDLOOP.
            ELSE.
              LOOP AT it_yrva_qais_data_m INTO wa_yrva_qais_data_m.
                READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data WITH KEY kunnr = wa_yrva_qais_data_m-kunnr.
                IF sy-subrc EQ 0.
*                  DELETE it_yrva_qais_data WHERE kunnr = wa_yrva_qais_data_m-kunnr.
                ENDIF.
              ENDLOOP.587
              CLEAR wa_yrva_qais_data_m.
            ENDIF.
          ENDIF.
        ENDIF.
        IF it_yrva_rebate IS NOT INITIAL.
          LOOP AT it_yrva_rebate INTO wa_yrva_rebate.
            READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data WITH KEY kunnr = wa_yrva_rebate-kunnr.
            IF sy-subrc EQ 0.
              DELETE it_yrva_qais_data WHERE kunnr = wa_yrva_rebate-kunnr.
            ENDIF.
          ENDLOOP.
          CLEAR wa_yrva_rebate.
        ENDIF.
      ENDIF.602
    WHEN '1'.
      CONCATENATE 'AND' 'MON_SO_M9' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.607
      CONCATENATE 'AND' 'MON_SO_M10' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.612
    WHEN '2'.
      CONCATENATE 'AND' 'MON_SO_M10' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.617
      CONCATENATE 'AND' 'MON_SO_M11' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.622
    WHEN '3'.
      CONCATENATE 'AND' 'MON_SO_M11' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.627
      CONCATENATE 'AND' 'MON_SO_M12' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.632
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
    WHEN '5'.
      CONCATENATE 'AND' 'MON_SO_M1' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.638
      CONCATENATE 'AND' 'MON_SO_M2' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.643
    WHEN '6'.
      CONCATENATE 'AND' 'MON_SO_M2' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.648
      CONCATENATE 'AND' 'MON_SO_M3' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.653
    WHEN '7'.
      CONCATENATE 'AND' 'MON_SO_M3' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.658
      CONCATENATE 'AND' 'MON_SO_M4' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.663
    WHEN '8'.
      CONCATENATE 'AND' 'MON_SO_M4' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.668
      CONCATENATE 'AND' 'MON_SO_M5' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
    WHEN '9'.
      CONCATENATE 'AND' 'MON_SO_M5' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.678
      CONCATENATE 'AND' 'MON_SO_M6' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.683
    WHEN '10'.
      CONCATENATE 'AND' 'MON_SO_M6' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.688
      CONCATENATE 'AND' 'MON_SO_M7' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.693
    WHEN '11'.
      CONCATENATE 'AND' 'MON_SO_M7' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.698
      CONCATENATE 'AND' 'MON_SO_M8' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.703
    WHEN '12'.
      CONCATENATE 'AND' 'MON_SO_M8' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.708
      CONCATENATE 'AND' 'MON_SO_M9' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab3.
      APPEND wa_where_tab TO it_where_tab4.
  ENDCASE.
  IF
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**      s_sptag-low+4(2) NE '4'.
    s_sptag-low+4(2) NE '4'.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
    SELECT * FROM yrva_qais_data
      INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data
      WHERE kunnr IN s_pkunag
      AND kvgr2 IN s_kvgr2
      AND vkbur IN s_vkbur
      AND mou_begda LE s_sptag-low
    AND mou_endda GE s_sptag-high
** SOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
        AND module_identity = ''.
** EOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
    IF sy-subrc EQ 0.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
**SOC by ujjjwal/priyanka on charm 4000002947 on 15-10-2020 to create new additional MQAIS link discount
*        IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ'X'.
      IF r_month1 EQ 'X' OR r_rpd EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002947 on 15-10-2020 to create new additional MQAIS link discount
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
        SELECT * FROM yrva_qais_data_m
        INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m
        WHERE (it_where_tab4).
        IF sy-subrc EQ 0.
          IF r_month1 EQ 'X'.
            SELECT * FROM yrva_qais_data_s
            INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_s
            WHERE (it_where_tab3) AND ( flag_rpd EQ 'S' OR flag_rpd EQ' ' ) .
          ENDIF.
          IF r_rpd EQ 'X'.
            SELECT * FROM yrva_qais_data_s
            INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_s
            WHERE (it_where_tab3) AND flag_rpd EQ 'R'.
          ENDIF.
          LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
            lv_index1 = sy-tabix.
            READ TABLE it_yrva_qais_data_s INTO wa_yrva_qais_data_s WITH KEY qais_no = wa_yrva_qais_data-qais_no.
            IF sy-subrc EQ 0.
              DELETE it_yrva_qais_data INDEX lv_index1.
              CLEAR lv_index1.
              CONTINUE.
            ENDIF.
          ENDLOOP.
        ELSE.
          LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
            lv_index1 = sy-tabix.
            READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m WITH KEY qais_no = wa_yrva_qais_data-qais_no.
            IF sy-subrc NE 0.
              DELETE it_yrva_qais_data INDEX lv_index1.
              CLEAR lv_index1.
              CONTINUE.
            ENDIF.
          ENDLOOP.
        ENDIF.
      ENDIF.
      REFRESH it_yrva_qais_data_m.
      CLEAR lv_index1.
      IF r_rpd NE 'X'.
        SELECT * FROM yrva_qais_data_m
        INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m
        WHERE (it_where_tab).
        IF c_chk IS  INITIAL. "" SOC by ujjwal/priyanka on 04-12-2019charm 4000001283 dynamic lifiting
          LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
            lv_index1 = sy-tabix.
            READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m WITH KEY qais_no = wa_yrva_qais_data-qais_no.
            IF sy-subrc NE 0.
              IF wa_yrva_qais_data-mou_begda NE s_sptag-low .
                DELETE it_yrva_qais_data INDEX lv_index1.
                CLEAR lv_index1.
                CONTINUE.
              ENDIF.
            ENDIF.788
            "SOC RITESH SINGH PRIYANKA SINGH ON CHARM 200000236 ON DATE 17.05.2021
*              IF wa_yrva_qais_data-mou_begda LT s_sptag-low .
*                IF s_sptag-low+4(2) = '07' OR s_sptag-low+4(2) = '10' OR s_sptag-low+4(2) = '01'.
*                  READ TABLE it_yrva_rebate1 INTO wa_yrva_rebate WITH KEY kunnr = wa_yrva_qais_data-kunnr.
*                  IF sy-subrc NE 0.
*                    DELETE it_yrva_qais_data INDEX lv_index1.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*              CLEAR lv_index1.
            "EOC RITESH SINGH PRIYANKA SINGH ON CHARM 200000236 ON DATE 17.05.2021
          ENDLOOP.
        ENDIF. "" EOC by ujjwal/priyanka on 04-12-2019 charm 4000001283 dynamic lifiting
      ENDIF.
      LOOP AT it_yrva_rebate INTO wa_yrva_rebate.
        DELETE it_yrva_qais_data WHERE kunnr EQ wa_yrva_rebate-kunnr.
      ENDLOOP.
    ENDIF.
  ENDIF.
ELSE.
  REFRESH it_where_tab.
  CLEAR wa_where_tab.
  CONCATENATE 'KUNNR' 'IN' 'S_PKUNAG' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.814
  CONCATENATE 'AND' 'KVGR2' 'IN' 'S_KVGR2' INTO wa_where_tab SEPARATEDBY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.818
  CONCATENATE 'AND' 'VKBUR' 'IN' 'S_VKBUR' INTO wa_where_tab SEPARATEDBY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.822
  CONCATENATE 'AND' 'MOU_BEGDA' 'LE' 'S_SPTAG-LOW' INTO wa_where_tab SEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.826
  CONCATENATE 'AND' 'MOU_ENDDA' 'GE' 'S_SPTAG-HIGH' INTO wa_where_tabSEPARATED BY space.
  TRANSLATE wa_where_tab TO UPPER CASE.
  APPEND wa_where_tab TO it_where_tab.830
  IF w_q1 = 'X'.
    IF lv_siml EQ 'X' .833
***SOUncomment by Adarsh/Archana on CHARM: 4000006427 TR:DVRK9A12BV CHANGE Uncommenting For April Month
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE CommentingFor April Month
      IF lv_mth1 NE 'APR'.
        CONCATENATE 'AND' 'MON_SO_M1' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE CommentingFor April Month
***EOUncomment by ABHINAV JUYAL/PRIYANKA on CHARM: 4000006427 TR:DVRK9A12BV CHANGE Uncommenting For April Month843
      IF lv_mth1 NE 'MAY'.
        CONCATENATE 'AND' 'MON_SO_M2' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'JUN'.
        CONCATENATE 'AND' 'MON_SO_M3' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
    ENDIF.
    IF lv_siml NE 'X'.
      CONCATENATE 'AND' 'MON_SO_M1' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.859
      CONCATENATE 'AND' 'MON_SO_M2' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.863
      CONCATENATE 'AND' 'MON_SO_M3' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.
    ENDIF.
  ENDIF.
  IF w_q2 = 'X'.
    IF lv_siml NE 'X'.
      CONCATENATE 'AND' 'MON_SO_M4' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.874
      CONCATENATE 'AND' 'MON_SO_M5' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.878
      CONCATENATE 'AND' 'MON_SO_M6' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.
    ENDIF.
    IF lv_siml EQ 'X'.
      IF lv_mth1 NE 'JUL'.
        CONCATENATE 'AND' 'MON_SO_M4' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'AUG'.
        CONCATENATE 'AND' 'MON_SO_M5' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'SEP'.
        CONCATENATE 'AND' 'MON_SO_M6' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
    ENDIF.
  ENDIF.
  IF w_q3 = 'X'.
    IF lv_siml NE 'X'.
      CONCATENATE 'AND' 'MON_SO_M7' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.906
      CONCATENATE 'AND' 'MON_SO_M8' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.910
      CONCATENATE 'AND' 'MON_SO_M9' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.
    ENDIF.
    IF lv_siml EQ 'X'.
      IF lv_mth1 NE 'OCT'.
        CONCATENATE 'AND' 'MON_SO_M7' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'NOV'.
        CONCATENATE 'AND' 'MON_SO_M8' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'DEC'.
        CONCATENATE 'AND' 'MON_SO_M9' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
    ENDIF.
  ENDIF.
  IF w_q4 = 'X'.
    IF lv_siml NE 'X'.
      CONCATENATE 'AND' 'MON_SO_M10' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.938
      CONCATENATE 'AND' 'MON_SO_M11' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.942
      CONCATENATE 'AND' 'MON_SO_M12' 'NE' 'Co_NULL' INTO wa_where_tabSEPARATED BY space.
      TRANSLATE wa_where_tab TO UPPER CASE.
      APPEND wa_where_tab TO it_where_tab.
    ENDIF.
    IF lv_siml EQ 'X'.
      IF lv_mth1 NE 'JAN'.
        CONCATENATE 'AND' 'MON_SO_M10' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'FEB'.
        CONCATENATE 'AND' 'MON_SO_M11' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
      IF lv_mth1 NE 'MAR'.
        CONCATENATE 'AND' 'MON_SO_M12' 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
        TRANSLATE wa_where_tab TO UPPER CASE.
        APPEND wa_where_tab TO it_where_tab.
      ENDIF.
    ENDIF.
  ENDIF.
  CLEAR lv_mth1.
  SELECT * FROM yrva_qais_data
     INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data
     WHERE kunnr IN s_pkunag
     AND kvgr2 IN s_kvgr2
     AND vkbur IN s_vkbur
     AND ( mou_begda LE s_sptag-low OR mou_begda LE s_sptag-high )
  AND mou_endda GE s_sptag-high
** SOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
        AND module_identity = ''.
** EOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer      .
  IF sy-subrc EQ 0.
    SELECT * FROM yrva_qais_data_m
    INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m
*        FOR ALL ENTRIES IN it_yrva_qais_data
    WHERE (it_where_tab).981
    LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
      CLEAR lv_index1.
      lv_index1 = sy-tabix.
      READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m WITH KEYqais_no = wa_yrva_qais_data-qais_no.
      IF sy-subrc NE 0.
        IF wa_yrva_qais_data-mou_begda GE s_sptag-low AND wa_yrva_qais_data-mou_begda LE s_sptag-high .
          CONCATENATE 'QAIS_NO' 'EQ' 'WA_YRVA_QAIS_DATA-QAIS_NO' INTOwa_where_tab SEPARATED BY space.
          APPEND wa_where_tab TO it_where_tab2.
          IF w_q1 = 'X'.
            lv_qmonth = wa_yrva_qais_data-mou_begda+4(2).
            lv_qmonth = lv_qmonth - 3.
            SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            WHILE lv_qmonth LE'3'.
              CONCATENATE 'AND' 'MON_SO_M' INTO wa_where_tab SEPARATEDBY space.
              CONCATENATE wa_where_tab lv_qmonth INTO wa_where_tab .
              CONCATENATE wa_where_tab 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
              APPEND wa_where_tab TO it_where_tab2.
              lv_qmonth = lv_qmonth + 1.
              SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            ENDWHILE.
          ENDIF.
          IF w_q2 = 'X'.
            lv_qmonth = wa_yrva_qais_data-mou_begda+4(2).
            lv_qmonth = lv_qmonth - 3.
            SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            WHILE lv_qmonth LE'6'.
              CONCATENATE 'AND' 'MON_SO_M' INTO wa_where_tab SEPARATEDBY space.
              CONCATENATE wa_where_tab lv_qmonth INTO wa_where_tab .
              CONCATENATE wa_where_tab 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
              APPEND wa_where_tab TO it_where_tab2.
              lv_qmonth = lv_qmonth + 1.
              SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            ENDWHILE.
          ENDIF.
          IF w_q3 = 'X'.
            lv_qmonth = wa_yrva_qais_data-mou_begda+4(2).
            lv_qmonth = lv_qmonth - 3.
            SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            WHILE lv_qmonth LE'9'.
              CONCATENATE 'AND' 'MON_SO_M' INTO wa_where_tab SEPARATEDBY space.
              CONCATENATE wa_where_tab lv_qmonth INTO wa_where_tab .
              CONCATENATE wa_where_tab 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
              APPEND wa_where_tab TO it_where_tab2.
              lv_qmonth = lv_qmonth + 1.
              SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            ENDWHILE.
          ENDIF.
          IF w_q4 = 'X'.
            lv_qmonth = wa_yrva_qais_data-mou_begda+4(2).
            lv_qmonth = lv_qmonth + 9.
            SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            WHILE lv_qmonth LE'12'.
              CONCATENATE 'AND' 'MON_SO_M' INTO wa_where_tab SEPARATEDBY space.
              CONCATENATE wa_where_tab lv_qmonth INTO wa_where_tab .
              CONCATENATE wa_where_tab 'NE' 'Co_NULL' INTO wa_where_tab SEPARATED BY space.
              APPEND wa_where_tab TO it_where_tab2.
              lv_qmonth = lv_qmonth + 1.
              SHIFT lv_qmonth LEFT DELETING LEADING '0'.
            ENDWHILE.
          ENDIF.
          SELECT * FROM yrva_qais_data_m
          INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m2
          WHERE (it_where_tab2).
          IF sy-subrc EQ 0.
            REFRESH it_where_tab2.
            CLEAR wa_where_tab.
            CONTINUE.
          ELSE.
            DELETE it_yrva_qais_data INDEX lv_index1.
            REFRESH it_where_tab2.
            CLEAR wa_where_tab.
            CONTINUE.
          ENDIF.
        ELSE.
          DELETE it_yrva_qais_data INDEX lv_index1.
        ENDIF.
      ENDIF.
    ENDLOOP.
    LOOP AT it_yrva_rebate INTO wa_yrva_rebate.
***SOC Adarsh/Archana charm 4000006427, TR DVRK9A12BV
      IF r_consis = 'X'.
*DELETE it_yrva_qais_data WHERE kunnr EQ wa_yrva_rebate-kunnr.
      ELSE.
        DELETE it_yrva_qais_data WHERE kunnr EQ wa_yrva_rebate-kunnr.
      ENDIF.
***EOC Adarsh/Archana charm 4000006427, TR DVRK9A12BV
    ENDLOOP.
  ENDIF.
ENDIF.
*  select the latest record of each customer.
** SOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
DELETE  it_yrva_qais_data WHERE module_identity = 'X'.
** EOC by ujjwal/priyanka on 08-10-2020 on charm 4000002898 to display only low value customer
DELETE  it_yrva_qais_data WHERE inactive EQ 'X'.
SORT   it_yrva_qais_data  DESCENDING BY kunnr  yytimestamp DESCENDING.
DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data COMPARING qais_no kunnr.1078
IF r_newcus = 'X' . "Logic for get data for new customer  "Vivek
  SELECT * FROM yrva_qais_newcus INTO TABLE it_yrva_qais_newcus .
  IF it_yrva_qais_newcus IS NOT INITIAL  .
    SELECT * FROM yrva_qais_data INTO TABLE it_yrva_qais_data_newcus
             FOR ALL ENTRIES IN it_yrva_qais_newcus
              WHERE qais_no = it_yrva_qais_newcus-qais_no
              AND kunnr   = it_yrva_qais_newcus-kunnr AND
              vkbur IN s_vkbur AND kvgr2 IN s_kvgr2 AND inactive NE 'X'..
    SORT   it_yrva_qais_data_newcus DESCENDING BY qais_no kunnr yytimestamp .
    DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data_newcus COMPARINGqais_no  kunnr.
    LOOP AT it_yrva_qais_newcus INTO wa_yrva_qais_newcus.
*        w_index = sy-tabix.
      READ TABLE it_yrva_qais_data_newcus  INTO wa_yrva_qais_data_newcus WITH KEY qais_no = wa_yrva_qais_newcus-qais_no.
      IF sy-subrc NE 0.
        DELETE TABLE it_yrva_qais_newcus FROM wa_yrva_qais_newcus .
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDIF .
*LOGIC TO DELTE THE ENTRY WHOSE SALE ORDER FOR THAT IS ALREADY CREATED
IF r_annual = 'X' .
** SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009468
**    IF s_kvgr2-low IS INITIAL.
**      DELETE it_yrva_qais_data WHERE
**          so_annual IS NOT INITIAL  OR sale_order_q4 IS INITIAL.
**    ELSE.
**      DELETE it_yrva_qais_data WHERE
**       so_annual IS NOT INITIAL  OR ( kvgr2 IS INITIAL AND sale_order_q4 IS INITIAL ).
**
**    ENDIF.
  IF s_kvgr2-low IS INITIAL.
    DELETE it_yrva_qais_data WHERE
        so_annual IS NOT INITIAL.
  ELSE.
    DELETE it_yrva_qais_data WHERE
     so_annual IS NOT INITIAL.
  ENDIF.
  DATA lv_year TYPE gjahr.
  lv_year = s_sptag-low+0(4) + 1.
  CONCATENATE lv_year '0131' INTO  w_date_limit .
  IF lv_siml NE 'X'.
*      DELETE it_yrva_qais_data WHERE mou_begda GE w_date_limit.
  ENDIF.1122
***SOC Adarsh/Archana against charm 400006427, TR: DVRK9A12BV
*  ELSEIF r_consis = 'X' .
*    IF s_kvgr2-low IS INITIAL.
*      DELETE it_yrva_qais_data WHERE
*          so_annual IS NOT INITIAL  OR  sale_order_q4 IS INITIAL    .
*    ELSE.
*      DELETE it_yrva_qais_data WHERE
*       so_annual IS NOT INITIAL  OR ( kvgr2 IS INITIAL AND sale_order_q4 IS INITIAL )   .
*    ENDIF.
*    DATA lv_year TYPE gjahr.
*    lv_year = s_sptag-low+0(4) + 1.
*    CONCATENATE lv_year '0131' INTO  w_date_limit .
*    IF lv_siml NE 'X'.
**      DELETE it_yrva_qais_data WHERE mou_begda GE w_date_limit.
*    ENDIF.
***EOC Adarsh/Archana against charm 400006427, TR: DVRK9A12BV
ELSEIF r_quater = 'X'.
  IF w_q1 = 'X' .
    DELETE it_yrva_qais_data WHERE sale_order_q1 IS NOT INITIAL .
  ELSEIF   w_q2 = 'X' .
    DELETE it_yrva_qais_data WHERE sale_order_q2 IS NOT INITIAL .
    DELETE it_yrva_qais_data WHERE mou_begda LE w_endda_prev AND sale_order_q1 IS INITIAL AND kvgr2 IS INITIAL.
  ELSEIF   w_q3 = 'X' .
    DELETE it_yrva_qais_data WHERE sale_order_q3 IS NOT INITIAL .
    DELETE it_yrva_qais_data WHERE mou_begda LE w_endda_prev AND sale_order_q2 IS INITIAL AND kvgr2 IS INITIAL.
  ELSEIF   w_q4 = 'X' .
    DELETE it_yrva_qais_data WHERE sale_order_q4 IS NOT INITIAL .
    DELETE it_yrva_qais_data WHERE mou_begda LE w_endda_prev AND sale_order_q3 IS INITIAL AND kvgr2 IS INITIAL.
  ENDIF.
ELSEIF r_month EQ 'X' .
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*      DELETE IT_YRVA_QAIS_DATA WHERE MON_SO IS NOT INITIAL .
*Enf of change by Suyash Goyal for QAIS Monthly logic.
ELSEIF r_newcus = 'X' . "VIVEK
  IF s_kvgr2-low IS INITIAL.
    DELETE it_yrva_qais_data_newcus WHERE
        so_annual IS INITIAL ." OR  SALE_ORDER_Q4 IS INITIAL    .  "change by Vivek
  ELSE.
    DELETE it_yrva_qais_data_newcus WHERE
     so_annual IS INITIAL  OR ( kvgr2 IS INITIAL AND sale_order_q4 ISINITIAL )   . "change by Vivek
  ENDIF.
*    DATA LV_YEAR TYPE GJAHR.
  lv_year = s_sptag-low+0(4) + 1.
  CONCATENATE lv_year '0131' INTO  w_date_limit .
  IF lv_siml NE 'X'.
    DELETE it_yrva_qais_data_newcus WHERE mou_begda GE w_date_limit.
  ENDIF.
ENDIF.
*    get the all customers in the group company
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
  it_kunnr-kvgr2 = wa_yrva_qais_data-kvgr2.
  it_kunnr-kunnr = wa_yrva_qais_data-kunnr.
  APPEND it_kunnr.
ENDLOOP.
SORT it_kunnr BY kvgr2 kunnr.
DELETE ADJACENT DUPLICATES FROM it_kunnr COMPARING ALL FIELDS.
*  GET THE DISTINCT GROUP COMPANY CODE
it_yrva_qais_data_temp[] = it_yrva_qais_data[] .
DELETE it_yrva_qais_data_temp WHERE kvgr2 IS INITIAL.
SORT it_yrva_qais_data_temp BY kvgr2.
DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data_temp COMPARING kvgr2.
IF it_yrva_qais_data_temp[] IS NOT INITIAL.
  SELECT  * FROM knvv
    INTO TABLE it_knvv
    FOR ALL ENTRIES IN it_yrva_qais_data_temp
  WHERE kvgr2 = it_yrva_qais_data_temp-kvgr2 AND vtweg = '10'.
ENDIF.
*  select the data abuot the quantity picked by customer or group company
IF it_yrva_qais_data[] IS NOT INITIAL.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  IF r_rhd IS NOT INITIAL.
    SELECT kondm
      FROM yrva_hdpe_grades
      INTO TABLE @DATA(lt_hdpe).
    IF sy-subrc IS INITIAL.
      SORT lt_hdpe BY kondm.
      SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922_n
FOR ALL ENTRIES IN lt_hdpe
WHERE sptag IN s_sptag
*        AND PKUNAG = IT_YRVA_QAIS_DATA-KUNNR
AND kondm = lt_hdpe-kondm.
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008766
    IF ls_psdq = 'X'.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      SELECT kondm
FROM yrva_lldpe_grade
INTO TABLE @DATA(lt_lldpe2).1212
      SELECT kondm
FROM yrva_other_grade
INTO TABLE @DATA(lt_tota).
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_hdpe_grades
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grad1
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
**        IF sy-subrc IS INITIAL." SOC Commenetd by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      IF lt_lldpe2 IS NOT INITIAL." SOC Commenetd by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000008973
        SORT lt_lldpe2 BY kondm.
        SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922
  FOR ALL ENTRIES IN lt_lldpe2
WHERE sptag IN s_sptag
AND kondm = lt_lldpe2-kondm.
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008766
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
  ELSEIF c_maint IS NOT INITIAL.
    SELECT kondm
      FROM yrva_other_grade
      INTO TABLE @DATA(lt_other).
    IF sy-subrc IS INITIAL.
      SORT lt_other BY kondm.
      SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922_n
FOR ALL ENTRIES IN lt_other
WHERE sptag IN s_sptag
*        AND PKUNAG = IT_YRVA_QAIS_DATA-KUNNR
AND kondm = lt_other-kondm.
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
    IF ls_psdq = 'X'.
      SELECT kondm
FROM yrva_lldpe_grade
INTO TABLE lt_lldpe2.
      SELECT kondm
FROM yrva_hdpe_grades
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grade
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grad1
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      IF lt_lldpe2 IS NOT INITIAL.
        SORT lt_lldpe2 BY kondm.
        SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922
  FOR ALL ENTRIES IN lt_lldpe2
WHERE sptag IN s_sptag
AND kondm = lt_lldpe2-kondm.
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
  ELSEIF c_maint1 IS NOT INITIAL.
    SELECT kondm
      FROM yrva_other_grad1
      INTO TABLE @DATA(lt_other1).
    IF sy-subrc IS INITIAL.
      SORT lt_other1 BY kondm.
      SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922_n
FOR ALL ENTRIES IN lt_other1
WHERE sptag IN s_sptag
*        AND PKUNAG = IT_YRVA_QAIS_DATA-KUNNR
AND kondm = lt_other1-kondm.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
    IF ls_psdq = 'X'.
      SELECT kondm
FROM yrva_lldpe_grade
INTO TABLE lt_lldpe2.
      SELECT kondm
FROM yrva_hdpe_grades
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grade
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grad1
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_lldpe2.
      IF lt_lldpe2 IS NOT INITIAL.
        SORT lt_lldpe2 BY kondm.
        SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922
  FOR ALL ENTRIES IN lt_lldpe2
WHERE sptag IN s_sptag
AND kondm = lt_lldpe2-kondm.
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
  ELSEIF r_rlld IS NOT INITIAL.
    SELECT kondm
FROM yrva_lldpe_grade
INTO TABLE @DATA(lt_lldpe) .
    IF sy-subrc IS INITIAL.
      SORT lt_lldpe BY kondm.
      SELECT * FROM s922
**INTO CORRESPONDING FIELDS OF TABLE it_s922_n" ** SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
INTO CORRESPONDING FIELDS OF TABLE it_s922 " ** SOC by Chilukuri TripuraReddy/Archna/Vishal Charm : 2000000971
FOR ALL ENTRIES IN lt_lldpe
WHERE sptag IN s_sptag
*        AND PKUNAG = IT_YRVA_QAIS_DATA-KUNNR
AND kondm = lt_lldpe-kondm.
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
    IF ls_psdq = 'X'.
      SELECT kondm
        FROM yrva_hdpe_grades
        INTO TABLE @DATA(lt_hdpe2).
      SELECT kondm
FROM yrva_other_grade
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_hdpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_other_grad1
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_hdpe2.
      REFRESH: lt_tota[].
      SELECT kondm
FROM yrva_lldpe_grade
INTO TABLE lt_tota.
      APPEND LINES OF lt_tota TO lt_hdpe2.
      IF lt_hdpe2 IS NOT INITIAL.
        SORT lt_hdpe2 BY kondm.
        SELECT * FROM s922
INTO CORRESPONDING FIELDS OF TABLE it_s922
  FOR ALL ENTRIES IN lt_hdpe2
WHERE sptag IN s_sptag
AND kondm = lt_hdpe2-kondm.
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
  ELSE.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
* SOC by Chilukuri Tripura Reddy/Archna/Vishal charm no : 4000007011 " B56 Material inluding only from 01/08/2023
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no : 4000007184
    IF w_q2 = 'X'.
      IF s_sptag-low = '20230701' AND s_sptag-high = '20230930'.
        REFRESH : s_sptagn[], it_s922_n[].
        CLEAR : s_sptagn.
        s_sptagn-sign   = 'I'.
        s_sptagn-option = 'BT'.
        s_sptagn-low    = '20230801'.
        s_sptagn-high   = '20230930'.
        APPEND s_sptagn.
        SELECT * FROM s922
      INTO CORRESPONDING FIELDS OF TABLE it_s922_n
      FOR ALL ENTRIES IN it_yrva_qais_data
      WHERE sptag IN s_sptagn
      AND pkunag = it_yrva_qais_data-kunnr
      AND kondm IN ( 'Y1' ).
        CLEAR:  s_sptagn.
        REFRESH: s_sptagn[].
      .    ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no : 4000007184
    IF s_sptag-low => '20230801'.
      SELECT * FROM s922
      INTO CORRESPONDING FIELDS OF TABLE it_s922
      FOR ALL ENTRIES IN it_yrva_qais_data
      WHERE sptag IN s_sptag
      AND pkunag = it_yrva_qais_data-kunnr
*        AND kondm NOT IN ('01','02','30','31','32','49','50','51','54','55','58','59','61','62','63','64','65','72',
*         'A0','A1','A2','A3','A4','A5','A6','A7','A8','A9','B0','B1','B2','B3','B4','B5','B6','B7','B8','B9',
*         'C0','C1','C2','C3','C4','C5','C6','C7','C8','C9','D0','D1','D2','D3','D4','D5','D6','D7','D8','D9',
*         'E1','E2','E3','E4','E5','E6','E7','E8','G1','G2','G3','G4', 'G6', 'G8',
*         'H0', 'H2','H4','H5', 'H6', 'H8', 'I0', 'I2','I3','I4','I5', 'I6', 'I7', 'I8', 'I9',
*         'J0', 'J1', 'J2','J3','J4', 'J5', 'J7',  'J9','K1',  'K3',  'K5','K7', 'K9' ,
*         'L0' ,'L1' ,'L2', 'L3' ,'L4',  'L5' , 'Y2'  , 'Y4' ).
           AND kondm IN lt_kondm.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007300 Excluded E24 Material ( Y3,Y4 )
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007598 Included E24 Material ( Y3 ) A & B
    ELSE.
      SELECT * FROM s922
        INTO CORRESPONDING FIELDS OF TABLE it_s922
        FOR ALL ENTRIES IN it_yrva_qais_data
        WHERE sptag IN s_sptag
        AND pkunag = it_yrva_qais_data-kunnr
        AND kondm NOT IN ('01','02','30','31','32','49','50','51','54','55','58','59','61','62','63','64','65','72',
         'A0','A1','A2','A3','A4','A5','A6','A7','A8','A9','B0','B1','B2','B3','B4','B5','B6','B7','B8','B9',
         'C0','C1','C2','C3','C4','C5','C6','C7','C8','C9','D0','D1','D2','D3','D4','D5','D6','D7','D8','D9',
         'E1','E2','E3','E4','E5','E6','E7','E8','G1','G2','G3','G4','G6', 'G8',
         'H0', 'H2','H4','H5', 'H6', 'H8', 'I0', 'I2','I3','I4','I5','I6', 'I7', 'I8', 'I9',
         'J0', 'J1', 'J2','J3','J4', 'J5', 'J7',  'J9','K1',  'K3',  'K5','K7', 'K9' ,
         'L0' ,'L1' ,'L2', 'L3' ,'L4',  'L5' , 'Y1', 'Y2' ).    "'Y1'
      "Y1 commented by Chilukuri Tripura Reddy/Archna/Vishal Charm no4000006937 date: 17/08/2023 included material B56A003A & B56A003B
      "And excluded material B56A003OG.
      " B56A003A & B56A003B excluded material by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000006964
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no : 4000007184
    IF w_q2 = 'X'.
      IF it_s922_n IS NOT INITIAL.
        APPEND LINES OF it_s922_n TO it_s922.
        REFRESH : it_s922_n[].
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no : 4000007184
* EOC by Chilukuri Tripura Reddy/Archna/Vishal charm no : 4000007011
  ENDIF.
  ""Added L2 and L4 by ujjwal/Priyanka on 08/09/2020 on charm 40000002394 for metallocene grade exclusion  for MQAIS 20-21
  "Added by Kunal/Priyanka on 04/02/2019 for metallocene grade exclusion  for MQAIS 18-19
  " '31'Added by ujjwal/Priyanka on 31/07/2019 for metallocene grade exclusion  for MQAIS
  SORT it_s922 BY pkunag sptag.
** -> Begin of changes by of Ritika on 04.02.2025 11:38:04 for ATC
*    SELECT vbeln fkart fkdat kunag sfakn INTO TABLE i_vbrk
*        FROM vbrk
*        WHERE vkorg = '5000'
*        AND ( fkart IN ('ZP07', 'ZI07') OR fkart = 'S1' )
*   AND fkdat IN s_sptag .
  SELECT vbeln fkart fkdat kunag sfakn INTO TABLE i_vbrk
      FROM vbrk
      WHERE vkorg = '5000'
      AND ( fkart IN ('ZP07', 'ZI07') OR fkart = 'S1' )
 AND fkdat IN s_sptag and draft = space.1454
** -> End of changes by of Ritika on 04.02.2025 11:38:08 for ATC
  IF i_vbrk[] IS NOT INITIAL.
    i_vbrk_t[] = i_vbrk[].
    DELETE i_vbrk WHERE fkart = 'S1'.
    DELETE i_vbrk_t WHERE fkart = 'ZP07'.
    DELETE i_vbrk_t WHERE fkart = 'ZI07'.
    LOOP AT i_vbrk.
      READ TABLE i_vbrk_t WITH KEY sfakn = i_vbrk-vbeln.
      IF sy-subrc = 0.
        DELETE i_vbrk.
      ENDIF.
    ENDLOOP.
    IF i_vbrk[] IS NOT INITIAL.
      SELECT vbeln fkimg kondm FROM vbrp INTO TABLE i_vbrp FOR ALL ENTRIES IN i_vbrk WHERE vbeln = i_vbrk-vbeln.
      LOOP AT i_vbrp.
        READ TABLE i_vbrk WITH KEY vbeln = i_vbrp-vbeln.
        IF sy-subrc = 0.
          i_vbrp-kunag = i_vbrk-kunag.
          i_vbrp-fkdat = i_vbrk-fkdat .
          MODIFY i_vbrp TRANSPORTING kunag fkdat .
        ENDIF.
      ENDLOOP.
      IF i_vbrp[] IS NOT INITIAL.
        LOOP AT i_vbrp.
          LOOP AT  it_s922 INTO wa_s922 WHERE sptag = i_vbrp-fkdat  AND  kondm = i_vbrp-kondm AND pkunag = i_vbrp-kunag.
            wa_s922-ummenge = wa_s922-ummenge - i_vbrp-fkimg.
            IF wa_s922-ummenge LE 0 .
              DELETE TABLE it_s922 FROM wa_s922 .
            ELSE.
              MODIFY it_s922 FROM wa_s922 TRANSPORTING ummenge .
            ENDIF.
            EXIT.
          ENDLOOP.
        ENDLOOP.
      ENDIF.
    ENDIF.
  ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
  IF ls_psdq = 'X'.
    DATA: wa_s922_n TYPE s922.
    CLEAR: wa_s922_n.
    IF i_vbrp[] IS NOT INITIAL.
** -> Begin of changes by of Aditi on 11.12.2024 11:58:10 for ATC
      SORT it_s922_n.
** <- End changes by of Aditi on 11.12.2024 11:58:13 for ATC
      LOOP AT i_vbrp.
        LOOP AT  it_s922_n INTO wa_s922_n WHERE sptag = i_vbrp-fkdatAND  kondm = i_vbrp-kondm AND pkunag = i_vbrp-kunag.
          wa_s922_n-ummenge = wa_s922_n-ummenge - i_vbrp-fkimg.
          IF wa_s922_n-ummenge LE 0 .
            DELETE TABLE it_s922_n FROM wa_s922_n.
          ELSE.
            MODIFY it_s922_n FROM wa_s922_n TRANSPORTING ummenge.
          ENDIF.
          EXIT.
          CLEAR: wa_s922_n.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
ENDIF.
ENDFORM.                    " GET_DATA
*&*
*&      Form  GET_CUST_NAME
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM get_cust_name .
IF r_quater = 'X' .
  IF it_data_quater[] IS NOT INITIAL .
    SELECT kunnr name1 FROM kna1 INTO TABLE it_kna1
      FOR ALL ENTRIES IN it_data_quater
    WHERE kunnr  = it_data_quater-kunnr.
    LOOP AT it_data_quater .
      READ TABLE it_kna1 WITH KEY kunnr  = it_data_quater-kunnr.
      IF sy-subrc EQ 0 .
        it_data_quater-name1 = it_kna1-name1 .
        MODIFY it_data_quater .
        CLEAR it_data_quater.
      ENDIF.
    ENDLOOP.
  ENDIF.
ELSEIF r_annual = 'X' .
  IF it_data_annual[] IS NOT INITIAL .
    SELECT kunnr name1 FROM kna1 INTO TABLE it_kna1
      FOR ALL ENTRIES IN it_data_annual
    WHERE kunnr  = it_data_annual-kunnr.
    LOOP AT it_data_annual .
      READ TABLE it_kna1 WITH KEY kunnr  = it_data_annual-kunnr.
      IF sy-subrc EQ 0 .
        it_data_annual-name1 = it_kna1-name1 .
        MODIFY it_data_annual .
        CLEAR it_data_annual.
      ENDIF.
    ENDLOOP.
  ENDIF.1554
***SOC Adarsh/Archana against charm:4000006427 TR: DVRK9A12BV
ELSEIF r_consis = 'X' .
  IF it_annual_consis[] IS NOT INITIAL .
    SELECT kunnr name1 FROM kna1 INTO TABLE it_kna1
      FOR ALL ENTRIES IN it_annual_consis
    WHERE kunnr  = it_annual_consis-kunnr.
    LOOP AT it_annual_consis .
      READ TABLE it_kna1 WITH KEY kunnr  = it_annual_consis-kunnr.
      IF sy-subrc EQ 0 .
        it_annual_consis-name1 = it_kna1-name1 .
        MODIFY it_annual_consis .
        CLEAR it_annual_consis.
      ENDIF.
    ENDLOOP.
  ENDIF.
***EOC Adarsh/Archana against charm:4000006427 TR: DVRK9A12BV15711572
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount1574
*******SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*******EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V1580
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  IF it_data_monthly[] IS NOT INITIAL.
    SELECT kunnr name1 FROM kna1 INTO TABLE it_kna1
      FOR ALL ENTRIES IN it_data_monthly
    WHERE kunnr  = it_data_monthly-kunnr.
    LOOP AT it_data_monthly .
      READ TABLE it_kna1 WITH KEY kunnr  = it_data_monthly-kunnr.
      IF sy-subrc EQ 0 .
        it_data_monthly-name1 = it_kna1-name1 .
        MODIFY it_data_monthly .
        CLEAR it_data_monthly.
      ENDIF.
    ENDLOOP.
  ENDIF.
ELSEIF r_newcus = 'X' . "VIVEK
  IF it_data_annual_newcus[] IS NOT INITIAL .
    SELECT kunnr name1 FROM kna1 INTO TABLE it_kna1
      FOR ALL ENTRIES IN it_data_annual_newcus
    WHERE kunnr  = it_data_annual_newcus-kunnr.
    LOOP AT it_data_annual_newcus .
      READ TABLE it_kna1 WITH KEY kunnr  = it_data_annual_newcus-kunnr.
      IF sy-subrc EQ 0 .
        it_data_annual_newcus-name1 = it_kna1-name1 .
        MODIFY it_data_annual_newcus .
        CLEAR it_data_annual_newcus.
      ENDIF.
    ENDLOOP.
  ENDIF.
ENDIF.
ENDFORM.                    " GET_CUST_NAME
*&*
*&      Form  CALCULATE_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM calculate_discount .
**R_RPD & R_MONTH1 logic is not being used as the radio button are disabled on the selection screen.
IF r_quater = 'X' .
** SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**    PERFORM quarter_discount.   "logic for processing quearterly discount
** EOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
ELSEIF   r_annual = 'X' .
  PERFORM annual_discount.     " logic for processing annual discountand consistnecy check discount
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount1629
***SOC Adarsh/Archana against charm: 4000006427 TR: DVRK9A12BV
ELSEIF r_consis = 'X'.
  PERFORM annual_consis_discount.
***EOC Adarsh/Archana against charm: 4000006427 TR: DVRK9A12BV1634
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ'X' OR C_MAINT EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V1640
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
*( logic for processing monthly discount r_month = monthly discount ) -( r_month1 = special monthly discount is not being used any more ).
  PERFORM monthly_discount.
ELSEIF r_rpd EQ 'X'.
*logic for processing repeat performance discount. The logic inside is commented as this discount scheme is not being used any more.
  PERFORM repeat_performance_discount.
ELSEIF r_newcus = 'X' . "VIVEK
  PERFORM annual_disc_for_new_cust.
ENDIF.
ENDFORM.                    " CALCULATE_DISCOUNT
*&*
*&      Form  FORMAT_DATA
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM format_data .1661
IF w_q1 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    CLEAR: wa_yrva_qais_data-ind_lift_qty_m1,
           wa_yrva_qais_data-ind_lift_qty_m2,
           wa_yrva_qais_data-ind_lift_qty_m3.16681669
*   MONTH 11671
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*          IF wa_yrva_qais_data-p_d_sector = 'X' AND wa_s922-kondm NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'   .
*              CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '11' AND wa_s922-kondm NE  '14' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'
*              AND wa_s922-kondm NE  'G7' AND wa_s922-kondm NE  'I1' ANDwa_s922-kondm NE  'K2' .
            CONTINUE.1712
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '14'  AND wa_s922-kondm NE  '21' AND
*"Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018for r36u050u a>mpg k6
*               wa_s922-kondm NE  '27' AND wa_s922-kondm NE  'G7' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m1 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m1 = lv_m1 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.17311732
*      MONTH 2
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m2 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m2 = lv_m2 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.1789
*      month 3
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m3 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m3 = lv_m3 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
    MODIFY it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.1848
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.
    CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m1,
           wa_yrva_qais_data_temp-grp_lift_qty_m2,
           wa_yrva_qais_data_temp-grp_lift_qty_m3.
*   MONTH 1
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
* SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P.
* EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
* SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
* EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
* SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R.
* EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
* SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
* EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. "Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m1 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      MONTH 2
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'.
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m2 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      month 3
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000006951.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m3 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.2050
ELSEIF w_q2 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    CLEAR: wa_yrva_qais_data-ind_lift_qty_m4,
           wa_yrva_qais_data-ind_lift_qty_m5,
           wa_yrva_qais_data-ind_lift_qty_m6.2057
*   MONTH 4
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m4 = wa_yrva_qais_data-ind_lift_qty_m4 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m1 = lv_m1 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      MONTH 5
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m5 = wa_yrva_qais_data-ind_lift_qty_m5 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m2 = lv_m2 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      month 6
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m6 = wa_yrva_qais_data-ind_lift_qty_m6 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m3 = lv_m3 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.222822292230
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.
    CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m4,
           wa_yrva_qais_data_temp-grp_lift_qty_m5,
           wa_yrva_qais_data_temp-grp_lift_qty_m6.
*   MONTH 4
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P. " EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'. " SOC Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p. " EOC Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m4 = wa_yrva_qais_data_temp-grp_lift_qty_m4 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      MONTH 5
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'   .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m5 = wa_yrva_qais_data_temp-grp_lift_qty_m5 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      month 6
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S. " Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s. " Added by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007173.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m6 = wa_yrva_qais_data_temp-grp_lift_qty_m6 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.2424
ELSEIF w_q3 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    CLEAR: wa_yrva_qais_data-ind_lift_qty_m7,
           wa_yrva_qais_data-ind_lift_qty_m8,
           wa_yrva_qais_data-ind_lift_qty_m9.2431
*   MONTH 7
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m7 = wa_yrva_qais_data-ind_lift_qty_m7 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m1 = lv_m1 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      MONTH 8
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m8 = wa_yrva_qais_data-ind_lift_qty_m8 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m2 = lv_m2 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      month 9
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m9 = wa_yrva_qais_data-ind_lift_qty_m9 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m3 = lv_m3 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.260226032604
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.
    CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m7,
           wa_yrva_qais_data_temp-grp_lift_qty_m8,
           wa_yrva_qais_data_temp-grp_lift_qty_m9.
*   MONTH 7
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000007571
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000007571
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m7 = wa_yrva_qais_data_temp-grp_lift_qty_m7 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      MONTH 8
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000007571
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m8 = wa_yrva_qais_data_temp-grp_lift_qty_m8 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      month 9
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
*            IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*              IF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'P' AND WA_S922-KONDM NOT IN RANGE_P." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'R' AND WA_S922-KONDM NOT IN RANGE_R." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000007571
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
*              ELSEIF WA_YRVA_QAIS_DATA-P_R_INDICATOR = 'S' AND WA_S922-KONDM NOT IN RANGE_S." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000007571
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000007571
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m9 = wa_yrva_qais_data_temp-grp_lift_qty_m9 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
    CLEAR: wa_yrva_qais_data_temp.
  ENDLOOP.
ELSEIF w_q4 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    CLEAR: wa_yrva_qais_data-ind_lift_qty_m10,
           wa_yrva_qais_data-ind_lift_qty_m11,
           wa_yrva_qais_data-ind_lift_qty_m12.
*   MONTH 10
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*               NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m10 = wa_yrva_qais_data-ind_lift_qty_m10 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m1 = lv_m1 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      MONTH 11
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m11 = wa_yrva_qais_data-ind_lift_qty_m11 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m2 = lv_m2 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
*      month 12
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data-mou_begda.
      w_begda = wa_yrva_qais_data-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
        AND pkunag = wa_yrva_qais_data-kunnr
        AND kvgr2 = wa_yrva_qais_data-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*          IF WA_YRVA_QAIS_DATA-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*            WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*            AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*            AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*            AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*            CONTINUE.
*          ENDIF.
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*              NE  '09' AND
*              wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*              AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*              AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*              AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' ANDwa_s922-kondm NE  'H3'  .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*              NE  '21' AND
*              wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
            CONTINUE.
          ENDIF.
        ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
        wa_yrva_qais_data-ind_lift_qty_m12 = wa_yrva_qais_data-ind_lift_qty_m12 +
         wa_s922-ummenge .
        IF wa_s922-vtweg = '60'.
          lv_m3 = lv_m3 + wa_s922-ummenge.
        ENDIF.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.297529762977
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.
    CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m10,
           wa_yrva_qais_data_temp-grp_lift_qty_m11,
           wa_yrva_qais_data_temp-grp_lift_qty_m12.
*   MONTH 10
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
**            IF wa_yrva_qais_data-p_d_sector = 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'."  SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
**              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m10 = wa_yrva_qais_data_temp-grp_lift_qty_m10 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      MONTH 11
    w_begda = w_endda + 1 .
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
***            IF wa_yrva_qais_data-p_d_sector = 'X'." SOC Commented byChilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
**              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000008015.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000008015.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m11 = wa_yrva_qais_data_temp-grp_lift_qty_m11 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
*      month 12
    w_begda = w_endda + 1.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
      w_begda = wa_yrva_qais_data_temp-mou_begda.
    ENDIF.
    IF w_begda LT w_endda.
      LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
        LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
          AND pkunag = wa_kunnr-kunnr
          AND kvgr2 = wa_kunnr-kvgr2.
*Begin of change by Suyash Goyal for QAIS Monthly logic.
*       consider only selected material in case of Pipe and ducting sector and roto sector.
*            IF WA_YRVA_QAIS_DATA_TEMP-P_D_SECTOR = 'X' AND WA_S922-KONDM NE  '09' AND
*              WA_S922-KONDM NE  '34'  AND WA_S922-KONDM NE  '20'
*              AND WA_S922-KONDM NE  '56' AND WA_S922-KONDM NE  '60'
*              AND WA_S922-KONDM NE  '43' AND WA_S922-KONDM NE  '44'
*              AND WA_S922-KONDM NE  '46' AND WA_S922-KONDM NE  '38'   .
*              CONTINUE.
*            ENDIF.
**            IF wa_yrva_qais_data-p_d_sector = 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
          IF wa_yrva_qais_data_temp-p_d_sector = 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
**              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
*                NE  '09' AND
*                wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
              CONTINUE.
              "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyankaon 13/02/2018  for r36u050u a>mpg k6
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000008015.
*                NE  '21' AND
*                wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
              CONTINUE.
**              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm 4000008015.
            ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm 4000008015.
              CONTINUE.
            ENDIF.
          ENDIF.
*End of change by Suyash Goyal for QAIS Monthly logic.
          wa_yrva_qais_data_temp-grp_lift_qty_m12 = wa_yrva_qais_data_temp-grp_lift_qty_m12 +
           wa_s922-ummenge .
          IF wa_s922-vtweg = '60'.
            wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.
ENDIF.
ENDFORM.                    " FORMAT_DATA
*&*
*&      Form  FORMAT_DATA_MONTH
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM format_data_month .3182
IF w_q1 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    CASE s_sptag-low+4(2).
      WHEN '4'.
*   MONTH 1
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m1.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'   .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.3231
            wa_yrva_qais_data-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m1 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m1 = wa_yrva_qais_data-ind_elgl_qty_m1 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.3240
      WHEN '5'.
*      MONTH 2
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m2.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m2 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m2 = wa_yrva_qais_data-ind_elgl_qty_m2 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.3278
      WHEN '6'.
*      month 3
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m3.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                   NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                   NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m3 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m3 = wa_yrva_qais_data-ind_elgl_qty_m3 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
    ENDCASE.
    MODIFY it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.3320
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code3322
  CLEAR : wa_yrva_qais_data.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code et group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.3326
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.3341
    CASE s_sptag-low+4(2).
      WHEN '4'.
*   MONTH 1
**SOC by ujjwal/priyanka on 11-10-2019 on charm 400000939 mQAIS BUG
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3347
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF  R_MONTH1 NE 'X' AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF  r_month1 NE 'X' AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF  r_month1 NE 'X' AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3353
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m1.
        ENDIF.
**EOC by ujjwal/priyanka on 11-10-2019 on charm 400000939 mQAIS BUG
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3388
***sOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF r_month1 NE 'X' AND r_rpd NE 'X' AND r_rhd NE 'X' AND r_rlld NE 'X'.
*                IF R_MONTH1 NE 'X' AND R_RPD NE 'X' AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X' AND r_rpd NE 'X' AND r_rhd NE 'X' ANDr_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by ChilukuriTripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3394
*                IF r_month1 NE 'X'AND r_rpd NE 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m1 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.3406
      WHEN '5'.
*      MONTH 2
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3411
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3417
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m2.
        ENDIF.
**eOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector.
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'   .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3452
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF r_month1 NE 'X'  AND r_rpd NE 'X' AND r_rhd NE 'X' AND r_rlld NE 'X'.
*                IF R_MONTH1 NE 'X'  AND R_RPD NE 'X' AND R_RHD NE 'X' AND R_RLLD NE 'X'AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rpd NE 'X' AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3458
*          IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m2 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '6'.
*      month 3
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3474
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3480
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m3.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3'  .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3515
*****SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'. " SOC Commnted by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
*****EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3521
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3524
                wa_yrva_qais_data_temp-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m3 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code3538
  CLEAR : wa_yrva_qais_data_temp.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code et group lifted quantity
ELSEIF w_q2 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.3544
    w_begda = s_sptag-low.3546
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.3560
    CASE s_sptag-low+4(2).
      WHEN '7'.
*   MONTH 4
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m4.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'   .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m4 = wa_yrva_qais_data-ind_lift_qty_m4 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m4 = wa_yrva_qais_data-ind_elgl_qty_m4 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.3600
      WHEN '8'.
*      MONTH 5
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m5.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m5 = wa_yrva_qais_data-ind_lift_qty_m5 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m5 = wa_yrva_qais_data-ind_elgl_qty_m5 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
      WHEN '9'.
*      month 6
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m6.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr
            AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector.
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                   NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m6 = wa_yrva_qais_data-ind_lift_qty_m6 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m6 = wa_yrva_qais_data-ind_elgl_qty_m6 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code3681
  CLEAR : wa_yrva_qais_data.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.3686
    w_begda = s_sptag-low.3688
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.3702
    CASE s_sptag-low+4(2).
      WHEN '7'.
*   MONTH 4
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3708
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3714
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3717
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m4.
        ENDIF.
* **EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing for group lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.3749
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3751
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3757
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m4 = wa_yrva_qais_data_temp-grp_lift_qty_m4 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '8'.
*      MONTH 5
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008794
        IF ls_psdq = 'X'.
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m5.
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008794
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3783
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m5.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
              IF ls_psdq = 'X'.
                wa_yrva_qais_data_temp-grp_lift_qty_m5 = wa_yrva_qais_data_temp-grp_lift_qty_m5 +
               wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3827
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3833
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m5 = wa_yrva_qais_data_temp-grp_lift_qty_m5 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.3842
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '9'.
*      month 6
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3850
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***eOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3856
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m6.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.3890
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3892
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V3898
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount3901
                wa_yrva_qais_data_temp-grp_lift_qty_m6 = wa_yrva_qais_data_temp-grp_lift_qty_m6 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code3915
  CLEAR : wa_yrva_qais_data_temp.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code et group lifted quantity
ELSEIF w_q3 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    CASE s_sptag-low+4(2).
      WHEN '10'.
*   MONTH 7
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m7,
        wa_yrva_qais_data-grp_lift_qty_m7.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000008973
            IF ls_psdq = 'X'.
              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
                wa_yrva_qais_data-grp_lift_qty_m7 = wa_yrva_qais_data-grp_lift_qty_m7 +
                               wa_s922-ummenge.
              ENDIF.
            ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000008973
            wa_yrva_qais_data-ind_lift_qty_m7 = wa_yrva_qais_data-ind_lift_qty_m7 +
             wa_s922-ummenge.
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m7 = wa_yrva_qais_data-ind_elgl_qty_m7 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
      WHEN '11'.
*      MONTH 8
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m8, wa_yrva_qais_data-grp_lift_qty_m8.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
*** Soc by Vaishnavi/Pawan Charm : 4000009111
            IF ls_psdq = 'X'.
              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
                wa_yrva_qais_data-grp_lift_qty_m8 = wa_yrva_qais_data-grp_lift_qty_m8 +
                               wa_s922-ummenge.
              ENDIF.
            ENDIF.
*** Eoc by Vaishnavi/Pawan Charm : 4000009111
            wa_yrva_qais_data-ind_lift_qty_m8 = wa_yrva_qais_data-ind_lift_qty_m8 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m8 = wa_yrva_qais_data-ind_elgl_qty_m8 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
      WHEN '12'.
*      month 9
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m9.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'  .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m9 = wa_yrva_qais_data-ind_lift_qty_m9 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m9 = wa_yrva_qais_data-ind_elgl_qty_m9 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.4070
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code
  CLEAR : wa_yrva_qais_data.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.
    w_begda = s_sptag-low.4077
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
    CASE s_sptag-low+4(2).
      WHEN '10'.
*   MONTH 7
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
        IF ls_psdq = 'X'.
**            CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m5." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009020
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m7." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009020
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'. " SOC Commenetd by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4107
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount .
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m7.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'   .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
              IF ls_psdq = 'X'.
                wa_yrva_qais_data_temp-grp_lift_qty_m7 = wa_yrva_qais_data_temp-grp_lift_qty_m7 +
               wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4151
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4157
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m7 = wa_yrva_qais_data_temp-grp_lift_qty_m7 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.4169
      WHEN '11'.
*      MONTH 8
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
**** Soc by Vaishnavi/Pawan Charm : 4000009111
        IF ls_psdq = 'X'.
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m8." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009020
        ENDIF.
**** Eoc by Vaishnavi/Pawan Charm : 4000009111
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4184
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m8.
        ENDIF.4189
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
**soc BY UJJWAL/priyanka on charm 400003180 on 01-12-2020 to exclude some MPG as per indivisul liftted qty
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND  wa_s922-kondm NOT IN range_p.
**                    wa_s922-kondm
**                    NE  '09' AND
**                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
**                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
**                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
**                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
**eoc BY UJJWAL/priyanka on charm 400003180 on 01-12-2020 to exclude some MPG as per indivisul liftted qty
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
**soc BY UJJWAL/priyanka on charm 400003180 on 01-12-2020 to exclude some MPG as per indivisul liftted qty
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
**                    wa_s922-kondm NE  '21' AND
**                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9'AND wa_s922-kondm NE  'K6'.
**eoc BY UJJWAL/priyanka on charm 400003180 on 01-12-2020 to exclude some MPG as per indivisul liftted qty
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4225
*** soc BY vaishnavi/ pawan charm: 4000009111
              IF ls_psdq = 'X'.
                wa_yrva_qais_data_temp-grp_lift_qty_m8 = wa_yrva_qais_data_temp-grp_lift_qty_m8 +
               wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
*** Eoc BY vaishnavi/ pawan charm: 40000091114235
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4241
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m8 = wa_yrva_qais_data_temp-grp_lift_qty_m8 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '12'.
*      month 9
*         **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
        IF r_rlld = 'X'.
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m9.
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m9.
        ENDIF.4271
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
              IF r_rlld = 'X'.
                wa_yrva_qais_data_temp-grp_lift_qty_m9 = wa_yrva_qais_data_temp-grp_lift_qty_m9 +
                        wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4316
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m9 = wa_yrva_qais_data_temp-grp_lift_qty_m9 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code4332
  CLEAR : wa_yrva_qais_data_temp.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code et group lifted quantity
ELSEIF w_q4 = 'X' .
*    get individual lifted quantity
  LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.4338
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.4353
    CASE s_sptag-low+4(2).
      WHEN '1'.4356
*   MONTH 10
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m10.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3'.
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m10 = wa_yrva_qais_data-ind_lift_qty_m10 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m10 = wa_yrva_qais_data-ind_elgl_qty_m10 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
      WHEN '2'.
*      MONTH 11
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m11.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector.
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m11 = wa_yrva_qais_data-ind_lift_qty_m11 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m11 = wa_yrva_qais_data-ind_elgl_qty_m11 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
      WHEN '3'.
*      month 12
        CLEAR: wa_yrva_qais_data-ind_lift_qty_m12.
        IF w_begda LT wa_yrva_qais_data-mou_begda.
          w_begda = wa_yrva_qais_data-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda ANDw_endda
            AND pkunag = wa_yrva_qais_data-kunnr.
*              AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
            IF wa_yrva_qais_data-p_d_sector = 'X'.
              IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                  NE  '09' AND
*                  wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                  AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                  AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                  AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'AND wa_s922-kondm NE  'H3' .
                CONTINUE.
                "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NOT IN range_r.
*                  NE  '21' AND
*                  wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' ANDwa_s922-kondm NE  'K6'.
                CONTINUE.
              ELSEIF wa_yrva_qais_data-p_r_indicator = 'S' AND wa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                CONTINUE.
              ENDIF.
            ENDIF.
            wa_yrva_qais_data-ind_lift_qty_m12 = wa_yrva_qais_data-ind_lift_qty_m12 +
             wa_s922-ummenge .
            IF wa_s922-vtweg = '60'.
              wa_yrva_qais_data-lv_no_dis_qty = wa_yrva_qais_data-lv_no_dis_qty + wa_s922-ummenge.
            ENDIF.
          ENDLOOP.
          wa_yrva_qais_data-ind_elgl_qty_m12 = wa_yrva_qais_data-ind_elgl_qty_m12 - wa_yrva_qais_data-lv_no_dis_qty.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data.
  ENDLOOP.4473
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code
  CLEAR : wa_yrva_qais_data.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code4477
*    get group lifted quantity
  LOOP AT it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp.4480
    w_begda = s_sptag-low.
    CALL FUNCTION 'HR_IN_LAST_DAY_OF_MONTHS'
      EXPORTING
        day_in            = w_begda
      IMPORTING
        last_day_of_month = w_endda
*           EXCEPTIONS
*         DAY_IN_NO_DATE    = 1
*         OTHERS            = 2
      .
    IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*         WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.4495
    CASE s_sptag-low+4(2).
      WHEN '1'.
*   MONTH 10
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4501
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4507
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m10.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2..
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38' AND wa_s922-kondm NE  'H3'  .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4542
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4548
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m10 = wa_yrva_qais_data_temp-grp_lift_qty_m10 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '2'.
*      MONTH 11
*          **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4564
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4570
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m11.
        ENDIF.4575
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4606
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND  C_MAINT NE 'X'." SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4613
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m11 = wa_yrva_qais_data_temp-grp_lift_qty_m11 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
      WHEN '3'.
*      month 12
*         **SOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bugfixing for group lift
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4628
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X' AND C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND c_maint NE 'X' AND c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4634
*          IF r_month1 NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          CLEAR: wa_yrva_qais_data_temp-grp_lift_qty_m12.
        ENDIF.
**EOC by ujjwal/priyanka on 10-10-2019 in charm#400000935 bug fixing forgroup lift
        IF w_begda LT wa_yrva_qais_data_temp-mou_begda.
          w_begda = wa_yrva_qais_data_temp-mou_begda.
        ENDIF.
        IF w_begda LT w_endda.
          LOOP AT it_kunnr INTO wa_kunnr WHERE kvgr2 = wa_yrva_qais_data_temp-kvgr2.
            LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN w_begda AND w_endda
              AND pkunag = wa_kunnr-kunnr
              AND kvgr2 = wa_kunnr-kvgr2.
*       consider only selected material in case of Pipe and ducting sector.
              IF wa_yrva_qais_data_temp-p_d_sector = 'X'.
                IF wa_yrva_qais_data_temp-p_r_indicator = 'P' AND wa_s922-kondm NOT IN range_p.
*                    NE  '09' AND
*                    wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
*                    AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
*                    AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
*                    AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'  AND wa_s922-kondm NE  'H3' .
                  CONTINUE.
                  "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'R' ANDwa_s922-kondm NOT IN range_r.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ELSEIF wa_yrva_qais_data_temp-p_r_indicator = 'S' ANDwa_s922-kondm NOT IN range_s.
*                    NE  '21' AND
*                    wa_s922-kondm NE  '29'AND wa_s922-kondm NE  'H9' AND wa_s922-kondm NE  'K6'.
                  CONTINUE.
                ENDIF.
              ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount4669
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*                IF R_MONTH1 NE 'X'  AND R_RHD NE 'X' AND R_RLLD NE 'X'AND R_RPD NE 'X' AND  C_MAINT NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
              IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_rpd NE 'X' AND  c_maint NE 'X' AND  c_maint1 NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X'AND r_rpd NE 'X'.
*           IF r_month1 NE 'X'AND r_rpd NE 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V4676
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
                wa_yrva_qais_data_temp-grp_lift_qty_m12 = wa_yrva_qais_data_temp-grp_lift_qty_m12 +
                 wa_s922-ummenge .
                IF wa_s922-vtweg = '60'.
                  wa_yrva_qais_data_temp-lv_no_dis_qty = wa_yrva_qais_data_temp-lv_no_dis_qty + wa_s922-ummenge.
                ENDIF.
              ENDIF.
            ENDLOOP.
          ENDLOOP.
        ENDIF.
    ENDCASE.
    MODIFY  it_yrva_qais_data_temp FROM wa_yrva_qais_data_temp.
  ENDLOOP.
****SOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code4691
  CLEAR : wa_yrva_qais_data_temp.
****EOC BY ujjwal & PRIYANKA and madan sir ON 24.07.2019 ; Correcting invalid code et group lifted quantity
ENDIF.
ENDFORM.
*&*
*&      Form  QUARTER_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM quarter_discount .
*    calculate the rate4706
SELECT * INTO TABLE i_a350
  FROM a350 WHERE kappl = 'V'
  AND     kschl = 'ZQIS'   AND
          vkorg =  '5000' AND
          kfrst = ''       AND
          datab LE s_sptag-high AND
datbi GE s_sptag-low.
* Condition Types
IF NOT i_a350[] IS INITIAL.
  SELECT knumh kbetr kstbm
   INTO TABLE i_cond
   FROM konm
   FOR ALL ENTRIES IN i_a350
  WHERE knumh = i_a350-knumh .
ENDIF.
*   get the additional waiver for shortfall grades
IF it_yrva_qais_data[] IS NOT INITIAL.
*      if w_q1 = 'X' .
  SELECT * FROM yrva_qais_add_wv
    INTO TABLE it_yrva_qais_add_wv
    FOR ALL ENTRIES IN it_yrva_qais_data
  WHERE qais_no = it_yrva_qais_data-qais_no.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  SELECT * FROM yrva_revival_fai
    INTO TABLE it_yrva_revival_fai
    FOR ALL ENTRIES IN it_yrva_qais_data
  WHERE qais_no = it_yrva_qais_data-qais_no.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
ENDIF.4736
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
*    IF wa_yrva_qais_data-mou_begda+4(2) NE '02' AND wa_yrva_qais_data-mou_begda+4(2) NE '03'.
  CLEAR: w_month_min,w_month_max,w_quater_min, w_quater_max,
         w_waive_month_1,w_waive_month_2,w_waive_month_3.
*      flag for checking the fulfilment of monthly commitment
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  CLEAR: lv_revival_q, wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  w_flag_month1 = 'X' .
  w_flag_month2 = 'X' .
  w_flag_month3 = 'X'.
  MOVE-CORRESPONDING wa_yrva_mstr_waiver_temp TO wa_yrva_mstr_waiver .4749
  it_data_quater-kunnr = wa_yrva_qais_data-kunnr.
  it_data_quater-kvgr2 = wa_yrva_qais_data-kvgr2.
  it_data_quater-vkbur = wa_yrva_qais_data-vkbur.
  it_data_quater-mou_qty = wa_yrva_qais_data-mou_qty.4754
*    quater 1
  IF w_q1 = 'X' .
    PERFORM q1_discount.
  ELSEIF w_q2 = 'X'.
    PERFORM q2_discount.
  ELSEIF w_q3 = 'X'.
    PERFORM q3_discount.
  ELSEIF w_q4 EQ 'X'.
    PERFORM q4_discount.
  ENDIF.4765
  IF lv_flag123 IS INITIAL.
    it_data_quater-tot_grp_lift_qty = it_data_quater-grp_lift_qty_m1 +it_data_quater-grp_lift_qty_m2
                          + it_data_quater-grp_lift_qty_m3 .
*     value of credit note
    SORT i_cond BY kstbm DESCENDING.
    LOOP AT i_cond WHERE kstbm <= wa_yrva_qais_data-mou_qty . " IT_DATA_QUATER-TOT_ELGL_QTY.
      w_kbetr = i_cond-kbetr.
      it_data_quater-value = it_data_quater-tot_elgl_qty * w_kbetr.
      IF it_data_quater-value LT 0 .
        it_data_quater-value = it_data_quater-value * -1 .
      ENDIF.
      EXIT.
    ENDLOOP.4779
    it_data_quater-remarks = w_remarks.
    CONDENSE it_data_quater-remarks .
    APPEND it_data_quater .
    CLEAR it_data_quater .
    MODIFY it_yrva_qais_data FROM  wa_yrva_qais_data.
*    ENDIF.
    CLEAR: lv_m1, lv_m2, lv_m3,wa_yrva_qais_data.
  ELSE.
    CLEAR: lv_flag123.
  ENDIF.
ENDLOOP.
ENDFORM.
*&*
*&      Form  Q1_DISCOUNT
*&*
*       text
**
*>  p1        text.
*  <p2        text
**
FORM q1_discount .
IF wa_yrva_mstr_waiver-max_perc_q1 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    wa_yrva_mstr_waiver-max_perc_q1 = wa_yrva_mstr_waiver-pd_perc_q1 .
    wa_yrva_mstr_waiver-annual_max = wa_yrva_mstr_waiver-pd_perc_q1.
  ENDIF.
ELSE.
  CLEAR wa_yrva_mstr_waiver-max_perc_q1.
ENDIF.
IF wa_yrva_qais_data-waiver_qty EQ 'Q1' .
  wa_yrva_mstr_waiver-min_perc_q1 = '65'.
ENDIF.4812
***SOUncomment by Adarsh/Archana on Charm: 4000006427 TR:DVRK9A12BV
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Waiver April
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
  WITH KEY qais_no = wa_yrva_qais_data-qais_no
  waiver_month  = 'APR' .
IF sy-subrc EQ  0 .
  w_waive_month_1 = 'X' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Waiver April
***EOUncomment by Adarsh/Archana on Charm: 4000006427 TR:DVRK9A12BV
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
CLEAR : lv_revival_q.
READ TABLE it_yrva_revival_fai INTO wa_yrva_revival_fai
WITH KEY qais_no = wa_yrva_qais_data-qais_no.
IF sy-subrc EQ 0.
  IF s_sptag-low <= '20231001'.
    lv_revival_q = 'X'.
  ENDIF.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'MAY' .
IF sy-subrc EQ  0 .
  w_waive_month_2 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'JUN' .
IF sy-subrc EQ  0 .
  w_waive_month_3 = 'X' .
ENDIF.
* SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000006786
IF w_q1 = 'X' .
  CLEAR w_open_max_flag.
ENDIF.
* EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000006786
IF wa_yrva_qais_data-mou_begda LE s_sptag-low.
  w_quater_min = ( wa_yrva_qais_data-commited_qty_m1 +
               wa_yrva_qais_data-commited_qty_m2 +
               wa_yrva_qais_data-commited_qty_m3  ) * wa_yrva_mstr_waiver-min_perc_q1 / 100 .
  IF wa_yrva_mstr_waiver-max_perc_q1 IS NOT INITIAL.
    w_quater_max = ( wa_yrva_qais_data-commited_qty_m1 +
                               wa_yrva_qais_data-commited_qty_m2 +
                               wa_yrva_qais_data-commited_qty_m3  ) *wa_yrva_mstr_waiver-max_perc_q1 / 100.
  ELSE.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    CLEAR w_open_max_flag.
    w_open_max_flag = 'X'.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
    w_quater_max = ( wa_yrva_qais_data-ind_lift_qty_m1 +
                               wa_yrva_qais_data-ind_lift_qty_m2 +
                               wa_yrva_qais_data-ind_lift_qty_m3  ).
  ENDIF.
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005303 For Q1 * 2.
*******    abhinav change
ELSEIF w_q1 = 'X'.
  w_quater_min = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-min_perc_q1 / 100 .
  w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-max_perc_q1 / 100 .
*******    abhinav change
** SOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006791
*    IF W_Q1 = 'X'.
*      W_QUATER_MAX = ( WA_YRVA_QAIS_DATA-IND_LIFT_QTY_M1 +
*                                   WA_YRVA_QAIS_DATA-IND_LIFT_QTY_M2 +
*                                   WA_YRVA_QAIS_DATA-IND_LIFT_QTY_M3  ).
*    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006791
* SOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006805
  IF w_q1 = 'X' AND w_quater_max IS INITIAL.
* SOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006824
    IF wa_yrva_qais_data-kvgr2 = space.
      w_quater_max = ( wa_yrva_qais_data-ind_lift_qty_m1 +
                                 wa_yrva_qais_data-ind_lift_qty_m2 +
                                 wa_yrva_qais_data-ind_lift_qty_m3  ).
* EOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006824
    ELSE.
      w_quater_max = ( wa_yrva_qais_data-grp_lift_qty_m1 +
                                   wa_yrva_qais_data-grp_lift_qty_m2 +
                                   wa_yrva_qais_data-grp_lift_qty_m3).
    ENDIF.
  ENDIF.
* EOC by Chilukuri Tripura Reddy/Archna/Vishal charm 40000006805
ELSE.
  w_quater_min = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-min_perc_q1 / 100 .
  w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-max_perc_q1 / 100 .4898
  IF w_q1 = 'X'.
*******    abhinav change
    IF wa_yrva_mstr_waiver-max_perc_q1 IS NOT INITIAL.
      w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-max_perc_q1 / 100 .
    ELSE.
      w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3.
    ENDIF.
*******    abhinav change
  ELSE.
    IF wa_yrva_mstr_waiver-max_perc_q1 IS NOT INITIAL.
      w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3  * wa_yrva_mstr_waiver-max_perc_q1 / 100 .
    ELSE.
      w_quater_max = wa_yrva_qais_data-commited_qty_m3  * 3.
    ENDIF.
  ENDIF.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005303 For Q1 * 2.
ENDIF.4916
****SOUncomment by Adarsh/Archana on Charm: 4000006427 TR: DVRK9A12BV
*****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April tonot consider.
PERFORM q1_april.
*****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April tonot consider.
****EOUncomment by Adarsh/Archana on Charm: 4000006427 TR: DVRK9A12BV4922
PERFORM q1_may.
PERFORM q1_june.4925
*      GET THE TOTAL ELIGIBLE QUANTITY OF QUATER
it_data_quater-ind_elgl_qty_m3 = it_data_quater-ind_elgl_qty_m3 - lv_m3.
IF it_data_quater-ind_elgl_qty_m3 < 0.
  it_data_quater-ind_elgl_qty_m3 = 0.
ENDIF.4931
*******SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April to not consider
IF (4934
****SOUncomment by Adarsh/Archana on Charm: 4000006427 TR: DVRK9A12BV
*****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April tonot consider.
  it_data_quater-ind_elgl_qty_m1 IS INITIAL AND w_flag_month1 IS INITIAL AND
    (
  wa_yrva_qais_data-mou_begda+4(4) LT '0430' )
  OR
*****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April tonot consider.
****EOUncomment by Adarsh/Archana on Charm: 4000006427 TR: DVRK9A12BV4943
  it_data_quater-ind_elgl_qty_m2 IS INITIAL AND w_flag_month2 IS INITIAL AND
    (
   wa_yrva_qais_data-mou_begda+4(4) LT '0531' )
  OR
  it_data_quater-ind_elgl_qty_m3 IS INITIAL AND w_flag_month3 IS INITIAL AND
    (
  wa_yrva_qais_data-mou_begda+4(4) LT '0630')   ) .4951
  CLEAR: it_data_quater-tot_elgl_qty .
ELSE.
  w_tot_qty_quater = it_data_quater-grp_lift_qty_m1 + it_data_quater-grp_lift_qty_m2
                      + it_data_quater-grp_lift_qty_m3 .
  IF w_tot_qty_quater GE w_quater_min AND w_tot_qty_quater LE w_quater_max.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
    it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3 ).
  ELSEIF  w_tot_qty_quater GT w_quater_max.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    IF w_open_max_flag = 'X'.
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
    ELSE.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
      it_data_quater-tot_elgl_qty =  ( ( it_data_quater-ind_lift_qty_m1 +
      it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3) / w_tot_qty_quater ) * w_quater_max .
    ENDIF.
  ELSE.
    SELECT SINGLE * FROM  yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv WHERE qais_no EQ wa_yrva_qais_data-qais_no
    AND quarter = lv_q.
    IF sy-subrc NE 0.
      CLEAR: it_data_quater-tot_elgl_qty .
    ELSE.
      it_data_quater-tot_elgl_qty = w_tot_qty_quater.
*Soc by kunal/Priyanka on 11/12/2018 for q1 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
      it_data_quater-tot_elgl_qty = ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 ).
*Eoc by kunal/Priyanka on 11/12/2018 for q1 discount( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    SELECT SINGLE * FROM  yrva_revival_fai INTO wa_yrva_revival_fai
                                           WHERE qais_no EQ wa_yrva_qais_data-qais_no.
    IF sy-subrc = 0.
      it_data_quater-tot_elgl_qty = w_tot_qty_quater.
      it_data_quater-tot_elgl_qty = ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 ).
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  ENDIF.
ENDIF.
*      set the group lifted quantities
wa_yrva_qais_data-grp_lift_qty_m1   = it_data_quater-grp_lift_qty_m1 .
wa_yrva_qais_data-grp_lift_qty_m2   = it_data_quater-grp_lift_qty_m2 .
wa_yrva_qais_data-grp_lift_qty_m3   = it_data_quater-grp_lift_qty_m3 .
ENDFORM.
*&*
*&      Form  Q1_APRIL
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q1_april .
*    month 1
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m1 .
IF wa_yrva_mstr_waiver-max_perc_m1 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m1 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m1 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m1 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'APR' OR wa_yrva_qais_data-waiver_2 ='APR'
  OR wa_yrva_qais_data-waiver_3 = 'APR' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m1 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'APR' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'APR' OR w_waive_month_1 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'APR' OR wa_yrva_mstr_waiver-ms_waiver4 = 'APR'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m1  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m1 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m1.
ENDIF.5040
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m1.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m1.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m1.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m1 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m1,w_flag_month1  .
ELSEIF it_data_quater-grp_lift_qty_m1 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 / it_data_quater-grp_lift_qty_m1 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m1 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m1 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m1 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m1 LE w_month_max .
  it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 /it_data_quater-grp_lift_qty_m1 )
     * it_data_quater-grp_lift_qty_m1 .
ENDIF.
it_data_quater-ind_elgl_qty_m1 = it_data_quater-ind_elgl_qty_m1 - lv_m1.
IF it_data_quater-ind_elgl_qty_m1 < 0.
  it_data_quater-ind_elgl_qty_m1 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q1_MAY
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q1_may .5084
*    month 2
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m2 .
IF wa_yrva_mstr_waiver-max_perc_m2 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m2 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc = wa_yrva_mstr_waiver-pd_perc_m2 / 100.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m2 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'MAY' OR wa_yrva_qais_data-waiver_2 ='MAY'
  OR wa_yrva_qais_data-waiver_3 = 'MAY' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m2 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'MAY' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'MAY' OR w_waive_month_2 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'MAY' OR wa_yrva_mstr_waiver-ms_waiver4 = 'MAY'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m2  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m2 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m2.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m2.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m2.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m2.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m2 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m2,w_flag_month2  .
ELSEIF it_data_quater-grp_lift_qty_m2 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 / it_data_quater-grp_lift_qty_m2 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m2 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m2 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m2 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m2 LE w_month_max .
  it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 /it_data_quater-grp_lift_qty_m2 )
     * it_data_quater-grp_lift_qty_m2 .
ENDIF.
it_data_quater-ind_elgl_qty_m2 = it_data_quater-ind_elgl_qty_m2 - lv_m2.
IF it_data_quater-ind_elgl_qty_m2 < 0.
  it_data_quater-ind_elgl_qty_m2 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q1_JUNE
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q1_june .
*    month 3
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m3 .
IF wa_yrva_mstr_waiver-max_perc_m3 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m3 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc = wa_yrva_mstr_waiver-pd_perc_m3 / 100. " '1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m3 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'JUN' OR wa_yrva_qais_data-waiver_2 ='JUN'
    OR wa_yrva_qais_data-waiver_3 = 'JUN' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m3 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'JUN' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'JUN' OR w_waive_month_3 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'JUN' OR wa_yrva_mstr_waiver-ms_waiver4 = 'JUN'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m3  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m3 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m3.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m3.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m3.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m3.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m3 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m3,w_flag_month3  .
ELSEIF it_data_quater-grp_lift_qty_m3 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL..
      it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 / it_data_quater-grp_lift_qty_m3 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m3 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m3 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m3 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m3 LE w_month_max .
  it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 /it_data_quater-grp_lift_qty_m3 )
     * it_data_quater-grp_lift_qty_m3 .
ENDIF.
ENDFORM.
*&*
*&      Form  Q2_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q2_discount .
IF wa_yrva_mstr_waiver-max_perc_q2 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    wa_yrva_mstr_waiver-max_perc_q2 = wa_yrva_mstr_waiver-pd_perc_q2 .
    wa_yrva_mstr_waiver-annual_max = wa_yrva_mstr_waiver-pd_perc_q2.
  ENDIF.
ELSE.
  CLEAR wa_yrva_mstr_waiver-max_perc_q2.
ENDIF.
IF wa_yrva_qais_data-waiver_qty EQ 'Q2' .
  wa_yrva_mstr_waiver-min_perc_q2 = '65'.
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
  WITH KEY qais_no = wa_yrva_qais_data-qais_no
  waiver_month  = 'JUL' .
IF sy-subrc EQ  0 .
  w_waive_month_1 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'AUG' .
IF sy-subrc EQ  0 .
  w_waive_month_2 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'SEP' .
IF sy-subrc EQ  0 .
  w_waive_month_3 = 'X' .
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_revival_fai INTO wa_yrva_revival_fai
WITH KEY qais_no = wa_yrva_qais_data-qais_no.
IF sy-subrc EQ 0.
  lv_revival_q = 'X' .
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF wa_yrva_qais_data-mou_begda LE s_sptag-low.
  w_quater_min = ( wa_yrva_qais_data-commited_qty_m4 +
                    wa_yrva_qais_data-commited_qty_m5 +
                    wa_yrva_qais_data-commited_qty_m6  ) * wa_yrva_mstr_waiver-min_perc_q2 / 100.
  IF wa_yrva_mstr_waiver-max_perc_q2 IS NOT INITIAL.
    w_quater_max = ( wa_yrva_qais_data-commited_qty_m4 +
                               wa_yrva_qais_data-commited_qty_m5 +
                               wa_yrva_qais_data-commited_qty_m6  ) *wa_yrva_mstr_waiver-max_perc_q2 / 100.
  ELSE.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    CLEAR w_open_max_flag.
    w_open_max_flag = 'X'.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
    w_quater_max = ( wa_yrva_qais_data-ind_lift_qty_m4 +
                               wa_yrva_qais_data-ind_lift_qty_m5 +
                               wa_yrva_qais_data-ind_lift_qty_m6  ).
  ENDIF.
ELSE.
  w_quater_min = wa_yrva_qais_data-commited_qty_m6  * 3  * wa_yrva_mstr_waiver-min_perc_q2 / 100 .
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**    w_quater_min = wa_yrva_qais_data-commited_qty_m6  * 3  * wa_yrva_mstr_waiver-min_perc_q2 / 100 . " '.80'.
*    W_QUATER_MIN = WA_YRVA_QAIS_DATA-COMMITED_QTY_M6  * 2  * WA_YRVA_MSTR_WAIVER-MIN_PERC_Q2 / 100 . " '.80'.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
  IF wa_yrva_mstr_waiver-max_perc_q2 IS NOT INITIAL.
    w_quater_max = wa_yrva_qais_data-commited_qty_m6  * 3  * wa_yrva_mstr_waiver-max_perc_q2 / 100 . " '1.25'.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**      w_quater_max = wa_yrva_qais_data-commited_qty_m6  * 3  * wa_yrva_mstr_waiver-max_perc_q2 / 100 . " '1.25'.
*      W_QUATER_MAX = WA_YRVA_QAIS_DATA-COMMITED_QTY_M6  * 2  * WA_YRVA_MSTR_WAIVER-MAX_PERC_Q2 / 100 . " '1.25'.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
  ELSE.
    w_quater_max = wa_yrva_qais_data-commited_qty_m6  * 3.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**      w_quater_max = wa_yrva_qais_data-commited_qty_m6  * 3.
*      W_QUATER_MAX = WA_YRVA_QAIS_DATA-COMMITED_QTY_M6  * 2.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
  ENDIF.
ENDIF.
PERFORM q2_july.
PERFORM q2_aug.
PERFORM q2_sep.5311
*      GET THE TOTAL ELIGIBLE QUANTITY OF QUATER
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**  IF ( it_data_quater-ind_elgl_qty_m1 IS INITIAL AND w_flag_month1 ISINITIAL AND
**      (
**    wa_yrva_qais_data-mou_begda+4(4) LT '0731')
**    OR
IF
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
    ( it_data_quater-ind_elgl_qty_m1 IS INITIAL AND w_flag_month1 IS INITIAL AND
      (
    wa_yrva_qais_data-mou_begda+4(4) LT '0731')
    OR
    it_data_quater-ind_elgl_qty_m2 IS INITIAL AND w_flag_month2 IS   INITIAL AND
      (
     wa_yrva_qais_data-mou_begda+4(4) LT '0831')
    OR
    it_data_quater-ind_elgl_qty_m3 IS INITIAL AND w_flag_month3 IS INITIAL AND
      (
    wa_yrva_qais_data-mou_begda+4(4) LT '0930')   ) .5331
  CLEAR: it_data_quater-tot_elgl_qty .
ELSE.
  w_tot_qty_quater = it_data_quater-grp_lift_qty_m1 + it_data_quater-grp_lift_qty_m2
                      + it_data_quater-grp_lift_qty_m3 .
  IF w_tot_qty_quater GE w_quater_min AND w_tot_qty_quater LE w_quater_max.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
    it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3 ).
  ELSEIF  w_tot_qty_quater GT w_quater_max.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    IF w_open_max_flag = 'X'.
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
    ELSE.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
      it_data_quater-tot_elgl_qty =  ( ( it_data_quater-ind_lift_qty_m1 +
                                         it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3 ) / w_tot_qty_quater ) * w_quater_max.
    ENDIF.
  ELSE.
    SELECT SINGLE * FROM  yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv WHERE qais_no EQ wa_yrva_qais_data-qais_no
    AND quarter = lv_q.
    IF sy-subrc NE 0.
      CLEAR: it_data_quater-tot_elgl_qty .
    ELSE.
*        it_data_quater-tot_elgl_qty = w_tot_qty_quater.
*Soc by kunal/Priyanka on 20/11/2018 for q2 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
      it_data_quater-tot_elgl_qty = ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 ).
*Eoc by kunal/Priyanka on 20/11/2018 for q2 discount( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
                                          WHERE qais_no EQ wa_yrva_qais_data-qais_no.
    IF sy-subrc = 0.
      it_data_quater-tot_elgl_qty = ( it_data_quater-ind_lift_qty_m1 +
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 ).
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  ENDIF.
ENDIF.
*      Set the group lifted quantities
wa_yrva_qais_data-grp_lift_qty_m4   = it_data_quater-grp_lift_qty_m1 .
wa_yrva_qais_data-grp_lift_qty_m5   = it_data_quater-grp_lift_qty_m2 .
wa_yrva_qais_data-grp_lift_qty_m6   = it_data_quater-grp_lift_qty_m3 .
ENDFORM.
*&*
*&      Form  Q2_JULY
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q2_july .
*    month 4
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m4 .
IF wa_yrva_mstr_waiver-max_perc_m4 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m4 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m4 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m4 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'JUL' OR wa_yrva_qais_data-waiver_2 ='JUL'
   OR wa_yrva_qais_data-waiver_3 = 'JUL' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m4 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'JUL' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'JUL' OR w_waive_month_1 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'JUL' OR wa_yrva_mstr_waiver-ms_waiver4 = 'JUL'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m4  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m4 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m4.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m4.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m4.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m4.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m1 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m1,w_flag_month1  .
ELSEIF it_data_quater-grp_lift_qty_m1 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 / it_data_quater-grp_lift_qty_m1 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m1 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m1 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m1 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m1 LE w_month_max .
  it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 /it_data_quater-grp_lift_qty_m1 )
     * it_data_quater-grp_lift_qty_m1 .
ENDIF.
it_data_quater-ind_elgl_qty_m1 = it_data_quater-ind_elgl_qty_m1 - lv_m1.
IF it_data_quater-ind_elgl_qty_m1 < 0.
  it_data_quater-ind_elgl_qty_m1 = 0.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007230 data:17/10/2023
IF wa_yrva_qais_data-qais_no = '202300000961'.
*   IF IT_DATA_QUATER-KUNNR = '35622'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007247
  IF it_data_quater-kunnr =  '35622' OR it_data_quater-kunnr = '0000035622'.  " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007247
    IF it_data_quater-kvgr2 = 'SIL'.
      it_data_quater-grp_lift_qty_m1 = '1015'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007249
    ENDIF.
  ENDIF.
*     IF IT_DATA_QUATER-KUNNR = '30141'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007247
  IF it_data_quater-kunnr = '30141' OR it_data_quater-kunnr = '0000030141'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007247
    IF it_data_quater-kvgr2 = 'SIL'.
      it_data_quater-grp_lift_qty_m1 = '1015'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007249
      it_data_quater-ind_elgl_qty_m1 = '1015'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007249
      it_data_quater-ind_lift_qty_m1 = '1015'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007249
    ENDIF.
  ENDIF.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007230 data:17/10/2023
ENDFORM.
*&*
*&      Form  Q2_AUG
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q2_aug .
*month 5
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m5 .
IF wa_yrva_mstr_waiver-max_perc_m5 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m5 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m5 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m5 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'AUG' OR wa_yrva_qais_data-waiver_2 ='AUG'
  OR wa_yrva_qais_data-waiver_3 = 'AUG' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m5 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'AUG' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'AUG' OR w_waive_month_2 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'AUG' OR wa_yrva_mstr_waiver-ms_waiver4 = 'AUG'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m5  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m5 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m5.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m5.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m5.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m5.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m2 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m2,w_flag_month2  .
ELSEIF it_data_quater-grp_lift_qty_m2 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 / it_data_quater-grp_lift_qty_m2 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m2 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m2 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m2 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m2 LE w_month_max .
  it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 /it_data_quater-grp_lift_qty_m2 )
     * it_data_quater-grp_lift_qty_m2 .
ENDIF.
it_data_quater-ind_elgl_qty_m2 = it_data_quater-ind_elgl_qty_m2 - lv_m2.
IF it_data_quater-ind_elgl_qty_m2 < 0.
  it_data_quater-ind_elgl_qty_m2 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q2_SEP
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q2_sep .
*    month 6
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m6 .
IF wa_yrva_mstr_waiver-max_perc_m6 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m6 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m6 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m6 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'SEP' OR wa_yrva_qais_data-waiver_2 ='SEP'
  OR wa_yrva_qais_data-waiver_3 = 'SEP' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m6 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'SEP' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'SEP' OR w_waive_month_3 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'SEP' OR wa_yrva_mstr_waiver-ms_waiver4 = 'SEP'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m6  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m6 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m6.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m6.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m6.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m6.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m3 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m3,w_flag_month3  .
ELSEIF it_data_quater-grp_lift_qty_m3 GT w_month_max .
*          SOC by sachin on 17.12.2016 to resolve group company issue
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL..
      it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 / it_data_quater-grp_lift_qty_m3 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m3 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m3 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m3 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m3 LE w_month_max .
  it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 /it_data_quater-grp_lift_qty_m3 )
     * it_data_quater-grp_lift_qty_m3 .
ENDIF.
it_data_quater-ind_elgl_qty_m3 = it_data_quater-ind_elgl_qty_m3 - lv_m3.
IF it_data_quater-ind_elgl_qty_m3 < 0.
  it_data_quater-ind_elgl_qty_m3 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q3_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q3_discount .
IF wa_yrva_mstr_waiver-max_perc_q3 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    wa_yrva_mstr_waiver-max_perc_q3 = wa_yrva_mstr_waiver-pd_perc_q3 .
    wa_yrva_mstr_waiver-annual_max = wa_yrva_mstr_waiver-pd_perc_q3.
  ENDIF.
ELSE.
  CLEAR wa_yrva_mstr_waiver-max_perc_q3.
ENDIF.
IF wa_yrva_qais_data-waiver_qty EQ 'Q3' .
  wa_yrva_mstr_waiver-min_perc_q3 = '65'.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_revival_fai INTO wa_yrva_revival_fai
WITH KEY qais_no = wa_yrva_qais_data-qais_no.
IF sy-subrc EQ 0.
  lv_revival_q = 'X' .
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
  WITH KEY qais_no = wa_yrva_qais_data-qais_no
  waiver_month  = 'OCT' .
IF sy-subrc EQ  0 .
  w_waive_month_1 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'NOV' .
IF sy-subrc EQ  0 .
  w_waive_month_2 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'DEC' .
IF sy-subrc EQ  0 .
  w_waive_month_3 = 'X' .
ENDIF.
IF wa_yrva_qais_data-mou_begda LE s_sptag-low.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
  IF wa_yrva_qais_data-mou_begda+0(6) = '202311'.
    w_quater_min = ( wa_yrva_qais_data-commited_qty_m8 +
                  wa_yrva_qais_data-commited_qty_m9  ) * wa_yrva_mstr_waiver-min_perc_q3 / 100.
  ELSE.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
    w_quater_min = ( wa_yrva_qais_data-commited_qty_m7 +
                      wa_yrva_qais_data-commited_qty_m8 +
                      wa_yrva_qais_data-commited_qty_m9  ) * wa_yrva_mstr_waiver-min_perc_q3 / 100.
  ENDIF. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  IF wa_yrva_qais_data-mou_endda <= '20240331'.
** -> Begin of changes by of Aditi on 05.12.2024 13:02:46 for ATC
*      SELECT SINGLE qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no)
*                         WHERE qais_no = @wa_yrva_qais_data-qais_no.
    SELECT qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no)
                       UP TO 1 ROWS
                       WHERE qais_no = @wa_yrva_qais_data-qais_no
                       ORDER BY PRIMARY KEY.
    ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 13:02:51 for ATC
    IF sy-subrc IS INITIAL AND lv_qais_no IS NOT INITIAL.
      w_quater_min = ( wa_yrva_qais_data-commited_qty_m8 +
                       wa_yrva_qais_data-commited_qty_m9  ) * wa_yrva_mstr_waiver-min_perc_q3 / 100.
    ENDIF.
    CLEAR : lv_qais_no.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  IF wa_yrva_mstr_waiver-max_perc_q3 IS NOT INITIAL.
    w_quater_max = ( wa_yrva_qais_data-commited_qty_m7 +
                               wa_yrva_qais_data-commited_qty_m8 +
                               wa_yrva_qais_data-commited_qty_m9  ) *wa_yrva_mstr_waiver-max_perc_q3 / 100.
  ELSE.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    CLEAR w_open_max_flag.
    w_open_max_flag = 'X'.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
    w_quater_max = ( wa_yrva_qais_data-ind_lift_qty_m7 +
                               wa_yrva_qais_data-ind_lift_qty_m8 +
                               wa_yrva_qais_data-ind_lift_qty_m9  ).
  ENDIF.
ELSE.5714
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
  IF wa_yrva_qais_data-mou_begda+0(6) = '202311'.
    w_quater_min = wa_yrva_qais_data-commited_qty_m9  * 2  * wa_yrva_mstr_waiver-min_perc_q3 / 100 .
  ELSE.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
    w_quater_min = wa_yrva_qais_data-commited_qty_m9  * 3  * wa_yrva_mstr_waiver-min_perc_q3 / 100 . " '.80'.
  ENDIF. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm no 4000007384
  IF wa_yrva_mstr_waiver-max_perc_q3 IS NOT INITIAL.
    w_quater_max = wa_yrva_qais_data-commited_qty_m9  * 3  * wa_yrva_mstr_waiver-max_perc_q3 / 100 . " '1.25'.
  ELSE.
    w_quater_max = wa_yrva_qais_data-commited_qty_m9  * 3.
  ENDIF.
ENDIF.5728
PERFORM q3_oct.
PERFORM q3_nov.
PERFORM q3_dec.5732
*      GET THE TOTAL ELIGIBLE QUANTITY OF QUATER
IF ( it_data_quater-ind_elgl_qty_m1 IS INITIAL AND w_flag_month1 IS INITIAL AND
    (
  wa_yrva_qais_data-mou_begda+4(4) LT '1031' )
   OR
  it_data_quater-ind_elgl_qty_m2 IS INITIAL AND w_flag_month2 IS INITIAL AND
    (
  wa_yrva_qais_data-mou_begda+4(4) LT '1130' )
  OR
  it_data_quater-ind_elgl_qty_m3 IS INITIAL AND w_flag_month3 IS   INITIAL AND
    (
  wa_yrva_qais_data-mou_begda+4(4) LT '1231' )   ) .5745
  CLEAR: it_data_quater-tot_elgl_qty .
ELSE.
  w_tot_qty_quater = it_data_quater-grp_lift_qty_m1 + it_data_quater-grp_lift_qty_m2
                      + it_data_quater-grp_lift_qty_m3 .
  IF w_tot_qty_quater GE w_quater_min AND w_tot_qty_quater LE w_quater_max.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
    it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3 ).
  ELSEIF  w_tot_qty_quater GT w_quater_max.
*SOC by Kunal/Priyanka for open max discounts on 08/04/2019
    IF w_open_max_flag = 'X'.
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
    ELSE.
*EOC by Kunal/Priyanka for open max discounts on 08/04/2019
      it_data_quater-tot_elgl_qty =  ( ( it_data_quater-ind_lift_qty_m1 +
      it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3) / w_tot_qty_quater ) * w_quater_max .
    ENDIF.
  ELSE.
*            CLEAR: it_data_quater-tot_elgl_qty .
    SELECT SINGLE * FROM  yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv WHERE qais_no EQ wa_yrva_qais_data-qais_no
    AND quarter = lv_q.
    IF sy-subrc NE 0.
      CLEAR: it_data_quater-tot_elgl_qty .
    ELSE.
*        it_data_quater-tot_elgl_qty = w_tot_qty_quater.
*Soc by kunal/Priyanka on 21/11/2018 for q3 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
*Eoc by kunal/Priyanka on 21/11/2018 for q2 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
    ENDIF.
  ENDIF.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF s_sptag-low+0(6) < '202404' AND s_sptag-low+0(6) NE '202404'.
  SELECT SINGLE * FROM  yrva_revival_fai INTO wa_yrva_revival_fai
                                         WHERE qais_no EQ wa_yrva_qais_data-qais_no.
  IF sy-subrc = 0.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
  ENDIF.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
** SOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007567
IF wa_yrva_qais_data-qais_no = '202300000935'.
  IF it_data_quater-kunnr =  '35380' OR it_data_quater-kunnr = '0000035380'.
    IF it_data_quater-kvgr2 = 'HPP'.
      it_data_quater-tot_elgl_qty = '2761'.
    ENDIF.
  ENDIF.
ENDIF.
** EOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007567
*      Set the group lifted quantities
wa_yrva_qais_data-grp_lift_qty_m7   = it_data_quater-grp_lift_qty_m1 .
wa_yrva_qais_data-grp_lift_qty_m8   = it_data_quater-grp_lift_qty_m2 .
wa_yrva_qais_data-grp_lift_qty_m9   = it_data_quater-grp_lift_qty_m3 .
ENDFORM.
*&*
*&      Form  Q3_OCT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q3_oct .5811
*    month 7
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m7 .
IF wa_yrva_mstr_waiver-max_perc_m7 IS NOT INITIAL  OR  wa_yrva_mstr_waiver-pd_perc_m7 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m7 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m7 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'OCT' OR wa_yrva_qais_data-waiver_2 ='OCT'
  OR wa_yrva_qais_data-waiver_3 = 'OCT' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m7 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'OCT' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'OCT' OR w_waive_month_1 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'OCT' OR wa_yrva_mstr_waiver-ms_waiver4 = 'OCT'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m7  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m7 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m7.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m7.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m7.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m7.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m1 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m1,w_flag_month1  .
ELSEIF it_data_quater-grp_lift_qty_m1 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 / it_data_quater-grp_lift_qty_m1 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m1 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m1 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m1 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m1 LE w_month_max .
  it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 /it_data_quater-grp_lift_qty_m1 )
     * it_data_quater-grp_lift_qty_m1 .
ENDIF.
it_data_quater-ind_elgl_qty_m1 = it_data_quater-ind_elgl_qty_m1 - lv_m1.
IF it_data_quater-ind_elgl_qty_m1 < 0.
  it_data_quater-ind_elgl_qty_m1 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q3_NOV
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q3_nov .5889
*    month 8
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m8 .
IF wa_yrva_mstr_waiver-max_perc_m8 IS NOT INITIAL OR  wa_yrva_mstr_waiver-pd_perc_m8 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m8 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m8 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'NOV' OR wa_yrva_qais_data-waiver_2 ='NOV'
  OR wa_yrva_qais_data-waiver_3 = 'NOV' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m8 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'NOV' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'NOV' OR w_waive_month_2 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'NOV' OR wa_yrva_mstr_waiver-ms_waiver4 = 'NOV'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m8  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m8 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m8.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m8.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m8.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m8.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m2 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m2,w_flag_month2  .
ELSEIF it_data_quater-grp_lift_qty_m2 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 / it_data_quater-grp_lift_qty_m2 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m2 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m2 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m2 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m2 LE w_month_max .
  it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 /it_data_quater-grp_lift_qty_m2 )
     * it_data_quater-grp_lift_qty_m2 .
ENDIF.
it_data_quater-ind_elgl_qty_m2 = it_data_quater-ind_elgl_qty_m2 - lv_m2.
IF it_data_quater-ind_elgl_qty_m2 < 0.
  it_data_quater-ind_elgl_qty_m2 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q3_DEC
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q3_dec .
*    month 9
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m9 .
IF wa_yrva_mstr_waiver-max_perc_m9 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m9 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m9 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m9 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'DEC' OR wa_yrva_qais_data-waiver_2 ='DEC'
  OR wa_yrva_qais_data-waiver_3 = 'DEC' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m9 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'DEC' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'DEC' OR w_waive_month_3 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'DEC' OR wa_yrva_mstr_waiver-ms_waiver4 = 'DEC'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m9  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m9 * w_month_max_perc. "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m9.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m9.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m9.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m9.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m3 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m3,w_flag_month3  .
ELSEIF it_data_quater-grp_lift_qty_m3 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL..
      it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 / it_data_quater-grp_lift_qty_m3 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m3 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m3 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m3 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m3 LE w_month_max .
  it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 /it_data_quater-grp_lift_qty_m3 )
     * it_data_quater-grp_lift_qty_m3 .
ENDIF.
it_data_quater-ind_elgl_qty_m3 = it_data_quater-ind_elgl_qty_m3 - lv_m3.
IF it_data_quater-ind_elgl_qty_m3 < 0.
  it_data_quater-ind_elgl_qty_m3 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q4_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q4_discount .6044
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter and Annual not allowed from Feb and March.
IF wa_yrva_qais_data-mou_begda GE '20240201'.
  lv_flag123 = 'X'.
  EXIT.
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter and Annual not allowed from Feb and March.605260536054
IF wa_yrva_mstr_waiver-max_perc_q4 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    wa_yrva_mstr_waiver-max_perc_q4 = wa_yrva_mstr_waiver-pd_perc_q4 .
    wa_yrva_mstr_waiver-annual_max = wa_yrva_mstr_waiver-pd_perc_q4.
  ENDIF.
ELSE.
  CLEAR wa_yrva_mstr_waiver-max_perc_q4.
ENDIF.
IF wa_yrva_qais_data-waiver_qty EQ 'Q4' .
  wa_yrva_mstr_waiver-min_perc_q4 = '65'.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_revival_fai INTO wa_yrva_revival_fai
WITH KEY qais_no = wa_yrva_qais_data-qais_no.
IF sy-subrc EQ 0.
  lv_revival_q = 'X' .
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
  WITH KEY qais_no = wa_yrva_qais_data-qais_no
  waiver_month  = 'JAN' .
IF sy-subrc EQ  0 .
  w_waive_month_1 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'FEB' .
IF sy-subrc EQ  0 .
  w_waive_month_2 = 'X' .
ENDIF.
READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
 WITH KEY qais_no = wa_yrva_qais_data-qais_no
 waiver_month  = 'MAR' .
IF sy-subrc EQ  0 .
  w_waive_month_3 = 'X' .
ENDIF.
IF wa_yrva_qais_data-mou_begda LE s_sptag-low.
  w_quater_min = ( wa_yrva_qais_data-commited_qty_m10 +
                    wa_yrva_qais_data-commited_qty_m11 +
                    wa_yrva_qais_data-commited_qty_m12  ) * wa_yrva_mstr_waiver-min_perc_q4 / 100.
  IF wa_yrva_mstr_waiver-max_perc_q4 IS NOT INITIAL.
    w_quater_max = ( wa_yrva_qais_data-commited_qty_m10 +
                               wa_yrva_qais_data-commited_qty_m11 +
                               wa_yrva_qais_data-commited_qty_m12  ) *wa_yrva_mstr_waiver-max_perc_q4 / 100.
  ELSE.
*SOC by Kunal/Priyanka for open max discounts on 05/04/2019
    CLEAR w_open_max_flag.
    w_open_max_flag = 'X'.
*EOC by Kunal/Priyanka for open max discounts on 05/04/2019
    w_quater_max = ( wa_yrva_qais_data-ind_lift_qty_m10 +
                               wa_yrva_qais_data-ind_lift_qty_m11 +
                               wa_yrva_qais_data-ind_lift_qty_m12  ).
  ENDIF.
ELSE.6109
  w_quater_min = wa_yrva_qais_data-commited_qty_m12  * 3  * wa_yrva_mstr_waiver-min_perc_q4 / 100 . " '.80'.
  IF wa_yrva_mstr_waiver-max_perc_q4 IS NOT INITIAL.
    w_quater_max = wa_yrva_qais_data-commited_qty_m12  * 3  * wa_yrva_mstr_waiver-max_perc_q4 / 100 . " '1.25'.
  ELSE.
    w_quater_max = wa_yrva_qais_data-commited_qty_m12  * 3.
  ENDIF.
ENDIF.6117
PERFORM q4_jan.
PERFORM q4_feb.
PERFORM q4_mar.61216122
*      GET THE TOTAL ELIGIBLE QUANTITY OF QUATER
IF ( it_data_quater-ind_elgl_qty_m1 IS INITIAL AND w_flag_month1 IS INITIAL
  OR
  it_data_quater-ind_elgl_qty_m2 IS INITIAL AND w_flag_month2 IS INITIAL
  OR
  it_data_quater-ind_elgl_qty_m3 IS INITIAL AND  w_flag_month3 IS INITIAL
   ) .
  CLEAR: it_data_quater-tot_elgl_qty .
ELSE.
  w_tot_qty_quater = it_data_quater-grp_lift_qty_m1 + it_data_quater-grp_lift_qty_m2
                      + it_data_quater-grp_lift_qty_m3 .
*SOC by Kunal/Priyanka for open max discounts on 05/04/2019
*    w_open_max_value  = ( wa_yrva_qais_data-ind_lift_qty_m10 +
*                                 wa_yrva_qais_data-ind_lift_qty_m11 +
*                                 wa_yrva_qais_data-ind_lift_qty_m12  ).
*EOC by Kunal/Priyanka for open max discounts on 05/04/2019
  IF w_tot_qty_quater GE w_quater_min AND w_tot_qty_quater LE w_quater_max.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
    it_data_quater-ind_lift_qty_m2 + it_data_quater-ind_lift_qty_m3 ).
  ELSEIF  w_tot_qty_quater GT w_quater_max.
*SOC by Kunal/Priyanka for open max discounts on 05/04/2019
    IF w_open_max_flag = 'X'.
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
    ELSE.
*EOC by Kunal/Priyanka for open max discounts on 05/04/2019
      it_data_quater-tot_elgl_qty =  ( ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 ) / w_tot_qty_quater ) * w_quater_max .
    ENDIF.
  ELSE.
    SELECT SINGLE * FROM  yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv WHERE qais_no EQ wa_yrva_qais_data-qais_no
    AND quarter = lv_q.
    IF sy-subrc NE 0.
      CLEAR: it_data_quater-tot_elgl_qty .
    ELSE.
*        it_data_quater-tot_elgl_qty = w_tot_qty_quater.
*SOC by kunal/Priyanka on 21/11/2018 for q4 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
      it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1+
                                      it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
*EOC by kunal/Priyanka on 21/11/2018 for q4 discount ( Commented the above line as per requirement and total quan will be the sum of indiviual qtyies of m1, m2, m3).
    ENDIF.
  ENDIF.
ENDIF.
IF s_sptag-low+0(6) < '202404' AND s_sptag-low+0(6) NE '202404'.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
                                         WHERE qais_no EQ wa_yrva_qais_data-qais_no.
  IF sy-subrc = 0.
    it_data_quater-tot_elgl_qty =  ( it_data_quater-ind_lift_qty_m1 +
                                     it_data_quater-ind_lift_qty_m2 +it_data_quater-ind_lift_qty_m3 )  .
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
ENDIF.
*      Set the group lifted quantities
wa_yrva_qais_data-grp_lift_qty_m10   = it_data_quater-grp_lift_qty_m1.
wa_yrva_qais_data-grp_lift_qty_m11   = it_data_quater-grp_lift_qty_m2.
wa_yrva_qais_data-grp_lift_qty_m12   = it_data_quater-grp_lift_qty_m3.
ENDFORM.
*&*
*&      Form  Q4_JAN
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q4_jan .
*    month 10
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m10 .
IF wa_yrva_mstr_waiver-max_perc_m10 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m10 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m10 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m10 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'JAN' OR wa_yrva_qais_data-waiver_2 ='JAN'
  OR wa_yrva_qais_data-waiver_3 = 'JAN' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m10 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'JAN' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'JAN' OR w_waive_month_1 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'JAN' OR wa_yrva_mstr_waiver-ms_waiver4 = 'JAN'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m10  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m10 * w_month_max_perc . "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m10.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m10.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m1 = wa_yrva_qais_data_temp-grp_lift_qty_m10.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m1 = wa_yrva_qais_data-ind_lift_qty_m10.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m1 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m1,w_flag_month1  .
ELSEIF it_data_quater-grp_lift_qty_m1 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 / it_data_quater-grp_lift_qty_m1 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m1 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m1 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m1 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m1 LE w_month_max .
  it_data_quater-ind_elgl_qty_m1 = ( it_data_quater-ind_lift_qty_m1 /it_data_quater-grp_lift_qty_m1 )
     * it_data_quater-grp_lift_qty_m1 .
ENDIF.
it_data_quater-ind_elgl_qty_m1 = it_data_quater-ind_elgl_qty_m1 - lv_m1.
IF it_data_quater-ind_elgl_qty_m1 < 0.
  it_data_quater-ind_elgl_qty_m1 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q4_FEB
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q4_feb .
*    month 11
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m11 .
IF wa_yrva_mstr_waiver-max_perc_m11 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m11 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m11 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m11 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'FEB' OR wa_yrva_qais_data-waiver_2 ='FEB'
  OR wa_yrva_qais_data-waiver_3 = 'FEB' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m11 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'FEB' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'FEB' OR w_waive_month_2 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'FEB' OR wa_yrva_mstr_waiver-ms_waiver4 = 'FEB'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m11  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m11 * w_month_max_perc . "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m11.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m11.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m2 = wa_yrva_qais_data_temp-grp_lift_qty_m11.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m2 = wa_yrva_qais_data-ind_lift_qty_m11.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m2 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m2,w_flag_month2  .
ELSEIF it_data_quater-grp_lift_qty_m2 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL.
      it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 / it_data_quater-grp_lift_qty_m2 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m2 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m2 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m2 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m2 LE w_month_max .
  it_data_quater-ind_elgl_qty_m2 = ( it_data_quater-ind_lift_qty_m2 /it_data_quater-grp_lift_qty_m2 )
     * it_data_quater-grp_lift_qty_m2 .
ENDIF.
it_data_quater-ind_elgl_qty_m2 = it_data_quater-ind_elgl_qty_m2 - lv_m2.
IF it_data_quater-ind_elgl_qty_m2 < 0.
  it_data_quater-ind_elgl_qty_m2 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  Q4_MAR
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM q4_mar .
*    month 12
CLEAR: w_month_max_perc.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m12 .
IF wa_yrva_mstr_waiver-max_perc_m12 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m12 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m12 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m12 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = 'MAR' OR wa_yrva_qais_data-waiver_2 ='MAR'
  OR wa_yrva_qais_data-waiver_3 = 'MAR' .
  w_month_min  =  wa_yrva_qais_data-commited_qty_m12 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = 'MAR' OR
    wa_yrva_mstr_waiver-ms_waiver2 = 'MAR' OR w_waive_month_3 = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = 'MAR' OR wa_yrva_mstr_waiver-ms_waiver4 = 'MAR'.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m12  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_q = 'X'.
  w_month_min  =  0.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF w_month_max_perc  IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m12 * w_month_max_perc . "'1.25' .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m12.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m12.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_quater-grp_lift_qty_m3 = wa_yrva_qais_data_temp-grp_lift_qty_m12.
  ENDIF.
ENDIF.
it_data_quater-ind_lift_qty_m3 = wa_yrva_qais_data-ind_lift_qty_m12.
*      calculate the discount
IF it_data_quater-grp_lift_qty_m3 LT w_month_min .
  CLEAR: it_data_quater-ind_elgl_qty_m3,w_flag_month3  .
ELSEIF it_data_quater-grp_lift_qty_m3 GT w_month_max .
  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
    IF w_month_max_perc IS NOT INITIAL..
      it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 / it_data_quater-grp_lift_qty_m3 )
         * w_month_max .
    ELSE.
      it_data_quater-ind_elgl_qty_m3 =  w_month_max.
    ENDIF.
  ELSE.
    it_data_quater-ind_elgl_qty_m3 =  w_month_max.
  ENDIF.
ELSEIF it_data_quater-grp_lift_qty_m3 GE w_month_min     AND
       it_data_quater-grp_lift_qty_m3 LE w_month_max .
  it_data_quater-ind_elgl_qty_m3 = ( it_data_quater-ind_lift_qty_m3 /it_data_quater-grp_lift_qty_m3 )
     * it_data_quater-grp_lift_qty_m3 .
ENDIF.
it_data_quater-ind_elgl_qty_m3 = it_data_quater-ind_elgl_qty_m3 - lv_m3.
IF it_data_quater-ind_elgl_qty_m3 < 0.
  it_data_quater-ind_elgl_qty_m3 = 0.
ENDIF.
ENDFORM.
*&*
*&      Form  ANNUAL_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM annual_discount .
DATA  lv_fact_pro_annual TYPE p DECIMALS 3.
*    calculate the rate
IF it_yrva_qais_data IS NOT INITIAL.
  REFRESH it_yrva_qais_data_m.
  SELECT * FROM yrva_qais_data_m INTO TABLE it_yrva_qais_data_m FOR ALL ENTRIES IN it_yrva_qais_data WHERE qais_no = it_yrva_qais_data-qais_no.
ENDIF.
SELECT * INTO TABLE i_a350
  FROM a350 WHERE kappl = 'V'
  AND     kschl = 'ZAIS'   AND
          vkorg =  '5000' AND
          kfrst = ''       AND
          datab LE s_sptag-high AND
datbi GE s_sptag-low.
* Condition Types
IF NOT i_a350[] IS INITIAL.
  SELECT knumh kbetr kstbm
   INTO TABLE i_cond
   FROM konm
   FOR ALL ENTRIES IN i_a350
  WHERE knumh = i_a350-knumh .
ENDIF.
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
*    IF wa_yrva_qais_data-mou_begda+4(2) NE '02' AND wa_yrva_qais_data-mou_begda+4(2) NE '03'.
  CLEAR: w_year_min, w_year_max.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009468
  DATA: lv_prev TYPE blnpz.
  CLEAR: lv_prev.
  IF wa_yrva_qais_data-p_sc_indicator NE 'S'.
    IF wa_yrva_qais_data-waiver_1 = 'MAR' OR wa_yrva_qais_data-waiver_2 = 'MAR'.
      lv_prev = wa_yrva_mstr_waiver-annual_max.
      wa_yrva_mstr_waiver-annual_max = 125.
    ENDIF.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009468
  w_year_min = wa_yrva_qais_data-mou_qty * wa_yrva_mstr_waiver-annual_min / 100 .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  IF wa_yrva_qais_data-mou_endda = '20240331'.
** -> Begin of changes by of Aditi on 05.12.2024 13:00:02 for ATC
*      SELECT SINGLE qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no)
*                           WHERE qais_no = @wa_yrva_qais_data-qais_no.
    SELECT qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no)
                         UP TO 1 ROWS
                         WHERE qais_no = @wa_yrva_qais_data-qais_no
                         ORDER BY PRIMARY KEY.
    ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 13:00:07 for ATC
    IF sy-subrc IS INITIAL AND lv_qais_no IS NOT INITIAL.
      w_year_min = 0.
    ENDIF.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  IF wa_yrva_qais_data-p_d_sector = 'X'.
*SOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    IF wa_yrva_mstr_waiver-pd_roto_max IS INITIAL.
      lv_pd_annual_max_flag = 'X'.
    ELSE.
      w_year_max = wa_yrva_qais_data-mou_qty * ( wa_yrva_mstr_waiver-pd_roto_max / 100 ).
    ENDIF.
*EOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
  ELSE.
*SOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    IF wa_yrva_mstr_waiver-annual_max IS INITIAL.
      lv_annual_max_flag = 'X'.
    ELSE.
      w_year_max = wa_yrva_qais_data-mou_qty * wa_yrva_mstr_waiver-annual_max / 100 .
    ENDIF.
*EOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
  ENDIF.
  it_data_annual-kunnr = wa_yrva_qais_data-kunnr.
  it_data_annual-kvgr2 = wa_yrva_qais_data-kvgr2.
  it_data_annual-vkbur = wa_yrva_qais_data-vkbur.
  it_data_annual-mou_qty = wa_yrva_qais_data-mou_qty.
  it_data_annual-waiver_1 = wa_yrva_qais_data-waiver_1 .
  it_data_annual-waiver_2 = wa_yrva_qais_data-waiver_2 .
  it_data_annual-waiver_3 = wa_yrva_qais_data-waiver_3 .
  IF lv_siml EQ 'X'.
    LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN s_sptag-low AND s_sptag-high
      AND pkunag = wa_yrva_qais_data-kunnr
      AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
      IF wa_yrva_qais_data-p_d_sector = 'X'.
        IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NE'09' AND
          wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
          AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
          AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
          AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'   .
          CONTINUE.
          "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on 13/02/2018  for r36u050u a>mpg k6
        ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondmNE  '21' AND
          wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'K6'.
          CONTINUE.
        ENDIF.
      ENDIF.
      it_data_annual-ind_lift_qty = it_data_annual-ind_lift_qty +
       wa_s922-ummenge .
    ENDLOOP.
    IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN s_sptag-low ANDs_sptag-high
*              AND pkunag = wa_yrva_qais_data-kunnr
       AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NE  '09' AND
            wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
            AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
            AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
            AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'   .
            CONTINUE.
            "Added ( AND wa_s922-kondm NE  'K6' ) by Kunal/Priyanka on13/02/2018  for r36u050u a>mpg k6
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NE  '21' AND
            wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ENDIF.
        ENDIF.
        it_data_annual-grp_lift_qty = it_data_annual-grp_lift_qty +
         wa_s922-ummenge .
      ENDLOOP.
    ELSE.
      it_data_annual-grp_lift_qty = it_data_annual-ind_lift_qty.
    ENDIF.
  ELSE.
    it_data_annual-grp_lift_qty = wa_yrva_qais_data-grp_lift_qty_m1 +wa_yrva_qais_data-grp_lift_qty_m2 +
                                  wa_yrva_qais_data-grp_lift_qty_m3 +wa_yrva_qais_data-grp_lift_qty_m4 +
                                  wa_yrva_qais_data-grp_lift_qty_m5 +wa_yrva_qais_data-grp_lift_qty_m6 +
                                  wa_yrva_qais_data-grp_lift_qty_m7 +wa_yrva_qais_data-grp_lift_qty_m8 +
                                  wa_yrva_qais_data-grp_lift_qty_m9 +wa_yrva_qais_data-grp_lift_qty_m10 +
                                  wa_yrva_qais_data-grp_lift_qty_m11 +wa_yrva_qais_data-grp_lift_qty_m12 .6548
    it_data_annual-ind_lift_qty = wa_yrva_qais_data-ind_lift_qty_m1 +wa_yrva_qais_data-ind_lift_qty_m2 +
                                  wa_yrva_qais_data-ind_lift_qty_m3 +wa_yrva_qais_data-ind_lift_qty_m4 +
                                  wa_yrva_qais_data-ind_lift_qty_m5 +wa_yrva_qais_data-ind_lift_qty_m6 +
                                  wa_yrva_qais_data-ind_lift_qty_m7 +wa_yrva_qais_data-ind_lift_qty_m8 +
                                  wa_yrva_qais_data-ind_lift_qty_m9 +wa_yrva_qais_data-ind_lift_qty_m10 +
                                  wa_yrva_qais_data-ind_lift_qty_m11 +wa_yrva_qais_data-ind_lift_qty_m12 .
  ENDIF.6556
  IF it_data_annual-grp_lift_qty GT w_year_max .
*SOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    IF ( lv_pd_annual_max_flag = 'X' OR lv_annual_max_flag = 'X' ) ANDit_data_annual-grp_lift_qty GE w_year_min."Added by Kunal/Priyanka on 16/04/2019
      it_data_annual-tot_elgl_qty = ( it_data_annual-ind_lift_qty / it_data_annual-grp_lift_qty )
                                     * it_data_annual-grp_lift_qty .
*EOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    ELSE.
      it_data_annual-tot_elgl_qty = ( it_data_annual-ind_lift_qty / it_data_annual-grp_lift_qty )
                                     * w_year_max .
    ENDIF.
  ELSEIF it_data_annual-grp_lift_qty GE w_year_min   AND
         it_data_annual-grp_lift_qty LE w_year_max .
    it_data_annual-tot_elgl_qty = ( it_data_annual-ind_lift_qty / it_data_annual-grp_lift_qty )
       * it_data_annual-grp_lift_qty .
  ELSE.
    CLEAR it_data_annual-tot_elgl_qty.
  ENDIF.
*    calculate loyality discount
*      W_90_MOU_QTY = '.85' * IT_DATA_ANNUAL-MOU_QTY .
  w_90_mou_qty =  it_data_annual-mou_qty .
*Begin of change for commenting loyality discount on 26.04.2016
*      IF it_data_annual-tot_elgl_qty IS NOT INITIAL AND
*        wa_yrva_qais_data-waiver_1 IS INITIAL AND wa_yrva_qais_data-waiver_2 IS INITIAL
*        AND wa_yrva_qais_data-waiver_3 IS INITIAL .
**        IF IT_DATA_ANNUAL-GRP_LIFT_QTY GE W_90_MOU_QTY .
*        IF it_data_annual-grp_lift_qty GE it_data_annual-mou_qty .
*          it_data_annual-loyal_discount = it_data_annual-tot_elgl_qty *100  .
*        ELSE.
  CLEAR: it_data_annual-loyal_discount, wa_yrva_qais_data_m.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*consistency check discount by suyash goyal.
***      READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m WITH KEY qais_no = wa_yrva_qais_data-qais_no.
***      IF sy-subrc EQ 0.
***        IF wa_yrva_qais_data_m-mon_so_m12 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m11 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m10 IS NOT INITIAL
***          AND wa_yrva_qais_data_m-mon_so_m9 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m8 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m7 IS NOT INITIAL
***          AND wa_yrva_qais_data_m-mon_so_m6 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m5 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m4 IS NOT INITIAL
***          AND wa_yrva_qais_data_m-mon_so_m3 IS NOT INITIAL.
***
***          it_data_annual-loyal_discount = it_data_annual-tot_elgl_qty* 300  .
***
***        ELSEIF wa_yrva_qais_data_m-mon_so_m12 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m11 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m10 IS NOT INITIAL
***          AND wa_yrva_qais_data_m-mon_so_m9 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m8 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m7 IS NOT INITIAL.
***
***          it_data_annual-loyal_discount = it_data_annual-tot_elgl_qty* 200  .
***
***        ELSEIF wa_yrva_qais_data_m-mon_so_m12 IS NOT INITIAL AND wa_yrva_qais_data_m-mon_so_m11 IS NOT INITIAL  AND wa_yrva_qais_data_m-mon_so_m10 IS NOT INITIAL.
***
***          it_data_annual-loyal_discount = it_data_annual-tot_elgl_qty* 100  .
***
***        ENDIF.
***      ENDIF.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
*        ENDIF.
*      ENDIF.
*End of change for commenting loyality discount on 26.04.2016
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007957
  IF wa_yrva_qais_data-mou_endda = '20240331'.
    CLEAR : lv_qais_no.
** -> Begin of changes by of Aditi on 05.12.2024 12:59:13 for ATC
*      SELECT SINGLE qais_no FROM yrva_revival_fai INTO lv_qais_no
*                            WHERE qais_no = wa_yrva_qais_data-qais_no.
    SELECT qais_no FROM yrva_revival_fai INTO lv_qais_no
                          UP TO 1 ROWS
                          WHERE qais_no = wa_yrva_qais_data-qais_no
                          ORDER BY PRIMARY KEY.
    ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 12:59:17 for ATC
    IF sy-subrc = 0 AND lv_qais_no IS NOT INITIAL.
      CLEAR : lv_revival_a.
      lv_revival_a = 'X'.
    ENDIF.
  ENDIF.
  CLEAR : lv_qais_no.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007957
*     value of credit note
  SORT i_cond BY kstbm DESCENDING.
  LOOP AT i_cond WHERE kstbm <= it_data_annual-mou_qty . "IT_DATA_ANNUAL-TOT_ELGL_QTY.
    lv_fact_pro_annual  = ( it_data_annual-grp_lift_qty  / it_data_annual-mou_qty ) * 100.
    IF lv_fact_pro_annual GE 100.
      w_kbetr = i_cond-kbetr.
    ELSEIF lv_fact_pro_annual GE wa_yrva_mstr_waiver-annual_min OR lv_revival_a = 'X'.
      w_kbetr = (  i_cond-kbetr * lv_fact_pro_annual ) / 100.
    ENDIF.
    it_data_annual-value = it_data_annual-tot_elgl_qty * w_kbetr.
*        ENDIF.
    IF it_data_annual-value LT 0 .
      it_data_annual-value = it_data_annual-value * -1 .
    ENDIF.
    EXIT.
  ENDLOOP.
*Begin of change for commenting loyality discount on 26.04.2016
*     loyality discount
*      IF it_data_annual-loyal_discount GT 0 .
*        CONCATENATE w_remarks '& Loyality Discount' INTO it_data_annual-remarks.
*      ELSE.
  it_data_annual-remarks = w_remarks.
*      ENDIF.
*End of change for commenting loyality discount on 26.04.2016
  CONDENSE it_data_annual-remarks .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009468
  IF wa_yrva_qais_data-mou_begda+4(2) NE '02' AND wa_yrva_qais_data-mou_begda+4(2) NE '03'.
    APPEND it_data_annual.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009468
  CLEAR: it_data_annual.
*    ENDIF.
  CLEAR : wa_yrva_qais_data.
  IF lv_prev IS NOT INITIAL.
    wa_yrva_mstr_waiver-annual_max = lv_prev.
  ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  CLEAR : lv_qais_no, lv_revival_a.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
ENDLOOP.
ENDFORM.
*&*
*&      Form  MONTHLY_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM monthly_discount .
CLEAR lv_mth.
CASE s_sptag-low+4(2).
  WHEN '1'.
    lv_mth = 'JAN'.
  WHEN '2'.
    lv_mth = 'FEB'.
  WHEN '3'.
    lv_mth = 'MAR'.
  WHEN '4'.
    lv_mth = 'APR'.
  WHEN '5'.
    lv_mth = 'MAY'.
  WHEN '6'.
    lv_mth = 'JUN'.
  WHEN '7'.
    lv_mth = 'JUL'.
  WHEN '8'.
    lv_mth = 'AUG'.
  WHEN '9'.
    lv_mth = 'SEP'.
  WHEN '10'.
    lv_mth = 'OCT'.
  WHEN '11'.
    lv_mth = 'NOV'.
  WHEN '12'.
    lv_mth = 'DEC'.
  WHEN OTHERS.
ENDCASE.
IF r_month EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE kappl = 'V'
       AND     kschl = 'ZMIS'   AND
               vkorg =  '5000' AND
               kfrst = ''       AND
               datab LE s_sptag-high AND
  datbi GE s_sptag-low.
ENDIF.
IF r_month1 EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE kappl = 'V'
       AND     kschl = 'ZAMS'   AND
               vkorg =  '5000' AND
               kfrst = ''       AND
               datab LE s_sptag-high AND
  datbi GE s_sptag-low.
ENDIF.6727
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
IF c_maint EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE kappl = 'V'
**         AND     kschl = 'ZP21'   AND " SOC Commenetd by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
       AND     kschl = 'PE32'   AND " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
               vkorg =  '5000' AND
               kfrst = ''       AND
               datab LE s_sptag-high AND
  datbi GE s_sptag-low.
ENDIF.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
IF c_maint1 EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE   kappl  = 'V'
                 AND     kschl  = 'PE31'   AND
                         vkorg  = '5000'   AND
                         kfrst  = ''       AND
                         datab  LE s_sptag-high AND
                         datbi  GE s_sptag-low.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
IF r_rhd EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE kappl = 'V'
       AND     kschl = 'PE07'   AND
               vkorg =  '5000' AND
               kfrst = ''       AND
               datab LE s_sptag-high AND
  datbi GE s_sptag-low.
ENDIF.
IF r_rlld EQ 'X'.
  SELECT * INTO TABLE i_a350
       FROM a350 WHERE kappl = 'V'
       AND     kschl = 'PE08'   AND
               vkorg =  '5000' AND
               kfrst = ''       AND
               datab LE s_sptag-high AND
  datbi GE s_sptag-low.
ENDIF.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
* Condition Types
IF NOT i_a350[] IS INITIAL.
  SELECT knumh kbetr kstbm
   INTO TABLE i_cond
   FROM konm
   FOR ALL ENTRIES IN i_a350
  WHERE knumh = i_a350-knumh .
ENDIF.
*   get the additional waiver for shortfall grades
IF it_yrva_qais_data[] IS NOT INITIAL.
*      if w_q1 = 'X' .
  SELECT * FROM yrva_qais_add_wv
    INTO TABLE it_yrva_qais_add_wv
    FOR ALL ENTRIES IN it_yrva_qais_data
  WHERE qais_no = it_yrva_qais_data-qais_no.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  SELECT * FROM yrva_revival_fai
    INTO TABLE it_yrva_revival_fai
    FOR ALL ENTRIES IN it_yrva_qais_data
  WHERE qais_no = it_yrva_qais_data-qais_no.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
ELSE.
  IF c_chk IS NOT INITIAL.   "CHARM #4000000388
    EXIT.
  ELSE.
    MESSAGE 'List Contains No Records' TYPE 'E'.
  ENDIF.
ENDIF.
*SOC by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
IF s_sptag-low+4(2) = '4'.
*             data(lv_year) = S_SPTAG-LOW+0(4).
*             lv_year       = lv_year - 1.
  DATA: lv_curr_year            TYPE char10,
        lv_prev_year            TYPE t009b-bdatj,
        lv_newbegda             TYPE datum,
        lv_newendda             TYPE datum,
        it_yrva_qais_data_new   TYPE STANDARD TABLE OF yrva_qais_data,
        it_yrva_qais_data_m_new TYPE STANDARD TABLE OF yrva_qais_data_m.
  CLEAR: lv_curr_year, lv_prev_year .
  CALL FUNCTION 'HR_IN_GET_DATE_COMPONENTS'
    EXPORTING
      idate                         = s_sptag-low
    IMPORTING
*       DAY                           =
*       MONTH                         =
      year                          = lv_curr_year
*       STEXT                         =
*       LTEXT                         =
*       USERDATE                      =
    EXCEPTIONS
      input_date_is_initial         = 1
      text_for_month_not_maintained = 2
      OTHERS                        = 3.
  lv_prev_year       = lv_curr_year - 1.
  CONDENSE lv_prev_year.
*  CONCATENATE '0104' lv_prev_year INTO lv_newbegda.
*  CONCATENATE '3103' lv_year INTO lv_newendda.
  CALL FUNCTION 'FIRST_AND_LAST_DAY_IN_YEAR_GET'
    EXPORTING
      i_gjahr        = lv_prev_year
      i_periv        = 'V3'
    IMPORTING
      e_first_day    = lv_newbegda
      e_last_day     = lv_newendda
    EXCEPTIONS
      input_false    = 1
      t009_notfound  = 2
      t009b_notfound = 3
      OTHERS         = 4.6840
  SELECT * FROM yrva_qais_data
           INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_new
*                                  WHERE KUNNR         IN S_PKUNAG
*                                  AND KVGR2           IN S_KVGR2
                              WHERE vkbur           IN s_vkbur
                                AND mou_begda       GE lv_newbegda
                                AND mou_begda       LE lv_newendda.
* SOC Commented by chilukuri Tripura Reddy/Archna/Vishal Charm 6686.
*                                  AND MOU_BEGDA       LE LV_NEWBEGDA
*                                  AND MOU_ENDDA       GE LV_NEWENDDA
*                                  AND MODULE_IDENTITY =   ''.
* EOC Commented by chilukuri Tripura Reddy/Archna/Vishal Charm 6686.
  IF sy-subrc = 0.
    SELECT * FROM yrva_qais_data_m
             INTO CORRESPONDING FIELDS OF TABLE it_yrva_qais_data_m_new
                               WHERE kunnr         IN s_pkunag
                               AND kvgr2           IN s_kvgr2
                               AND vkbur           IN s_vkbur
                               AND mou_begda       LE lv_newbegda
                               AND mou_endda       GE lv_newendda.
  ENDIF.
ENDIF.
SORT it_yrva_qais_data BY qais_no kunnr.
SORT it_yrva_qais_data_new BY qais_no  kunnr.
LOOP AT it_yrva_qais_data_new INTO DATA(wa_yrva_qais_data5).
  READ TABLE it_yrva_qais_data INTO DATA(wa_yrva_qais_data6) WITH KEYkunnr  = wa_yrva_qais_data5-kunnr.
  IF sy-subrc NE 0.
    DELETE it_yrva_qais_data_new WHERE  kunnr = wa_yrva_qais_data5-kunnr.
  ENDIF.
ENDLOOP.
SORT it_yrva_qais_data_new BY yytimestamp DESCENDING.
DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data_new COMPARING  kunnr."QAIS_NO YYTIMESTAMP
** EOC by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  CLEAR : lv_revival_m, wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  it_data_monthly-kunnr = wa_yrva_qais_data-kunnr.
  it_data_monthly-kvgr2 = wa_yrva_qais_data-kvgr2 .
  it_data_monthly-vkbur  = wa_yrva_qais_data-vkbur.
  it_data_monthly-begda = s_sptag-low.
  it_data_monthly-endda = s_sptag-high.
  w_flag_month = 'X' .
  MOVE-CORRESPONDING wa_yrva_mstr_waiver_temp TO wa_yrva_mstr_waiver .
  READ TABLE it_yrva_qais_add_wv INTO wa_yrva_qais_add_wv
    WITH KEY qais_no = wa_yrva_qais_data-qais_no
    waiver_month  = lv_mth .
  IF sy-subrc EQ  0 .
    w_waive_month = 'X' .
  ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  CLEAR : lv_revival_m.
  READ TABLE it_yrva_revival_fai INTO wa_yrva_revival_fai
  WITH KEY qais_no = wa_yrva_qais_data-qais_no.
  IF sy-subrc EQ 0.
    IF s_sptag-low < '20231001'.
      lv_revival_m = 'X'.
    ENDIF.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  CASE s_sptag-low+4(2).6902
    WHEN '1'.
      PERFORM month_jan.
    WHEN '2'.
      PERFORM month_feb.
    WHEN '3'.
      PERFORM month_mar.
    WHEN '4'.
      PERFORM month_apr. "Uncommented by Adarsh/Archana on Charm:4000006427, TR:DVRK9A12BV
    WHEN '5'.
      PERFORM month_may.
    WHEN '6'.
      PERFORM month_jun.
    WHEN '7'.
      PERFORM month_jul.
    WHEN '8'.
      PERFORM month_aug.
    WHEN '9'.
      PERFORM month_sep.
    WHEN '10'.
      PERFORM month_oct.
    WHEN '11'.
      PERFORM month_nov.
    WHEN '12'.
      PERFORM month_dec.
    WHEN OTHERS.
  ENDCASE.692969306931
*** SOC BY ABHINAV.6933
  IF lv_flag123 IS INITIAL.693569366937
***Uncommented by Adarsh/Archana on Charm:4000006427, TR:DVRK9A12BV (April month now considered)
**SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April Not considered.
    IF s_sptag-high+4(2) = '04'.
      lv_mon =  'APRIL'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m1.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m1.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m1.
    ELSEIF s_sptag-high+4(2) = '05' .
**EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April Not considered.
***Uncommented by Adarsh/Archana on Charm:4000006427, TR:DVRK9A12BV (April month now considered)6948
*    IF s_sptag-high+4(2) = '05' .
      lv_mon =  'MAY'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m2.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m2.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m2.
    ELSEIF s_sptag-high+4(2) = '06' .
      lv_mon =  'JUNE'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m3.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m3.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m3.
    ELSEIF s_sptag-high+4(2) = '07' .
      lv_mon =  'JULY'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m4.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m4.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m4.
    ELSEIF s_sptag-high+4(2) = '08' .
      lv_mon =  'AUGUST'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m5.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m5.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m5.
    ELSEIF s_sptag-high+4(2) = '09' .
      lv_mon =  'SEPTEMBER'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m6.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m6.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m6.
    ELSEIF s_sptag-high+4(2) = '10' .
      lv_mon =  'OCTOBER'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m7.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m7.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m7.
*      it_data_monthly-ind_elgl_qty   = wa_yrva_qais_data-ind_elgl_qty_m7.
    ELSEIF s_sptag-high+4(2) = '11' .
      lv_mon =  'NOVEMBER'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m8.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m8.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m8.
    ELSEIF s_sptag-high+4(2) = '12' .
      lv_mon =  'DECEMBER'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m9.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m9.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m9.
    ELSEIF s_sptag-high+4(2) = '01' .
      lv_mon =  'JANUARY'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m10.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m10.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m10.
    ELSEIF s_sptag-high+4(2) = '02' .
      lv_mon =  'FEBRUARY'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m11.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m11.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m11.
    ELSEIF s_sptag-high+4(2) = '03' .
      lv_mon =  'MARCH'.
      it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m12.
      it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m12.
      it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m12.
    ENDIF.
*      calculate the discount
    IF it_data_monthly-grp_lift_qty LT w_month_min .
      "SOC RITESH SINGH priyanka mam on charm 4000004022 on date 16.07.2021
      CLEAR: it_data_monthly-ind_elgl_qty,w_flag_month  .
      "EOC RITESH SINGH priyanka mam on charm 4000004022 on date 16.07.2021
    ELSEIF it_data_monthly-grp_lift_qty GT w_month_max .
      IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
        IF w_month_max_perc IS NOT INITIAL.
** SOC by ujjwal/priyanka on 05-11-2019 on charm 1000001096 on MODIFICATION IN MQAIS FOR ADDITIONAL to disable upper cap
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount7016
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*            IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
          IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V7022
*          IF r_month1 EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
            it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
          ELSE.
            it_data_monthly-ind_elgl_qty = ( it_data_monthly-ind_lift_qty / it_data_monthly-grp_lift_qty )
           * w_month_max .
          ENDIF.
        ELSE.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount7032
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*            IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
          IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V7038
*          IF r_month1 EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
            it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
          ELSE.
            it_data_monthly-ind_elgl_qty =  w_month_max.
          ENDIF.
        ENDIF.
      ELSE.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
*
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR  C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR  c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*                IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V7054
*          IF r_month1 EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
        ELSE.
          it_data_monthly-ind_elgl_qty =  w_month_max.
        ENDIF.
** EOC by ujjwal/priyanka on 05-11-2019 on charm 1000001096 on MODIFICATION IN MQAIS FOR ADDITIONAL to disable upper cap
      ENDIF.
    ELSEIF it_data_monthly-grp_lift_qty GE w_month_min     AND
           it_data_monthly-grp_lift_qty LE w_month_max .
      it_data_monthly-ind_elgl_qty = ( it_data_monthly-ind_lift_qty /it_data_monthly-grp_lift_qty )
         * it_data_monthly-grp_lift_qty.
    ENDIF.7068
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
    IF r_rlld = 'X'.
      it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
    IF ls_psdq = 'X'.
      it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
    it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty - wa_yrva_qais_data-lv_no_dis_qty.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
*      IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR  C_MAINTEQ 'X' OR C_MAINT1 EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
    IF r_rhd EQ 'X' OR r_rlld EQ 'X' OR  c_maint EQ 'X' OR c_maint1 EQ'X'.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
      IF  lv_flag1 EQ 'X'.
        CLEAR: it_data_monthly-ind_elgl_qty.
      ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      IF ls_psdq = 'X'.
        CLEAR: it_data_monthly-ind_elgl_qty.
**          IF it_data_monthly-kvgr2 IS INITIAL.
        CLEAR: wa_yrva_qais_data_n.
        READ TABLE it_yrva_qais_data_n INTO wa_yrva_qais_data_n WITH KEY kunnr = it_data_monthly-kunnr.
        IF wa_yrva_qais_data_n IS NOT INITIAL.
          it_data_monthly-ind_elgl_qty = wa_yrva_qais_data_n-ind_lift_qty_m8.
        ENDIF.
**          ELSE.
**            READ TABLE it_yrva_qais_data_n_temp INTO wa_yrva_qais_data_n_temp WITH KEY kunnr = it_data_monthly-kunnr
**kvgr2 = it_data_monthly-kvgr2.
**            CLEAR: wa_yrva_qais_data_n_temp.
**            IF wa_yrva_qais_data_n_temp IS NOT INITIAL.
**            it_data_monthly-ind_elgl_qty = wa_yrva_qais_data_n-ind_lift_qty_m7.
**            ENDIF.
**          ENDIF.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF it_data_monthly-ind_elgl_qty < 0.
      it_data_monthly-ind_elgl_qty = 0.
    ENDIF.7112
    CLEAR: w_remarks, lv_fact, it_data_monthly-value.
    lv_year1 = s_sptag-high+2(2).
    IF s_sptag-high+4(2) LE '03'.
      lv_year2 = lv_year1 - 1.
      CONCATENATE lv_year2 '-' lv_year1 INTO lv_dat.
    ELSE.
      lv_year2 = lv_year1 + 1.
      CONCATENATE lv_year1 '-' lv_year2 INTO lv_dat.
    ENDIF.
    IF r_month EQ 'X'.
      CONCATENATE 'CIS' lv_dat lv_mon 'Discount' INTO w_remarks SEPARATED BY ' '.
    ENDIF.
    IF r_month1 EQ 'X'.
      CONCATENATE 'CIS' lv_dat lv_mon ' Spl.Discount' INTO w_remarks SEPARATED BY ' '.
    ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    IF r_rhd EQ 'X'.
      CONCATENATE 'Add.CIS' lv_dat lv_mon+(3) 'XY HD Dis' INTO w_remarks SEPARATED BY ' '.
    ENDIF.
    IF r_rlld EQ 'X'.
      CONCATENATE 'Add.CIS' lv_dat lv_mon+(3) 'XY LL Dis' INTO w_remarks SEPARATED BY ' '.
    ENDIF.7135
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
    IF c_maint EQ 'X'.
      CONCATENATE 'Add.CIS' lv_dat lv_mon+(3) 'XY OTHERS' INTO w_remarks SEPARATED BY ' '.
    ENDIF.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF c_maint1 EQ 'X'.
      CONCATENATE 'Add.CIS' lv_dat lv_mon+(3) 'XY OTHERS1' INTO w_remarks SEPARATED BY ' '.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    SORT i_cond BY kstbm DESCENDING.
    IF r_month EQ 'X'.
      LOOP AT i_cond WHERE kstbm <= wa_yrva_qais_data-mou_qty . "IT_DATA_ANNUAL-TOT_ELGL_QTY.
        lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
        IF lv_fact GE w_month_min_perc OR w_waive_month EQ 'X' OR lv_flag1 EQ 'X' OR lv_flag2 EQ 'X'.
          w_kbetr = i_cond-kbetr.
        ELSE.
          CLEAR: w_kbetr.
        ENDIF.
        EXIT.
      ENDLOOP.
    ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount7160
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*    IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*          IF r_month1 EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V7167
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
      IF ls_psdq = 'X'.
        IF it_data_monthly-kvgr2 IS INITIAL.
          READ TABLE it_yrva_qais_data_n INTO wa_yrva_qais_data_n WITHKEY kunnr = it_data_monthly-kunnr.
          lv_fact = ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
        ELSE.
          READ TABLE it_yrva_qais_data_n_temp INTO wa_yrva_qais_data_n_temp WITH KEY kvgr2 =  it_data_monthly-kvgr2.
          lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
      ELSE.
        lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
      ENDIF." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000924
**        IF s_sptag-low+4(2) = 10 AND r_rlld = 'X' AND s_sptag-low+0(4)= '2024'.
**          it_data_monthly-ind_elgl_qty =  it_data_monthly-ind_lift_qty.
      IF ls_psdq = 'X'.
        IF it_data_monthly-kvgr2 IS INITIAL.
          READ TABLE it_yrva_qais_data_n INTO wa_yrva_qais_data_n WITHKEY kunnr = it_data_monthly-kunnr.
          lv_fact = ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
        ELSE.
          READ TABLE it_yrva_qais_data_n_temp INTO wa_yrva_qais_data_n_temp WITH KEY kvgr2 =  it_data_monthly-kvgr2.
          lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
        ENDIF.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000924
** SOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*        if LV_FLAG2 EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
*       IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR  C_MAINTEQ 'X' OR C_MAINT1 EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
** SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
*       IF R_RHD EQ 'X' OR R_RLLD EQ 'X' OR  C_MAINT EQ 'X' OR C_MAINT1EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
*       if LV_FLAG2 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007262
*         sort i_cond ASCENDING BY KSTBM.
*         READ TABLE i_cond INTO data(lwa_cond) INDEX 1.
*          W_KBETR = lwa_cond-KBETR.
*         CLEAR : lwa_cond.
*         endif.
*        else.
** EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
** EOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
      LOOP AT i_cond WHERE kstbm <= lv_fact.
        w_kbetr = i_cond-kbetr.
        EXIT.
      ENDLOOP.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 20000009247214
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
      IF r_rlld EQ 'X'.
        IF lv_flag1 = 'X'.
          w_kbetr = 0.
        ENDIF.
        IF lv_fact < 100.
          IF w_waive_month = 'X'.
            READ TABLE i_cond INDEX 3."3
            w_kbetr = i_cond-kbetr + 500.
          ENDIF.
        ENDIF.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 20000009717228
**           IF s_sptag-low+4(2) = 09 AND r_rlld = 'X' AND s_sptag-low+0(4) = '2024'." SOC Commenetd by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
**        IF s_sptag-low+4(2) = 10 AND r_rlld = 'X' AND s_sptag-low+0(4)= '2024'." SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      IF ls_psdq = 'X'." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm : 4000008973
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
        IF w_waive_month = 'X'.
          READ TABLE i_cond INDEX 3."3
          w_kbetr = i_cond-kbetr + 500.
        ENDIF.
        IF lv_flag1 = 'X'.
          w_kbetr = 0.
        ENDIF.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000924
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
      IF ls_psdq = 'X'.
        IF w_waive_month = 'X'.
          READ TABLE i_cond INDEX 3."3
          w_kbetr = i_cond-kbetr + 500.
        ENDIF.
      ELSEIF lv_flag1 = 'X'.
        w_kbetr = '0'.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
** SOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*        endif." SOC Commented by Chilukuri Tripura Reddy/Archna/VishalCharm : 4000007264
** EOC By Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007272
*        IF R_RHD EQ 'X' OR R_RLLD EQ 'X' OR  C_MAINT EQ 'X' OR C_MAINT1EQ 'X' AND LV_FLAG2 EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
      IF r_rhd EQ 'X' OR r_rlld EQ 'X' OR  c_maint EQ 'X' OR c_maint1EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
        IF lv_flag2 EQ 'X'.
          IF w_kbetr IS INITIAL.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007272
            SORT i_cond ASCENDING BY kstbm.
            READ TABLE i_cond INTO DATA(lwa_cond) INDEX 1.
            w_kbetr = lwa_cond-kbetr.
            CLEAR : lwa_cond.
          ENDIF.
        ENDIF.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007264
    ENDIF.
    IF r_month EQ 'X'.
      it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
      IF it_data_monthly-value LT 0 .
        it_data_monthly-value = it_data_monthly-value * -1.
      ENDIF.
    ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
*    IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.72807281
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      IF R_MONTH1 EQ 'X'  OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*    IF r_month1 EQ 'X'  OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*          IF r_month1 EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF r_month1 EQ 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
      it_data_monthly-ind_lift_qty = it_data_monthly-ind_lift_qty - wa_yrva_qais_data-lv_no_dis_qty.
*      IF it_data_monthly-ind_lift_qty LE 200.
*SOC by Kunal/Priyanka on 30/11/2018 for additional monthly discount based on capping from report YRVR147
** SOC commented by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
** EOC commented by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
** SOC by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
      IF s_sptag-low+4(2) = '4' AND r_month1 EQ 'X' AND s_sptag-low+0(4) = '2023'.
* SOC by Chilukuri Tripura Reddy/Archna/Vishal charm 4000006810.
        IF it_data_monthly-ind_elgl_qty IS INITIAL.
          it_data_monthly-ind_elgl_qty  =   wa_yrva_qais_data-ind_elgl_qty_m1.
        ENDIF.
* EOC by Chilukuri Tripura Reddy/Archna/Vishal charm 4000006810.
        DATA : gt_yrva_qais_data TYPE STANDARD TABLE OF yrva_qais_data.
*            LOOP AT IT_YRVA_QAIS_DATA_NEW INTO DATA(WA_YRVA_QAIS_DATA_NEW3)
*                                          WHERE QAIS_NO      = WA_YRVA_QAIS_DATA-QAIS_NO     AND
*                                                YYTIMESTAMP  = WA_YRVA_QAIS_DATA-YYTIMESTAMP AND
*                                                KUNNR        = WA_YRVA_QAIS_DATA-KUNNR.
        READ TABLE it_yrva_qais_data_new INTO DATA(wa_yrva_qais_data_new3)
                                     WITH KEY kunnr  = wa_yrva_qais_data-kunnr.
*SOC by Chilukuri Tripura Reddy/Archana/Vishal (on 08/07/2023) TR DVRK9A13EI.
        DATA(lwa_kvgr22)   = it_data_monthly-kvgr2.
        IF wa_yrva_qais_data_new3-kvgr2 NE lwa_kvgr22.
          CLEAR: wa_yrva_qais_data_new3.
          CLEAR:  wa_yrva_qais_data_new3-commited_qty_m12.
        ENDIF.
*EOC by Chilukuri Tripura Reddy/Archana/Vishal (on 08/07/2023) TR DVRK9A13EI.
*SOC by Chilukuri Tripura Reddy/Archana/Vishal (on 23/06/2023) TR DVRK9A131f.
        SELECT yytimestamp
               kunnr
               yy_cusclass FROM yrva_qais_data INTO CORRESPONDING FIELDS OF TABLE gt_yrva_qais_data
                                               WHERE kunnr = wa_yrva_qais_data-kunnr.
        SORT gt_yrva_qais_data  BY yytimestamp DESCENDING.
        DELETE ADJACENT DUPLICATES FROM gt_yrva_qais_data COMPARING kunnr.
        READ TABLE gt_yrva_qais_data INTO DATA(gs_yrva_qais_data) WITHKEY kunnr = wa_yrva_qais_data-kunnr.
        IF gs_yrva_qais_data IS NOT INITIAL.
          wa_yrva_qais_data-yy_cusclass =   gs_yrva_qais_data-yy_cusclass.
        ENDIF.
*EOC by Chilukuri Tripura Reddy/Archana/Vishal (on 23/06/2023) TR DVRK9A131f.
        DATA lv_per TYPE p DECIMALS 3.
        IF it_data_monthly-kvgr2 = ' '.
          IF wa_yrva_qais_data_new3-commited_qty_m12 IS NOT INITIAL.
            lv_per   =  ( it_data_monthly-ind_lift_qty / wa_yrva_qais_data_new3-commited_qty_m12 ) * 100.
            IF lv_per IS NOT INITIAL.
              IF lv_per >= 90 AND lv_per < 100.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 1200.
              ELSEIF lv_per >= 100 AND lv_per < 125.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 2000.
              ELSEIF lv_per >= 125 AND lv_per < 150.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 3000.
              ELSEIF lv_per >= 150.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 3500.
              ENDIF.
            ENDIF.
          ELSE.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              it_data_monthly-value = it_data_monthly-ind_elgl_qty * 0.
            ELSE.
              lv_per   =  ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per IS NOT INITIAL.
                IF lv_per >= 90 AND lv_per < 100.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 1200.
                ELSEIF lv_per >= 100 AND lv_per < 125.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 2000.
                ELSEIF lv_per >= 125 AND lv_per < 150.
*                    IT_DATA_MONTHLY-IND_ELGL_QTY = IT_DATA_MONTHLY-COMMITED_QTY * 125 / 100.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 3000.
                ELSEIF lv_per >= 150.
*                    IT_DATA_MONTHLY-IND_ELGL_QTY = IT_DATA_MONTHLY-COMMITED_QTY * 125 / 100.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 3000.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
*            DATA(LV_DISCOUNT_VALUE)   = IT_DATA_MONTHLY-VALUE.
*            ENDLOOP.
          IF it_data_monthly-value IS INITIAL.
            it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
          ENDIF.
        ELSE.
          IF wa_yrva_qais_data_new3-commited_qty_m12 IS NOT INITIAL.
            lv_per   =  ( it_data_monthly-grp_lift_qty / wa_yrva_qais_data_new3-commited_qty_m12 ) * 100.
            IF lv_per IS NOT INITIAL.
              IF lv_per >= 90 AND lv_per < 100.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 1200.
              ELSEIF lv_per >= 100 AND lv_per < 125.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 2000.
              ELSEIF lv_per >= 125 AND lv_per < 150.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 3000.
              ELSEIF lv_per >= 150.
                it_data_monthly-value =  it_data_monthly-ind_elgl_qty* 3500.
              ENDIF.
            ENDIF.
          ELSE.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              it_data_monthly-value = it_data_monthly-ind_elgl_qty * 0.
            ELSE.
              lv_per   =  ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per IS NOT INITIAL.
                IF lv_per >= 90 AND lv_per < 100.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 1200.
                ELSEIF lv_per >= 100 AND lv_per < 125.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 2000.
                ELSEIF lv_per >= 125 AND lv_per < 150.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 3000.
                ELSEIF lv_per >= 150.
*                    IT_DATA_MONTHLY-VALUE =  IT_DATA_MONTHLY-IND_ELGL_QTY * 3500.
                  it_data_monthly-value =  it_data_monthly-ind_elgl_qty * 3000.
                ENDIF.
              ENDIF.
            ENDIF.
          ENDIF.
          IF it_data_monthly-value IS INITIAL.
            it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
          ENDIF.
        ENDIF.
      ELSE.
        IF wa_yrva_qais_data-kvgr2 IS INITIAL.
** EOC by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
          IF w_month_max LE it_data_monthly-ind_lift_qty.
* SOC by ujjwal/priyanka on 05-11-2019 on charm 1000001096 on MODIFICATION IN MQAIS FOR ADDITIONAL to disable upper cap
*          it_data_monthly-value   = w_month_max * w_kbetr.
            it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
* EOC by ujjwal/priyanka on 05-11-2019 on charm 1000001096 on MODIFICATION IN MQAIS FOR ADDITIONAL to disable upper cap7413
          ELSE.
*          it_data_monthly-value   = it_data_monthly-ind_lift_qty * w_kbetr.
            it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
          ENDIF.
** EOC commented by Chilukuri Tripura Reddy/Archana/Vishal (on 16/06/2023) Charm DVRK9A12U8.
*        ENDIF.    " Added Charm DVRK9A12U8.
*SOC by Kunal/Priyanka on 30/11/2018 for additional monthly discount based on capping from report YRVR147
        ELSE.
          it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
**EOC by Kunal/Priyanka on 30/11/2018 for additional monthly discount based on capping from report YRVR147
        ENDIF.
*EOC by Kunal/Priyanka on 30/11/2018 for additional monthly discount based on capping from report YRVR147
*      ELSE.
*        it_data_monthly-ind_lift_qty = 200.
*        it_data_monthly-ind_elgl_qty  = 200.
*        it_data_monthly-value   = it_data_monthly-ind_lift_qty * w_kbetr.
*      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archana/Vishal (commented on 16/06/2023) Charm DVRK9A12U8.
* SOC by Chilukuri Tripura Reddy/Archana/Vishal  (05/07/2023) Charm 4000006698 TR DVRK9A13B9.
        IF s_sptag-low+4(2) = '6' AND r_month1 EQ 'X' AND s_sptag-low+0(4) = '2023'.
          DATA : gt_yrva_qais_data1 TYPE STANDARD TABLE OF yrva_qais_data.
          SELECT yytimestamp
                  kunnr
                  yy_cusclass FROM yrva_qais_data INTO CORRESPONDING FIELDS OF TABLE gt_yrva_qais_data1
                                                  WHERE kunnr = wa_yrva_qais_data-kunnr.
          SORT gt_yrva_qais_data1  BY yytimestamp DESCENDING.
          DELETE ADJACENT DUPLICATES FROM gt_yrva_qais_data1 COMPARINGkunnr.
          READ TABLE gt_yrva_qais_data1 INTO DATA(gs_yrva_qais_data1)WITH KEY kunnr = wa_yrva_qais_data-kunnr.
          IF gs_yrva_qais_data1 IS NOT INITIAL.
            wa_yrva_qais_data-yy_cusclass = gs_yrva_qais_data1-yy_cusclass.
          ENDIF.
          READ TABLE i_cond INTO DATA(wa_cond) INDEX 1.
          IF wa_cond-kstbm = 150.
            DATA(lv_kbetr)    = wa_cond-kbetr.
          ELSE.
            lv_kbetr          = w_kbetr.
          ENDIF.
          IF it_data_monthly-kvgr2 = ' '.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              IF it_data_monthly-commited_qty >= 400.
                DATA lv_per1 TYPE p DECIMALS 3.
                lv_per1   =  ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
                IF lv_per1 >= 150.
                  it_data_monthly-value   = it_data_monthly-ind_elgl_qty * lv_kbetr .
                ELSE.
                  it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                  it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
                ENDIF.
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ELSE.
              lv_per1   =  ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per1 >= 150.
                it_data_monthly-value   = it_data_monthly-ind_elgl_qty* lv_kbetr .
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ENDIF.
          ELSE.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              IF it_data_monthly-commited_qty >= 400.
                lv_per1   =  ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
                IF lv_per1 >= 150.
                  it_data_monthly-value   = it_data_monthly-ind_elgl_qty * lv_kbetr.
                ELSE.
                  it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                  it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
                ENDIF.
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ELSE.
              lv_per1   =  ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per1 >= 150.
                it_data_monthly-value   = it_data_monthly-ind_elgl_qty* lv_kbetr .
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
* EOC by Chilukuri Tripura Reddy/Archana/Vishal  (05/07/2023) Charm 4000006698 TR DVRK9A13B9.
* SOC by Chilukuri Tripura Reddy/Archana/Vishal  (30/08/2023) Charm 4000007010 TR DVRK9A14I9.
        IF s_sptag-low+4(2) = '8' AND r_month1 EQ 'X' AND s_sptag-low+0(4) = '2023'.
          DATA : gt_yrva_qais_data2 TYPE STANDARD TABLE OF yrva_qais_data.
          SELECT yytimestamp
                 kunnr
                 yy_cusclass FROM yrva_qais_data INTO CORRESPONDING FIELDS OF TABLE gt_yrva_qais_data2
                                                 WHERE kunnr = wa_yrva_qais_data-kunnr.
          SORT gt_yrva_qais_data2  BY yytimestamp DESCENDING.
          DELETE ADJACENT DUPLICATES FROM gt_yrva_qais_data2 COMPARINGkunnr.
          READ TABLE gt_yrva_qais_data2 INTO DATA(gs_yrva_qais_data2)WITH KEY kunnr = wa_yrva_qais_data-kunnr.
          IF gs_yrva_qais_data2 IS NOT INITIAL.
            wa_yrva_qais_data-yy_cusclass = gs_yrva_qais_data2-yy_cusclass.
          ENDIF.
          READ TABLE i_cond INTO DATA(wa_cond1) INDEX 1.
          IF wa_cond1-kstbm = 150.
            DATA(lv_kbetr1)    = wa_cond1-kbetr.
          ELSE.
            lv_kbetr1          = w_kbetr.
          ENDIF.
          IF it_data_monthly-kvgr2 = ' '.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              IF it_data_monthly-commited_qty >= 400.
                DATA lv_per2 TYPE p DECIMALS 3.
                lv_per2   =  ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
                IF lv_per2 >= 150.
                  it_data_monthly-value   = it_data_monthly-ind_elgl_qty * lv_kbetr1 .
                ELSE.
                  it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                  it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
                ENDIF.
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ELSE.
              lv_per2   =  ( it_data_monthly-ind_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per2 >= 150.
                it_data_monthly-value   = it_data_monthly-ind_elgl_qty* lv_kbetr1.
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ENDIF.
          ELSE.
            IF  wa_yrva_qais_data-yy_cusclass = 'TRADER'.
              IF it_data_monthly-commited_qty >= 400.
                lv_per2   =  ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
                IF lv_per2 >= 150.
                  it_data_monthly-value   = it_data_monthly-ind_elgl_qty * lv_kbetr1.
                ELSE.
                  it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                  it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
                ENDIF.
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ELSE.
              lv_per2   =  ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
              IF lv_per2 >= 150.
                it_data_monthly-value   = it_data_monthly-ind_elgl_qty* lv_kbetr1 .
              ELSE.
                it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty * 0.
                it_data_monthly-value        = it_data_monthly-ind_elgl_qty * 0.
              ENDIF.
            ENDIF.
          ENDIF.
        ENDIF.
* EOC by Chilukuri Tripura Reddy/Archana/Vishal  (30/08/2023) Charm 4000007010 TR DVRK9A14I9.
        IF it_data_monthly-value LT 0 .
          it_data_monthly-value = it_data_monthly-value * -1 .
        ENDIF.
      ENDIF.
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007313 date:03/11/2023
    IF it_data_monthly-value = '0'.
      it_data_monthly-ind_elgl_qty = '0'.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007313 date:03/11/2023
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
    IF ls_psdq = 'X'.
      IF it_data_monthly-value = '0'.
        it_data_monthly-ind_elgl_qty = '0'.
      ENDIF.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
    it_data_monthly-tot_elgl_qty =  it_data_monthly-ind_elgl_qty .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222 date:12/10/2023
    IF r_rhd = 'X'.
*          W_REMARKS = 'ADDL. CIS XY PSD HD-PIPBM & LL-RMEC'." SOC commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
*        w_remarks = TEXT-004." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299,
      w_remarks = 'AD CIS XY NOV24 LLOT'.
    ELSEIF r_rlld   = 'X'.
*          W_REMARKS = 'ADDL. CIS XY PSD HD-LOIM & LL-I26'." SOC commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
*        w_remarks = TEXT-012." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
      w_remarks = 'ADDL CIS XYZ DEC24'.
    ELSEIF c_maint  = 'X'.
*          W_REMARKS = 'ADDL. CIS XY PSD HD-RAF-IMHI-HDHMF'." SOC commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
*        w_remarks = TEXT-006." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
      w_remarks = 'AD CIS XY NOV24 HDBP'.
    ELSEIF c_maint1 = 'X'.
*          W_REMARKS = 'ADDL. CIS XY PSD LL-FILM-D22'." SOC commented byChilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
*        w_remarks = TEXT-008." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007299
      w_remarks = 'AD CIS XY NOV24 HDOT'.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222 date:12/10/2023
    it_data_monthly-remarks = w_remarks.
    APPEND it_data_monthly .
    CLEAR: wa_yrva_qais_data-lv_no_dis_qty.
    MODIFY it_yrva_qais_data FROM  wa_yrva_qais_data.
    "SOC RITESH SINGH PRIYANKA MAM ON CHARM 4000004022 on Date 16.07.2021
    CLEAR: w_waive_month, lv_flag1,  w_kbetr, i_cond,wa_yrva_qais_data,it_data_monthly-tot_elgl_qty, lv_per. "LV_DISCOUNT_VALUE .
    "EOC RITESH SINGH PRIYANKA MAM ON CHARM 4000004022 on Date 16.07.2021
    CLEAR: wa_yrva_qais_data_new3, gs_yrva_qais_data,gs_yrva_qais_data1,wa_cond, lv_kbetr ,lv_per1,lwa_kvgr22,it_data_monthly-ind_elgl_qty.
  ELSE.7616
    CLEAR: lv_flag123.
  ENDIF.
ENDLOOP.7620
ENDFORM.
*&*
*&      Form  MONTH_JAN
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_jan .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 3 when not processed.
**  IF wa_yrva_qais_data_m-mon_so_m9 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20240101'."* SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 9.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 3 when not processed.
**  IF wa_yrva_qais_data_m-mon_so_m9 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20240101'."* SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
IF wa_yrva_qais_data_m-mon_so_m9 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
  lv_flag123 = 'X'.
  EXIT. "17644
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
** SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**  IF wa_yrva_qais_data-sale_order_q3 IS INITIAL AND wa_yrva_qais_data-mou_begda LE '20231001'.
**    lv_flag123 = 'X'.
**    EXIT. "1
**
**    MESSAGE 'List contain no data' TYPE 'E' .
**  ENDIF.
**
**  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
**    IF wa_yrva_qais_data-sale_order_q3 IS INITIAL AND  wa_yrva_qais_data-mou_begda LE '20231001'.
**      lv_flag123 = 'X'.
**      EXIT. "1
**
**      MESSAGE 'List contain no data' TYPE 'E' .
**    ENDIF.
**  ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quarter 3 when not processed.
** EOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m10.
IF wa_yrva_mstr_waiver-max_perc_m10 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m10 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m10 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m10 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
    OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m10 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m10  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m10 * w_month_max_perc .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m10.
ENDIF.7700
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m10.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m10.
  ENDIF.
ENDIF.7710
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m10   = it_data_monthly-grp_lift_qty.
ENDIF.
**EOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_FEB
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_feb .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.7727
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 10.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 20000010507734
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Jan Not Processed.
**  IF wa_yrva_qais_data_m-mon_so_m10 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20240201'." SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
 IF wa_yrva_qais_data_m-mon_so_m10 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000008188
  lv_flag123 = 'X'.
  EXIT. "17740
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Jan Not Processed.7744
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m11.
IF wa_yrva_mstr_waiver-max_perc_m11 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m11 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m11 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m11 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
    OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m11 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m11  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m11 * w_month_max_perc .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m11.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m11.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m11.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m11   = it_data_monthly-grp_lift_qty.
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_MAR
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_mar .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.78057806
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Feb Not Processed.
**  IF wa_yrva_qais_data_m-mon_so_m11 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20240301'." SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
*  IF wa_yrva_qais_data_m-mon_so_m11 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20250301'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 11.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
**  IF wa_yrva_qais_data_m-mon_so_m11 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20250301'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**  IF wa_yrva_qais_data_m-mon_so_m11 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20250301'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
IF wa_yrva_qais_data_m-mon_so_m11 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm:20000010507819
  lv_flag123 = 'X'.
  EXIT. "17822
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Feb Not Processed.7826
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m12.
IF wa_yrva_mstr_waiver-max_perc_m12 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m12 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m12 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m12 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m12 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m12  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m12 * w_month_max_perc .
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m12.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m12.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m12.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m12   = it_data_monthly-grp_lift_qty.
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_APR
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_apr .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.7887
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m1.
IF wa_yrva_mstr_waiver-max_perc_m1 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m1 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc = wa_yrva_mstr_waiver-pd_perc_m1 / 100. " '1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m1 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m1 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m1  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m1 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m1.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m1.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m1.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m1   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_MAY
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_may .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m2.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 1.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 200000105079557956
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Feb Not Processed.
*  IF wa_yrva_qais_data_m-mon_so_m1 IS INITIAL AND wa_yrva_qais_data-mou_begda LT '20240501'.
IF wa_yrva_qais_data_m-mon_so_m1 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
  lv_flag123 = 'X'.
  EXIT. "1
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Feb Not Processed.
IF wa_yrva_mstr_waiver-max_perc_m2 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m2 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m2 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m2 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m2 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m2  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m2 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m2.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m2.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m2.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m2   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_JUN
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_jun .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 2.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month MayNot Processed.
IF wa_yrva_qais_data_m-mon_so_m2 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18034
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month MayNot Processed.
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m3.
IF wa_yrva_mstr_waiver-max_perc_m3 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m3 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m3 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m3 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m3 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m3  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m3 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m3.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m3.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m3.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m3   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_JUL
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_jul .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 3.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Jun Not Processed.
IF wa_yrva_qais_data_m-mon_so_m3 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18108
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
** SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**  IF wa_yrva_qais_data-sale_order_q1 IS INITIAL AND wa_yrva_qais_data-mou_begda LE '20230501'.
**    lv_flag123 = 'X'.
**    EXIT. "1
**
**    MESSAGE 'List contain no records' TYPE 'E' .
**  ENDIF.
** EOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
** SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
**    IF wa_yrva_qais_data-sale_order_q1 IS INITIAL AND  wa_yrva_qais_data-mou_begda LE '20230501'.
**      lv_flag123 = 'X'.
**      EXIT. "1
**
**      MESSAGE 'List contain no data' TYPE 'E' .
**    ENDIF.
**  ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Jun Not Processed.
** EOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m4.
IF wa_yrva_mstr_waiver-max_perc_m4 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m4 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m4 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m4 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m4 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m4  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m4 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m4.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m4.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m4.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m4   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_AUG
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_aug .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.8190
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 4.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month JulyNot Processed.
 IF wa_yrva_qais_data_m-mon_so_m4 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18201
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month JulyNot Processed.8205
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m5.
IF wa_yrva_mstr_waiver-max_perc_m5 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m5 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m5 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m5 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m5 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m5  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m5 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m5.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m5.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m5.
  ENDIF.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
IF ls_psdq IS NOT INITIAL.
  IF r_rhd IS NOT INITIAL OR r_rlld IS NOT INITIAL.
    wa_yrva_qais_data-grp_lift_qty_m5   = it_data_monthly-grp_lift_qty.
  ENDIF.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m5   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_SEP
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_sep .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
**SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Aug Not Processed.8274
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 5.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Aug Not Processed.
IF wa_yrva_qais_data_m-mon_so_m5 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18284
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Aug Not Processed.82888289
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m6.
IF wa_yrva_mstr_waiver-max_perc_m6 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m6 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m6 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m6 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m6 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m6  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m6 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m6.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m6.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m6.
  ENDIF.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m6   = it_data_monthly-grp_lift_qty .
ENDIF.8338
ENDFORM.
*&*
*&      Form  MONTH_OCT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_oct .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.8350
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Sep Not Processed.83528353
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 6.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Sep Not Processed.
IF wa_yrva_qais_data_m-mon_so_m6 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18364
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
** SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
**  IF wa_yrva_qais_data-sale_order_q2 IS INITIAL AND wa_yrva_qais_data-mou_begda LE '20230701'.
**    lv_flag123 = 'X'.
**    EXIT. "1
**
**    MESSAGE 'List contain no data' TYPE 'E' .
**  ENDIF.
**  IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
**    IF wa_yrva_qais_data-sale_order_q2 IS INITIAL AND  wa_yrva_qais_data-mou_begda LE '20230701'.
**      lv_flag123 = 'X'.
**      EXIT. "1
**
**      MESSAGE 'List contain no data' TYPE 'E' .
**    ENDIF.
**  ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Sep Not Processed.
** EOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008188
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m7.
IF wa_yrva_mstr_waiver-max_perc_m7 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m7 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m7 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m7 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m7 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m7  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m7 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m7.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m7.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m7.
  ENDIF.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
IF ls_psdq IS NOT INITIAL.
  IF r_rhd IS NOT INITIAL OR r_rlld IS NOT INITIAL OR c_maint IS NOT INITIAL OR c_maint1 IS NOT INITIAL.
    wa_yrva_qais_data-grp_lift_qty_m7   = it_data_monthly-grp_lift_qty.
  ENDIF.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m7   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_NOV
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_nov .
CLEAR: w_month_max_perc, w_month_min_perc,lv_flag2.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 7.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month OctNot Processed.
IF wa_yrva_qais_data_m-mon_so_m7 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18461
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month OctNot Processed.8465
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m8.
IF wa_yrva_mstr_waiver-max_perc_m8 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m8 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m8 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m8 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m8 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m8  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m8 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m8.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m8.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m8.
  ENDIF.
ENDIF.8510
*  SOC BY VASISHNAVI/PAWAN CHARM:4000009111.
IF ls_psdq IS NOT INITIAL.
  IF r_rhd IS NOT INITIAL OR r_rlld IS NOT INITIAL OR c_maint IS NOT INITIAL OR c_maint1 IS NOT INITIAL.
    wa_yrva_qais_data-grp_lift_qty_m8   = it_data_monthly-grp_lift_qty.
  ENDIF.
ENDIF.
**  EOC BY VASISHNAVI/PAWAN CHARM:4000009111.8518
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m8   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  MONTH_DEC
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM month_dec .
CLEAR: w_month_max_perc, w_month_min_perc, lv_flag2.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
CLEAR: ls_monthn, ls_date.
ls_monthn = 8.
ls_date =  ls_yrva_cis_mstr-yy_start_date.
PERFORM dynamic_month USING ls_date ls_monthn.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Nov Not Processed.
IF wa_yrva_qais_data_m-mon_so_m8 IS INITIAL AND wa_yrva_qais_data-mou_begda LT ls_date.
  lv_flag123 = 'X'.
  EXIT. "18545
  MESSAGE 'List contain no records' TYPE 'E' .
ENDIF.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Nov Not Processed.8549
w_month_min_perc = wa_yrva_mstr_waiver-min_perc_m9.
IF wa_yrva_mstr_waiver-max_perc_m9 IS NOT INITIAL OR wa_yrva_mstr_waiver-pd_perc_m9 IS NOT INITIAL.
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    w_month_max_perc =  wa_yrva_mstr_waiver-pd_perc_m9 / 100. "'1.50'.
  ELSE.
    w_month_max_perc = wa_yrva_mstr_waiver-max_perc_m9 / 100.
  ENDIF.
ELSE.
  CLEAR w_month_max_perc.
ENDIF.
IF wa_yrva_qais_data-waiver_1 = lv_mth OR wa_yrva_qais_data-waiver_2 =lv_mth
OR wa_yrva_qais_data-waiver_3 = lv_mth .
  lv_flag1 = 'X'.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m9 * '.25' .
ELSEIF  wa_yrva_mstr_waiver-ms_waiver1 = lv_mth OR
    wa_yrva_mstr_waiver-ms_waiver2 = lv_mth OR w_waive_month = 'X'
**    SOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
OR   wa_yrva_mstr_waiver-ms_waiver3 = lv_mth OR wa_yrva_mstr_waiver-ms_waiver4 = lv_mth.
**    EOC by ujjwal/priynka on 23-03-2020 on charm 40000001877 to add mstr waiver 3 and mstr waiver 4
  w_month_min  =  0 .
  lv_flag2 = 'X'.
ELSE.
  w_month_min  =  wa_yrva_qais_data-commited_qty_m9  * w_month_min_perc / 100.
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF lv_revival_m = 'X'.
  w_month_min  =  0.
  lv_flag2 = 'X'.
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
IF  w_month_max_perc IS NOT INITIAL.
  w_month_max  =  wa_yrva_qais_data-commited_qty_m9 * w_month_max_perc.
ELSE.
  w_month_max  =  wa_yrva_qais_data-ind_lift_qty_m9.
ENDIF.
IF wa_yrva_qais_data-kvgr2 IS INITIAL.
  it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m9.
ELSE.
  READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
  WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
  IF sy-subrc EQ 0 .
    it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m9.
  ENDIF.
ENDIF.8594
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
IF r_rlld = 'X'.
  wa_yrva_qais_data-grp_lift_qty_m9   = it_data_monthly-grp_lift_qty .
ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 2000000971
**SOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
IF r_month IS NOT INITIAL OR r_month1 IS NOT  INITIAL.
  wa_yrva_qais_data-grp_lift_qty_m9   = it_data_monthly-grp_lift_qty .
ENDIF.
**eOC by ujjjwal/priyanka on charm 4000002906 on 13-10-2020 to create new additional MQAIS link discount
ENDFORM.
*&*
*&      Form  REPEAT_PERFORMANCE_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM repeat_performance_discount .
*   CLEAR lv_mth.
*    CASE s_sptag-low+4(2).
*      WHEN '1'.
*        lv_mth  = 'JAN'.
*        lv_mth1 = 'DEC'.
*      WHEN '2'.
*        lv_mth = 'FEB'.
*        lv_mth1 = 'JAN'.
*      WHEN '3'.
*        lv_mth = 'MAR'.
*        lv_mth1 = 'FEB'.
*      WHEN '4'.
*        lv_mth = 'APR'.
*      WHEN '5'.
*        lv_mth = 'MAY'.
*        lv_mth1 = 'APR'.
*      WHEN '6'.
*        lv_mth = 'JUN'.
*        lv_mth1 = 'MAY'.
*      WHEN '7'.
*        lv_mth = 'JUL'.
*        lv_mth1 = 'JUN'.
*      WHEN '8'.
*        lv_mth = 'AUG'.
*        lv_mth1 = 'JUL'.
*      WHEN '9'.
*        lv_mth = 'SEP'.
*        lv_mth1 = 'AUG'.
*      WHEN '10'.
*        lv_mth = 'OCT'.
*        lv_mth1 = 'SEP'.
*      WHEN '11'.
*        lv_mth = 'NOV'.
*        lv_mth1 = 'OCT'.
*      WHEN '12'.
*        lv_mth = 'DEC'.
*        lv_mth1 = 'NOV'.
*      WHEN OTHERS.
*    ENDCASE.
*
*    LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
*      IF wa_yrva_qais_data-mou_begda < s_sptag-low.
*        it_data_monthly-kunnr = wa_yrva_qais_data-kunnr.
*        it_data_monthly-kvgr2 = wa_yrva_qais_data-kvgr2 .
*        it_data_monthly-vkbur  = wa_yrva_qais_data-vkbur.
*        it_data_monthly-begda = s_sptag-low.
*        it_data_monthly-endda = s_sptag-high.
*        lv_index_rpd = sy-tabix.
*        MOVE-CORRESPONDING wa_yrva_mstr_waiver_temp TO wa_yrva_mstr_waiver .
*        CASE s_sptag-low+4(2).
*          WHEN '1'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m10  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m9   * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m10.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m10.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m10   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m9 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m9 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m10.
*                  ENDIF.
*                ENDIF.
*
*              ENDIF.
*            ENDIF.
*
*          WHEN '2'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m11  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m10  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m11.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m11.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m11   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m10 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m10 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m11.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '3'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m12  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m11  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m12.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m12.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m12   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m11 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m11 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m12.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '4'.
*            CLEAR: it_data_monthly, wa_yrva_qais_data.
*            CONTINUE.
*
*          WHEN '5'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m2  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m1  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m2.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m2.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m2   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m1 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m1 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m2.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '6'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m3  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m2  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m3.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m3.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m3   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m2 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m2 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m3.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '7'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m4  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m3  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m4.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m4.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m4   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m3 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m3 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m4.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '8'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m5  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m4  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m5.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m5.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m5   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m4 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m4 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m5.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '9'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m6  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m5  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m6.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m6.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m6   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m5 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m5 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m6.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '10'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m7  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m6  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m7.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m7.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m7   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m6 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m6 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m7.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '11'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m8  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m7  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m8.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m8.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m8   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m7 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m7 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m8.
*                  ENDIF.
*                ENDIF.
*              ENDIF.
*            ENDIF.
*
*          WHEN '12'.
*            CLEAR: w_month_min_perc, w_month_min_perc1.
*            IF wa_yrva_mstr_waiver-rpd_m2 EQ lv_mth AND wa_yrva_mstr_waiver-rpd_m1 EQ lv_mth1.
*              w_month_min_perc = wa_yrva_mstr_waiver-rpd_perc_m1 / 100.
*              w_month_min_perc1 = wa_yrva_mstr_waiver-rpd_perc_m2 / 100.
*
*              w_month_min   =  wa_yrva_qais_data-commited_qty_m9  * w_month_min_perc.
*              w_month_min1  =  wa_yrva_qais_data-commited_qty_m8  * w_month_min_perc1 .
*
*              IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                it_data_monthly-grp_lift_qty = wa_yrva_qais_data-ind_lift_qty_m9.
*              ELSE.
*                READ TABLE it_yrva_qais_data_temp INTO wa_yrva_qais_data_temp
*                WITH KEY kvgr2 = wa_yrva_qais_data-kvgr2 .
*                IF sy-subrc EQ 0 .
*                  it_data_monthly-grp_lift_qty = wa_yrva_qais_data_temp-grp_lift_qty_m9.
*                ENDIF.
*              ENDIF.
*              wa_yrva_qais_data-grp_lift_qty_m9   = it_data_monthly-grp_lift_qty .
*              IF it_data_monthly-grp_lift_qty LT w_month_min .
*                CONTINUE.
*              ELSE.
*                IF wa_yrva_qais_data-kvgr2 IS INITIAL.
*                  IF wa_yrva_qais_data-ind_lift_qty_m8 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  it_data_monthly-grp_lift_qty.
*                  ENDIF.
*                ELSE.
*                  IF wa_yrva_qais_data-grp_lift_qty_m8 LT w_month_min1.
*                    CLEAR:  wa_yrva_qais_data, it_data_monthly.
*                    CONTINUE.
*                  ELSE.
*                    it_data_monthly-ind_elgl_qty =  wa_yrva_qais_data-ind_lift_qty_m9.
*                  ENDIF.
*                ENDIF.
*
*              ENDIF.
*            ENDIF.
*
*          WHEN OTHERS.
*        ENDCASE.
*
*        IF s_sptag-high+4(2) = '04'.
*          lv_mon =  'APRIL'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m1.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m1.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m1.
*        ELSEIF s_sptag-high+4(2) = '05' .
*          lv_mon =  'MAY'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m2.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m2.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m2..
*        ELSEIF s_sptag-high+4(2) = '06' .
*          lv_mon =  'JUNE'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m3.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m3.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m3.
*        ELSEIF s_sptag-high+4(2) = '07' .
*          lv_mon =  'JULY'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m4.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m4.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m4.
*        ELSEIF s_sptag-high+4(2) = '08' .
*          lv_mon =  'AUGUST'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m5.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m5.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m5..
*        ELSEIF s_sptag-high+4(2) = '09' .
*          lv_mon =  'SEPTEMBER'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m6.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m6.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m6.
*        ELSEIF s_sptag-high+4(2) = '10' .
*          lv_mon =  'OCTOBER'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m7.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m7.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m7.
*        ELSEIF s_sptag-high+4(2) = '11' .
*          lv_mon =  'NOVEMBER'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m8.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m8.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m8.
*        ELSEIF s_sptag-high+4(2) = '12' .
*          lv_mon =  'DECEMBER'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m9.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m9.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m9.
*        ELSEIF s_sptag-high+4(2) = '01' .
*          lv_mon =  'JANUARY'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m10.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m10.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m10.
*        ELSEIF s_sptag-high+4(2) = '02' .
*          lv_mon =  'FEBRUARY'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m11.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m11.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m11.
*        ELSEIF s_sptag-high+4(2) = '03' .
*          lv_mon =  'MARCH'.
*          it_data_monthly-commited_qty   = wa_yrva_qais_data-commited_qty_m12.
*          it_data_monthly-grp_lift_qty   = wa_yrva_qais_data-grp_lift_qty_m12.
*          it_data_monthly-ind_lift_qty   = wa_yrva_qais_data-ind_lift_qty_m12.
*        ENDIF.
**      calculate the discount
*        IF it_data_monthly-grp_lift_qty LT w_month_min .
*          CLEAR: it_data_monthly-ind_elgl_qty,w_flag_month  .
*        ELSEIF it_data_monthly-grp_lift_qty GT w_month_max .
*        ENDIF.
*
*        CLEAR: w_remarks, lv_fact, it_data_monthly-value.
*        lv_year1 = s_sptag-high+2(2).
*        lv_year2 = lv_year1 + 1.
*        CONCATENATE lv_year1 '-' lv_year2 INTO lv_dat.
*        IF r_month EQ 'X'.
*          CONCATENATE 'MQAIS' lv_dat lv_mon 'Discount' INTO w_remarks SEPARATED BY ' '.
*        ENDIF.
*        IF r_month1 EQ 'X'.
*          CONCATENATE 'MQAIS' lv_dat lv_mon ' Spl.Discount' INTO w_remarks SEPARATED BY ' '.
*        ENDIF.
*        IF r_rpd EQ 'X'.
*          CONCATENATE 'MQAIS' lv_dat lv_mon ' RPD.Discount' INTO w_remarks SEPARATED BY ' '.
*        ENDIF.
*        IF r_rpd EQ 'X'.
*          w_kbetr = wa_yrva_mstr_waiver-rpd_rate.
*        ENDIF.
*        IF r_month EQ 'X'.
*          SORT i_cond BY kstbm DESCENDING.
*          LOOP AT i_cond WHERE kstbm <= wa_yrva_qais_data-mou_qty . "IT_DATA_ANNUAL-TOT_ELGL_QTY.
*            lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
*            IF lv_fact GE w_month_min_perc OR w_waive_month EQ 'X' OR lv_flag1 EQ 'X' OR lv_flag2 EQ 'X'.
*              w_kbetr = i_cond-kbetr.
*            ELSE.
*              CLEAR: w_kbetr.
*            ENDIF.
*            EXIT.
*          ENDLOOP.
*        ENDIF.
*        IF r_month1 EQ 'X'.
*          SORT i_cond BY kstbm DESCENDING.
*          lv_fact = ( it_data_monthly-grp_lift_qty / it_data_monthly-commited_qty ) * 100.
*          LOOP AT i_cond WHERE kstbm <= lv_fact.
*            w_kbetr = i_cond-kbetr.
*            EXIT.
*          ENDLOOP.
*        ENDIF.
*        IF r_month EQ 'X'.
*          it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
*          IF it_data_monthly-value LT 0 .
*            it_data_monthly-value = it_data_monthly-value * -1 .
*          ENDIF.
*        ENDIF.
*        IF r_month1 EQ 'X'.
*          it_data_monthly-value   = it_data_monthly-ind_lift_qty * w_kbetr.
*          IF it_data_monthly-value LT 0 .
*            it_data_monthly-value = it_data_monthly-value * -1 .
*          ENDIF.
*        ENDIF.
*        IF r_rpd EQ 'X'.
*          it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty -wa_yrva_qais_data-lv_no_dis_qty.
*          it_data_monthly-value   = it_data_monthly-ind_elgl_qty * w_kbetr.
*          IF it_data_monthly-value LT 0 .
*            it_data_monthly-value = it_data_monthly-value * -1 .
*          ENDIF.
*        ENDIF.
*        it_data_monthly-ind_elgl_qty = it_data_monthly-ind_elgl_qty - wa_yrva_qais_data-lv_no_dis_qty.
*        IF it_data_monthly-ind_elgl_qty < 0.
*          it_data_monthly-ind_elgl_qty = 0.
*        ENDIF.
*        it_data_monthly-tot_elgl_qty =  it_data_monthly-ind_elgl_qty .
*
*        it_data_monthly-remarks = w_remarks.
*        APPEND it_data_monthly .
*        CLEAR: wa_yrva_qais_data-lv_no_dis_qty.
*        MODIFY it_yrva_qais_data FROM  wa_yrva_qais_data.
*        CLEAR: w_waive_month, lv_flag1,  w_kbetr, i_cond.
*
*      ENDIF.
*    ENDLOOP.
ENDFORM.9251
*&*
*&      Form  CREATE_FIELD_CATALOG
*&*
*       text
**
FORM create_field_catalog .
DATA: w_sr TYPE i.
w_sr = 1 .9260
gt_fieldcat-fieldname = 'CHECK'.
gt_fieldcat-key       = 'X' .
gt_fieldcat-outputlen    =  4.
gt_fieldcat-just         =  'C' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'FLAG'.
gt_fieldcat-seltext_m    = 'FLAG'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-checkbox     = 'X'.
gt_fieldcat-input        = 'X'.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9274
gt_fieldcat-fieldname = 'KUNNR'.
gt_fieldcat-key       = 'X' .
gt_fieldcat-outputlen    =  10.
gt_fieldcat-just         =  'C' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'Customer'.
gt_fieldcat-seltext_m    = 'Customer'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9287
gt_fieldcat-fieldname = 'NAME1'.
gt_fieldcat-key       = 'X' .
gt_fieldcat-outputlen    =  35.
gt_fieldcat-just         =  'L' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'Customer Name'.
gt_fieldcat-seltext_m    = 'Customer Name'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9300
gt_fieldcat-fieldname = 'KVGR2'.
*  GT_FIELDCAT-key       = 'X' .
gt_fieldcat-outputlen    =  6.
gt_fieldcat-just         =  'C' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'Grp Co.'.
gt_fieldcat-seltext_m    = 'Grp Co.'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9313
gt_fieldcat-fieldname = 'VKBUR'.
*  GT_FIELDCAT-key       = 'X' .
gt_fieldcat-outputlen    =  10.
gt_fieldcat-just         =  'L' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'Sales Office'.
gt_fieldcat-seltext_m    = 'Sales Office'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9326
IF r_quater = 'X' .
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY_M1'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty JAN'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty APR'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty JUL'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty OCT'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9346
  gt_fieldcat-fieldname = 'IND_LIFT_QTY_M1'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty JAN'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty APR'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty JUL'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty OCT'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9365
  gt_fieldcat-fieldname = 'IND_ELGL_QTY_M1'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty JAN'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty APR'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty JUL'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty OCT'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .93849385
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY_M2'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Feb'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty May'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Aug'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Nov'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9404
  gt_fieldcat-fieldname = 'IND_LIFT_QTY_M2'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Feb'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty May'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Aug'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Nov'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9423
  gt_fieldcat-fieldname = 'IND_ELGL_QTY_M2'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Feb'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty May'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Aug'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Nov'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .944294439444
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY_M3'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Mar'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Jun'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Sept'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Grp Lifted Qty Dec'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9463
  gt_fieldcat-fieldname = 'IND_LIFT_QTY_M3'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Mar'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Jun'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Sept'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Lifted Qty Dec'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9482
  gt_fieldcat-fieldname = 'IND_ELGL_QTY_M3'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'R' .
  gt_fieldcat-col_pos      =   w_sr.
  IF w_q4 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Mar'.
  ELSEIF w_q1 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Jun'.
  ELSEIF w_q2 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Sept'.
  ELSEIF w_q3 = 'X' .
    gt_fieldcat-seltext_m    = 'Ind Eligbl Qty Dec'.
  ENDIF.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .
ELSEIF r_annual = 'X' .
  gt_fieldcat-fieldname = 'MOU_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Annual Committed Qty'.
  gt_fieldcat-seltext_m    = 'Annual Committed Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9513
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Grp Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Grp Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9525
  gt_fieldcat-fieldname = 'IND_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Ind Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Ind Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9537
*    gt_fieldcat-fieldname = 'IND_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Ind Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Ind Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9549
*    gt_fieldcat-fieldname = 'TOT_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Total Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Total Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9561
  gt_fieldcat-fieldname = 'WAIVER_1'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'First Waiver'.
  gt_fieldcat-seltext_m    = 'First Waiver'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .
  gt_fieldcat-fieldname = 'WAIVER_2'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Second Waiver'.
  gt_fieldcat-seltext_m    = 'Second Waiver'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9584
*    GT_FIELDCAT-FIELDNAME = 'WAIVER_3'.
*    GT_FIELDCAT-OUTPUTLEN    =  15.
*    GT_FIELDCAT-JUST         =  'L' .
*    GT_FIELDCAT-COL_POS      =  W_SR.
*    GT_FIELDCAT-SELTEXT_S    = 'Third Waiver'.
*    GT_FIELDCAT-SELTEXT_M    = 'Third Waiver'.
*    GT_FIELDCAT-DDICTXT      = 'M'.
*    GT_FIELDCAT-DO_SUM       = SPACE.
*    APPEND GT_FIELDCAT.
*    CLEAR GT_FIELDCAT.
*    W_SR = W_SR  + 1  .
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**    gt_fieldcat-fieldname = 'LOYAL_DISCOUNT'.
**    gt_fieldcat-outputlen    =  15.
**    gt_fieldcat-just         =  'L' .
**    gt_fieldcat-col_pos      =  w_sr.
**    gt_fieldcat-seltext_s    = 'Consist Discount'.
**    gt_fieldcat-seltext_m    = 'Consistency Discount' .
**    gt_fieldcat-ddictxt      = 'M'.
**    gt_fieldcat-do_sum       = space.
**    APPEND gt_fieldcat.
**    CLEAR gt_fieldcat.
**    w_sr = w_sr  + 1  .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount9610
***SOC Adarsh/Archana charm:4000006427 TR:DVRK9A12BV
ELSEIF r_consis = 'X' .
  gt_fieldcat-fieldname = 'MOU_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Annual Committed Qty'.
  gt_fieldcat-seltext_m    = 'Annual Committed Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9624
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Grp Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Grp Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9636
  gt_fieldcat-fieldname = 'IND_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Ind Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Ind Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9648
*    gt_fieldcat-fieldname = 'IND_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Ind Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Ind Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9660
*    gt_fieldcat-fieldname = 'TOT_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Total Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Total Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9672
*    gt_fieldcat-fieldname = 'WAIVER_1'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'First Waiver'.
*    gt_fieldcat-seltext_m    = 'First Waiver'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .
*    gt_fieldcat-fieldname = 'WAIVER_2'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Second Waiver'.
*    gt_fieldcat-seltext_m    = 'Second Waiver'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9695
*    GT_FIELDCAT-FIELDNAME = 'WAIVER_3'.
*    GT_FIELDCAT-OUTPUTLEN    =  15.
*    GT_FIELDCAT-JUST         =  'L' .
*    GT_FIELDCAT-COL_POS      =  W_SR.
*    GT_FIELDCAT-SELTEXT_S    = 'Third Waiver'.
*    GT_FIELDCAT-SELTEXT_M    = 'Third Waiver'.
*    GT_FIELDCAT-DDICTXT      = 'M'.
*    GT_FIELDCAT-DO_SUM       = SPACE.
*    APPEND GT_FIELDCAT.
*    CLEAR GT_FIELDCAT.
*    W_SR = W_SR  + 1  .9707
***EOC Adarsh/Archana charm:4000006427 TR:DVRK9A12BV
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V9714
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' .
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  gt_fieldcat-fieldname = 'COMMITED_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Commited Qty'.
  gt_fieldcat-seltext_m    = 'Commited Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9728
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Grp Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Grp Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9740
  gt_fieldcat-fieldname = 'IND_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Ind Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Ind Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
*    IF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X'OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm : 4000007222
  IF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X'OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by ChilukuriTripura Reddy/Archna/Vishal Charm : 4000007222
*    IF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X'OR r_rlld EQ 'X'.
*    IF r_month EQ 'X' OR r_rpd EQ 'X' OR r_month1 EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    gt_fieldcat-fieldname = 'IND_ELGL_QTY'.
    gt_fieldcat-outputlen    =  15.
    gt_fieldcat-just         =  'L' .
    gt_fieldcat-col_pos      =  w_sr.
    gt_fieldcat-seltext_s    = 'Ind Eligible Qty'.
    gt_fieldcat-seltext_m    = 'Ind Eligible Qty'.
    gt_fieldcat-ddictxt      = 'M'.
    gt_fieldcat-do_sum       = space.
    APPEND gt_fieldcat.
    CLEAR gt_fieldcat.
    w_sr = w_sr  + 1  .
  ENDIF.
ELSEIF r_newcus = 'X'. "VIVEk
  gt_fieldcat-fieldname = 'MOU_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Annual Committed Qty'.
  gt_fieldcat-seltext_m    = 'Annual Committed Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9782
  gt_fieldcat-fieldname = 'GRP_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Grp Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Grp Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9794
  gt_fieldcat-fieldname = 'IND_LIFT_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Ind Lifted Qty'.
  gt_fieldcat-seltext_m    = 'Ind Lifted Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .9806
*    gt_fieldcat-fieldname = 'IND_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Ind Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Ind Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9818
*    gt_fieldcat-fieldname = 'TOT_ELGL_QTY'.
*    gt_fieldcat-outputlen    =  15.
*    gt_fieldcat-just         =  'L' .
*    gt_fieldcat-col_pos      =  w_sr.
*    gt_fieldcat-seltext_s    = 'Total Eligible Qty'.
*    gt_fieldcat-seltext_m    = 'Total Eligible Qty'.
*    gt_fieldcat-ddictxt      = 'M'.
*    gt_fieldcat-do_sum       = space.
*    APPEND gt_fieldcat.
*    CLEAR gt_fieldcat.
*    w_sr = w_sr  + 1  .9830
  gt_fieldcat-fieldname = 'WAIVER_1'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'First Waiver'.
  gt_fieldcat-seltext_m    = 'First Waiver'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .
  gt_fieldcat-fieldname = 'WAIVER_2'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Second Waiver'.
  gt_fieldcat-seltext_m    = 'Second Waiver'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .
  gt_fieldcat-fieldname = 'WAIVER_3'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L' .
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Third Waiver'.
  gt_fieldcat-seltext_m    = 'Third Waiver'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.9863
  w_sr = w_sr  + 1  .
ENDIF.
******************************BOC by Sachin Kaul(TCS) n Atul Singhal on12.1.16*******************************
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
**  IF r_month1 NE 'X'  AND r_rhd NE 'X' AND r_rlld NE 'X' AND r_month NE 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
IF r_month1 NE 'X' AND r_month NE 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
*            IF r_month NE 'X' AND r_month1 NE 'X' AND r_rpd NE 'X'.
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  gt_fieldcat-fieldname = 'TOT_ELGL_QTY'.
  gt_fieldcat-outputlen    =  15.
  gt_fieldcat-just         =  'L'.
  gt_fieldcat-col_pos      =  w_sr.
  gt_fieldcat-seltext_s    = 'Total Eligible Qty'.
  gt_fieldcat-seltext_m    = 'Total Eligible Qty'.
  gt_fieldcat-ddictxt      = 'M'.
  gt_fieldcat-do_sum       = space.
  APPEND gt_fieldcat.
  CLEAR gt_fieldcat.
  w_sr = w_sr  + 1  .98839884
ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 40000090059887
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
*  IF r_lty = 'X'.
*    gt_fieldcat-seltext_m  = 'Loyalty Discount'.
*    ENDIF.
******************************EOC by Sachin Kaul(TCS) n Atul Singhal on12.1.16*******************************9893
gt_fieldcat-fieldname = 'VALUE'.9895
gt_fieldcat-outputlen    =  25.
gt_fieldcat-just         =  'L'.
gt_fieldcat-col_pos      =  w_sr.
IF r_month = abap_true OR r_annual = abap_true.
  gt_fieldcat-ddictxt      = 'M'.
ELSE.
  gt_fieldcat-ddictxt      = 'L'.
ENDIF.9904
IF r_quater = 'X'.
  gt_fieldcat-seltext_m  = 'Quaterly Discount' .
ELSEIF r_annual = 'X'.
  gt_fieldcat-seltext_m  = 'Annual Discount' .
ELSEIF r_month = 'X'.
  gt_fieldcat-seltext_m  = 'Monthly Discount'.
ELSEIF r_month1 = 'X'.
  gt_fieldcat-seltext_m  = 'Spl.Monthly Discount'.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
ELSEIF r_rhd = 'X'.
**    gt_fieldcat-seltext_m  = 'Spl. HDPE Monthly Discount'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_m  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_l  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
ELSEIF r_rlld = 'X'.
**    gt_fieldcat-seltext_m  = 'Addl.PSD Monthly Discount'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_m  = 'Addnl.CIS Linked PSD Dec 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_l  = 'Addnl.CIS Linked PSD Dec 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
ELSEIF r_rpd = 'X'.
  gt_fieldcat-seltext_m  = 'RPD.Monthly Discount'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
ELSEIF r_newcus = 'X' . "vivek
  gt_fieldcat-seltext_m  = 'Annual Discount'.9927
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
ELSEIF c_maint = 'X' . "vivek
**    gt_fieldcat-seltext_m  = 'Other Discount'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_m  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_l  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF c_maint1 = 'X' . "vivek
**    gt_fieldcat-seltext_m  = 'Other Discount1'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_m  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
  gt_fieldcat-seltext_l  = 'Addnl.CIS Linked PSD Nov 24'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000009005
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***SOC Adarsh/Archana against charm:4000006427, TR:DVRK9A12BV
ELSEIF r_consis = 'X' .
  gt_fieldcat-seltext_m  = 'Annual Consist. Discount'.
***EOC Adarsh/Archana against charm:4000006427, TR:DVRK9A12BV9944
ENDIF.9946
**  gt_fieldcat-ddictxt      = 'M'." SOC Commented by Chilukuri TripuraReddy/Archna/Vishal Charm: 4000009005
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .99529953
gt_fieldcat-fieldname = 'REMARKS'.
*  GT_FIELDCAT-OUTPUTLEN    =  30. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222 date: 12/10/2023
gt_fieldcat-outputlen    =  40.  " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222 date: 12/10/2023
gt_fieldcat-just         =  'L' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'REMARKS'.
gt_fieldcat-seltext_m    = 'REMARKS'.
gt_fieldcat-ddictxt      = 'M'.
*  GT_FIELDCAT-CHECKBOX     = 'X'.
gt_fieldcat-input        = 'X'.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .9967
gt_fieldcat-fieldname = 'SALE_ORDER'.
gt_fieldcat-outputlen    =  15.
gt_fieldcat-just         =  'L' .
gt_fieldcat-col_pos      =  w_sr.
gt_fieldcat-seltext_s    = 'Sales Order'.
gt_fieldcat-seltext_m    = 'Sales Order'.
gt_fieldcat-ddictxt      = 'M'.
gt_fieldcat-do_sum       = space.
APPEND gt_fieldcat.
CLEAR gt_fieldcat.
w_sr = w_sr  + 1  .99799980
*
i_exit_event-ucomm = 'FCOD'.
i_exit_event-before = 'X'.
i_exit_event-after = ''.
APPEND i_exit_event.
CLEAR i_exit_event.9987
i_exit_event-ucomm = 'CALC'.
i_exit_event-before = 'X'.
i_exit_event-after = ''.
APPEND i_exit_event.
CLEAR i_exit_event.9993
i_exit_event-ucomm = 'SALL'.
i_exit_event-before = 'X'.
i_exit_event-after = 'X'.
APPEND i_exit_event.
CLEAR i_exit_event.9999
i_exit_event-ucomm = 'DSAL'.
i_exit_event-before = 'X'.
i_exit_event-after = 'X'.
APPEND i_exit_event.
CLEAR i_exit_event.10005
i_events-name = 'USER_COMMAND'.
i_events-form = 'ON_SELECTION'.
APPEND i_events.
CLEAR i_events.
ENDFORM.                    " CREATE_FIELD_CATALOG
*&*
*&      Form  QAIS_REMARKS
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM qais_remarks .
IF r_quater = 'X' .
  CONCATENATE 'CIS' w_fiscal INTO w_remarks SEPARATED BY space.
  IF w_q4 = 'X' .
    CONCATENATE w_remarks 'Q4' INTO w_remarks SEPARATED BY space.
  ELSEIF w_q1 = 'X' .
    CONCATENATE w_remarks 'Q1' INTO w_remarks SEPARATED BY space.
  ELSEIF w_q2 = 'X' .
    CONCATENATE w_remarks 'Q2' INTO w_remarks SEPARATED BY space.
  ELSEIF w_q3 = 'X' .
    CONCATENATE w_remarks 'Q3' INTO w_remarks SEPARATED BY space.
  ENDIF.10031
ELSEIF r_annual = 'X'.
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**    CONCATENATE 'MQAIS' w_fiscal 'Annual & Consistency' INTO w_remarksSEPARATED BY space.
  CONCATENATE 'CIS' w_fiscal 'Annual' INTO w_remarks SEPARATED BY space.
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-202110037
***SOC Adarsh/Archana against charm: 4000006427 TR:DVRK9A12BV
ELSEIF r_consis = 'X'.
  CONCATENATE 'CIS' w_fiscal 'Annual Consistency' INTO w_remarks SEPARATED BY space.10041
***EOC Adarsh/Archana against charm: 4000006427 TR:DVRK9A12BV10043
ELSEIF r_month = 'X'.
  w_remarks = 'CIS Monthly Discount' .
ELSEIF r_month1 = 'X'.
  w_remarks = 'CIS Special Monthly Discount' .
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
ELSEIF r_rhd = 'X'.
  w_remarks = 'CIS Special HDPE Monthly Discount' .
ELSEIF r_rlld = 'X'.
  w_remarks = 'CIS Special LLDPE Monthly Discount' .
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
ELSEIF r_rpd = 'X'.
  w_remarks = 'CIS Repeat Performance Discount' .
ELSEIF r_newcus = 'X' ."vivek
  CONCATENATE 'CIS' w_fiscal 'Addl. Annual Disc' INTO w_remarks SEPARATED BY space.
ELSEIF c_maint = 'X'.
  w_remarks = 'CIS Other Discount' .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF c_maint1 = 'X'.
  w_remarks = 'CIS Other Discount1' .
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ENDIF.
CONDENSE w_remarks .
ENDFORM.
*&*
*&      Form  TOP_OF_PAGE
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM top_of_page .10076
ENDFORM.                    " TOP_OF_PAGE
*&*
*&      Form  on_selection
*&*
*       text
**
*>R_UCOMM    text
*>RS_SELFIELDtext
**
FORM on_selection USING r_ucomm LIKE sy-ucomm
                      rs_selfield TYPE slis_selfield.
DATA: itab TYPE TABLE OF sy-ucomm,
      w_ln TYPE i.10090
APPEND 'CALC' TO itab.
APPEND 'FCOD' TO itab.
APPEND '&ALL' TO itab.
APPEND '&SAL' TO itab.
APPEND '&F03' TO itab.10096
CASE r_ucomm.
  WHEN 'CALC'.
    SET PF-STATUS 'STANDARD'.10100
    rs_selfield-refresh    = 'X'.10102
*Execute Button
  WHEN 'FCOD'.
    IF lv_siml EQ 'X'.
      MESSAGE e000(yv01) WITH ' Record can not be processed in SIMULATION MODE'.
      EXIT.
    ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
** To check All selected
 REFRESH: it_dataselm[].
 LOOP AT it_data_monthly WHERE check = 'X'.
  APPEND it_data_monthly TO it_dataselm[].
 ENDLOOP.
 LOOP AT it_dataselm INTO DATA(ls_dataselm).
  CLEAR: ls_kvgr2.
  ls_kvgr2 = ls_dataselm-kvgr2.
  IF ls_kvgr2 IS INITIAL.
   CONTINUE.
  ENDIF.
  LOOP AT it_data_monthly WHERE kvgr2 = ls_kvgr2.
   ls_grpcu-kunnr = it_data_monthly-kunnr.
   ls_grpcu-kvgr2 = it_data_monthly-kvgr2.
   APPEND ls_grpcu TO lt_grpcu.
  ENDLOOP.
  LOOP AT lt_grpcu INTO ls_grpcu.
   READ TABLE it_dataselm INTO DATA(ls_dataselm2) WITH KEY kunnr = ls_grpcu-kunnr.
   IF sy-subrc NE 0 AND ls_dataselm2 IS INITIAL.
    MESSAGE 'Partial selection of group customers is not allowed, Please select all customers in the group' TYPE 'E'.
    EXIT.
   ENDIF.
   CLEAR: ls_grpcu, ls_dataselm2.
  ENDLOOP.
  REFRESH: lt_grpcu[].
  CLEAR: ls_dataselm, ls_dataselm2, ls_grpcu.
 ENDLOOP.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 2000001050
    CLEAR: it_vbak[], it_vbak.
    SET PF-STATUS 'STANDARD' OF PROGRAM 'SAPLSALV'
                            EXCLUDING itab.
    PERFORM top_of_page.
*Check if order is already created
    IF r_quater = 'X' .
      DELETE it_data_quater WHERE check <> 'X'.
      IF it_data_quater[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_quater
          WHERE kunnr = it_data_quater-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_quater-vkbur
        AND reb_cond = 'ZQIS'.
      ENDIF.10154
    ELSEIF r_consis = 'X'.
      DELETE it_annual_consis WHERE check <> 'X'.
      IF it_annual_consis[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_annual_consis
          WHERE kunnr = it_annual_consis-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_annual_consis-vkbur
        AND reb_cond = 'ZACD'.
*          CLEAR: it_yrva_rebate.
      ENDIF.10167
    ELSEIF r_annual = 'X'.
      DELETE it_data_annual WHERE check <> 'X'.
      IF it_data_annual[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_annual
          WHERE kunnr = it_data_annual-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_annual-vkbur
        AND reb_cond = 'ZAIS'.
      ENDIF.
    ELSEIF r_month = 'X' .
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'ZMIS'.
      ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    ELSEIF r_month1 = 'X'.
*          ELSEIF r_month1 = 'X' .
**eOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'ZAMS'.
      ENDIF.
    ELSEIF  r_rhd = 'X' .
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'PE07'.
      ENDIF.
    ELSEIF  r_rlld = 'X'.
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'PE08'.
      ENDIF.
    ELSEIF r_rpd = 'X' .
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'ZRPD'.
      ENDIF.
    ELSEIF r_newcus = 'X' ."vivek
      DELETE it_data_annual_newcus WHERE check <> 'X'.
      IF it_data_annual_newcus[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_annual_newcus
          WHERE kunnr = it_data_annual_newcus-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_annual_newcus-vkbur
        AND reb_cond = 'PE12'.
      ENDIF.10248
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
    ELSEIF  c_maint = 'X'.
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
**          AND reb_cond = 'ZP21'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
        AND reb_cond = 'PE32'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      ENDIF.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    ELSEIF  c_maint1 = 'X'.
      DELETE it_data_monthly WHERE check <> 'X' .
      IF it_data_monthly[] IS NOT INITIAL.
        SELECT * FROM yrva_rebate INTO TABLE it_yrva_rebate
          FOR ALL ENTRIES IN it_data_monthly
          WHERE kunnr = it_data_monthly-kunnr
          AND yy_per_start = s_sptag-low
          AND yy_per_end = s_sptag-high
          AND vkbur = it_data_monthly-vkbur
        AND reb_cond = 'PE31'.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    ENDIF.
    IF it_yrva_rebate[] IS INITIAL.
      REFRESH it_yrva_rebate.1027910280
*         IF it_annual_consis[] IS NOT INITIAL.
*           READ TABLE it_yrva_qais_data INTO DATA(w_yrva_qais-data) with key kunnr = it_annual_consis-kunnr.
*           IF sy-subrc EQ 0.
*             if w_
*             ENDIF.
*
*         ENDIF.1028810289
*SOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*        LOOP AT it_data_monthly INTO wa_data_monthly WHERE check = 'X'.
*          IF r_month = 'X' AND wa_data_monthly-kvgr2 IS NOT INITIAL ANDwa_data_monthly-ind_lift_qty IS INITIAL.
*            CONCATENATE 'MQAISGR' wa_data_monthly-kvgr2 INTO wa_data_monthly-sale_order.
*            MODIFY it_data_monthly[] FROM wa_data_monthly.
*            lv_sales_order = 'X'.
*          ENDIF.
*        ENDLOOP.
**EOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*        IF lv_sales_order NE 'X'.
      PERFORM create_sale_order.
*        ENDIF.
    ELSE.
      MESSAGE 'Credit Memo Request already created for some selected items' TYPE 'I' .
    ENDIF.
    rs_selfield-refresh    = 'X'.10306
*Execute Select All
  WHEN 'SALL'.
    SET PF-STATUS 'STANDARD' OF PROGRAM 'YRVG004_QAIS_EXECUTE'.
    IF r_quater = 'X' .
      LOOP AT it_data_quater .
        it_data_quater-check = 'X' .
        MODIFY it_data_quater.
      ENDLOOP.10315
    ELSEIF r_annual = 'X'..
      LOOP AT it_data_annual .
        it_data_annual-check = 'X' .
        MODIFY it_data_annual.
      ENDLOOP.10321
*****SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      ELSEIF R_MONTH = 'X' OR  R_MONTH1 = 'X' OR R_RHD = 'X' OR R_RLLD= 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    ELSEIF r_month = 'X' OR  r_month1 = 'X' OR r_rhd = 'X' OR r_rlld ='X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*      ELSEIF r_month = 'X' OR  r_month1 = 'X' OR r_rhd = 'X' OR r_rlld= 'X' .
*****EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V10327
      LOOP AT it_data_monthly .
        it_data_monthly-check  = 'X'.
        MODIFY it_data_monthly.
      ENDLOOP.
    ELSEIF r_newcus = 'X' ."Vivek
      LOOP AT it_data_annual_newcus .
        it_data_annual_newcus-check = 'X' .
        MODIFY it_data_annual_newcus.
      ENDLOOP.
    ENDIF.
    rs_selfield-refresh    = 'X'.10339
*Execute deselect All
  WHEN 'DSAL'.
    SET PF-STATUS 'STANDARD' OF PROGRAM 'YRVG004_QAIS_EXECUTE'.
    IF r_quater = 'X' .
      LOOP AT it_data_quater .
        CLEAR  it_data_quater-check  .
        MODIFY it_data_quater.
      ENDLOOP.
    ELSEIF r_annual = 'X'.
      LOOP AT it_data_annual .
        CLEAR it_data_annual-check  .
        MODIFY it_data_annual.
      ENDLOOP.
*****SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      ELSEIF R_MONTH = 'X' OR  R_MONTH1 = 'X' OR R_RHD = 'X' OR R_RLLD= 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    ELSEIF r_month = 'X' OR  r_month1 = 'X' OR r_rhd = 'X' OR r_rlld ='X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*      ELSEIF r_month = 'X' OR  r_month1 = 'X' OR r_rhd = 'X' OR r_rlld= 'X' .
*****EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      ELSEIF r_month = 'X' OR  r_month1 = 'X' OR r_rhd = 'X' OR r_rlld= 'X' .
      LOOP AT it_data_monthly .
        CLEAR it_data_monthly-check  .
        MODIFY it_data_monthly.
      ENDLOOP.
    ELSEIF r_newcus = 'X' ."VIVEK
      LOOP AT it_data_annual_newcus .
        CLEAR it_data_annual_newcus-check  .
        MODIFY it_data_annual_newcus.
      ENDLOOP.
    ENDIF.
    rs_selfield-refresh    = 'X'.
  WHEN OTHERS.10371
ENDCASE.
ENDFORM.                    "on_selection
*&*
*&      Form  DISPLAY_LIST
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM display_list .
IF r_quater = 'X' .
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_callback_program       = 'YRVG004_QAIS_EXECUTE'
      i_callback_pf_status_set = 'PF_STATUS_SET'
      is_layout                = i_layout
      it_fieldcat              = gt_fieldcat[]
      it_events                = i_events[]
      it_event_exit            = i_exit_event[]
    TABLES
      t_outtab                 = it_data_quater[]
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
ELSEIF r_annual = 'X'.
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_callback_program       = 'YRVG004_QAIS_EXECUTE'
      i_callback_pf_status_set = 'PF_STATUS_SET'
      is_layout                = i_layout
      it_fieldcat              = gt_fieldcat[]
      it_events                = i_events[]
      it_event_exit            = i_exit_event[]
      i_save                   = 'A'
    TABLES
      t_outtab                 = it_data_annual[]
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount10421
***SOC by Adarsh/Archana on Charm 4000006427, TR: DVRK9A12BV
ELSEIF r_consis = 'X'.
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_callback_program       = 'YRVG004_QAIS_EXECUTE'
      i_callback_pf_status_set = 'PF_STATUS_SET'
      is_layout                = i_layout
      it_fieldcat              = gt_fieldcat[]
      it_events                = i_events[]
      it_event_exit            = i_exit_event[]
      i_save                   = 'A'
    TABLES
      t_outtab                 = it_annual_consis[]
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
***EOC by Adarsh/Archana on Charm 4000006427, TR: DVRK9A12BV
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V10448
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' .
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_callback_program       = 'YRVG004_QAIS_EXECUTE'
      i_callback_pf_status_set = 'PF_STATUS_SET'
      is_layout                = i_layout
      it_fieldcat              = gt_fieldcat[]
      it_events                = i_events[]
      it_event_exit            = i_exit_event[]
    TABLES
      t_outtab                 = it_data_monthly[]
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
ELSEIF r_newcus = 'X' . "Vivek
  CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
    EXPORTING
      i_callback_program       = 'YRVG004_QAIS_EXECUTE'
      i_callback_pf_status_set = 'PF_STATUS_SET'
      is_layout                = i_layout
      it_fieldcat              = gt_fieldcat[]
      it_events                = i_events[]
      it_event_exit            = i_exit_event[]
      i_save                   = 'A'
    TABLES
      t_outtab                 = it_data_annual_newcus[]
    EXCEPTIONS
      program_error            = 1
      OTHERS                   = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
ENDIF.10488
ENDFORM.                    " DISPLAY_LIST
*&*
*&      Form  CREATE_SALE_ORDER
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM create_sale_order .
DATA: l_tabix   TYPE sy-tabix,
      l_tabix1  TYPE sy-tabix,
      lv_tabix  TYPE char3,
      lv_string TYPE char10,
      yv_flag   TYPE i,
      yv_flag1  TYPE i,
      lv_so     TYPE c.
DATA: BEGIN OF l_ind_elgl_qty_m ,
        ind_elgl_qty_m1  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m2  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m3  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m4  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m5  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m6  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m7  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m8  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m9  TYPE y_ind_elgl_m1,
        ind_elgl_qty_m10 TYPE y_ind_elgl_m1,
        ind_elgl_qty_m11 TYPE y_ind_elgl_m1,
        ind_elgl_qty_m12 TYPE y_ind_elgl_m1,
      END OF l_ind_elgl_qty_m .10520
IF r_quater = 'X' .
  CLEAR: lv_so,  yv_flag .
  SORT  it_data_quater BY value DESCENDING.
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quater group.
  LOOP AT it_data_quater WHERE check = 'X' AND value GE 0.
    yv_flag = it_data_quater-tot_elgl_qty + yv_flag.
  ENDLOOP.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Quater group.
  LOOP AT it_data_quater WHERE check = 'X' AND value GE 0.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    MOVE sy-tabix TO lv_tabix.
    CLEAR : w_auart,
            w_matnr,
            w_objtype,
            x_order_header_in,
            i_order_partners,
            i_order_items_in.10540
    REFRESH : i_order_partners,
              i_order_items_in.
    IF it_data_quater-sale_order IS NOT INITIAL.
      WRITE : / 'Credit Memo Request already created',it_data_quater-sale_order .
      EXIT.
    ENDIF.
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V COMMENTING LINE
*      IF it_data_quater-value GT 0.
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V COMMENTING LINE
    w_auart = 'ZP09'.
    w_matnr = 'REBATE(POLYMER)'.10552
    x_order_header_in-doc_type   = w_auart.
    x_order_header_in-sales_org  = '5000'.
    x_order_header_in-distr_chan = '10'.
    x_order_header_in-division   = '20'.
    x_order_header_in-ord_reason = 'G21'.
    x_order_header_in-sales_off  = it_data_quater-vkbur.
    x_order_header_in-cd_type1   =   'ZCMU'.
    x_order_header_in-cd_value1    =  it_data_quater-value / 10 .
*   block the billing for 1st quarter of 2013
    IF s_sptag-high EQ '20130630' .
      x_order_header_in-bill_block = '08' .
      w_vbeln = 'Q1-Manual' .
    ELSE.
*REMARKS
      x_order_header_in-purch_no   = it_data_quater-remarks.10568
* PARTENER DETAILS
      i_order_partners-partn_role  = 'AG'.
      i_order_partners-partn_numb  = it_data_quater-kunnr.
      APPEND i_order_partners.10573
* ITEM DETAILS
      i_order_items_in-material   = w_matnr.
      i_order_items_in-target_qty = it_data_quater-tot_elgl_qty * 1000.
      APPEND i_order_items_in.
*
      w_objtype = 'BUS2094'.1058010581
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V10583
      CLEAR yv_flag1.
      IF it_data_quater-kvgr2 IS INITIAL.
        IF it_data_quater-tot_elgl_qty IS INITIAL.
          IF w_quater_min IS NOT INITIAL.
            w_vbeln = ''.
            yv_flag1 = '1'.
          ENDIF.
          IF w_quater_min IS INITIAL AND it_data_quater-tot_elgl_qty IS INITIAL.
            MOVE 'CIS OK 'TO w_vbeln .
            yv_flag1 = '1'.
          ENDIF..
          READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
          WITH KEY kunnr = it_data_quater-kunnr kvgr2 = it_data_quater-kvgr2
          vkbur = it_data_quater-vkbur.
          IF sy-subrc EQ 0 .
** -> Begin of changes by of Aditi on 05.12.2024 13:00:58 for ATC
*              SELECT SINGLE * FROM yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv
*              WHERE qais_no = wa_yrva_qais_data-qais_no AND quarter = lv_q  .
            SELECT * FROM yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv
            UP TO 1 ROWS
            WHERE qais_no = wa_yrva_qais_data-qais_no AND quarter = lv_q
            ORDER BY PRIMARY KEY.
            ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 13:01:04 for ATC
            IF sy-subrc EQ 0 AND it_data_quater-value EQ 0.
              MOVE 'CIS OK 'TO w_vbeln .
              yv_flag1 = '1'.
            ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
** -> Begin of changes by of Aditi on 05.12.2024 13:03:59 for ATC
*              SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
*                              WHERE qais_no = wa_yrva_qais_data-qais_no.
            SELECT * FROM yrva_revival_fai INTO wa_yrva_revival_fai
                            UP TO 1 ROWS
                            WHERE qais_no = wa_yrva_qais_data-qais_no
                            ORDER BY PRIMARY KEY.
            ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 13:04:03 for ATC
            IF sy-subrc EQ 0 AND it_data_quater-value EQ 0.
              MOVE 'CIS OK 'TO w_vbeln .
              yv_flag1 = '1'.
            ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          ENDIF.
        ENDIF.
      ELSE.
        IF it_data_quater-tot_elgl_qty IS INITIAL AND it_data_quater-grp_lift_qty_m1 IS NOT INITIAL AND yv_flag IS NOT INITIAL.
          CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
          yv_flag1 = '1'.
        ENDIF.
        IF w_quater_min IS INITIAL AND it_data_quater-tot_elgl_qty ISINITIAL.
          CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
          yv_flag1 = '1'.
        ENDIF.
        IF it_data_quater-tot_elgl_qty IS INITIAL AND w_quater_min ISNOT INITIAL AND wa_yrva_qais_qtr_wv IS INITIAL AND yv_flag IS INITIAL.
          w_vbeln = ''.
          yv_flag1 = '1'.
        ENDIF.
        READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
                  WITH KEY kunnr = it_data_quater-kunnr kvgr2 = it_data_quater-kvgr2
                  vkbur = it_data_quater-vkbur.
        IF sy-subrc EQ 0.
          SELECT SINGLE * FROM yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv
          WHERE qais_no = wa_yrva_qais_data-qais_no AND quarter = lv_q.
          IF sy-subrc EQ 0 AND it_data_quater-value EQ 0.
            CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
            MOVE lv_string TO w_vbeln.
            CLEAR: lv_tabix, lv_string.
            yv_flag1 = '1'.
          ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
** -> Begin of changes by of Aditi on 05.12.2024 12:58:15 for ATC
*            SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
*            WHERE qais_no = wa_yrva_qais_data-qais_no.
          SELECT * FROM yrva_revival_fai INTO wa_yrva_revival_fai
          UP TO 1 ROWS
          WHERE qais_no = wa_yrva_qais_data-qais_no
          ORDER BY PRIMARY KEY.
          ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 12:58:22 for ATC
          IF sy-subrc EQ 0 AND it_data_quater-value EQ 0.
            CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
            MOVE lv_string TO w_vbeln.
            CLEAR: lv_tabix, lv_string.
            yv_flag1 = '1'.
          ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
        ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
        IF it_data_quater-tot_elgl_qty IS INITIAL AND w_quater_min ISNOT INITIAL AND wa_yrva_revival_fai IS INITIAL AND yv_flag IS INITIAL .
          w_vbeln = ''.
          yv_flag1 = '1'.
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
      ENDIF.10683
      IF yv_flag1 IS INITIAL.
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
        CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA'
          EXPORTING
            order_header_in = x_order_header_in
            business_object = w_objtype
            without_commit  = ' '
          IMPORTING
            salesdocument   = w_vbeln
            sold_to_party   = x_sold_to_party
            return          = x_return_commit
          TABLES
            order_items_in  = i_order_items_in
            order_partners  = i_order_partners.
      ENDIF.
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
    ENDIF.
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
*      IF w_vbeln IS INITIAL.
*        WRITE : / 'ERROR MESSAGE :',x_return_commit-message.
*      ELSE.
*        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
*          EXPORTING
*            wait = 'X'.
    IF w_vbeln IS NOT INITIAL..
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.
      IF it_data_quater-kvgr2 IS NOT INITIAL.
        lv_so = 'X'.
      ENDIF.
    ENDIF.
**
**      IF w_vbeln IS INITIAL.
**        WRITE : / 'ERROR MESSAGE :',x_return_commit-message.
**      ENDIF.
*
**      CALL FUNCTION 'IDWT_READ_MONTH_TEXT'
**        EXPORTING
**          langu = sy-langu
**          month = it_data_quater-begda+4(2)
**        IMPORTING
**          t247  = t247.
*      .
*
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4VCOMMENTING.
*      IF lv_so NE 'X'.
*        IF it_data_quater-tot_elgl_qty IS INITIAL AND w_quater_min IS NOT INITIAL AND wa_yrva_qais_qtr_wv IS INITIAL.
*          w_vbeln = ''.
*          CONTINUE.
*        ELSEIF wa_yrva_qais_qtr_wv IS NOT INITIAL AND it_data_quater-tot_elgl_qty IS INITIAL.
*          MOVE 'CIS OK 'TO w_vbeln .
*        ENDIF.
*        IF w_quater_min IS INITIAL AND it_data_quater-tot_elgl_qty IS INITIAL.
*          MOVE 'CIS OK 'TO w_vbeln .
*        ENDIF.
*      ELSE.
*        IF it_data_quater-tot_elgl_qty IS INITIAL AND it_data_quater-grp_lift_qty_m1 IS NOT INITIAL AND yv_flag IS NOT INITIAL..
*          CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ENDIF.
*        IF wa_yrva_qais_qtr_wv IS NOT INITIAL AND it_data_quater-tot_elgl_qty IS INITIAL.
*          CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ENDIF.
*        IF w_quater_min IS INITIAL AND it_data_quater-tot_elgl_qty IS INITIAL.
*          CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ENDIF.
*        IF it_data_quater-tot_elgl_qty IS INITIAL AND w_quater_min IS NOT INITIAL AND wa_yrva_qais_qtr_wv IS INITIAL AND yv_flag IS INITIAL.
*          w_vbeln = ''.
*          CONTINUE.
*        ENDIF.
*      ENDIF.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month Quarter N  .
*
*      IF w_vbeln IS INITIAL.
*        READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
*          WITH KEY kunnr = it_data_quater-kunnr kvgr2 = it_data_quater-kvgr2
*          vkbur = it_data_quater-vkbur.
*        IF sy-subrc EQ 0 .
*          SELECT SINGLE * FROM yrva_qais_qtr_wv INTO wa_yrva_qais_qtr_wv
*          WHERE qais_no = wa_yrva_qais_data-qais_no AND quarter = lv_q.
*          IF sy-subrc EQ 0 AND it_data_quater-value EQ 0.
*            MOVE 'CIS OK 'TO w_vbeln .
*          ELSE.
**BOC Suyash Goyal for 0 value sales order in group.
*            IF w_vbeln IS INITIAL.
**SOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*              IF it_data_quater-kvgr2 IS NOT INITIAL AND it_data_quater-value EQ 0."commented by kunal on 12/11/2018 AND lv_so EQ 'X'.
*                CONCATENATE 'CISGR' it_data_quater-kvgr2 lv_tabix INTOlv_string.
*                MOVE lv_string TO w_vbeln.
*                CLEAR: lv_tabix, lv_string.
*              ENDIF.
**EOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*            ENDIF.
**EOC Suyash Goyal for 0 value sales order in group.
*          ENDIF.
*
*        ENDIF.
*      ENDIF.
*
**        WRITE : / 'Sales Order has been created with :'(003), W_VBELN,
**                  'and Customer No :'(004), X_SOLD_TO_PARTY-SOLD_TO.10791
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4VCOMMENTING.10793
    IF NOT w_vbeln IS INITIAL.10795
      MOVE w_vbeln TO it_data_quater-sale_order.
*          it_data_quater-sale_order = w_vbeln .
      MODIFY it_data_quater .10799
      READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
        WITH KEY kunnr = it_data_quater-kunnr kvgr2 = it_data_quater-kvgr2
        vkbur = it_data_quater-vkbur.
      IF sy-subrc EQ 0 .
        l_tabix = sy-tabix.
        IF w_q1 = 'X' .
          wa_yrva_qais_data-grp_lift_qty_m1 = it_data_quater-grp_lift_qty_m1 .
          wa_yrva_qais_data-ind_elgl_qty_m1 = it_data_quater-ind_elgl_qty_m1 .
          wa_yrva_qais_data-grp_lift_qty_m2 = it_data_quater-grp_lift_qty_m2 .
          wa_yrva_qais_data-ind_elgl_qty_m2 = it_data_quater-ind_elgl_qty_m2 .
          wa_yrva_qais_data-grp_lift_qty_m3 = it_data_quater-grp_lift_qty_m3 .
          wa_yrva_qais_data-ind_elgl_qty_m3 = it_data_quater-ind_elgl_qty_m3 .
          wa_yrva_qais_data-tot_elgl_qty_q1 = it_data_quater-tot_elgl_qty .
          wa_yrva_qais_data-value_q1        = it_data_quater-value .
          wa_yrva_qais_data-sale_order_q1   = it_data_quater-sale_order .
        ELSEIF    w_q2 = 'X' .
          wa_yrva_qais_data-grp_lift_qty_m4 = it_data_quater-grp_lift_qty_m1 .
          wa_yrva_qais_data-ind_elgl_qty_m4 = it_data_quater-ind_elgl_qty_m1 .
          wa_yrva_qais_data-grp_lift_qty_m5 = it_data_quater-grp_lift_qty_m2 .
          wa_yrva_qais_data-ind_elgl_qty_m5 = it_data_quater-ind_elgl_qty_m2 .
          wa_yrva_qais_data-grp_lift_qty_m6 = it_data_quater-grp_lift_qty_m3 .
          wa_yrva_qais_data-ind_elgl_qty_m6 = it_data_quater-ind_elgl_qty_m3 .
          wa_yrva_qais_data-tot_elgl_qty_q2 = it_data_quater-tot_elgl_qty .
          wa_yrva_qais_data-value_q2        = it_data_quater-value .
          wa_yrva_qais_data-sale_order_q2   = it_data_quater-sale_order .
        ELSEIF    w_q3 = 'X' .
          wa_yrva_qais_data-grp_lift_qty_m7 = it_data_quater-grp_lift_qty_m1 .
          wa_yrva_qais_data-ind_elgl_qty_m7 = it_data_quater-ind_elgl_qty_m1 .
          wa_yrva_qais_data-grp_lift_qty_m8 = it_data_quater-grp_lift_qty_m2 .
          wa_yrva_qais_data-ind_elgl_qty_m8 = it_data_quater-ind_elgl_qty_m2 .
          wa_yrva_qais_data-grp_lift_qty_m9 = it_data_quater-grp_lift_qty_m3 .
          wa_yrva_qais_data-ind_elgl_qty_m9 = it_data_quater-ind_elgl_qty_m3 .
          wa_yrva_qais_data-tot_elgl_qty_q3 = it_data_quater-tot_elgl_qty .
          wa_yrva_qais_data-value_q3        = it_data_quater-value .
          wa_yrva_qais_data-sale_order_q3   = it_data_quater-sale_order .
        ELSEIF    w_q4 = 'X' .
          wa_yrva_qais_data-grp_lift_qty_m10 = it_data_quater-grp_lift_qty_m1 .
          wa_yrva_qais_data-ind_elgl_qty_m10 = it_data_quater-ind_elgl_qty_m1 .
          wa_yrva_qais_data-grp_lift_qty_m11 = it_data_quater-grp_lift_qty_m2 .
          wa_yrva_qais_data-ind_elgl_qty_m11 = it_data_quater-ind_elgl_qty_m2 .
          wa_yrva_qais_data-grp_lift_qty_m12 = it_data_quater-grp_lift_qty_m3 .
          wa_yrva_qais_data-ind_elgl_qty_m12 = it_data_quater-ind_elgl_qty_m3 .
          wa_yrva_qais_data-tot_elgl_qty_q4 = it_data_quater-tot_elgl_qty .
          wa_yrva_qais_data-value_q4        = it_data_quater-value .
          wa_yrva_qais_data-sale_order_q4   = it_data_quater-sale_order .
        ENDIF.10846
        MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data INDEX l_tabix.
      ENDIF.
    ENDIF.
*      ENDIF.10851
    CLEAR :   w_vbeln, x_return_commit, x_order_header_in, w_objtype,
              x_sold_to_party.10854
    REFRESH :  i_order_partners, i_order_items_in .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  ENDLOOP.
ELSEIF r_annual = 'X'.10861
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Group Lifting.
  CLEAR: yv_flag.
  LOOP AT it_data_annual WHERE check = 'X' AND value GT 0.
    yv_flag = it_data_annual-tot_elgl_qty + yv_flag.
  ENDLOOP.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Group Lifting.1086810869
  LOOP AT it_data_annual WHERE check = 'X' AND value GT 0.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : w_auart,
            w_matnr,
            w_objtype,
            x_order_header_in,
            i_order_partners,
            i_order_items_in.10880
    REFRESH : i_order_partners,
              i_order_items_in.
    IF it_data_annual-sale_order IS NOT INITIAL.
      WRITE : / 'Credit Memo Request already created',it_data_annual-sale_order .
      EXIT.
    ENDIF.
    w_auart = 'ZP09'.
    w_matnr = 'REBATE(POLYMER)'.10889
    x_order_header_in-doc_type   = w_auart.
    x_order_header_in-sales_org  = '5000'.
    x_order_header_in-distr_chan = '10'.
    x_order_header_in-division   = '20'.
    x_order_header_in-ord_reason = 'G21'.
    x_order_header_in-sales_off  = it_data_annual-vkbur.
    x_order_header_in-cd_type1   = 'ZCMU'.
*      add loyality discount for 2014 qais and onwards
*      IF s_sptag-low GE '20140401' .
    IF it_data_annual-loyal_discount IS NOT INITIAL.
      x_order_header_in-cd_value1    = ( it_data_annual-value + it_data_annual-loyal_discount ) / 10 .
    ELSE.
      x_order_header_in-cd_value1    =  it_data_annual-value / 10 .
    ENDIF.
*REMARKS
    x_order_header_in-purch_no   = it_data_annual-remarks.10906
* PARTENER DETAILS
    i_order_partners-partn_role  = 'AG'.
    i_order_partners-partn_numb  = it_data_annual-kunnr.
    APPEND i_order_partners.10911
* ITEM DETAILS
    i_order_items_in-material   = w_matnr.
    i_order_items_in-target_qty = it_data_annual-tot_elgl_qty * 1000.
    APPEND i_order_items_in.
*
    w_objtype = 'BUS2094'.10918
    CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA'
      EXPORTING
        order_header_in = x_order_header_in
        business_object = w_objtype
        without_commit  = ' '
      IMPORTING
        salesdocument   = w_vbeln
        sold_to_party   = x_sold_to_party
        return          = x_return_commit
      TABLES
        order_items_in  = i_order_items_in
        order_partners  = i_order_partners.10931
    IF w_vbeln IS INITIAL.
      WRITE : / 'ERROR MESSAGE :',x_return_commit-message.
    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.10938
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
      READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
                    WITH KEY kunnr = it_data_annual-kunnr kvgr2 = it_data_annual-kvgr2
                    vkbur = it_data_annual-vkbur.
      IF sy-subrc = 0.
** -> Begin of changes by of Aditi on 05.12.2024 12:56:27 for ATC
*          SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
*                                                WHERE qais_no = wa_yrva_qais_data-qais_no.
        SELECT * FROM yrva_revival_fai INTO wa_yrva_revival_fai UP TO1 ROWS
                                              WHERE qais_no = wa_yrva_qais_data-qais_no
                                              ORDER BY PRIMARY KEY.
        ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 12:56:32 for ATC
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Annual Conditions.
      IF it_data_annual-kvgr2 IS INITIAL.
        IF ( it_data_annual-tot_elgl_qty IS INITIAL AND w_year_min ISNOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL )
        OR ( it_data_annual-tot_elgl_qty IS INITIAL AND w_year_min ISNOT INITIAL AND wa_yrva_revival_fai IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          w_vbeln = ''.
          CONTINUE.
        ELSEIF ( wa_yrva_qais_add_wv IS NOT INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL )
        OR ( wa_yrva_revival_fai IS NOT INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          MOVE 'CIS OK 'TO w_vbeln .
*        MESSAGE ' List Contains No Record' TYPE 'E'.
        ENDIF.
        IF w_year_min IS INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL.
          MOVE 'CIS OK 'TO w_vbeln .
        ENDIF.
      ELSE.
        IF ( it_data_annual-tot_elgl_qty IS INITIAL AND w_year_min ISNOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL AND yv_flag IS INITIAL )
        OR ( it_data_annual-tot_elgl_qty IS INITIAL AND w_year_min ISNOT INITIAL AND wa_yrva_revival_fai IS INITIAL AND yv_flag IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          w_vbeln = ''.
          CONTINUE.
        ELSEIF ( wa_yrva_qais_add_wv IS NOT INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL )
        OR ( wa_yrva_revival_fai IS NOT INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          CONCATENATE 'CISGR' it_data_annual-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
        ELSEIF w_year_min IS INITIAL AND it_data_annual-tot_elgl_qty IS INITIAL.
          CONCATENATE 'CISGR' it_data_annual-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.10982
        ELSEIF yv_flag IS NOT INITIAL AND it_data_annual-tot_elgl_qtyIS INITIAL.
          CONCATENATE 'CISGR' it_data_annual-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
        ENDIF.
      ENDIF.10989
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Annual Conditions.109911099210993
*        WRITE : / 'Sales Order has been created with :'(003), W_VBELN,
*                  'and Customer No :'(004), X_SOLD_TO_PARTY-SOLD_TO.
      IF NOT w_vbeln IS INITIAL.10997
        it_data_annual-sale_order = w_vbeln .
        MODIFY it_data_annual .
        READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
          WITH KEY kunnr = it_data_annual-kunnr kvgr2 = it_data_annual-kvgr2
          vkbur = it_data_annual-vkbur.
        IF sy-subrc EQ 0 .
          l_tabix = sy-tabix.
          wa_yrva_qais_data-grp_lift_qty = it_data_annual-grp_lift_qty.
          wa_yrva_qais_data-ind_lift_qty = it_data_annual-ind_lift_qty.
          wa_yrva_qais_data-tot_elgl_qty = it_data_annual-tot_elgl_qty.
          wa_yrva_qais_data-value = it_data_annual-value .
** SOC by ritesh/priyanka on charm 200000236 on 12-05-2021 on special MQAIS scheme for 2021-2022
          "add loyalite discount
          wa_yrva_qais_data-loyal_discount = it_data_annual-loyal_discount .
** EOC by ritesh/priyanka on charm 200000236 on 12-05-2021 on special MQAIS scheme for 2021-2022
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**            wa_yrva_qais_data-loyal_discount = it_data_annual-loyal_discount .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
          wa_yrva_qais_data-so_annual = it_data_annual-sale_order .
          MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data INDEX l_tabix .
        ENDIF.11019
      ENDIF.
    ENDIF.11022
    CLEAR :   w_vbeln, x_return_commit, x_order_header_in, w_objtype,
              x_sold_to_party.11025
    REFRESH :  i_order_partners, i_order_items_in .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai, wa_yrva_qais_data.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  ENDLOOP.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount11032
**SOC BY ABHINVA/ADARSH
ELSEIF r_consis = 'X'.
**SOC BY ABHINVA/ADARSH11036
***SOC by Adarsh/Archana on charm 4000006427, TR: DVRK9A12BV
  CLEAR: yv_flag.
  LOOP AT it_annual_consis WHERE check = 'X' AND value GT 0.
    yv_flag = it_annual_consis-tot_elgl_qty + yv_flag.
  ENDLOOP.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Group Lifting.1104311044
  LOOP AT it_annual_consis WHERE check = 'X' AND value GT 0.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : w_auart,
            w_matnr,
            w_objtype,
            x_order_header_in,
            i_order_partners,
            i_order_items_in.11055
    REFRESH : i_order_partners,
              i_order_items_in.
    IF it_annual_consis-sale_order IS NOT INITIAL.
      WRITE : / 'Credit Memo Request already created',it_annual_consis-sale_order .
      EXIT.
    ENDIF.
    w_auart = 'ZP09'.
    w_matnr = 'REBATE(POLYMER)'.11064
    x_order_header_in-doc_type   = w_auart.
    x_order_header_in-sales_org  = '5000'.
    x_order_header_in-distr_chan = '10'.
    x_order_header_in-division   = '20'.
    x_order_header_in-ord_reason = 'G21'.
    x_order_header_in-sales_off  = it_annual_consis-vkbur.
    x_order_header_in-cd_type1   = 'ZCMU'.
*      add loyality discount for 2014 qais and onwards
*      IF s_sptag-low GE '20140401' .
    IF it_annual_consis-loyal_discount IS NOT INITIAL.
      x_order_header_in-cd_value1    = ( it_annual_consis-value + it_annual_consis-loyal_discount ) / 10 .
    ELSE.
      x_order_header_in-cd_value1    =  it_annual_consis-value / 10 .
    ENDIF.
*REMARKS
    x_order_header_in-purch_no   = it_annual_consis-remarks.11081
* PARTENER DETAILS
    i_order_partners-partn_role  = 'AG'.
    i_order_partners-partn_numb  = it_annual_consis-kunnr.
    APPEND i_order_partners.11086
* ITEM DETAILS
    i_order_items_in-material   = w_matnr.
    i_order_items_in-target_qty = it_annual_consis-tot_elgl_qty * 1000.
    APPEND i_order_items_in.
*
    w_objtype = 'BUS2094'.11093
    CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA'
      EXPORTING
        order_header_in = x_order_header_in
        business_object = w_objtype
        without_commit  = ' '
      IMPORTING
        salesdocument   = w_vbeln
        sold_to_party   = x_sold_to_party
        return          = x_return_commit
      TABLES
        order_items_in  = i_order_items_in
        order_partners  = i_order_partners.11106
    IF w_vbeln IS INITIAL.
      WRITE : / 'ERROR MESSAGE :',x_return_commit-message.
    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
      READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
                    WITH KEY kunnr = it_annual_consis-kunnr kvgr2 = it_annual_consis-kvgr2
                    vkbur = it_annual_consis-vkbur.
      IF sy-subrc = 0.
** -> Begin of changes by of Aditi on 05.12.2024 13:01:55 for ATC
*          SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
*                                                WHERE qais_no = wa_yrva_qais_data-qais_no.
        SELECT * FROM yrva_revival_fai INTO wa_yrva_revival_fai UP TO1 ROWS
                                              WHERE qais_no = wa_yrva_qais_data-qais_no
                                              ORDER BY PRIMARY KEY.
        ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 13:02:00 for ATC
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Annual Conditions.
      IF it_annual_consis-kvgr2 IS INITIAL.
        IF ( it_annual_consis-tot_elgl_qty IS INITIAL AND w_year_min IS NOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL )
        OR ( it_annual_consis-tot_elgl_qty IS INITIAL AND w_year_min IS NOT INITIAL AND wa_yrva_revival_fai IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          w_vbeln = ''.
          CONTINUE.
        ELSEIF ( wa_yrva_qais_add_wv IS NOT INITIAL AND it_annual_consis-tot_elgl_qty IS INITIAL )
        OR ( wa_yrva_revival_fai IS NOT INITIAL AND it_annual_consis-tot_elgl_qty IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm : 4000007399
          MOVE 'CIS OK 'TO w_vbeln .
*        MESSAGE ' List Contains No Record' TYPE 'E'.
        ENDIF.
        IF w_year_min IS INITIAL AND it_annual_consis-tot_elgl_qty ISINITIAL.
          MOVE 'CIS OK 'TO w_vbeln .
        ENDIF.
      ELSE.
        IF ( it_annual_consis-tot_elgl_qty IS INITIAL AND w_year_min IS NOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL AND yv_flag IS INITIAL)
        OR ( it_annual_consis-tot_elgl_qty IS INITIAL AND w_year_min IS NOT INITIAL AND wa_yrva_revival_fai IS INITIAL AND yv_flag IS INITIAL)." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          w_vbeln = ''.
          CONTINUE.
        ELSEIF ( wa_yrva_qais_add_wv IS NOT INITIAL AND it_annual_consis-tot_elgl_qty IS INITIAL )
        OR ( wa_yrva_revival_fai IS NOT INITIAL AND it_annual_consis-tot_elgl_qty IS INITIAL )." SOC by Chilukuri Tripura Reddy/Archna/VishalCharm : 4000007399
          CONCATENATE 'CISGR' it_annual_consis-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
        ELSEIF w_year_min IS INITIAL AND it_annual_consis-tot_elgl_qtyIS INITIAL.
          CONCATENATE 'CISGR' it_annual_consis-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.11156
        ELSEIF yv_flag IS NOT INITIAL AND it_annual_consis-tot_elgl_qty IS INITIAL.
          CONCATENATE 'CISGR' it_annual_consis-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          CLEAR: lv_tabix, lv_string.
        ENDIF.
      ENDIF.11163
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Annual Conditions.111651116611167
*        WRITE : / 'Sales Order has been created with :'(003), W_VBELN,
*                  'and Customer No :'(004), X_SOLD_TO_PARTY-SOLD_TO.
      IF NOT w_vbeln IS INITIAL.11171
        it_annual_consis-sale_order = w_vbeln .
        MODIFY it_annual_consis .
        READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
          WITH KEY kunnr = it_annual_consis-kunnr kvgr2 = it_annual_consis-kvgr2
          vkbur = it_annual_consis-vkbur.
        IF sy-subrc EQ 0 .
          l_tabix = sy-tabix.
          wa_yrva_qais_data-grp_lift_qty = it_annual_consis-grp_lift_qty .
          wa_yrva_qais_data-ind_lift_qty = it_annual_consis-ind_lift_qty .
          wa_yrva_qais_data-tot_elgl_qty = it_annual_consis-tot_elgl_qty .
          wa_yrva_qais_data-value = it_annual_consis-value .
** SOC by ritesh/priyanka on charm 200000236 on 12-05-2021 on special MQAIS scheme for 2021-2022
          "add loyalite discount
          wa_yrva_qais_data-loyal_discount = it_annual_consis-loyal_discount .
** EOC by ritesh/priyanka on charm 200000236 on 12-05-2021 on special MQAIS scheme for 2021-2022
** SOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
**            wa_yrva_qais_data-loyal_discount = it_annual_consis-loyal_discount .
** EOC by ujjwal/priyanka on charm 4000002394 on 10-08-2020 on special MQAIS scheme for 2020-2021
          wa_yrva_qais_data-so_annual_consit = it_annual_consis-sale_order .
          MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data INDEX l_tabix .
        ENDIF.
      ENDIF.
    ENDIF.11195
    CLEAR :   w_vbeln, x_return_commit, x_order_header_in, w_objtype,
              x_sold_to_party.11198
    REFRESH :  i_order_partners, i_order_items_in .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
    CLEAR : wa_yrva_revival_fai, wa_yrva_qais_data.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
  ENDLOOP.
***EOC by Adarsh/Archana on charm 4000006427, TR: DVRK9A12BV11205
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V11211
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X'.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  DATA t247  TYPE t247.
  CLEAR lv_so.
  CLEAR: wa_yrva_qais_data_m, yv_flag.
  SORT  it_data_monthly BY value DESCENDING.11218
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Monthly Group.
  LOOP AT it_data_monthly WHERE check = 'X' AND value GE 0.
    yv_flag = it_data_monthly-ind_elgl_qty + yv_flag.
*    ENDLOOP.
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Monthly Group.
    CALL FUNCTION 'ENQUEUE_EZ004_LOCK'
      EXPORTING
*         MODE_YRVA_QAIS_DATA       = 'E'
*         MANDT          = SY-MANDT
        kunnr          = it_data_monthly-kunnr
*         X_KUNNR        = ' '
*         _SCOPE         = '2'
*         _WAIT          = ' '
*         _COLLECT       = ' '
      EXCEPTIONS
        foreign_lock   = 1
        system_failure = 2
        OTHERS         = 3.
    IF sy-subrc <> 0.
      DATA l_msg TYPE char100.
      CONCATENATE TEXT-900 it_data_monthly-kunnr INTO l_msg SEPARATEDBY space.
      MESSAGE l_msg TYPE 'E'.
* Implement suitable error handling here
    ENDIF.11243
  ENDLOOP.
** SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
*********************change by vaibhav to check retrigger
**refresh IT_WHERE_TAB1.
**  PERFORM get_data.
************************************************************
** EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
  LOOP AT it_data_monthly WHERE check = 'X' AND value GE 0.
    CLEAR : w_auart,
            w_matnr,
            w_objtype,
            x_order_header_in,
            i_order_partners,
            i_order_items_in.11258
    REFRESH : i_order_partners,
              i_order_items_in.
** SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
**********************change by vaibhav to check retrigger
**      READ TABLE IT_YRVA_QAIS_DATA into data(wa_wals) with key kunnr =it_data_monthly-kunnr.
**      if sy-subrc <> 0.
**        CONTINUE.
**        endif.
***************change by vaibhav to check retrigger
** EOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008707
    IF it_data_monthly-sale_order IS NOT INITIAL.
      WRITE : / 'Credit Memo Request already created',it_data_monthly-sale_order .
      EXIT.
    ENDIF.
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE Removing Bypass.
*      IF it_data_monthly-value GT 0.
**EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE Removing Bypass.
    w_auart = 'ZP09'.
    w_matnr = 'REBATE(POLYMER)'.11278
    x_order_header_in-doc_type   = w_auart.
    x_order_header_in-sales_org  = '5000'.
    x_order_header_in-distr_chan = '10'.
    x_order_header_in-division   = '20'.
    x_order_header_in-ord_reason = 'G21'.
    x_order_header_in-sales_off  = it_data_monthly-vkbur.
    x_order_header_in-cd_type1   = 'ZCMU'.
    x_order_header_in-cd_value1    =  it_data_monthly-value / 10 .
*REMARKS
    x_order_header_in-purch_no   = it_data_monthly-remarks.11289
* PARTENER DETAILS
    i_order_partners-partn_role  = 'AG'.
    i_order_partners-partn_numb  = it_data_monthly-kunnr.
    APPEND i_order_partners.11294
* ITEM DETAILS
    i_order_items_in-material   = w_matnr.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount11298
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*      IF R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X'  OR C_MAINT EQ 'X'. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*      IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V11304
*        IF r_month1 EQ 'X' OR r_rpd EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
      i_order_items_in-target_qty = it_data_monthly-ind_lift_qty * 1000.
    ELSEIF r_month EQ 'X'.
      i_order_items_in-target_qty = it_data_monthly-tot_elgl_qty * 1000.
    ENDIF.
    IF r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ'X'.  "Soc by Vaishnavi/Pawan Charm : 4000009111
      CLEAR : i_order_items_in-target_qty.
      i_order_items_in-target_qty = it_data_monthly-tot_elgl_qty * 1000.
    ENDIF.11315
    APPEND i_order_items_in.
*
    w_objtype = 'BUS2094'.11319
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
    CLEAR : yv_flag1.
    IF it_data_monthly-tot_elgl_qty IS INITIAL AND c_maint EQ 'X'.
      w_vbeln = ''.
      yv_flag1 = '1'.
    ENDIF.
    IF it_data_monthly-kvgr2 IS INITIAL.
      IF it_data_monthly-ind_elgl_qty IS INITIAL.
        IF w_month_min_perc IS NOT INITIAL.
          w_vbeln = ''.
          yv_flag1 = '1'.
        ENDIF.
        IF w_month_min_perc IS INITIAL.
          MOVE 'CIS OK 'TO w_vbeln .
          yv_flag1 = '1'.
        ENDIF.11336
        CALL FUNCTION 'IDWT_READ_MONTH_TEXT'
          EXPORTING
            langu = sy-langu
            month = it_data_monthly-begda+4(2)
          IMPORTING
            t247  = t247.
        READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
          WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
          vkbur = it_data_monthly-vkbur.
        IF sy-subrc EQ 0 .
          SELECT SINGLE * FROM yrva_qais_add_wv INTO wa_yrva_qais_add_wv
          WHERE qais_no = wa_yrva_qais_data-qais_no AND waiver_month =t247-ktx .
          IF sy-subrc EQ 0.
            MOVE 'CIS OK 'TO w_vbeln .
            yv_flag1 = '1'.
          ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
          SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
         WHERE qais_no = wa_yrva_qais_data-qais_no.
          IF sy-subrc EQ 0.
            MOVE 'CIS OK 'TO w_vbeln .
            yv_flag1 = '1'.
          ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
        ENDIF.
      ENDIF.
    ELSE.
      IF w_month_min_perc IS INITIAL AND it_data_monthly-ind_elgl_qtyIS INITIAL.
        CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
        MOVE lv_string TO w_vbeln.
        CLEAR: lv_tabix, lv_string.
        yv_flag1 = '1'.
      ENDIF.
      IF it_data_monthly-ind_elgl_qty IS INITIAL AND w_month_min_percIS NOT INITIAL AND yv_flag IS INITIAL.
        w_vbeln = ''.
        yv_flag1 = '1'.
      ENDIF.
      IF it_data_monthly-ind_elgl_qty IS INITIAL AND w_month_min_percIS NOT INITIAL AND yv_flag IS NOT INITIAL.
        CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
        MOVE lv_string TO w_vbeln.
        yv_flag1 = '1'.
      ENDIF.
      CALL FUNCTION 'IDWT_READ_MONTH_TEXT'
        EXPORTING
          langu = sy-langu
          month = it_data_monthly-begda+4(2)
        IMPORTING
          t247  = t247.
      READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
        WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
        vkbur = it_data_monthly-vkbur.
      IF sy-subrc EQ 0.
        SELECT SINGLE * FROM yrva_qais_add_wv INTO wa_yrva_qais_add_wv
        WHERE qais_no = wa_yrva_qais_data-qais_no AND waiver_month = t247-ktx .
        IF sy-subrc EQ 0 AND it_data_monthly-ind_elgl_qty IS INITIAL.
          CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          yv_flag1 = '1'.
          CLEAR: lv_tabix, lv_string.
        ENDIF.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
        SELECT SINGLE * FROM yrva_revival_fai INTO wa_yrva_revival_fai
        WHERE qais_no = wa_yrva_qais_data-qais_no.
        IF sy-subrc EQ 0 AND it_data_monthly-ind_elgl_qty IS INITIAL.
          CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
          MOVE lv_string TO w_vbeln.
          yv_flag1 = '1'.
          CLEAR: lv_tabix, lv_string.
        ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
      ENDIF.11408
    ENDIF.11410
    IF  yv_flag1 IS INITIAL . "Charm 350
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V114131141411415
***SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Bypass Removed
*        IF  r_month EQ 'X'. "Charm 350
***EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Bypass Removed11419
      CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA'
        EXPORTING
          order_header_in = x_order_header_in
          business_object = w_objtype
          without_commit  = ' '
        IMPORTING
          salesdocument   = w_vbeln
          sold_to_party   = x_sold_to_party
          return          = x_return_commit
        TABLES
          order_items_in  = i_order_items_in
          order_partners  = i_order_partners.11432
      IF w_vbeln IS NOT INITIAL..
        CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
          EXPORTING
            wait = 'X'.
        IF r_rpd NE 'X'.
          IF it_data_monthly-kvgr2 IS NOT INITIAL.
            lv_so = 'X'.
          ENDIF.
        ENDIF.11442
      ENDIF.
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
    ENDIF.
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V
*      ENDIF." Chram 350 SOC ADD For Bypass Create sales Order in Monthly11448
******SOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4V COMMENTING.
*      IF lv_so NE 'X'.
*        IF it_data_monthly-ind_elgl_qty IS INITIAL AND w_month_min_percIS NOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL.
*          w_vbeln = ''.
*          CONTINUE.
*        ELSEIF wa_yrva_qais_add_wv IS NOT INITIAL AND it_data_monthly-ind_elgl_qty IS INITIAL.
*          MOVE 'CIS OK 'TO w_vbeln .
**        MESSAGE ' List Contains No Record' TYPE 'E'.
*        ENDIF.
*        IF w_month_min_perc IS INITIAL AND it_data_monthly-ind_elgl_qtyIS INITIAL.
*          MOVE 'CIS OK 'TO w_vbeln .
*        ENDIF.
*      ELSE.
*        IF w_month_min_perc IS INITIAL AND it_data_monthly-ind_elgl_qtyIS INITIAL.
*          CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ELSEIF wa_yrva_qais_add_wv IS NOT INITIAL AND it_data_monthly-ind_elgl_qty IS INITIAL.
*          CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ELSEIF it_data_monthly-ind_elgl_qty IS INITIAL AND w_month_min_perc IS NOT INITIAL AND wa_yrva_qais_add_wv IS INITIAL AND yv_flag IS INITIAL.
*          w_vbeln = ''.
*          CONTINUE.
*        ELSEIF it_data_monthly-ind_elgl_qty IS INITIAL AND wa_yrva_qais_add_wv IS INITIAL
*          AND w_month_min_perc IS NOT INITIAL AND yv_flag IS NOT INITIAL.
*          CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTO lv_string.
*          MOVE lv_string TO w_vbeln.
*          CLEAR: lv_tabix, lv_string.
*        ENDIF.
*      ENDIF.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE Month condition.
*
*      IF w_vbeln IS INITIAL.
*        CALL FUNCTION 'IDWT_READ_MONTH_TEXT'
*          EXPORTING
*            langu = sy-langu
*            month = it_data_monthly-begda+4(2)
*          IMPORTING
*            t247  = t247.
**  "SOC CODE COMMENT RITESH SINGH Priyanka mam on charm 20000350 on date 28.06.2021        .
*        IF r_month EQ 'X'.
*          READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
*            WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
*            vkbur = it_data_monthly-vkbur.
*          IF sy-subrc EQ 0 .
*            SELECT SINGLE * FROM yrva_qais_add_wv INTO wa_yrva_qais_add_wv
*            WHERE qais_no = wa_yrva_qais_data-qais_no AND waiver_month= t247-ktx .
*            IF sy-subrc EQ 0 AND it_data_monthly-value EQ 0 .
*              MOVE 'CIS OK 'TO w_vbeln .
*            ENDIF.
*            IF lv_flag2 EQ 'X' AND it_data_monthly-value EQ 0 .
*              MOVE 'CIS OK 'TO w_vbeln .
*            ENDIF.
**BOC Suyash Goyal for 0 value sales order in group.
*            IF w_vbeln IS INITIAL.
**SOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*              IF it_data_monthly-kvgr2 IS NOT INITIAL AND it_data_monthly-value EQ 0."Commented by Kunal on 11/12/2018 AND lv_so EQ 'X'.
*                CONCATENATE 'CISGR' it_data_monthly-kvgr2 lv_tabix INTOlv_string.
*                MOVE lv_string TO w_vbeln.
*                CLEAR: lv_tabix, lv_string.
*              ENDIF.
**EOC by Kunal/Priyanka on 06/12/2018 for Extend Group Issue
*            ENDIF.
**EOC Suyash Goyal for 0 value sales order in group.
*          ENDIF.
***            SOC by sachin to allow Monthly CIS even without sale order creation
*          IF w_vbeln IS INITIAL AND it_data_monthly-value GT 0.
*            MOVE 'CIS OK 'TO w_vbeln .
*          ENDIF.
***            EOC by sachin to allow Monthly CIS even without sale order creation
*        ENDIF.
*      ENDIF.
** "SOC CODE COMMENT RITESH SINGH Priyanka mam on charm 20000350 on date28.06.2021
******EOC by ABHINAV JUYAL/PRIYANKA on CHARM:4000005447 TR: DVRK9A0X4VCOMMENTING ABOVE CODE11524
    IF NOT w_vbeln IS INITIAL.
      MOVE w_vbeln TO it_data_monthly-sale_order.
*          it_data_monthly-sale_order = w_vbeln .
      MODIFY it_data_monthly .
      READ TABLE it_yrva_qais_data INTO wa_yrva_qais_data
        WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
        vkbur = it_data_monthly-vkbur.
      IF sy-subrc EQ 0 .
        l_tabix = sy-tabix.
*          wa_yrva_qais_data-month_begda   = it_data_monthly-begda.
*          wa_yrva_qais_data-month_endda   = it_data_monthly-endda.11536
        IF r_month EQ 'X'.
          READ TABLE it_yrva_qais_data_m INTO wa_yrva_qais_data_m
            WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
            vkbur = it_data_monthly-vkbur.
          IF sy-subrc EQ 0.
            l_tabix1 = sy-tabix.
          ENDIF.
****            SOC by sachin and priyanka to resolve issue of elligle quantity of previous(Inactive) CIS number of same customer
*            BREAK-POINT .
          IF wa_yrva_qais_data-qais_no NE wa_yrva_qais_data_m-qais_no.
            MOVE-CORRESPONDING wa_yrva_qais_data_m TO l_ind_elgl_qty_m.
            MOVE-CORRESPONDING wa_yrva_qais_data TO wa_yrva_qais_data_m.
            MOVE-CORRESPONDING  l_ind_elgl_qty_m TO wa_yrva_qais_data_m .
          ELSE.
            MOVE-CORRESPONDING wa_yrva_qais_data TO wa_yrva_qais_data_m.
          ENDIF.
****            EOC by sachin and priyanka to resolve issue of elligle quantity of previous(Inactive) CIS number of same customer11554
*Begin of change by Suyash Goyal for QAIS Monthly Logic.
***Souncomment by Adarsh/Archana on charm:4000006427 TR: DVRK9A12BV
****SOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April to Exclude.
          IF s_sptag-high+4(2) = '04'.
            wa_yrva_qais_data-ind_elgl_qty_m1  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m1  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m1     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m1        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m1   = it_data_monthly-remarks.
****EOC by ABHINAV JUYAL/PRIYANKA on CHARM: DVRK9A0VEE CHANGE April to Exclude.
***Eouncomment by Adarsh/Archana on charm:4000006427 TR: DVRK9A12BV
          ELSEIF s_sptag-high+4(2) = '05' .
            wa_yrva_qais_data-ind_elgl_qty_m2  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m2  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m2     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m2        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m2   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '06' .
            wa_yrva_qais_data-ind_elgl_qty_m3  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m3  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m3     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m3        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m3   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '07' .
            wa_yrva_qais_data-ind_elgl_qty_m4  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m4  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m4     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m4        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m4   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '08' .
            wa_yrva_qais_data-ind_elgl_qty_m5  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m5  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m5     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m5        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m5   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '09' .
            wa_yrva_qais_data-ind_elgl_qty_m6  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m6  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m6     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m6        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m6   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '10' .
            wa_yrva_qais_data-ind_elgl_qty_m7  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m7  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m7     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m7        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m7   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '11' .
            wa_yrva_qais_data-ind_elgl_qty_m8  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m8  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m8     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m8        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m8   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '12' .
            wa_yrva_qais_data-ind_elgl_qty_m9  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m9  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m9     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m9        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m9   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '01' .
            wa_yrva_qais_data-ind_elgl_qty_m10  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m10  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m10     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m10        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m10   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '02' .
            wa_yrva_qais_data-ind_elgl_qty_m11 = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m11 = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m11     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m11        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m11   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '03' .
            wa_yrva_qais_data-ind_elgl_qty_m12  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-ind_elgl_qty_m12  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_m-mon_value_m12     = it_data_monthly-value.
            wa_yrva_qais_data_m-mon_so_m12        = it_data_monthly-sale_order.
            wa_yrva_qais_data_m-mon_remarks_m12   = it_data_monthly-remarks.
          ENDIF.116331163411635
**********************BOC by Sachin Kaul ORO Atul Singhal on 5/9/16********************
          MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data INDEX l_tabix.
          IF l_tabix1 IS NOT  INITIAL.
            MODIFY  it_yrva_qais_data_m FROM wa_yrva_qais_data_m INDEXl_tabix1.
          ELSE.
            APPEND wa_yrva_qais_data_m TO it_yrva_qais_data_m.
          ENDIF.11643
          CLEAR: l_tabix1.
        ENDIF.
**********************EOC by Sachin Kaul ORO Atul Singhal on 5/9/16********************
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount11648
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*          IF R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLDEQ 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
        IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*          IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlldEQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V11654
*          IF r_month1 EQ 'X' OR r_rpd EQ 'X'.
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
          READ TABLE it_yrva_qais_data_s INTO wa_yrva_qais_data_s
            WITH KEY kunnr = it_data_monthly-kunnr kvgr2 = it_data_monthly-kvgr2
            vkbur = it_data_monthly-vkbur.
          IF sy-subrc EQ 0.
            l_tabix1 = sy-tabix.
          ENDIF.
          MOVE-CORRESPONDING wa_yrva_qais_data TO wa_yrva_qais_data_s.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount11665
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*            IF  R_MONTH1 EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X'  OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
          IF  r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'  OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*            IF  r_month1 EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V11671
*            IF r_month1 EQ 'X'.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
            wa_yrva_qais_data_s-flag_rpd = 'S'.
          ENDIF.
          IF r_rpd EQ 'X'.
            wa_yrva_qais_data_s-flag_rpd = 'R'.
          ENDIF.
*Begin of change by Suyash Goyal for QAIS Monthly Logic.
          IF s_sptag-high+4(2) = '04'.
            wa_yrva_qais_data-ind_elgl_qty_m1  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m1  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m1     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m1        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m1   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '05' .
            wa_yrva_qais_data-ind_elgl_qty_m2  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m2  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m2     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m2        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m2   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '06' .
            wa_yrva_qais_data-ind_elgl_qty_m3  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m3  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m3     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m3        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m3   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '07' .
            wa_yrva_qais_data-ind_elgl_qty_m4  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m4  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m4     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m4        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m4   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '08' .
            wa_yrva_qais_data-ind_elgl_qty_m5  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m5  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m5     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m5        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m5   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '09' .
            wa_yrva_qais_data-ind_elgl_qty_m6  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m6  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m6     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m6        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m6   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '10' .
            wa_yrva_qais_data-ind_elgl_qty_m7  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m7  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m7     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m7        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m7   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '11' .
            wa_yrva_qais_data-ind_elgl_qty_m8  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m8  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m8     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m8        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m8   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '12' .
            wa_yrva_qais_data-ind_elgl_qty_m9  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m9  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m9     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m9        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m9   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '01' .
            wa_yrva_qais_data-ind_elgl_qty_m10  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m10  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m10     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m10        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m10   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '02' .
            wa_yrva_qais_data-ind_elgl_qty_m11 = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m11 = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m11     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m11        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m11   = it_data_monthly-remarks.
          ELSEIF s_sptag-high+4(2) = '03' .
            wa_yrva_qais_data-ind_elgl_qty_m12  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-ind_elgl_qty_m12  = it_data_monthly-tot_elgl_qty.
            wa_yrva_qais_data_s-mon_value_m12     = it_data_monthly-value.
            wa_yrva_qais_data_s-mon_so_m12        = it_data_monthly-sale_order.
            wa_yrva_qais_data_s-mon_remarks_m12   = it_data_monthly-remarks.
          ENDIF.11753
**********************BOC by Sachin Kaul ORO Atul Singhal on 5/9/16********************
          MODIFY  it_yrva_qais_data FROM wa_yrva_qais_data INDEX l_tabix.
          IF l_tabix1 IS NOT  INITIAL.
            MODIFY  it_yrva_qais_data_s FROM wa_yrva_qais_data_s INDEXl_tabix1 .
          ELSE.
            APPEND wa_yrva_qais_data_s TO it_yrva_qais_data_s.
          ENDIF.
          CLEAR: l_tabix1.
**********************EOC by Sachin Kaul ORO Atul Singhal on 5/9/16********************
        ENDIF.
*            WA_YRVA_QAIS_DATA-MON_VALUE_DEC_15_16     = IT_DATA_MONTHLY-VALUE.
*            WA_YRVA_QAIS_DATA-MON_SO_DEC_15_16        = IT_DATA_MONTHLY-SALE_ORDER.
*            WA_YRVA_QAIS_DATA-MON_REMARKS_DEC15_16   = IT_DATA_MONTHLY-REMARKS.11767
*End of change by Suyash Goyal for QAIS Monthly Logic.
      ENDIF.
*        ENDIF.
    ENDIF.11772
    CLEAR :   w_vbeln, x_return_commit, x_order_header_in, w_objtype,
              x_sold_to_party, l_tabix.
    CLEAR:  wa_yrva_qais_data_m, wa_yrva_qais_data.
    REFRESH :  i_order_partners, i_order_items_in .
  ENDLOOP.1177811779
  LOOP AT it_data_monthly WHERE check = 'X' AND value GE 0.
    CALL FUNCTION 'DEQUEUE_EZ004_LOCK'
      EXPORTING
*         MODE_YRVA_QAIS_DATA       = 'E'
*         MANDT = SY-MANDT
        kunnr = it_data_monthly-kunnr
*         X_KUNNR                   = ' '
*         _SCOPE                    = '3'
*         _SYNCHRON                 = ' '
*         _COLLECT                  = ' '
      .1179111792
  ENDLOOP.1179411795
ELSEIF r_newcus = 'X' . "Vivek
  LOOP AT it_data_annual_newcus WHERE check = 'X' AND value GT 0.
    CLEAR : w_auart,
            w_matnr,
            w_objtype,
            x_order_header_in,
            i_order_partners,
            i_order_items_in.11804
    REFRESH : i_order_partners,
              i_order_items_in.
    IF it_data_annual_newcus-sale_order IS NOT INITIAL.
      WRITE : / 'Credit Memo Request already created',it_data_annual_newcus-sale_order .
      EXIT.
    ENDIF.
    w_auart = 'ZP09'.
    w_matnr = 'REBATE(POLYMER)'.11813
    x_order_header_in-doc_type   = w_auart.
    x_order_header_in-sales_org  = '5000'.
    x_order_header_in-distr_chan = '10'.
    x_order_header_in-division   = '20'.
    x_order_header_in-ord_reason = 'G21'.
    x_order_header_in-sales_off  = it_data_annual_newcus-vkbur.
    x_order_header_in-cd_type1   = 'ZCMU'.
*      add loyality discount for 2014 qais and onwards
*      IF s_sptag-low GE '20140401' .
    IF it_data_annual_newcus-loyal_discount IS NOT INITIAL.
      x_order_header_in-cd_value1    = ( it_data_annual_newcus-value +it_data_annual_newcus-loyal_discount ) / 10 .
    ELSE.
      x_order_header_in-cd_value1    =  it_data_annual_newcus-value /10 .
    ENDIF.
*REMARKS
    x_order_header_in-purch_no   = it_data_annual_newcus-remarks.11830
* PARTENER DETAILS
    i_order_partners-partn_role  = 'AG'.
    i_order_partners-partn_numb  = it_data_annual_newcus-kunnr.
    APPEND i_order_partners.11835
* ITEM DETAILS
    i_order_items_in-material   = w_matnr.
    i_order_items_in-target_qty = it_data_annual_newcus-tot_elgl_qty *1000.
    APPEND i_order_items_in.
*
    w_objtype = 'BUS2094'.11842
    CALL FUNCTION 'BAPI_SALESDOCU_CREATEFROMDATA'
      EXPORTING
        order_header_in = x_order_header_in
        business_object = w_objtype
        without_commit  = ' '
      IMPORTING
        salesdocument   = w_vbeln
        sold_to_party   = x_sold_to_party
        return          = x_return_commit
      TABLES
        order_items_in  = i_order_items_in
        order_partners  = i_order_partners.11855
    IF w_vbeln IS INITIAL.
      WRITE : / 'ERROR MESSAGE :',x_return_commit-message.
    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
        EXPORTING
          wait = 'X'.11862
*        WRITE : / 'Sales Order has been created with :'(003), W_VBELN,
*                  'and Customer No :'(004), X_SOLD_TO_PARTY-SOLD_TO.
      IF NOT w_vbeln IS INITIAL.11866
        it_data_annual_newcus-sale_order = w_vbeln .
        MODIFY it_data_annual_newcus .
        READ TABLE it_yrva_qais_data_newcus INTO wa_yrva_qais_data_newcus
          WITH KEY kunnr = it_data_annual_newcus-kunnr kvgr2 = it_data_annual_newcus-kvgr2
          vkbur = it_data_annual_newcus-vkbur.
        IF sy-subrc EQ 0 .
          l_tabix = sy-tabix.
*            WA_YRVA_QAIS_NEWCUS-GRP_LIFT_QTY = IT_DATA_ANNUAL_NEWCUS-GRP_LIFT_QTY .
*      WA_YRVA_QAIS_NEWCUS-QAIS_NO = IT_DATA_ANNUAL_NEWCUS-QAIS_NO .
*      WA_YRVA_QAIS_NEWCUS-Kunnr = IT_DATA_ANNUAL_NEWCUS-IND_LIFT_QTY .
*            WA_YRVA_QAIS_NEWCUS-IND_LIFT_QTY = IT_DATA_ANNUAL_NEWCUS-IND_LIFT_QTY .
*            WA_YRVA_QAIS_NEWCUS-TOT_ELGL_QTY = IT_DATA_ANNUAL_NEWCUS-TOT_ELGL_QTY .
*            WA_YRVA_QAIS_DATA_NEWCUS-VALUE = IT_DATA_ANNUAL_NEWCUS-VALUE .
          wa_yrva_qais_newcus-sale_order = it_data_annual_newcus-sale_order .
          MODIFY  it_yrva_qais_newcus FROM wa_yrva_qais_newcus  INDEXl_tabix .
        ENDIF.11883
        MODIFY yrva_qais_newcus FROM TABLE it_yrva_qais_newcus .
        WAIT UP TO 4 SECONDS.
      ENDIF.
    ENDIF.11888
    CLEAR :   w_vbeln, x_return_commit, x_order_header_in, w_objtype,
              x_sold_to_party.11891
    REFRESH :  i_order_partners, i_order_items_in .
  ENDLOOP.11894
ENDIF.
IF r_month EQ 'X'.
  MODIFY yrva_qais_data_m FROM TABLE it_yrva_qais_data_m.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
**SOC by ujjjwal/priyanka on charm 4000002947 on 15-10-2020 to create new additional MQAIS link discount
**  IF r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
IF r_month1 EQ 'X'OR r_rpd EQ 'X' .
**eOC by ujjjwal/priyanka on charm 4000002947 on 15-10-2020 to create new additional MQAIS link discount
**EOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  MODIFY yrva_qais_data_s FROM TABLE it_yrva_qais_data_s.
ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002979 on 20-10-2020 to create new additional MQAIS link disco11908
*****SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  IF r_rhd IS INITIAL AND r_rlld IS INITIAL.
*    MODIFY yrva_qais_data FROM TABLE it_yrva_qais_data .
*    WAIT UP TO 4 SECONDS.
*  ENDIF.
*  IF R_RHD IS INITIAL AND R_RLLD IS INITIAL AND C_MAINT IS INITIAL. " SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
IF r_rhd IS INITIAL AND r_rlld IS INITIAL AND c_maint IS INITIAL AND c_maint1 IS INITIAL. " SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm: 4000007222
  MODIFY yrva_qais_data FROM TABLE it_yrva_qais_data .
  WAIT UP TO 4 SECONDS.
ENDIF.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V11920
**EOC by ujjjwal/priyanka on charm 4000002979 on 20-10-2020 to create new additional MQAIS link disco
*Begin of change by Suyash Goyal for QAIS Monthly Logic.
IF r_quater = 'X' .
  CLEAR wa_yrva_rebate.
  REFRESH it_yrva_rebate.
  LOOP AT it_data_quater WHERE sale_order IS NOT INITIAL.
    UPDATE vbkd SET bstdk = s_sptag-low  bstdk_e = s_sptag-high
            WHERE vbeln = it_data_quater-sale_order ."AND POSNR = '000010'.
    COMMIT WORK AND WAIT.11930
    wa_yrva_rebate-vbeln =  it_data_quater-sale_order.
    wa_yrva_rebate-kunnr =  it_data_quater-kunnr.
    wa_yrva_rebate-vkbur =  it_data_quater-vkbur.
    wa_yrva_rebate-lft_qty =  it_data_quater-tot_grp_lift_qty.
    wa_yrva_rebate-rev_qty =  it_data_quater-tot_elgl_qty.
    wa_yrva_rebate-reb_cond =  'ZQIS'.
    wa_yrva_rebate-ord_cond =  'ZCMU'.
    wa_yrva_rebate-value =  it_data_quater-value.
    wa_yrva_rebate-yy_per_start =  s_sptag-low.
    wa_yrva_rebate-yy_per_end =  s_sptag-high.
    SELECT SINGLE kukla FROM kna1 INTO  wa_yrva_rebate-kukla WHERE kunnr EQ it_data_quater-sale_order.
*     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
    APPEND wa_yrva_rebate TO it_yrva_rebate.
  ENDLOOP.
  MODIFY yrva_rebate FROM TABLE it_yrva_rebate.11946
ELSEIF r_annual = 'X'.
  CLEAR wa_yrva_rebate.
  REFRESH it_yrva_rebate.
  LOOP AT it_data_annual WHERE sale_order IS NOT INITIAL.
    UPDATE vbkd SET bstdk = s_sptag-low  bstdk_e = s_sptag-high
            WHERE vbeln = it_data_annual-sale_order ."AND POSNR = '000010'.
    COMMIT WORK AND WAIT.11954
    wa_yrva_rebate-vbeln =  it_data_annual-sale_order.
    wa_yrva_rebate-kunnr =  it_data_annual-kunnr.
    wa_yrva_rebate-vkbur =  it_data_annual-vkbur.
    wa_yrva_rebate-lft_qty =  it_data_annual-grp_lift_qty.
    wa_yrva_rebate-rev_qty =  it_data_annual-tot_elgl_qty.
    wa_yrva_rebate-reb_cond =  'ZAIS'.
    wa_yrva_rebate-ord_cond =  'ZCMU'.
    wa_yrva_rebate-value =  it_data_annual-value.
    wa_yrva_rebate-yy_per_start =  s_sptag-low.
    wa_yrva_rebate-yy_per_end =  s_sptag-high.
    SELECT SINGLE kukla FROM kna1 INTO  wa_yrva_rebate-kukla WHERE kunnr EQ it_data_annual-sale_order.
*     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
    APPEND wa_yrva_rebate TO it_yrva_rebate.
  ENDLOOP.
  MODIFY yrva_rebate FROM TABLE it_yrva_rebate.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount11971
***SOC Adarsh/Archana on charm 4000006427, TR:DVRK9A12BV
ELSEIF r_consis = 'X'.
  CLEAR wa_yrva_rebate.
  REFRESH it_yrva_rebate.
  LOOP AT it_annual_consis WHERE sale_order IS NOT INITIAL.
    UPDATE vbkd SET bstdk = s_sptag-low  bstdk_e = s_sptag-high
            WHERE vbeln = it_annual_consis-sale_order ."AND POSNR = '000010'.
    COMMIT WORK AND WAIT.11980
    wa_yrva_rebate-vbeln =  it_annual_consis-sale_order.
    wa_yrva_rebate-kunnr =  it_annual_consis-kunnr.
    wa_yrva_rebate-vkbur =  it_annual_consis-vkbur.
    wa_yrva_rebate-lft_qty =  it_annual_consis-grp_lift_qty.
    wa_yrva_rebate-rev_qty =  it_annual_consis-tot_elgl_qty.
    wa_yrva_rebate-reb_cond =  'ZACD'.
    wa_yrva_rebate-ord_cond =  'ZCMU'.
    wa_yrva_rebate-value =  it_annual_consis-value.
    wa_yrva_rebate-yy_per_start =  s_sptag-low.
    wa_yrva_rebate-yy_per_end =  s_sptag-high.
    SELECT SINGLE kukla FROM kna1 INTO  wa_yrva_rebate-kukla WHERE kunnr EQ it_annual_consis-sale_order.
*     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
    APPEND wa_yrva_rebate TO it_yrva_rebate.
  ENDLOOP.
  MODIFY yrva_rebate FROM TABLE it_yrva_rebate.
***EOC Adarsh/Archana on charm 4000006427, TR:DVRK9A12BV11997
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
*  ELSEIF R_MONTH = 'X' OR R_MONTH1 EQ 'X' OR R_RPD EQ 'X' OR R_RHD EQ 'X' OR R_RLLD EQ 'X' OR C_MAINT EQ 'X'." SOC Commented by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X' OR c_maint EQ 'X' OR c_maint1 EQ 'X'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X' OR r_rhd EQ 'X' OR r_rlld EQ 'X'.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V12003
*  ELSEIF r_month = 'X' OR r_month1 EQ 'X' OR r_rpd EQ 'X'.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
  CLEAR wa_yrva_rebate.
  REFRESH it_yrva_rebate.
  LOOP AT it_data_monthly WHERE sale_order IS NOT INITIAL.
    UPDATE vbkd SET bstdk = s_sptag-low  bstdk_e = s_sptag-high
            WHERE vbeln = it_data_monthly-sale_order ."AND POSNR = '000010'.
    COMMIT WORK AND WAIT.
    wa_yrva_rebate-vbeln =  it_data_monthly-sale_order.
    wa_yrva_rebate-kunnr =  it_data_monthly-kunnr.
    wa_yrva_rebate-vkbur =  it_data_monthly-vkbur.
    wa_yrva_rebate-lft_qty =  it_data_monthly-grp_lift_qty.
    wa_yrva_rebate-rev_qty =  it_data_monthly-tot_elgl_qty.
    IF r_month EQ 'X'.
      wa_yrva_rebate-reb_cond =  'ZMIS'.
    ENDIF.
    IF r_month1 EQ 'X'.
      wa_yrva_rebate-reb_cond =  'ZAMS'.
    ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    IF r_rhd EQ 'X'.
      wa_yrva_rebate-reb_cond =  'PE07'.
    ENDIF.
    IF r_rlld EQ 'X'.
      wa_yrva_rebate-reb_cond =  'PE08'.
    ENDIF.
**SOC by ujjjwal/priyanka on charm 4000002906 on 10-10-2020 to create new additional MQAIS link discount
    IF r_rpd EQ 'X'.
      wa_yrva_rebate-reb_cond =  'ZRPD'.
    ENDIF.12034
***SOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
    IF c_maint EQ 'X'.
**        wa_yrva_rebate-reb_cond =  'ZP21'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
      wa_yrva_rebate-reb_cond =  'PE32'." SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008973
    ENDIF.
***EOC by Abhinav/Archna/Vishal on Charm  4000006149, TR DVRK9A112V
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    IF c_maint1 EQ 'X'.
      wa_yrva_rebate-reb_cond =  'PE31'.
    ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007222
    wa_yrva_rebate-ord_cond =  'ZCMU'.
    wa_yrva_rebate-value =  it_data_monthly-value.
    wa_yrva_rebate-yy_per_start =  it_data_monthly-begda.
    wa_yrva_rebate-yy_per_end =  it_data_monthly-endda.
    SELECT SINGLE kukla FROM kna1 INTO  wa_yrva_rebate-kukla WHERE kunnr EQ it_data_monthly-kunnr.
*     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
    APPEND wa_yrva_rebate TO it_yrva_rebate.
  ENDLOOP.
  MODIFY yrva_rebate FROM TABLE it_yrva_rebate.
ELSEIF r_newcus = 'X' . "VIVEK
  CLEAR wa_yrva_rebate.
  REFRESH it_yrva_rebate.
  LOOP AT it_data_annual_newcus WHERE sale_order IS NOT INITIAL.
    UPDATE vbkd SET bstdk = s_sptag-low  bstdk_e = s_sptag-high
            WHERE vbeln = it_data_annual_newcus-sale_order ."AND POSNR= '000010'.
    COMMIT WORK AND WAIT.12062
    wa_yrva_rebate-vbeln =  it_data_annual_newcus-sale_order.
    wa_yrva_rebate-kunnr =  it_data_annual_newcus-kunnr.
    wa_yrva_rebate-vkbur =  it_data_annual_newcus-vkbur.
    wa_yrva_rebate-lft_qty =  it_data_annual_newcus-grp_lift_qty.
    wa_yrva_rebate-rev_qty =  it_data_annual_newcus-tot_elgl_qty.
    wa_yrva_rebate-reb_cond =  'ZAIS'.
    wa_yrva_rebate-ord_cond =  'ZCMU'.
    wa_yrva_rebate-value =  it_data_annual_newcus-value.
    wa_yrva_rebate-yy_per_start =  s_sptag-low.
    wa_yrva_rebate-yy_per_end =  s_sptag-high.
    SELECT SINGLE kukla FROM kna1 INTO  wa_yrva_rebate-kukla WHERE kunnr EQ it_data_annual_newcus-sale_order.
*     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
    APPEND wa_yrva_rebate TO it_yrva_rebate.
  ENDLOOP.
  MODIFY yrva_rebate FROM TABLE it_yrva_rebate.12078120791208012081
*    CLEAR WA_YRVA_REBATE.
*    REFRESH IT_YRVA_REBATE.
*    LOOP AT IT_YRVA_QAIS_NEWCUS INTO WA_YRVA_QAIS_NEWCUS WHERE SALE_ORDER IS NOT INITIAL.
*      UPDATE VBKD SET BSTDK = S_SPTAG-LOW  BSTDK_E = S_SPTAG-HIGH
*              WHERE VBELN = WA_YRVA_QAIS_NEWCUS-SALE_ORDER ."AND POSNR= '000010'.
*      COMMIT WORK AND WAIT.
*
*      WA_YRVA_REBATE-VBELN =  WA_YRVA_QAIS_NEWCUS-SALE_ORDER.
*      WA_YRVA_REBATE-KUNNR =  WA_YRVA_QAIS_NEWCUS-KUNNR.
**      WA_YRVA_REBATE-VKBUR =  wa_YRVA_QAIS_NEWCUS-VKBUR.
*      WA_YRVA_REBATE-LFT_QTY =  WA_YRVA_QAIS_NEWCUS-IND_LIFT_QTY ."wa_YRVA_QAIS_NEWCUS-GRP_LIFT_QTY.
**      WA_YRVA_REBATE-REV_QTY =  wa_YRVA_QAIS_NEWCUS-TOT_ELGL_QTY.
*      WA_YRVA_REBATE-REB_COND =  'PE12'  .
*      WA_YRVA_REBATE-ORD_COND =  'ZCMU'.
**      WA_YRVA_REBATE-VALUE =  wa_YRVA_QAIS_NEWCUS-VALUE.
*      WA_YRVA_REBATE-YY_PER_START =  S_SPTAG-LOW.
*      WA_YRVA_REBATE-YY_PER_END =  S_SPTAG-HIGH.
*      SELECT SINGLE KUKLA FROM KNA1 INTO  WA_YRVA_REBATE-KUKLA WHERE KUNNR EQ WA_YRVA_QAIS_NEWCUS-SALE_ORDER.
**     WA_YRVA_REBATE-KUKLA =  IT_DATA_QUATER-SALE_ORDER.
*      APPEND WA_YRVA_REBATE TO IT_YRVA_REBATE.
*      CLEAR : WA_YRVA_QAIS_NEWCUS .
*    ENDLOOP.
*    MODIFY YRVA_REBATE FROM TABLE IT_YRVA_REBATE.
ENDIF.
COMMIT WORK.
*End of change by Suyash Goyal for QAIS Monthly Logic.
ENDFORM.                    " CREATE_SALE_ORDER.
*&*
*&      Form  ANNUAL_DISC_FOR_NEW_CUST
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM annual_disc_for_new_cust .
DATA  lv_fact_pro_annual TYPE p DECIMALS 3.
DATA : lv_percent TYPE char17 .
*    calculate the rate
IF it_yrva_qais_data_newcus IS NOT INITIAL.
  SORT it_yrva_qais_data_newcus[] DESCENDING BY qais_no  kunnr yytimestamp.
  DELETE ADJACENT DUPLICATES FROM it_yrva_qais_data_newcus COMPARING qais_no  kunnr.
  SELECT * INTO TABLE i_a350
    FROM a350 WHERE kappl = 'V'
    AND     kschl = 'PE12'   AND
            vkorg =  '5000' AND
            kfrst = ''       AND
            datab LE s_sptag-high AND
  datbi GE s_sptag-low.
* Condition Types
  IF NOT i_a350[] IS INITIAL.
    SELECT knumh kbetr kstbm
     INTO TABLE i_cond
     FROM konm
     FOR ALL ENTRIES IN i_a350
    WHERE knumh = i_a350-knumh .
  ENDIF.
  LOOP AT it_yrva_qais_data_newcus INTO wa_yrva_qais_data_newcus.
    READ TABLE it_yrva_qais_newcus  INTO wa_yrva_qais_newcus WITH KEYqais_no =  wa_yrva_qais_data_newcus-qais_no .
    IF sy-subrc = 0 AND wa_yrva_qais_newcus-sale_order IS INITIAL .
      IF wa_yrva_qais_data_newcus-waiver_1 IS INITIAL AND wa_yrva_qais_data_newcus-waiver_2 IS INITIAL
           AND wa_yrva_qais_data_newcus-waiver_3 IS INITIAL AND wa_yrva_qais_data_newcus-waiver_qty IS INITIAL .
        IF wa_yrva_qais_data_newcus-ind_lift_qty IS NOT INITIAL.
          lv_percent =    wa_yrva_qais_data_newcus-grp_lift_qty / wa_yrva_qais_data_newcus-mou_qty * 100 .
          CONDENSE lv_percent .
          it_data_annual_newcus-kunnr = wa_yrva_qais_data_newcus-kunnr.
          it_data_annual_newcus-kvgr2 = wa_yrva_qais_data_newcus-kvgr2.
          it_data_annual_newcus-vkbur = wa_yrva_qais_data_newcus-vkbur.
          it_data_annual_newcus-mou_qty = wa_yrva_qais_data_newcus-mou_qty.
          it_data_annual_newcus-waiver_1 = wa_yrva_qais_data_newcus-waiver_1 .
          it_data_annual_newcus-waiver_2 = wa_yrva_qais_data_newcus-waiver_2 .
          it_data_annual_newcus-waiver_3 = wa_yrva_qais_data_newcus-waiver_3 .
          it_data_annual_newcus-ind_lift_qty = wa_yrva_qais_data_newcus-ind_lift_qty .
          it_data_annual_newcus-grp_lift_qty = wa_yrva_qais_data_newcus-grp_lift_qty .
          it_data_annual_newcus-tot_elgl_qty = wa_yrva_qais_data_newcus-tot_elgl_qty .
          CLEAR: it_data_annual_newcus-loyal_discount, wa_yrva_qais_data_m.
          SORT i_cond BY kstbm DESCENDING.
          LOOP AT i_cond .
            w_kbetr = i_cond-kbetr * -1.
            IF lv_percent LT 85 .
              it_data_annual_newcus-value = 0 .
            ELSEIF lv_percent GE 85 AND lv_percent LT  100 .
              it_data_annual_newcus-value = wa_yrva_qais_data_newcus-tot_elgl_qty * ( lv_percent / 100 ) * w_kbetr .
            ELSEIF lv_percent GE  100.
              it_data_annual_newcus-value = wa_yrva_qais_data_newcus-tot_elgl_qty * w_kbetr .
            ENDIF.
          ENDLOOP .
          it_data_annual_newcus-rate = w_kbetr.
          it_data_annual_newcus-remarks = w_remarks.
          CONDENSE it_data_annual_newcus-remarks .
          APPEND it_data_annual_newcus .
          CLEAR: it_data_annual_newcus.
          CLEAR : wa_yrva_qais_data_newcus.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDLOOP.
ENDIF.
ENDFORM.
*&*
*&      Form  ANNUAL_CONSIS_DISCOUNT
*&*
*       text
**
*>  p1        text
*  <p2        text
**
FORM annual_consis_discount .
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
  IF wa_yrva_qais_data-mou_endda <= '20240331'.
** -> Begin of changes by of Aditi on 05.12.2024 12:57:18 for ATC
*      SELECT SINGLE qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no)
*                            WHERE qais_no = @wa_yrva_qais_data-qais_no.
    SELECT qais_no FROM yrva_revival_fai INTO @DATA(lv_qais_no) UP TO1 ROWS
                          WHERE qais_no = @wa_yrva_qais_data-qais_no ORDER BY PRIMARY KEY.
    ENDSELECT.
** <- End changes by of Aditi on 05.12.2024 12:57:22 for ATC
    IF sy-subrc = 0 AND lv_qais_no IS NOT INITIAL.
      DELETE it_yrva_qais_data WHERE qais_no = wa_yrva_qais_data-qais_no.
    ENDIF.
  ENDIF.
  CLEAR : wa_yrva_qais_data, lv_qais_no.
ENDLOOP.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000007399
LOOP AT it_yrva_qais_data INTO wa_yrva_qais_data.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000009519
  DATA: lv_prev TYPE blnpz.
  CLEAR: lv_prev.
  IF wa_yrva_qais_data-p_sc_indicator NE 'S'.
    IF wa_yrva_qais_data-waiver_1 = 'MAR' OR wa_yrva_qais_data-waiver_2 = 'MAR'.
      lv_prev = wa_yrva_mstr_waiver-annual_max.
      wa_yrva_mstr_waiver-annual_max = 125.
    ENDIF.
  ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 400000951912218
  it_annual_consis-mou_begda = wa_yrva_qais_data-mou_begda.
  it_annual_consis-mou_endda = wa_yrva_qais_data-mou_endda.
  it_annual_consis-kunnr     = wa_yrva_qais_data-kunnr.
  it_annual_consis-kvgr2     = wa_yrva_qais_data-kvgr2.
  it_annual_consis-vkbur     = wa_yrva_qais_data-vkbur.
  it_annual_consis-mou_qty   = wa_yrva_qais_data-mou_qty.12225
***Grp Lifted and Individual Lifted Qty
  IF lv_siml EQ 'X'.
    LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN s_sptag-low AND s_sptag-high
      AND pkunag = wa_yrva_qais_data-kunnr
      AND kvgr2  = wa_yrva_qais_data-kvgr2.12231
*       consider only selected material in case of Pipe and ducting sector
      IF wa_yrva_qais_data-p_d_sector = 'X'.
        IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NE'09' AND
          wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
          AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
          AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
          AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'   .
          CONTINUE.12240
        ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondmNE  '21' AND
          wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'K6'.
          CONTINUE.
        ENDIF.
      ENDIF.
      it_annual_consis-ind_lift_qty = it_annual_consis-ind_lift_qty +
       wa_s922-ummenge .
    ENDLOOP.
    IF wa_yrva_qais_data-kvgr2 IS NOT INITIAL.
      LOOP AT it_s922 INTO wa_s922 WHERE sptag BETWEEN s_sptag-low ANDs_sptag-high
       AND kvgr2 = wa_yrva_qais_data-kvgr2.
*       consider only selected material in case of Pipe and ducting sector
        IF wa_yrva_qais_data-p_d_sector = 'X'.
          IF wa_yrva_qais_data-p_r_indicator = 'P' AND wa_s922-kondm NE  '09' AND
            wa_s922-kondm NE  '34'  AND wa_s922-kondm NE  '20'
            AND wa_s922-kondm NE  '56' AND wa_s922-kondm NE  '60'
            AND wa_s922-kondm NE  '43' AND wa_s922-kondm NE  '44'
            AND wa_s922-kondm NE  '46' AND wa_s922-kondm NE  '38'   .
            CONTINUE.12260
          ELSEIF wa_yrva_qais_data-p_r_indicator = 'R' AND wa_s922-kondm NE  '21' AND
            wa_s922-kondm NE  '29' AND wa_s922-kondm NE  'K6'.
            CONTINUE.
          ENDIF.
        ENDIF.
        it_annual_consis-grp_lift_qty = it_annual_consis-grp_lift_qty+
         wa_s922-ummenge .
      ENDLOOP.
    ELSE.
      it_annual_consis-grp_lift_qty = it_annual_consis-ind_lift_qty.
    ENDIF.
  ELSE.
    it_annual_consis-grp_lift_qty = wa_yrva_qais_data-grp_lift_qty_m1+ wa_yrva_qais_data-grp_lift_qty_m2 +
                                    wa_yrva_qais_data-grp_lift_qty_m3+ wa_yrva_qais_data-grp_lift_qty_m4 +
                                    wa_yrva_qais_data-grp_lift_qty_m5+ wa_yrva_qais_data-grp_lift_qty_m6 +
                                    wa_yrva_qais_data-grp_lift_qty_m7+ wa_yrva_qais_data-grp_lift_qty_m8 +
                                    wa_yrva_qais_data-grp_lift_qty_m9+ wa_yrva_qais_data-grp_lift_qty_m10 +
                                    wa_yrva_qais_data-grp_lift_qty_m11+ wa_yrva_qais_data-grp_lift_qty_m12 .12279
    it_annual_consis-ind_lift_qty = wa_yrva_qais_data-ind_lift_qty_m1+ wa_yrva_qais_data-ind_lift_qty_m2 +
                                    wa_yrva_qais_data-ind_lift_qty_m3+ wa_yrva_qais_data-ind_lift_qty_m4 +
                                    wa_yrva_qais_data-ind_lift_qty_m5+ wa_yrva_qais_data-ind_lift_qty_m6 +
                                    wa_yrva_qais_data-ind_lift_qty_m7+ wa_yrva_qais_data-ind_lift_qty_m8 +
                                    wa_yrva_qais_data-ind_lift_qty_m9+ wa_yrva_qais_data-ind_lift_qty_m10 +
                                    wa_yrva_qais_data-ind_lift_qty_m11+ wa_yrva_qais_data-ind_lift_qty_m12 .
  ENDIF.12287
***Getting total elegible qty
  CLEAR: w_year_min, w_year_max.
  w_year_min = wa_yrva_qais_data-mou_qty * wa_yrva_mstr_waiver-annual_min / 100 .
  IF wa_yrva_qais_data-p_d_sector = 'X'.
    IF wa_yrva_mstr_waiver-pd_roto_max IS INITIAL.
      lv_pd_annual_max_flag = 'X'.
    ELSE.
      w_year_max = wa_yrva_qais_data-mou_qty * ( wa_yrva_mstr_waiver-pd_roto_max / 100 ).
    ENDIF.
  ELSE.
    IF wa_yrva_mstr_waiver-annual_max IS INITIAL.
      lv_annual_max_flag = 'X'.
    ELSE.
      w_year_max = wa_yrva_qais_data-mou_qty * wa_yrva_mstr_waiver-annual_max / 100 .
    ENDIF.
  ENDIF.12304
************
  IF it_annual_consis-grp_lift_qty GT w_year_max .
*SOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    IF ( lv_pd_annual_max_flag = 'X' OR lv_annual_max_flag = 'X' ) ANDit_annual_consis-grp_lift_qty GE w_year_min."Added by Kunal/Priyanka on16/04/2019
      it_annual_consis-tot_elgl_qty = ( it_annual_consis-ind_lift_qty/ it_annual_consis-grp_lift_qty )
                                     * it_annual_consis-grp_lift_qty .
*EOC by Kunal/Priyanka  on 09/04/2018 for open upper limit in Annual discount
    ELSE.
      it_annual_consis-tot_elgl_qty = ( it_annual_consis-ind_lift_qty/ it_annual_consis-grp_lift_qty )
                                     * w_year_max .
    ENDIF.
  ELSEIF it_annual_consis-grp_lift_qty GE w_year_min   AND
         it_annual_consis-grp_lift_qty LE w_year_max .
    it_annual_consis-tot_elgl_qty = ( it_annual_consis-ind_lift_qty /it_annual_consis-grp_lift_qty )
       * it_annual_consis-grp_lift_qty .
  ELSE.
    CLEAR it_annual_consis-tot_elgl_qty.
  ENDIF.
************12324
***Getting loyal discount(Annual Consistency Discount)
  DATA: lv_month TYPE vtbbewe-atage,
        lv_begda TYPE vtbbewe-dbervon,
        lv_endda TYPE vtbbewe-dberbis.12329
  lv_begda = it_annual_consis-mou_begda.
  lv_endda = it_annual_consis-mou_endda.1233212333
  CALL FUNCTION 'FIMA_DAYS_AND_MONTHS_AND_YEARS'
    EXPORTING
      i_date_from = lv_begda
      i_date_to   = lv_endda
    IMPORTING
      e_months    = lv_month.12340
  IF sy-subrc EQ 0 AND lv_month IS NOT INITIAL.
    IF lv_month EQ 10 OR lv_month EQ 11.
      it_annual_consis-value = it_annual_consis-tot_elgl_qty * 100.
**      ELSE." SOC Commeneted by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008015
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008015
    ELSEIF lv_month EQ 12.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008015
      it_annual_consis-value = it_annual_consis-tot_elgl_qty * 200.
** SOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008015
    ELSE.
      it_annual_consis-value = it_annual_consis-tot_elgl_qty * 0.
      IF  it_annual_consis-value = 0.
        it_annual_consis-tot_elgl_qty = 0.
      ENDIF.
** EOC by Chilukuri Tripura Reddy/Archna/Vishal Charm : 4000008015
    ENDIF.
  ENDIF.12358
*    IF it_annual_consis-mou_begda EQ '20230401' AND it_annual_consis-mou_endda+4(2) LE '20240331'.
*      it_annual_consis-value = it_annual_consis-value * 200.
*    ELSEIF it_annual_consis-mou_begda GE '20231001' OR it_annual_consis-mou_begda LE '20231101'.
*      it_annual_consis-value = it_annual_consis-value * 100.
*    ENDIF.12364
***Getting Remarks
  it_annual_consis-remarks = w_remarks.
  CONDENSE it_annual_consis-remarks .12368
  APPEND it_annual_consis .
  CLEAR: it_annual_consis.
      IF lv_prev IS NOT INITIAL.
    wa_yrva_mstr_waiver-annual_max = lv_prev.
  ENDIF.
  CLEAR : wa_yrva_qais_data.
ENDLOOP.
ENDFORM.
*&*
*&   Form DYNAMIC_MONTH
*&*
*    text
**
*>P_LS_DATE text
*>P_LS_MONTHN text
**
FORM dynamic_month  USING p_ls_date
                        p_ls_monthn.
CALL FUNCTION 'MONTH_PLUS_DETERMINE'
  EXPORTING
    months  = p_ls_monthn
    olddate = p_ls_date
  IMPORTING
    newdate = p_ls_date.
ENDFORM.
