class zcl_lmdb_data_finder definition
  public
  final
  create public .

  public section.

    types:
      begin of ty_technical_system_xt,
        guid         type lmdb_sap_guid_c32,
        extsid       type lmdb_esid,
        sid          type lmdb_sapsystemname,
        system_type  type lmdb_system_type,
        systemnumber type string,
        hanarelease  type string,
        caption      type string,
      end of ty_technical_system_xt .
    types:
      tt_technical_system_xt type sorted table of ty_technical_system_xt with unique key guid .
    types:
      begin of ty_technical_system,
        guid         type lmdb_sap_guid_c32,
        extsid       type lmdb_esid,
        sid          type lmdb_sapsystemname,
        system_type  type lmdb_system_type,
        systemnumber type string,
        caption      type string,
      end of ty_technical_system .
    types:
      tt_technical_system type sorted table of ty_technical_system with unique key guid .
    types:
      begin of ty_product_information,
        guid     type string,
        ppms_num type lmdb_ppms_number,
        name     type string,
        version  type string,
        vendor   type string,
        addon    type boolean,
      end of ty_product_information .
    types:
      tt_prod_info type standard table of ty_product_information .
    types:
      begin of ty_clients,
        guid         type string,
        number       type i,
        location     type string,
        log_sys_name type string,
        role         type string,
      end of ty_clients .
    types:
      tt_clients type standard table of ty_clients .
    types:
      begin of ty_technical_instance,
        guid               type lmdb_sap_guid_c32,
        name               type string,
        caption            type string,
        number             type string,
        host_guid          type lmdb_sap_guid_c32,
        short_display_text type string,
        element_type       type string,
      end of ty_technical_instance .
    types:
      tt_technical_instances type sorted table of ty_technical_instance with unique key guid .
    types:
      begin of operating_system,
        caption type string,
        name    type string,
        release type string,
        type    type string,
        version type string,
        bits    type i,
      end of operating_system .
    types:
      begin of ty_host,
        guid type lmdb_sap_guid_c32,
        name type string,
      end of ty_host .
    types:
      tt_hosts type sorted table of ty_host with unique key guid .
    types:
      begin of ty_host_details,
        host       type ty_host,
        fqdn       type string,
        is_logical type abap_bool,
        real_host  type ty_host,
        os         type operating_system,
        ip         type string,
        element_type        type string,
          os_element_type        type string,
        " tech_systems TYPE CL_LMDB_TECHNICAL_SYSTEM=>TECHNICAL_SYSTEMS,
      end of ty_host_details .
    types:
      begin of tt_database,
        "! The name of the database.
        "! If the database is a HANA Database, in the single-DB configuration, the name is
        "! equal to the 3-char SID. In the MDC (multiple DB configuration), the name of the system DB
        "! is equal to the 3-char SID and all tenants use their external name as name.
        guid              type lmdb_sap_guid_c32,
        name              type string,
        extsid            type lmdb_esid,
        "! Whether the database a HANA Database is.
        is_hana           type abap_bool,
        "! If the database is a HANA Database (is_hana = true), this field shows whether the database the
        "! system database is.
        is_hana_system_db type abap_bool,
        "! If the database is a HANA Database (is_hana = true), this field shows whether the database a
        "! tenant database is.
        is_hana_tenant    type abap_bool,
      end of tt_database .
    types:
      begin of ty_soft_with_sp_patch_line,
        guid    type string,
        name    type string,
        version type string,
        sp      type string,
        patch   type string,
      end of ty_soft_with_sp_patch_line .
    types:
      tt_software_with_sp_patch type standard table of ty_soft_with_sp_patch_line .
    types:
      begin of ty_soft_ti_with_sp_patch_line.
        include type ty_soft_with_sp_patch_line.
    types:
        installed_on_name type string,
        installed_on_guid type lmdb_sap_guid_c32,
      end of ty_soft_ti_with_sp_patch_line .
    types:
      tt_software_ti_with_sp_patch type standard table of ty_soft_ti_with_sp_patch_line .
    types:
      begin of ty_ports,
        guid         type string,
        port_type    type char40,
        name         type char40,
        number       type i,
        url          type string,
        service      type char40,
        protocol     type char40,
        service_type type char40,
        element_type type string,
      end of ty_ports .
    types:
      tt_ports type standard table of ty_ports .
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

    class-methods get_assoc_by_id_and_name
      importing
        !ip_guid           type lmdb_sap_guid_c32
        !ip_assoc_class    type string
        !ip_namespace_name type lmdb_short_cim_namespace_name
      returning
        value(eo_objwrefs) type cim_t_objwref .
    class-methods get_sys_num_for_ts
      importing
        !io_technical_system    type ref to cl_lmdb_technical_system
      returning
        value(ep_system_number) type likey_system_no .
    class-methods get_host_other_data_by_guid
      importing
        !ip_guid               type lmdb_sap_guid_c32
        !ip_namespace          type lmdb_short_cim_namespace_name
      exporting
        !et_other_fqdn_names   type string_table
        !et_other_ip_addresses type string_table .
    class-methods get_change_log_records
      importing
        !ip_namespace           type string
        !ip_event_type          type lmdb_t_cl_event_type
        !ip_hours_to_display    type int1
        !ip_display_tech_system type char1
      exporting
        !et_change_log_records  type tt_changelog_records .
    class-methods get_tech_sys_assoc_by_guid
      importing
        !ip_guid           type lmdb_sap_guid_c32 optional
        !lo_wbem_client    type ref to if_wbem_sap_client optional
        !lo_query_client   type ref to if_lmdb_query_client optional
        !ip_ancestor_guid  type lmdb_sap_guid_c32 optional
      changing
        !ep_system_name    type char40
        !ep_system_ext_sid type char256 optional
        !ep_system_number  type char18 optional .
    class-methods get_ports_by_inst_guid
      importing
        !ip_guid           type lmdb_sap_guid_c32
        !ip_system_type    type char40
        !ip_namespace_name type lmdb_short_cim_namespace_name
      exporting
        !et_ports          type tt_ports
        !ep_element_type   type string .
    methods get_license_by_sys_guid
      importing
        !ip_guid               type lmdb_sap_guid_c32
      exporting
        !ev_installed_licenses type if_lmdb_with_installed_license=>installed_licenses
        !ep_element_type       type string .
    methods get_tech_sys_by_extsid
      importing
        !ip_extendsid    type lmdb_esid
      exporting
        !ep_result       type tt_technical_system_xt
        !ep_element_type type string .
    methods get_software_by_sys_guid
      importing
        !ip_guid                       type lmdb_sap_guid_c32
      exporting
        !et_software_on_tech_system    type tt_software_with_sp_patch
        !et_software_on_tech_instances type tt_software_ti_with_sp_patch
        !ep_element_type               type string .
    methods get_products_by_sys_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      exporting
        !et_result       type tt_prod_info
        !ep_element_type type string .
    methods get_host_by_host_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      returning
        value(ep_result) type ty_host_details .
    methods get_tech_sys_inst_by_sys_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      returning
        value(et_result) type tt_technical_instances .
    methods get_abap_clients_by_sys_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      exporting
        value(et_result) type tt_clients
        !ep_element_type type string .
    methods get_db_release_by_db_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      returning
        value(ep_result) type string .
    methods get_db_sys_by_db_guid
      importing
        !ip_guid         type lmdb_sap_guid_c32
      exporting
        !ep_element_type type string
      returning
        value(ep_result) type tt_database .
    methods get_db_guid_by_sys_guid
      importing
        !ip_tech_sys_guid type lmdb_sap_guid_c32
      returning
        value(ep_result)  type lmdb_sap_guid_c32 .
    methods get_tech_sys_db_by_sys_guid
      importing
        !ip_tech_sys_guid type lmdb_sap_guid_c32
      exporting
        !ep_element_type  type string
      returning
        value(ep_result)  type lmdb_sap_guid_c32 .
    methods constructor
      importing
        !ip_namespace type lmdb_short_cim_namespace_name .
    methods get_all_tech_sys
      returning
        value(ep_result) type cl_lmdb_technical_system=>technical_systems .
    methods get_tech_sys_by_sys_guid
      importing
        value(ip_tech_sys_guid) type lmdb_sap_guid_c32
      exporting
        !ep_element_type        type string
      returning
        value(ep_result)        type tt_technical_system .
    methods get_tech_sys_by_sys_num
      importing
        value(ip_sys_num) type likey_system_no
      exporting
        !ep_element_type  type string
      returning
        value(ep_result)  type tt_technical_system .
