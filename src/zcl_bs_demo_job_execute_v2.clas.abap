CLASS zcl_bs_demo_job_execute_v2 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_apj_rt_run.

    TYPES tt_r_range TYPE RANGE OF zbs_demo_job_system.

    DATA md_user     TYPE c LENGTH 10.
    DATA mt_system   TYPE tt_r_range.
    DATA md_test     TYPE abap_boolean.
    DATA md_edate    TYPE d.
    DATA md_etime    TYPE t.
    DATA md_radio_de TYPE abap_boolean.
    DATA md_radio_en TYPE abap_boolean.
    DATA md_radio_fr TYPE abap_boolean.
ENDCLASS.


CLASS zcl_bs_demo_job_execute_v2 IMPLEMENTATION.
  METHOD if_apj_rt_run~execute.
    TRY.
        DATA(lo_log) = cl_bali_log=>create( ).
        DATA(lo_header) = cl_bali_header_setter=>create( object      = 'ZBS_DEMO_JOBV2_LOG'
                                                         subobject   = 'JOB'
                                                         external_id = CONV #( xco_cp=>uuid( )->value ) ).
        lo_log->set_header( lo_header ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_USER: { md_user }| ) ).

        LOOP AT mt_system INTO DATA(ls_system).
          lo_log->add_item(
              cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                text     = |MD_USER: { ls_system-low } - { ls_system-high }| ) ).

        ENDLOOP.

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_TEST: { md_test }| ) ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_EDATE: { md_edate }| ) ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_ETIME: { md_etime }| ) ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_RADIO_DE: { md_radio_de }| ) ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_RADIO_EN: { md_radio_en }| ) ).

        lo_log->add_item( cl_bali_free_text_setter=>create( severity = if_bali_constants=>c_severity_status
                                                            text     = |MD_RADIO_FR: { md_radio_fr }| ) ).

        cl_bali_log_db=>get_instance( )->save_log( log                        = lo_log
                                                   assign_to_current_appl_job = abap_true ).
      CATCH cx_root INTO DATA(lo_error).
        RAISE EXCEPTION NEW cx_apj_rt_content( previous = lo_error ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
