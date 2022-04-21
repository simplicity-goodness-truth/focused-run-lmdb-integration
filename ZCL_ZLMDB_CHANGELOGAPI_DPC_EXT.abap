class ZCL_ZLMDB_CHANGELOGAPI_DPC_EXT definition
  public
  inheriting from ZCL_ZLMDB_CHANGELOGAPI_DPC
  create public .

public section.
protected section.

  methods CHANGELOGRECORDS_GET_ENTITYSET
    redefinition .
private section.

  methods SEND_EMPTY_RESPONSE
    importing
      !IP_ERROR_TEXT type BAPI_MSG
    returning
      value(EP_MSG) type ref to /IWBEP/IF_MESSAGE_CONTAINER .
ENDCLASS.



CLASS ZCL_ZLMDB_CHANGELOGAPI_DPC_EXT IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_CHANGELOGAPI_DPC_EXT->CHANGELOGRECORDS_GET_ENTITYSET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_FILTER_SELECT_OPTIONS       TYPE        /IWBEP/T_MGW_SELECT_OPTION
* | [--->] IS_PAGING                      TYPE        /IWBEP/S_MGW_PAGING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IT_ORDER                       TYPE        /IWBEP/T_MGW_SORTING_ORDER
* | [--->] IV_FILTER_STRING               TYPE        STRING
* | [--->] IV_SEARCH_STRING               TYPE        STRING
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITYSET(optional)
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_CHANGELOGAPI_MPC=>TT_CHANGELOGRECORD
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method changelogrecords_get_entityset.

    types:
      begin of ty_changelog_records,
        event_type          type lmdb_cl_event_type,
        date                type dats,
        time                type tims,
        element_type        type string,
        tech_system_name    type char40,
        tech_system_ext_sid type char256,
        tech_system_number  type char18,
        name                type string,
        caption             type string,
        class_name          type string,
        old_value           type string,
        new_value           type string,
        user_name           type string,
        sap_guid            type lmdb_sap_guid_c32,
      end of ty_changelog_records .
    types:
      tt_changelog_records type standard table of ty_changelog_records .

    data: rg_filter_so             type /iwbep/t_cod_select_options,
          lv_namespace             type string,
          lt_event_type            type lmdb_t_cl_event_type,
          lv_event_type            type char1,
          lv_hours_to_display      type int1 value 12,
          lv_hours_to_display_char type char12,
          lv_display_tech_system   type char1 value abap_true,
          ls_entityset             like line of et_entityset,
          lt_changelog_records     type tt_changelog_records,
          lv_message_text          type bapi_msg,
          ls_header                type ihttpnvp,
          lt_active_cust_networks  type cl_lmdb_customer_net_reader=>cust_network_headers,
          ls_network               like line of lt_active_cust_networks.

    field-symbols <rs_filter_so> like line of rg_filter_so.



    " -----------------------------------Filters --------------------------------------------------

    data(it_filter_so) = io_tech_request_context->get_filter( )->get_filter_select_options( ).

    " Filter by Namespace

    clear rg_filter_so.

    if <rs_filter_so> is assigned.
      unassign <rs_filter_so>.
    endif. " if <rs_filter_so> is ASSIGNED

    if line_exists( it_filter_so[ property = 'NAMESPACE' ] ).

      rg_filter_so = it_filter_so[ property = 'NAMESPACE' ]-select_options.

      loop at rg_filter_so assigning <rs_filter_so>.
        lv_namespace = <rs_filter_so>-low.
      endloop.

    endif. " if line_exists( it_filter_so[ property = 'NAMESPACE' ] )

    " Filter by Event type

    clear rg_filter_so.

    if <rs_filter_so> is assigned.
      unassign <rs_filter_so>.
    endif. " if <rs_filter_so> is ASSIGNED

    if line_exists( it_filter_so[ property = 'EVENTTYPE' ] ).

      rg_filter_so = it_filter_so[ property = 'EVENTTYPE' ]-select_options.

      loop at rg_filter_so assigning <rs_filter_so>.

        lv_event_type = <rs_filter_so>-low.

        condense lv_event_type.

        case lv_event_type.

          when 'C'.
            append cl_lmdb_cl_event_type=>create to lt_event_type.
          when 'R'.
            append cl_lmdb_cl_event_type=>rename to lt_event_type.
          when 'U'.
            append cl_lmdb_cl_event_type=>modify to lt_event_type.
          when 'D'.
            append cl_lmdb_cl_event_type=>delete to lt_event_type.
        endcase. " case lv_event_type

      endloop.

    endif. " if line_exists( it_filter_so[ property = 'EVENTTYPE' ] )

    " Filter by Hours to display

    clear rg_filter_so.

    if <rs_filter_so> is assigned.
      unassign <rs_filter_so>.
    endif. " if <rs_filter_so> is ASSIGNED

    if line_exists( it_filter_so[ property = 'HOURSTODISPLAY' ] ).

      rg_filter_so = it_filter_so[ property = 'HOURSTODISPLAY' ]-select_options.

      loop at rg_filter_so assigning <rs_filter_so>.
        lv_hours_to_display = <rs_filter_so>-low.
      endloop.

    endif. " if line_exists( it_filter_so[ property = 'HOURSTODISPLAY' ] )


    " Filter by Tech System Display flag

    clear rg_filter_so.

    if <rs_filter_so> is assigned.
      unassign <rs_filter_so>.
    endif. " if <rs_filter_so> is ASSIGNED

    if line_exists( it_filter_so[ property = 'DISPLAYTECHSYSTEM' ] ).

      rg_filter_so = it_filter_so[ property = 'DISPLAYTECHSYSTEM' ]-select_options.

      loop at rg_filter_so assigning <rs_filter_so>.
        lv_display_tech_system = <rs_filter_so>-low.
      endloop.

    endif. " if line_exists( it_filter_so[ property = 'DISPLAYTECHSYSTEM' ] )

    " ----------------------------------- Request for change log records --------------------------------------------------

    lt_active_cust_networks = cl_lmdb_customer_net_reader=>create( )->read_active_cust_net_headers( ).

    read table lt_active_cust_networks into ls_network with table key name = lv_namespace.

    if sy-subrc = 0.

      call method zcl_lmdb_data_finder=>get_change_log_records
        exporting
              ip_namespace           = lv_namespace
          "ip_namespace           = ls_network-namespace_name
          ip_event_type          = lt_event_type
          ip_hours_to_display    = lv_hours_to_display
          ip_display_tech_system = lv_display_tech_system
        importing
          et_change_log_records  = lt_changelog_records.

      loop at lt_changelog_records assigning field-symbol(<ls_changelog_records>).

        clear ls_entityset.

        ls_entityset-eventtype = lv_event_type.

        convert date <ls_changelog_records>-date time <ls_changelog_records>-time into
          time stamp ls_entityset-timestamp time zone 'UTC'.

        ls_entityset-elementtype = <ls_changelog_records>-element_type.
        ls_entityset-techsystemnumber = <ls_changelog_records>-tech_system_number.
        ls_entityset-techsystemextsid = <ls_changelog_records>-tech_system_ext_sid.
        ls_entityset-techsystemsid = <ls_changelog_records>-tech_system_name.
        ls_entityset-name = <ls_changelog_records>-name.
        ls_entityset-caption = <ls_changelog_records>-caption.
        ls_entityset-classname = <ls_changelog_records>-class_name.
        ls_entityset-oldvalue = <ls_changelog_records>-old_value.
        ls_entityset-newvalue = <ls_changelog_records>-new_value.
        ls_entityset-username = <ls_changelog_records>-user_name.
        ls_entityset-guid = <ls_changelog_records>-sap_guid.
        ls_entityset-displaytechsystem = lv_display_tech_system.
        " ls_entityset-namespace = lv_namespace.
        ls_entityset-namespace = ls_network-namespace_name.
        ls_entityset-hourstodisplay = lv_hours_to_display.

        append ls_entityset  to et_entityset.

      endloop. " loop at lt_changelog_records ASSIGNING FIELD-SYMBOL(<ls_changelog_records>)

    endif."if sy-subrc = 0


    " ~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^
    "   Errors processing
    " ~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~~^~^~^~^~^~^~^~^


    if et_entityset is initial.

      clear lv_message_text.

      lv_hours_to_display_char = lv_hours_to_display.
      condense lv_hours_to_display_char.

      concatenate 'no'  lv_event_type 'events for last' lv_hours_to_display_char 'hours' into lv_message_text separated by space.

      ls_header-name = 'zlmdbapistatus'.
      ls_header-value = lv_message_text.

      set_header( is_header = ls_header ).

    endif. " if et_entityset is initial




  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_ZLMDB_CHANGELOGAPI_DPC_EXT->SEND_EMPTY_RESPONSE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_ERROR_TEXT                  TYPE        BAPI_MSG
* | [<-()] EP_MSG                         TYPE REF TO /IWBEP/IF_MESSAGE_CONTAINER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SEND_EMPTY_RESPONSE.

    data:
          lo_msg type ref to /iwbep/if_message_container.

   " call method me->/iwbep/if_mgw_conv_srv_runtime~get_message_container
    call method /iwbep/if_mgw_conv_srv_runtime~get_message_container
      receiving
        ro_message_container = ep_msg.

    call method ep_msg->add_message_text_only
      exporting
        iv_msg_type = /iwbep/cl_cos_logger=>error
        iv_msg_text = ip_error_text.

  endmethod.
ENDCLASS.