protected section.
private section.

  data tech_system_api type ref to if_lmdb_api_for_tech_syst .
  data host_api type ref to if_lmdb_api_for_host .

  methods get_technical_system_by_guid
    importing
      !ip_guid         type lmdb_sap_guid_c32
    returning
      value(ep_result) type ref to cl_lmdb_technical_system .
  methods get_software_for_ts
    importing
      !tech_system    type ref to cl_lmdb_technical_system
    exporting
      !software_on_ts type tt_software_with_sp_patch .
  methods get_software_for_ti_of_ts
    importing
      !tech_system    type ref to cl_lmdb_technical_system
    exporting
      !software_on_ti type tt_software_ti_with_sp_patch .
  methods get_software_for_abstr_entity
    importing
      !abstract_entity type ref to cl_lmdb_abstract_entity
    exporting
      !software        type tt_software_with_sp_patch .
  methods get_sid
    importing
      !ip_technical_system type ref to cl_lmdb_technical_system
    returning
      value(ep_result)     type lmdb_sapsystemname .
  methods get_real_host
    importing
      !io_host         type ref to cl_lmdb_host
    returning
      value(ep_result) type ty_host .
  methods get_prod_version
    importing
      !ic_prod_version type ref to cl_lmdb_product_version
    exporting
      !es_prod_info    type ty_product_information .
  methods format_and_add_sp_patch_softw
    importing
      !soft_comps         type cl_lmdb_installed_soft_comp=>installed_component_versions
    exporting
      !formatted_software type tt_software_with_sp_patch .
ENDCLASS.



CLASS ZCL_LMDB_DATA_FINDER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_NAMESPACE                   TYPE        LMDB_SHORT_CIM_NAMESPACE_NAME
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method constructor.

    try.
        data(lmdb_api_factory) = cl_lmdb_api_factory=>create( cl_cim_namespace=>create( |{ ip_namespace }| ) ).
        tech_system_api = lmdb_api_factory->get_technical_system_api( ).
        host_api = lmdb_api_factory->get_host_api( ).

      catch cx_wbem_cim_err into data(wbem_cim_err).



    endtry.

*    me->mo_bo_ts = cl_lmdb_bo_ts=>s_get_instance( ).
*   me->mo_bo_service   = cl_lmdb_bo_service=>s_get_instance( ).
*
*    mo_bo_cim_instance  = cl_lmdb_bo_cim_instance=>s_get_instance( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->FORMAT_AND_ADD_SP_PATCH_SOFTW
* +-------------------------------------------------------------------------------------------------+
* | [--->] SOFT_COMPS                     TYPE        CL_LMDB_INSTALLED_SOFT_COMP=>INSTALLED_COMPONENT_VERSIONS
* | [<---] FORMATTED_SOFTWARE             TYPE        TT_SOFTWARE_WITH_SP_PATCH
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method format_and_add_sp_patch_softw.

    clear formatted_software.

    loop at soft_comps into data(inst_swcv).

      try.

          data(inst_supp_pack) = inst_swcv->get_installed_support_package( ).
          data(supp_pack_version) = inst_supp_pack->version.
          data(supp_pack_patch) = inst_supp_pack->get_patch_level( ).

        catch cx_lmdb_no_installed_supp_pack.

          clear supp_pack_version.
          clear supp_pack_patch.

      endtry.

      insert value #(
     "   guid = inst_swcv->guid
        name     = inst_swcv->name
        version  = inst_swcv->version
        sp       = supp_pack_version
        patch    = supp_pack_patch )
          into table formatted_software.

    endloop.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_ABAP_CLIENTS_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<---] ET_RESULT                      TYPE        TT_CLIENTS
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_abap_clients_by_sys_guid.

    types : begin of ty_clients,
              guid         type string,
              number       type i,
              location     type string,
              log_sys_name type string,
              role         type string,
            end of ty_clients.

    data :
      lt_clients_tab type table of ty_clients,
      ls_client_tab  type ty_clients,
      lo_cim_element type ref to cl_cim_elementname,
      lv_index       type i,
      lv_lines       type i..
    try.

        if ip_guid is initial.
          exit.
        endif.

        data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).
        data(lt_clients) = cast cl_lmdb_abap_system( lo_tech_system )->get_clients( ).
        clear: lv_index,lv_lines.
        lv_index = 1.
        describe table lt_clients lines lv_lines.
        do lv_lines times.
          read table lt_clients into data(ls_clients) index lv_index.

          ls_client_tab-guid   = ls_clients->get_guid( ).
          ls_client_tab-number   = ls_clients->get_number( ).
          ls_client_tab-location = ls_clients->get_location( ).
          ls_client_tab-log_sys_name = ls_clients->get_logical_system_name( ).
          ls_client_tab-role = ls_clients->get_role_display_text( ).
          append ls_client_tab to et_result.
          clear ls_client_tab.
          add 1 to lv_index.
        enddo.

        " ---- Adding output of element type ----


        data(lo_cim_instance) = ls_clients->get_cim_instance( ).
        lo_cim_element = lo_cim_instance->elementname.
        ep_element_type = lo_cim_element->name.

      catch cx_sy_move_cast_error ##NO_HANDLER. " Can not have instances

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_ALL_TECH_SYS
* +-------------------------------------------------------------------------------------------------+
* | [<-()] EP_RESULT                      TYPE        CL_LMDB_TECHNICAL_SYSTEM=>TECHNICAL_SYSTEMS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_all_tech_sys.

    try.

        " Taking all technical systems

        ep_result = tech_system_api->get_all_technical_systems( ).

      catch cx_wbem_cim_err into data(wbem_cim_err).

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_ASSOC_BY_ID_AND_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [--->] IP_ASSOC_CLASS                 TYPE        STRING
* | [--->] IP_NAMESPACE_NAME              TYPE        LMDB_SHORT_CIM_NAMESPACE_NAME
* | [<-()] EO_OBJWREFS                    TYPE        CIM_T_OBJWREF
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_assoc_by_id_and_name.

    " Search for GUID without tonns of redefinitions

    data:
      "  lo_system_objwrefs type cim_t_objwref,
      lr_guid_result   type ref to cl_cim_objectwithreference,
      lo_ports_objwref type ref to cl_cim_objectwithreference,
      lv_refstring     type lmdb_refstring.

    data(lo_domain_manager) = cl_lmdb_cim_factory=>get_domain_manager( ).
    data(lo_domain_context) = lo_domain_manager->get_domain_context( cl_lmdb_cim_domain=>ldb ).
    data(lo_wbem_client) = lo_domain_context->create_wbem_client( ).
    data(lo_query_client) = lo_domain_context->create_query_client( ).

    try.


        lo_wbem_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace_name }| ) ).
        lo_query_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace_name }| ) ).


        lo_query_client->get_instance_by_guid(
               exporting
                 iv_instance_guid = ip_guid
               importing
                 eo_guid_result   = lr_guid_result ).

        if lr_guid_result is bound.
          lv_refstring = lr_guid_result->reference->to_string( comparable = abap_true ).
        else.
          clear: lv_refstring.
        endif.

        eo_objwrefs = lo_wbem_client->associators(
                    objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
                    assocclass  = cl_cim_elementname=>create( ip_assoc_class ) ).

      catch cx_wbem_cim_err cx_lmdb_namespace_mismatch into data(le_exception).

        return.

    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_CHANGE_LOG_RECORDS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_NAMESPACE                   TYPE        STRING
* | [--->] IP_EVENT_TYPE                  TYPE        LMDB_T_CL_EVENT_TYPE
* | [--->] IP_HOURS_TO_DISPLAY            TYPE        INT1
* | [--->] IP_DISPLAY_TECH_SYSTEM         TYPE        CHAR1
* | [<---] ET_CHANGE_LOG_RECORDS          TYPE        TT_CHANGELOG_RECORDS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_change_log_records.

    types : begin of ty_systems_cache,

              guid           type lmdb_sap_guid_c32,
              system_name    type char40,
              system_ext_sid type char256,
              system_number  type char18,

            end of ty_systems_cache.

    data: lv_start_time_tz        type tzntstmpl,
          lv_end_time_tz          type tzntstmpl,
          lv_start_time           type timestamp,
          lv_end_time             type timestamp,
          lv_seconds_to_display   type i,
          lo_domain_context       type ref to cl_lmdb_cim_domain_context,
          lo_change_log_client    type ref to cl_lmdb_changelog_client,
          lr_cim_instance_obj     type ref to cl_cim_instance,
          lr_object_with_ref      type ref to cl_cim_objectwithreference,
          ls_changelog_records    type ty_changelog_records,
          lv_assoc_guid_32        type lmdb_sap_guid_c32,
          lt_systems_cache        type sorted table of ty_systems_cache with unique key guid,
          wa_systems_cache        type ty_systems_cache,
          lv_system_name          type char40,
          lv_system_ext_sid       type char256,
          lv_system_number        type char18,
          lv_namespace_code       type string,
          lt_active_cust_networks type cl_lmdb_customer_net_reader=>cust_network_headers,
          ls_network              like line of lt_active_cust_networks,
          lv_sap_guid             type string,
          lv_name                 type string,
          lv_caption              type string,
          lt_zlmdbapichlogelm     type standard table of zlmdbapichlogelm,
          lt_element_name_filter  type cim_t_elementname,
          wa_element_name_filter  like line of lt_element_name_filter,
          lv_cim_element_name     type string.

    " Picking permitted element types

    select elementtype from zlmdbapichlogelm into corresponding fields of table lt_zlmdbapichlogelm.

    " Calculation of timestamps

    get time stamp field lv_end_time_tz.

    lv_seconds_to_display = ip_hours_to_display * 3600.

    call method cl_abap_tstmp=>subtractsecs
      exporting
        tstmp   = lv_end_time_tz
        secs    = lv_seconds_to_display
      receiving
        r_tstmp = lv_start_time_tz.

    lv_start_time = lv_start_time_tz.
    lv_end_time = lv_end_time_tz.

    " Access to change log

    lo_domain_context ?= cl_lmdb_cim_factory=>get_domain_manager( )->get_domain_context( cl_lmdb_cim_domain=>ldb ).
    lo_change_log_client = new cl_lmdb_changelog_local_client( lo_domain_context ).

    " Preapaing wbem and query clients and change log filter

    data(lo_wbem_client) = lo_domain_context->create_wbem_client( ).
    data(lo_query_client) = lo_domain_context->create_query_client( ).

    lt_active_cust_networks = cl_lmdb_customer_net_reader=>create( )->read_active_cust_net_headers( ).

    read table lt_active_cust_networks into ls_network with table key name = ip_namespace.



    "   lo_wbem_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace }| ) ).
    lo_wbem_client->set_target_namespace( cl_cim_namespace=>create( |{ ls_network-namespace_name }| ) ).
    "lo_query_client->set_target_namespace( cl_cim_namespace=>create( |{ `ip_namespace }| ) ).
    lo_query_client->set_target_namespace( cl_cim_namespace=>create( |{ ls_network-namespace_name }| ) ).

    " data(lo_filter) = new cl_lmdb_cl_filter( cl_cim_namespace=>create( ip_namespace ) ).
    lv_namespace_code = ls_network-namespace_name.

    data(lo_filter) = new cl_lmdb_cl_filter( cl_cim_namespace=>create( lv_namespace_code ) ).

    lo_filter->set_start_time( lv_start_time ).
    lo_filter->set_end_time( lv_end_time ).
    lo_filter->set_event_types( ip_event_type ).


    " Adding filter by specific element names

    loop at lt_zlmdbapichlogelm assigning field-symbol(<ls_zlmdbapichlogelm>).

      clear: lv_cim_element_name,  wa_element_name_filter.

      lv_cim_element_name =  <ls_zlmdbapichlogelm>-elementtype.
      wa_element_name_filter = cl_cim_elementname=>create( lv_cim_element_name ).
      append  wa_element_name_filter to  lt_element_name_filter.
*
    endloop.

    lo_filter->set_names( lt_element_name_filter ).
    lo_filter->set_subclasses( abap_false ).

    " Start of data collection

    data(lo_iterator) = lo_change_log_client->get_entry_iterator( lo_filter ).

    while lo_iterator->has_next( ) = abap_true.

      data(lo_entry) = lo_iterator->next( ).


      " Creating output only for CIM instances

      if ( lo_entry->object_type = 'I' ).

        data(lr_change_log_element) =  lo_entry->element.

        lr_object_with_ref ?= lr_change_log_element.


        if lr_object_with_ref is not initial.

          lr_cim_instance_obj ?= lr_object_with_ref->object.

        endif. " if lr_object_with_ref is not initial


        " Picking up GUID

        clear lv_sap_guid.

        if lr_cim_instance_obj is not initial.



          " Filtering out redundand events according to setup in zlmdbapichlogelm table

*          read table lt_zlmdbapichlogelm with key elementtype = lr_cim_instance_obj->elementname->name transporting no fields.
*
*          if sy-subrc <> 0.
*
*            continue.
*
*          endif.
*

          loop at lr_cim_instance_obj->qualifier_list assigning field-symbol(<lr_cim_instance_obj>) where comparable_name = 'sap_guid'.

            lv_sap_guid = <lr_cim_instance_obj>-value.

          endloop.

          " If GUID is empty - skip the record

          if lv_sap_guid is not initial.

            "replace all occurrences of '-' in lv_sap_guid with ''.

            lv_sap_guid =  cl_lmdb_guid_util=>convert_guid_c36_to_c32( lv_sap_guid ).

            "  ls_changelog_records-sap_guid = lv_sap_guid.

          else.

            continue.

          endif. " if lv_sap_guid is not initial

        endif. " if lr_cim_instance_obj is not initial


        clear: lv_name,
               lv_caption.

        loop at lr_cim_instance_obj->property_list assigning field-symbol(<ls_property_list>).

          case <ls_property_list>-comparable_name.

            when 'name'.
              lv_name = <ls_property_list>-value.

            when 'caption'.

              lv_caption = <ls_property_list>-value.

          endcase. " case <ls_property_list>-comparable_name

        endloop. " loop at lr_cim_instance_obj->property_list assigning field-symbol(<ls_property_list>)





        call method cl_lmdb_cl_entry_comparator=>get_instance_oldinstance_delta
          exporting
            changelog_entry  = lo_entry
          importing
            properties_delta = data(lt_properties_delta)
            qualifiers_delta = data(lt_qualifiers_delta).


        " Search for a system reference



        if ( ip_display_tech_system = 'X' ) and ( lt_properties_delta is not initial ).

          if lv_sap_guid is not initial.

            lv_assoc_guid_32 = lv_sap_guid.

            clear: lv_system_name,
                   lv_system_ext_sid,
                   lv_system_number,
                   wa_systems_cache.

            translate lv_assoc_guid_32 to upper case.

            read table lt_systems_cache into wa_systems_cache
              with key guid = lv_assoc_guid_32.

            if wa_systems_cache is initial.

              zcl_lmdb_data_finder=>get_tech_sys_assoc_by_guid(
                           exporting
                              ip_guid = lv_assoc_guid_32
                              lo_wbem_client = lo_wbem_client
                              lo_query_client = lo_query_client
                           changing
                              ep_system_name = lv_system_name
                              ep_system_ext_sid = lv_system_ext_sid
                              ep_system_number = lv_system_number ).

              ls_changelog_records-tech_system_name = lv_system_name.
              ls_changelog_records-tech_system_ext_sid = lv_system_ext_sid.
              ls_changelog_records-tech_system_number = lv_system_number.

              wa_systems_cache-guid = lv_assoc_guid_32.
              wa_systems_cache-system_name = lv_system_name.
              wa_systems_cache-system_ext_sid = lv_system_ext_sid.
              wa_systems_cache-system_number = lv_system_number.

              insert wa_systems_cache into table lt_systems_cache.

            else.

              ls_changelog_records-tech_system_name = wa_systems_cache-system_name.
              ls_changelog_records-tech_system_ext_sid = wa_systems_cache-system_ext_sid.
              ls_changelog_records-tech_system_number = wa_systems_cache-system_number.

            endif. " if wa_systems_cache is initial

          endif. "if lv_sap_guid is not initial

        endif. " if ( IP_DISPLAY_TECH_SYSTEM = 'X' ).





        if ( lt_properties_delta is not initial ).

          loop at lt_properties_delta assigning field-symbol(<ls_properties_delta>) .


            if ( <ls_properties_delta>-elementname->name = 'SyncTime' ) or
               ( <ls_properties_delta>-elementname->name = 'LastProcessedTime' ) or
               ( <ls_properties_delta>-elementname->name = 'SuppliedDataFingerprint' ) or
               ( <ls_properties_delta>-elementname->name = 'CPURate' ) or
               ( <ls_properties_delta>-elementname->name = 'CPUType' ).

              continue.

            endif. " if ( <ls_properties_delta>-elementname->name = 'SyncTime' )...


            " Preparing output record

            ls_changelog_records-sap_guid = lv_sap_guid.
            ls_changelog_records-name = lv_name.
            ls_changelog_records-caption = lv_caption.

            if lr_cim_instance_obj is not initial.

              ls_changelog_records-element_type = lr_cim_instance_obj->elementname->name.

            endif. " if lr_cim_instance_obj is not initial

            ls_changelog_records-event_type = lo_entry->event_type.
            ls_changelog_records-user_name = lo_entry->user_name.
            ls_changelog_records-date = lo_entry->time->datetime-date.
            ls_changelog_records-time = lo_entry->time->datetime-time.






            ls_changelog_records-class_name = <ls_properties_delta>-elementname->name.
            ls_changelog_records-old_value = <ls_properties_delta>-old_value-value.
            ls_changelog_records-new_value = <ls_properties_delta>-value-value.

            condense ls_changelog_records-class_name.



            append ls_changelog_records to et_change_log_records.

          endloop. " loop at lt_properties_delta ASSIGNING FIELD-SYMBOL(<ls_properties_delta>)






        endif. " if ( lt_properties_delta is not initial )

        clear ls_changelog_records.


      endif. " if ( entry->object_type = 'I' )

    endwhile. " while lo_iterator->has_next( ) = abap_true

    "     data(a) = 1.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_DB_GUID_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_TECH_SYS_GUID               TYPE        LMDB_SAP_GUID_C32
* | [<-()] EP_RESULT                      TYPE        LMDB_SAP_GUID_C32
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_db_guid_by_sys_guid.
    try.

        if ip_tech_sys_guid is initial.
          exit.
        endif.

        data(lv_tech_system) = get_technical_system_by_guid( ip_tech_sys_guid ).
        data(lv_database) = cast if_lmdb_system_on_database( lv_tech_system )->get_system_database( ) .

        ep_result = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lv_database->get_guid( ) ).

      catch cx_sy_move_cast_error.



      catch cx_wbem_cim_err .


    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_DB_RELEASE_BY_DB_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<-()] EP_RESULT                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_db_release_by_db_guid.

    if ip_guid is initial.
      exit.
    endif.

    try.

        try.

            data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).
            ep_result = cast cl_lmdb_hana_database( lo_tech_system )->get_release( ).

          catch cx_sy_move_cast_error.

            ep_result = cast cl_lmdb_database( lo_tech_system )->get_release( ).

        endtry.

      catch cx_sy_move_cast_error.



    endtry.



  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_DB_SYS_BY_DB_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* | [<-()] EP_RESULT                      TYPE        TT_DATABASE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_db_sys_by_db_guid.

    if ip_guid is initial.
      exit.
    endif.

    try.

        data(lo_database) = cast cl_lmdb_database( get_technical_system_by_guid( ip_guid ) ) .
        ep_result-name = lo_database->get_name( ).
        ep_result-extsid = lo_database->get_extended_sid( ).

        try.
            data(lo_hana_database) = cast cl_lmdb_hana_database( lo_database ).

            ep_result-is_hana = abap_true.

            if lo_hana_database->has_tenant_database( ).

              ep_result-is_hana_system_db = abap_true.

            elseif lo_hana_database->is_tenant_database( ).

              ep_result-is_hana_tenant = abap_true.

            endif.

          catch cx_sy_move_cast_error.

        endtry.

    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_HOST_BY_HOST_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<-()] EP_RESULT                      TYPE        TY_HOST_DETAILS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_host_by_host_guid.

    if ip_guid is initial.
      exit.
    endif.

    try.
        data(lo_host) = host_api->get_by_guid( cl_lmdb_guid_util=>convert_guid_c32_to_c36( ip_guid ) ).
        data(lo_real_host) = get_real_host( lo_host ). "can be initial

        ep_result =  value #(
          host-guid  = ip_guid
          host-name  = lo_host->name
          fqdn       = lo_host->get_fqdn( )
          ip = lo_host->get_ip_adress( )
          os = lo_host->get_operating_system( )
          is_logical = lo_host->is_logical( )
          real_host-guid  = lo_real_host-guid
          real_host-name  = lo_real_host-name
          element_type = lo_host->get_cim_instance( )->elementname->name
           os_element_type = 'SAP_RunningOS'
          "tech_systems = lo_host->GET_TECHNICAL_SYSTEMS( )
          ).

      catch cx_lmdb_no_host.

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_HOST_OTHER_DATA_BY_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [--->] IP_NAMESPACE                   TYPE        LMDB_SHORT_CIM_NAMESPACE_NAME
* | [<---] ET_OTHER_FQDN_NAMES            TYPE        STRING_TABLE
* | [<---] ET_OTHER_IP_ADDRESSES          TYPE        STRING_TABLE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_host_other_data_by_guid.

    data: lr_guid_result        type ref to cl_cim_objectwithreference,
          lo_domain_context     type ref to cl_lmdb_cim_domain_context,
          lo_assoc_cim_instance type ref to cl_cim_instance.

    if ip_guid is initial.
      exit.
    endif.

    lo_domain_context ?= cl_lmdb_cim_factory=>get_domain_manager( )->get_domain_context( cl_lmdb_cim_domain=>ldb ).

    data(lo_query_client) = lo_domain_context->create_query_client( ).

    lo_query_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace }| ) ).

    try.

        lo_query_client->get_instance_by_guid(
          exporting
            iv_instance_guid = ip_guid
          importing
            eo_guid_result   = lr_guid_result ).

        if lr_guid_result is bound.

          lo_assoc_cim_instance ?=  lr_guid_result->object.

          et_other_fqdn_names = lo_assoc_cim_instance->get_valuearray( cl_cim_elementname=>create( `OtherFQDNames` ) ).
          et_other_ip_addresses = lo_assoc_cim_instance->get_valuearray( cl_cim_elementname=>create( `OtherIPAddresses` ) ).


        endif. " if lr_guid_result is bound

      catch cx_wbem_cim_err cx_lmdb_namespace_mismatch into data(le_exception).

        return.

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_LICENSE_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<---] EV_INSTALLED_LICENSES          TYPE        IF_LMDB_WITH_INSTALLED_LICENSE=>INSTALLED_LICENSES
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_license_by_sys_guid.


    try.

        if ip_guid is initial.
          exit.
        endif.



        " Search for licenses

        data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).
        ev_installed_licenses = cast if_lmdb_with_installed_license( lo_tech_system )->get_installed_licenses( ).



      catch cx_sy_move_cast_error .


    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_PORTS_BY_INST_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [--->] IP_SYSTEM_TYPE                 TYPE        CHAR40
* | [--->] IP_NAMESPACE_NAME              TYPE        LMDB_SHORT_CIM_NAMESPACE_NAME
* | [<---] ET_PORTS                       TYPE        TT_PORTS
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_ports_by_inst_guid.

    data: lo_system_objwrefs   type cim_t_objwref,
          lo_ports_objwref     type ref to cl_cim_objectwithreference,
          lo_port_cim_instance type ref to cl_cim_instance,
          lsc_base_struc       type sdiagls_common,
          le_wbem_cim_err      type ref to cx_wbem_cim_err,
          lv_port_name         type char256,
          lv_port_url          type char256,
          wa_ports             type ty_ports,
          lv_refstring         type lmdb_refstring,
          lr_guid_result       type ref to cl_cim_objectwithreference.

    if ip_guid is initial.
      exit.
    endif.

    " Preparing client

    data(lo_domain_manager) = cl_lmdb_cim_factory=>get_domain_manager( ).
    data(lo_domain_context) = lo_domain_manager->get_domain_context( cl_lmdb_cim_domain=>ldb ).
    data(lo_wbem_client) = lo_domain_context->create_wbem_client( ).
    data(lo_query_client) = lo_domain_context->create_query_client( ).

    lo_wbem_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace_name }| ) ).
    lo_query_client->set_target_namespace( cl_cim_namespace=>create( |{ ip_namespace_name }| ) ).

    " Preparing reference string

    try.

        lo_query_client->get_instance_by_guid(
          exporting
            iv_instance_guid = ip_guid
          importing
            eo_guid_result   = lr_guid_result ).

        if lr_guid_result is bound.
          lv_refstring = lr_guid_result->reference->to_string( comparable = abap_true ).
        else.
          clear: lv_refstring.
        endif.

      catch cx_wbem_cim_err cx_lmdb_namespace_mismatch into data(le_exception).

        return.

    endtry.


*    call method cl_ajm_lmdb_adapter=>get_landscape_ref_for_lmdbid
*      exporting
*        lmdbid = ip_guid
*      receiving
*        ro_ref = data(lo_ref).
*
*    lsc_base_struc = lo_ref->get_base_structure( ).

    try.

        case ip_system_type.

          when 'ABAP'.

            " ABAP HTTP Ports

            clear: wa_ports,
                   lo_system_objwrefs,
                   lo_ports_objwref,
                   lo_port_cim_instance.

            lo_system_objwrefs = lo_wbem_client->associators(
              "objectref   = cl_cim_reference=>create_from_refstring( |{ lsc_base_struc-sld_key }| )
              objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
              assocclass  = cl_cim_elementname=>create( 'SAP_BCApplicationServerHTTPServicePort' ) ).

            loop at lo_system_objwrefs into lo_ports_objwref.

              lo_port_cim_instance ?= lo_ports_objwref->object.
              wa_ports-port_type = 'HTTP'.
              wa_ports-name =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Name' ) ).
              wa_ports-url =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Url' ) ) .
              wa_ports-guid =  lo_port_cim_instance->get_qualifier_value( name = cl_cim_elementname=>create( 'sap_guid' ) ) .
              wa_ports-element_type = lo_port_cim_instance->elementname->name.

              append wa_ports to et_ports.

            endloop. " loop at lo_system_objwrefs into lo_ports_objwref

            " ABAP TCP/IP Ports

            clear: wa_ports,
              lo_system_objwrefs,
              lo_ports_objwref,
              lo_port_cim_instance.

            lo_system_objwrefs = lo_wbem_client->associators(
              "objectref   = cl_cim_reference=>create_from_refstring( |{ lsc_base_struc-sld_key }| )
              objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
              assocclass  = cl_cim_elementname=>create( 'SAP_BCApplicationServerDispatcherPort' ) ).

            loop at lo_system_objwrefs into lo_ports_objwref.

              lo_port_cim_instance ?= lo_ports_objwref->object.

              wa_ports-port_type = 'TCP/IP'.
              wa_ports-name =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Name' ) ).
              wa_ports-number =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Portnumber' ) ) .
              wa_ports-guid =  lo_port_cim_instance->get_qualifier_value( name = cl_cim_elementname=>create( 'sap_guid' ) ) .
              wa_ports-element_type = lo_port_cim_instance->elementname->name.

              append wa_ports to et_ports.

            endloop. " loop at lo_system_objwrefs into lo_ports_objwref

          when 'HANADB'.

            " SAP HANA Database Services

            clear: wa_ports,
              lo_system_objwrefs,
              lo_ports_objwref,
              lo_port_cim_instance.

            lo_system_objwrefs = lo_wbem_client->associators(
              "objectref   = cl_cim_reference=>create_from_refstring( |{ lsc_base_struc-sld_key }| )
              objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
              assocclass  = cl_cim_elementname=>create( 'SAP_HDBServerService' ) ).

            loop at lo_system_objwrefs into lo_ports_objwref.

              lo_port_cim_instance ?= lo_ports_objwref->object.

              wa_ports-port_type = 'SAP HANA Database Service'.
              wa_ports-service =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Name' ) ).
              wa_ports-service_type =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Servicetype' ) ) .
              wa_ports-number =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Portnumber' ) ) .
              wa_ports-guid =  lo_port_cim_instance->get_qualifier_value( name = cl_cim_elementname=>create( 'sap_guid' ) ) .
              wa_ports-element_type = lo_port_cim_instance->elementname->name.
              append wa_ports to et_ports.

            endloop. " loop at lo_system_objwrefs into lo_ports_objwref

            " SAP HANA IP Service Port

            clear: wa_ports,
              lo_system_objwrefs,
              lo_ports_objwref,
              lo_port_cim_instance.

            lo_system_objwrefs = lo_wbem_client->associators(
             " objectref   = cl_cim_reference=>create_from_refstring( |{ lsc_base_struc-sld_key }| )
              objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
              assocclass  = cl_cim_elementname=>create( 'SAP_HDBServerIPServicePort' ) ).

            loop at lo_system_objwrefs into lo_ports_objwref.

              lo_port_cim_instance ?= lo_ports_objwref->object.

              wa_ports-port_type = 'SAP HANA IP Service Port'.
              wa_ports-name =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Name' ) ).
              wa_ports-protocol =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Protocol' ) ) .
              wa_ports-number =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Portnumber' ) ) .
              wa_ports-guid =  lo_port_cim_instance->get_qualifier_value( name = cl_cim_elementname=>create( 'sap_guid' ) ) .
              wa_ports-element_type = lo_port_cim_instance->elementname->name.
              append wa_ports to et_ports.

            endloop. " loop at lo_system_objwrefs into lo_ports_objwref


            " SAP HANA HTTP Service Port

            clear: wa_ports,
              lo_system_objwrefs,
              lo_ports_objwref,
              lo_port_cim_instance.

            lo_system_objwrefs = lo_wbem_client->associators(
              "objectref   = cl_cim_reference=>create_from_refstring( |{ lsc_base_struc-sld_key }| )
               objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
              assocclass  = cl_cim_elementname=>create( 'SAP_HDBServerHTTPServicePort' ) ).

            loop at lo_system_objwrefs into lo_ports_objwref.

              lo_port_cim_instance ?= lo_ports_objwref->object.

              wa_ports-port_type = 'SAP HANA HTTP Service Port'.
              wa_ports-name =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Name' ) ).
              wa_ports-url =  lo_port_cim_instance->get_value( name = cl_cim_elementname=>create( 'Url' ) ) .
              wa_ports-guid =  lo_port_cim_instance->get_qualifier_value( name = cl_cim_elementname=>create( 'sap_guid' ) ) .
              wa_ports-element_type = lo_port_cim_instance->elementname->name.
              append wa_ports to et_ports.

            endloop. " loop at lo_system_objwrefs into lo_ports_objwref

        endcase. " case ip_system_type

      catch cx_wbem_cim_err into le_wbem_cim_err.

    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_PRODUCTS_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<---] ET_RESULT                      TYPE        TT_PROD_INFO
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_products_by_sys_guid.

    if ip_guid is initial.
      exit.
    endif.

    try.
        data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).

        data(lt_product) = cast if_lmdb_with_product( lo_tech_system )->get_inst_product_versions( ).

        loop at lt_product into data(ls_product).
          data(lcl_product_version) = ls_product->get_product_version( ).

          call method get_prod_version
            exporting
              ic_prod_version = lcl_product_version
            importing
              es_prod_info    = data(ls_prod_version).
          append ls_prod_version to et_result.
        endloop.

      catch cx_sy_move_cast_error.


    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_PROD_VERSION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IC_PROD_VERSION                TYPE REF TO CL_LMDB_PRODUCT_VERSION
* | [<---] ES_PROD_INFO                   TYPE        TY_PRODUCT_INFORMATION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_PROD_VERSION.
      TRY.
        es_prod_info-ppms_num = ic_prod_version->ppms_number.
        es_prod_info-name     = ic_prod_version->name.
        es_prod_info-version  = ic_prod_version->version.
        es_prod_info-vendor   = ic_prod_version->vendor.
        es_prod_info-addon    = ic_prod_version->is_add_on_product( ).
      CATCH cx_wbem_cim_err.
    ENDTRY.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_REAL_HOST
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_HOST                        TYPE REF TO CL_LMDB_HOST
* | [<-()] EP_RESULT                      TYPE        TY_HOST
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_REAL_HOST.

     TRY.
        DATA(lo_real_host) = io_host->get_real_host( ).
        ep_result-guid = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lo_real_host->get_guid( ) ).
        ep_result-name = lo_real_host->name.
      CATCH cx_lmdb_no_host.
    ENDTRY.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_SID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_TECHNICAL_SYSTEM            TYPE REF TO CL_LMDB_TECHNICAL_SYSTEM
* | [<-()] EP_RESULT                      TYPE        LMDB_SAPSYSTEMNAME
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_SID.

       CASE ip_technical_system->system_type.

      WHEN cl_lmdb_service_system_type=>system_type-abap.
        ep_result = CAST cl_lmdb_abap_system( ip_technical_system )->get_sid( ).
      WHEN cl_lmdb_service_system_type=>system_type-java.
        ep_result = CAST cl_lmdb_java_system( ip_technical_system )->get_sid( ).
      WHEN cl_lmdb_service_system_type=>system_type-hanadb.
        ep_result = CAST cl_lmdb_hana_database( ip_technical_system )->get_sid( ).
      WHEN cl_lmdb_service_system_type=>system_type-webdisp.
        ep_result = CAST cl_lmdb_web_dispatcher( ip_technical_system )->get_sid( ).
      WHEN OTHERS.

    ENDCASE.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_SOFTWARE_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<---] ET_SOFTWARE_ON_TECH_SYSTEM     TYPE        TT_SOFTWARE_WITH_SP_PATCH
* | [<---] ET_SOFTWARE_ON_TECH_INSTANCES  TYPE        TT_SOFTWARE_TI_WITH_SP_PATCH
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_software_by_sys_guid.

    if ip_guid is initial.
      exit.
    endif.

    clear:
       et_software_on_tech_system,
       et_software_on_tech_instances.

    try.

        data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).

        get_software_for_ts(
          exporting
            tech_system = lo_tech_system
          importing
            software_on_ts = et_software_on_tech_system ).

        get_software_for_ti_of_ts(
          exporting
            tech_system     = lo_tech_system
          importing
            software_on_ti  = et_software_on_tech_instances ).

      catch cx_wbem_cim_err.

    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_SOFTWARE_FOR_ABSTR_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] ABSTRACT_ENTITY                TYPE REF TO CL_LMDB_ABSTRACT_ENTITY
* | [<---] SOFTWARE                       TYPE        TT_SOFTWARE_WITH_SP_PATCH
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_software_for_abstr_entity.

    clear software.

    try.
        data(soft_comps) = cast if_lmdb_with_inst_soft_comps( abstract_entity )->get_inst_soft_comp( ).
        format_and_add_sp_patch_softw(
          exporting
            soft_comps = soft_comps
          importing
            formatted_software = data(tmp_software_on_ts) ).

        append lines of tmp_software_on_ts to software.

      catch cx_sy_move_cast_error.

    endtry.

    try.
        soft_comps = cast if_lmdb_with_used_soft_comps( abstract_entity )->get_used_soft_comps( ).
        format_and_add_sp_patch_softw(
          exporting
            soft_comps = soft_comps
          importing
            formatted_software = tmp_software_on_ts ).

        append lines of tmp_software_on_ts to software.

      catch cx_sy_move_cast_error.

    endtry.

    sort software.
    delete adjacent duplicates from software.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_SOFTWARE_FOR_TI_OF_TS
* +-------------------------------------------------------------------------------------------------+
* | [--->] TECH_SYSTEM                    TYPE REF TO CL_LMDB_TECHNICAL_SYSTEM
* | [<---] SOFTWARE_ON_TI                 TYPE        TT_SOFTWARE_TI_WITH_SP_PATCH
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_SOFTWARE_FOR_TI_OF_TS.

    DATA software_on_ts_for_ti TYPE tt_software_with_sp_patch.

    CLEAR software_on_ti.

    TRY.
        DATA(technical_instances) = CAST if_lmdb_system_with_instances( tech_system )->get_technical_instances( ).
      CATCH cx_sy_move_cast_error.

    ENDTRY.

    LOOP AT technical_instances INTO DATA(technical_instance).

      CLEAR software_on_ts_for_ti.

      get_software_for_abstr_entity(
        EXPORTING
          abstract_entity = technical_instance
        IMPORTING
          software        = software_on_ts_for_ti ).

      LOOP AT software_on_ts_for_ti INTO DATA(software_on_ts_for_ti_line).

        APPEND VALUE #(
          name              = software_on_ts_for_ti_line-name
          version           = software_on_ts_for_ti_line-version
          sp                = software_on_ts_for_ti_line-sp
          patch             = software_on_ts_for_ti_line-patch
          installed_on_name = technical_instance->compound_name
          installed_on_guid = cl_lmdb_guid_util=>convert_guid_c36_to_c32( technical_instance->get_guid( ) ) )
        TO software_on_ti.

      ENDLOOP.

    ENDLOOP.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_SOFTWARE_FOR_TS
* +-------------------------------------------------------------------------------------------------+
* | [--->] TECH_SYSTEM                    TYPE REF TO CL_LMDB_TECHNICAL_SYSTEM
* | [<---] SOFTWARE_ON_TS                 TYPE        TT_SOFTWARE_WITH_SP_PATCH
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_software_for_ts.
    clear software_on_ts.

    get_software_for_abstr_entity(
      exporting
        abstract_entity = tech_system
      importing
        software        = software_on_ts ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_SYS_NUM_FOR_TS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_TECHNICAL_SYSTEM            TYPE REF TO CL_LMDB_TECHNICAL_SYSTEM
* | [<-()] EP_SYSTEM_NUMBER               TYPE        LIKEY_SYSTEM_NO
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_sys_num_for_ts.
    try.

        ep_system_number = io_technical_system->get_system_number( ).

      catch cx_wbem_cim_err into data(wbem_cim_err).

        clear ep_system_number.

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_LMDB_DATA_FINDER->GET_TECHNICAL_SYSTEM_BY_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<-()] EP_RESULT                      TYPE REF TO CL_LMDB_TECHNICAL_SYSTEM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_technical_system_by_guid.


    try.

        data(lv_guid_c36) =  cl_lmdb_guid_util=>convert_guid_c32_to_c36( ip_guid ).
        ep_result  = tech_system_api->get_by_guid( lv_guid_c36 ).

      catch cx_lmdb_no_technical_system cx_lmdb_guid_class_mismatch .


    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_LMDB_DATA_FINDER=>GET_TECH_SYS_ASSOC_BY_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32(optional)
* | [--->] LO_WBEM_CLIENT                 TYPE REF TO IF_WBEM_SAP_CLIENT(optional)
* | [--->] LO_QUERY_CLIENT                TYPE REF TO IF_LMDB_QUERY_CLIENT(optional)
* | [--->] IP_ANCESTOR_GUID               TYPE        LMDB_SAP_GUID_C32(optional)
* | [<-->] EP_SYSTEM_NAME                 TYPE        CHAR40
* | [<-->] EP_SYSTEM_EXT_SID              TYPE        CHAR256(optional)
* | [<-->] EP_SYSTEM_NUMBER               TYPE        CHAR18(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_assoc_by_guid.

    data: lo_system_objwrefs     type cim_t_objwref,
          lo_system_objwref      type ref to cl_cim_objectwithreference,
          lo_system_cim_instance type ref to cl_cim_instance,
          lo_assoc_objwrefs      type cim_t_objwref,
          lo_assoc_objwref       type ref to cl_cim_objectwithreference,
          lo_assoc_cim_instance  type ref to cl_cim_instance,
          le_wbem_cim_err        type ref to cx_wbem_cim_err,
          lv_assoc_guid_36       type string,
          lv_assoc_guid_32       type lmdb_sap_guid_c32,
          lv_guid                type lmdb_sap_guid_c32,
          lr_guid_result         type ref to cl_cim_objectwithreference,
          lv_refstring           type lmdb_refstring.

    " Associations for scan

    types :
      begin of ty_permitted_assoc,
        associated_class type string,
      end of ty_permitted_assoc.

    data : lt_permitted_assoc type table of ty_permitted_assoc,
           wa_permitted_assoc type ty_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_ApplicationSystemInstance'.
    append wa_permitted_assoc to lt_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_BCApplicationServer'.
    append wa_permitted_assoc to lt_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_HDBServer'.
    append wa_permitted_assoc to lt_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_ComputerSystem'.
    append wa_permitted_assoc to lt_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_BCClient'.
    append wa_permitted_assoc to lt_permitted_assoc.

    wa_permitted_assoc-associated_class = 'SAP_InstalledSoftwareComponent'.
    append wa_permitted_assoc to lt_permitted_assoc.

    " System types for scan

    types : begin of ty_permitted_systems,

              associated_class type string,

            end of ty_permitted_systems.

    data : lt_permitted_systems type table of ty_permitted_systems,
           wa_permitted_systems type ty_permitted_systems.

    wa_permitted_systems-associated_class = 'SAP_BCSystem'.
    append wa_permitted_systems to lt_permitted_systems.

    wa_permitted_systems-associated_class = 'SAP_HDBSystem'.
    append wa_permitted_systems to lt_permitted_systems.

    wa_permitted_systems-associated_class = 'SAP_BCWebDispatcher'.
    append wa_permitted_systems to lt_permitted_systems.

    if ( ep_system_name is not initial ).
      exit.
    endif.

    " Query the object

    clear: lr_guid_result,
           lv_refstring.


    if ip_guid is initial.
      exit.
    endif.

    try.

        lo_query_client->get_instance_by_guid(
          exporting
            iv_instance_guid = ip_guid
          importing
            eo_guid_result   = lr_guid_result ).

        if lr_guid_result is bound.
          lv_refstring = lr_guid_result->reference->to_string( comparable = abap_true ).
        else.
          clear: lv_refstring.
        endif.

      catch cx_wbem_cim_err cx_lmdb_namespace_mismatch into data(le_exception).

        return.

    endtry.

    " Scanning for permitted System types

    try.

        clear:
               lo_system_objwrefs,
               lo_system_objwref,
               lo_system_cim_instance.

        loop at lt_permitted_systems assigning field-symbol(<ls_permitted_systems>).

          lo_system_objwrefs = lo_wbem_client->associators(
              objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )

              resultclass  = cl_cim_elementname=>create( <ls_permitted_systems>-associated_class ) ).

          if ( lo_system_objwrefs is not initial ).
            exit.
          endif. " if ( lo_system_objwrefs is not INITIAL ).

        endloop. "loop at lt_permitted_systems assigning field-symbol(<ls_permitted_systems>)

        " There is no direct association to system, starting recursive calls

        if  ( lo_system_objwrefs is initial ).

          " Take all associations and search for system for each association

          if ( ( lr_guid_result is not bound ) or ( lv_refstring is  initial ) ).

            exit.

          endif. " if ( ( lr_guid_result is not bound ) or ( lv_refstring is  initial ) )

          loop at lt_permitted_assoc assigning field-symbol(<ls_permitted_assoc>).

            if ( ep_system_name is not initial ).
              exit.
            endif. " if ( ep_system_name is not initial )

            clear:
                lo_assoc_objwrefs,
                lo_assoc_objwref,
                lo_assoc_cim_instance.

            try.

                lo_assoc_objwrefs = lo_wbem_client->associators(
                objectref   = cl_cim_reference=>create_from_refstring( |{ lv_refstring }| )
                resultclass  = cl_cim_elementname=>create( <ls_permitted_assoc>-associated_class ) ).

              catch   cx_sy_ref_is_initial into data(le_ref_initial).
                continue.
            endtry.

            loop at lo_assoc_objwrefs into lo_assoc_objwref.

              if ( ep_system_name is not initial ).
                exit.
              endif. " if ( ep_system_name is not initial )


              clear lo_assoc_cim_instance.

              lo_assoc_cim_instance ?= lo_assoc_objwref->object.

              lv_assoc_guid_36 =  lo_assoc_cim_instance->get_qualifier_value( cl_cim_elementname=>create( 'SAP_GUID' ) ).
              lv_assoc_guid_32 = cl_lmdb_guid_util=>convert_guid_c36_to_c32( guid = lv_assoc_guid_36 ).

              if ( ip_ancestor_guid is not initial ) and ( lv_assoc_guid_32 = ip_ancestor_guid ).
                continue.
              endif. " if ( ip_ancestor_guid is not initial ) and ( lv_assoc_guid_32 = ip_ancestor_guid )

              " Recursive execution

              zcl_lmdb_data_finder=>get_tech_sys_assoc_by_guid(
                   exporting
                      ip_guid = lv_assoc_guid_32
                      ip_ancestor_guid = ip_guid
                      lo_wbem_client = lo_wbem_client
                      lo_query_client = lo_query_client
                   changing
                      ep_system_name = ep_system_name
                      ep_system_ext_sid = ep_system_ext_sid
                      ep_system_number = ep_system_number ).

            endloop. " loop at lo_assoc_objwrefs into lo_assoc_objwref

          endloop. " loop at lt_permitted_assoc ASSIGNING FIELD-SYMBOL(<ls_permitted_assoc>).

        else. " System has been found

          if ep_system_name is initial.

            loop at lo_system_objwrefs into lo_system_objwref.

              lo_system_cim_instance ?= lo_system_objwref->object.
              ep_system_name =  lo_system_cim_instance->get_value( name = cl_cim_elementname=>create( 'Sapsystemname' ) ).
              ep_system_ext_sid =  lo_system_cim_instance->get_value( name = cl_cim_elementname=>create( 'Extsidname' ) ).
              ep_system_number =  lo_system_cim_instance->get_value( name = cl_cim_elementname=>create( 'Systemnumber' ) ).

              exit.

            endloop. " loop at lo_system_objwrefs into lo_system_objwref

          endif. "if ep_system_name is initial

        endif. " if  ( lo_system_objwrefs is initial )

      catch cx_wbem_cim_err into le_wbem_cim_err.

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_TECH_SYS_BY_EXTSID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_EXTENDSID                   TYPE        LMDB_ESID
* | [<---] EP_RESULT                      TYPE        TT_TECHNICAL_SYSTEM_XT
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_by_extsid.

    data: lv_extended_sid type lmdb_esid,
          lv_sys_num      type likey_system_no.

    try.

        " Taking all technical systems

        data(lt_technical_systems) = tech_system_api->get_all_technical_systems( ).

        loop at lt_technical_systems into data(ls_techical_system).
          try.

              " Taking system number and filtering according input

              lv_extended_sid = ls_techical_system->get_extended_sid( ).

              call function 'CONVERSION_EXIT_ALPHA_OUTPUT'
                exporting
                  input  = lv_extended_sid
                importing
                  output = lv_extended_sid.

              if ( lv_extended_sid <> ip_extendsid ).
                continue.
              else. " if ( lv_extended_sid <> ip_extendsid )

                try.

                    lv_sys_num = get_sys_num_for_ts( ls_techical_system ).

                  catch cx_root into data(root_err).

                    clear lv_sys_num.

                endtry.

                if ls_techical_system->system_type  <> 'HANADB'.
*                  try.
*                      data(hanarelease) = get_db_release_by_db_guid( ip_guid = cl_lmdb_guid_util=>convert_guid_c36_to_c32( ls_techical_system->get_guid( ) ) ).
*                    catch cx_root.
*                  endtry.

                  insert value #(
                   extsid       = ls_techical_system->get_extended_sid( )
                   system_type  = ls_techical_system->system_type
                   guid         = cl_lmdb_guid_util=>convert_guid_c36_to_c32( ls_techical_system->get_guid( ) )
                   sid          = get_sid( ls_techical_system )
            "       systemnumber = ls_techical_system->get_system_number( )
                   systemnumber = lv_sys_num
                   caption      = ls_techical_system->get_caption( )

                    ) into table ep_result.
                endif.
                if ls_techical_system->system_type  = 'HANADB'.
                  insert value #(
                   extsid       = ls_techical_system->get_extended_sid( )
                   system_type  = ls_techical_system->system_type
                   guid         = cl_lmdb_guid_util=>convert_guid_c36_to_c32( ls_techical_system->get_guid( ) )
                   sid          = get_sid( ls_techical_system )
                   caption      = ls_techical_system->get_caption( )
                  "  systemnumber = ls_techical_system->get_system_number( )
                    systemnumber = lv_sys_num
                   hanarelease = get_db_release_by_db_guid( ip_guid = cl_lmdb_guid_util=>convert_guid_c36_to_c32( ls_techical_system->get_guid( ) ) )
                    ) into table ep_result.
                endif.
              endif.

              " ---- Adding output of element type ----

              ep_element_type = ls_techical_system->get_cim_instance( )->elementname->name.


            catch cx_root.

          endtry.

        endloop. " loop at lt_technical_systems into data(ls_techical_system)

      catch cx_wbem_cim_err into data(wbem_cim_err).

    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_TECH_SYS_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_TECH_SYS_GUID               TYPE        LMDB_SAP_GUID_C32
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* | [<-()] EP_RESULT                      TYPE        TT_TECHNICAL_SYSTEM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_by_sys_guid.

    data: lv_sys_num           type likey_system_no.


    if ip_tech_sys_guid is initial.
      exit.
    endif.


    try.

        data(lo_tech_system) = get_technical_system_by_guid( ip_tech_sys_guid ).

        " Taking all technical systems
*
*        data(lt_tecnical_systems) = tech_system_api->get_all_technical_systems( ).
*
*
*        loop at lt_tecnical_systems into data(ls_techical_system).
*          try.
*
*              " Taking system number and filtering according input
*
*              lv_sys_num = ls_techical_system->get_system_number( ).
*
*              call function 'CONVERSION_EXIT_ALPHA_OUTPUT'
*                exporting
*                  input  = lv_sys_num
*                importing
*                  output = lv_sys_num.
*
*              if ( lv_sys_num <> ip_sys_num ).
*                continue.
*              else.
        try.

            lv_sys_num = get_sys_num_for_ts( lo_tech_system ).



          catch cx_root into data(root_err).

            clear lv_sys_num.

        endtry.

        insert value #(
         extsid       = lo_tech_system->get_extended_sid( )
         system_type  = lo_tech_system->system_type
         "systemnumber = lo_tech_system->get_system_number( )
         systemnumber = lv_sys_num
         guid         = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lo_tech_system->get_guid( ) )
         sid          = get_sid( lo_tech_system )
         caption      = lo_tech_system->get_caption( )
          ) into table ep_result.

*                  exit.
*
*              endif.

        " ---- Adding output of element type ----

        ep_element_type = lo_tech_system->get_cim_instance( )->elementname->name.


      catch cx_wbem_cim_err into data(wbem_cim_err).

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_TECH_SYS_BY_SYS_NUM
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_SYS_NUM                     TYPE        LIKEY_SYSTEM_NO
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* | [<-()] EP_RESULT                      TYPE        TT_TECHNICAL_SYSTEM
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_by_sys_num.

    data: lv_sys_num           type likey_system_no.

    try.

        " Taking all technical systems

        data(lt_tecnical_systems) = tech_system_api->get_all_technical_systems( ).


        loop at lt_tecnical_systems into data(ls_techical_system).
          try.

              " Taking system number and filtering according input

              "lv_sys_num = ls_techical_system->get_system_number( ).

              try.

                  lv_sys_num = get_sys_num_for_ts( ls_techical_system ).

                catch cx_root into data(root_err).

                  clear lv_sys_num.

              endtry.

              call function 'CONVERSION_EXIT_ALPHA_OUTPUT'
                exporting
                  input  = lv_sys_num
                importing
                  output = lv_sys_num.

              if ( lv_sys_num <> ip_sys_num ).
                continue.
              else.

                insert value #(
                 extsid       = ls_techical_system->get_extended_sid( )
                 system_type  = ls_techical_system->system_type
                 guid         = cl_lmdb_guid_util=>convert_guid_c36_to_c32( ls_techical_system->get_guid( ) )
                 sid          = get_sid( ls_techical_system )
                 caption      = ls_techical_system->get_caption( )
                 systemnumber = lv_sys_num
                  ) into table ep_result.

                exit.

              endif.





            catch cx_root.

          endtry.

        endloop.

      catch cx_wbem_cim_err into data(wbem_cim_err).

    endtry.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_TECH_SYS_DB_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_TECH_SYS_GUID               TYPE        LMDB_SAP_GUID_C32
* | [<---] EP_ELEMENT_TYPE                TYPE        STRING
* | [<-()] EP_RESULT                      TYPE        LMDB_SAP_GUID_C32
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_db_by_sys_guid.

    if ip_tech_sys_guid is initial.
      exit.
    endif.

    try.

        data(lo_tech_system) = get_technical_system_by_guid( ip_tech_sys_guid ).
        data(lo_database) = cast if_lmdb_system_on_database( lo_tech_system )->get_system_database( ) .

        ep_result = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lo_database->get_guid( ) ).

      catch cx_sy_move_cast_error
        cx_lmdb_no_database.



    endtry.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_LMDB_DATA_FINDER->GET_TECH_SYS_INST_BY_SYS_GUID
* +-------------------------------------------------------------------------------------------------+
* | [--->] IP_GUID                        TYPE        LMDB_SAP_GUID_C32
* | [<-()] ET_RESULT                      TYPE        TT_TECHNICAL_INSTANCES
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method get_tech_sys_inst_by_sys_guid.

    data lo_cim_element  type ref to cl_cim_elementname.

    if ip_guid is initial.
      exit.
    endif.

    try.

        data(lo_tech_system) = get_technical_system_by_guid( ip_guid ).

        data(lo_instances) = cast if_lmdb_system_with_instances( lo_tech_system )->get_technical_instances( ).

        loop at lo_instances into data(lo_instance).

          try.
              data(lv_instance_number) = cast cl_lmdb_sap_technical_instance( lo_instance )->get_instance_number( ).
            catch cx_sy_move_cast_error ##NO_HANDLER. " Can not have a inst number
          endtry.

          try.
              data(lv_instance_host_guid) = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lo_instance->get_host( )->get_guid( ) ).
            catch cx_lmdb_no_host ##no_handler.
          endtry.

          insert value #(
            guid = cl_lmdb_guid_util=>convert_guid_c36_to_c32( lo_instance->get_guid( ) )
         "   guid =  lo_instance->get_guid( )
            name = lo_instance->compound_name
            number = lv_instance_number
            host_guid = lv_instance_host_guid
            caption = lo_instance->get_caption( )
            short_display_text = lo_instance->get_short_display_text( )
           " element_type = lo_instance->get_cim_instance( )->get_value( name = cl_cim_elementname=>create( 'creationclassname' ) )
            element_type = lo_instance->get_cim_instance( )->elementname->name
          ) into table et_result.

        endloop.


      catch cx_sy_move_cast_error ##NO_HANDLER. " Can not have instances



    endtry.


  endmethod.
ENDCLASS.