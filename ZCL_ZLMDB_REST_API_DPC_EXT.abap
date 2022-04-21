class ZCL_ZLMDB_REST_API_DPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_DATA
  abstract
  create public .

public section.

  interfaces /IWBEP/IF_SB_DPC_COMM_SERVICES .
  interfaces /IWBEP/IF_SB_GEN_DPC_INJECTION .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY
    redefinition .
protected section.

  data mo_injection type ref to /IWBEP/IF_SB_GEN_DPC_INJECTION .

  methods SYSTEMSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_SYSTEM
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMLISTSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMLISTSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_SYSTEMLIST
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMLISTSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMLISTSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SYSTEMLISTSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SOFTWARESET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SOFTWARESET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_SOFTWARECOMPONENT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SOFTWARESET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SOFTWARESET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SOFTWARESET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SERVICESET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SERVICESET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_SERVICE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SERVICESET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SERVICESET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods SERVICESET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_PRODUCT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods PRODUCTSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods LICENSESET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods LICENSESET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_LICENSE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods LICENSESET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods LICENSESET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods LICENSESET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods INSTANCESET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods INSTANCESET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_INSTANCE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods INSTANCESET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods INSTANCESET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods INSTANCESET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CLIENTSET_UPDATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_U optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CLIENTSET_GET_ENTITYSET
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION
      !IS_PAGING type /IWBEP/S_MGW_PAGING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IT_ORDER type /IWBEP/T_MGW_SORTING_ORDER
      !IV_FILTER_STRING type STRING
      !IV_SEARCH_STRING type STRING
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET optional
    exporting
      !ET_ENTITYSET type ZCL_ZLMDB_REST_API_MPC=>TT_ABAPCLIENT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CLIENTSET_GET_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_REQUEST_OBJECT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
      !ES_RESPONSE_CONTEXT type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CLIENTSET_DELETE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_D optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods CLIENTSET_CREATE_ENTITY
    importing
      !IV_ENTITY_NAME type STRING
      !IV_ENTITY_SET_NAME type STRING
      !IV_SOURCE_NAME type STRING
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      !IT_NAVIGATION_PATH type /IWBEP/T_MGW_NAVIGATION_PATH
      !IO_DATA_PROVIDER type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      !ER_ENTITY type ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION
      /IWBEP/CX_MGW_TECH_EXCEPTION .

  methods CHECK_SUBSCRIPTION_AUTHORITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZLMDB_REST_API_DPC IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING(optional)
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING(optional)
* | [--->] IV_SOURCE_NAME                 TYPE        STRING(optional)
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [<---] ER_ENTITY                      TYPE REF TO DATA
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_CRT_ENTITY_BASE
*&* This class has been generated on 23.11.2021 14:26:36 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZLMDB_REST_API_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA systemlistset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_systemlist.
 DATA productset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_product.
 DATA serviceset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_service.
 DATA licenseset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_license.
 DATA softwareset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_softwarecomponent.
 DATA instanceset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_instance.
 DATA clientset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_abapclient.
 DATA systemset_create_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_system.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemlistSet
*-------------------------------------------------------------------------*
     WHEN 'SystemlistSet'.
*     Call the entity set generated method
    systemlistset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = systemlistset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = systemlistset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  ProductSet
*-------------------------------------------------------------------------*
     WHEN 'ProductSet'.
*     Call the entity set generated method
    productset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = productset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = productset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  ServiceSet
*-------------------------------------------------------------------------*
     WHEN 'ServiceSet'.
*     Call the entity set generated method
    serviceset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = serviceset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = serviceset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  LicenseSet
*-------------------------------------------------------------------------*
     WHEN 'LicenseSet'.
*     Call the entity set generated method
    licenseset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = licenseset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = licenseset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  SoftwareSet
*-------------------------------------------------------------------------*
     WHEN 'SoftwareSet'.
*     Call the entity set generated method
    softwareset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = softwareset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = softwareset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  InstanceSet
*-------------------------------------------------------------------------*
     WHEN 'InstanceSet'.
*     Call the entity set generated method
    instanceset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = instanceset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = instanceset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  ABAPClientSet
*-------------------------------------------------------------------------*
     WHEN 'ABAPClientSet'.
*     Call the entity set generated method
    clientset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = clientset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = clientset_create_entity
      CHANGING
        cr_data = er_entity
   ).

*-------------------------------------------------------------------------*
*             EntitySet -  SystemSet
*-------------------------------------------------------------------------*
     WHEN 'SystemSet'.
*     Call the entity set generated method
    systemset_create_entity(
         EXPORTING iv_entity_name     = iv_entity_name
                   iv_entity_set_name = iv_entity_set_name
                   iv_source_name     = iv_source_name
                   io_data_provider   = io_data_provider
                   it_key_tab         = it_key_tab
                   it_navigation_path = it_navigation_path
                   io_tech_request_context = io_tech_request_context
       	 IMPORTING er_entity          = systemset_create_entity
    ).
*     Send specific entity data to the caller interfaces
    copy_data_to_ref(
      EXPORTING
        is_data = systemset_create_entity
      CHANGING
        cr_data = er_entity
   ).

  when others.
    super->/iwbep/if_mgw_appl_srv_runtime~create_entity(
       EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         io_data_provider   = io_data_provider
         it_key_tab = it_key_tab
         it_navigation_path = it_navigation_path
      IMPORTING
        er_entity = er_entity
  ).
ENDCASE.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING(optional)
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING(optional)
* | [--->] IV_SOURCE_NAME                 TYPE        STRING(optional)
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~DELETE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_DEL_ENTITY_BASE
*&* This class has been generated on 23.11.2021 14:26:36 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZLMDB_REST_API_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemlistSet
*-------------------------------------------------------------------------*
      when 'SystemlistSet'.
*     Call the entity set generated method
     systemlistset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  ServiceSet
*-------------------------------------------------------------------------*
      when 'ServiceSet'.
*     Call the entity set generated method
     serviceset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  LicenseSet
*-------------------------------------------------------------------------*
      when 'LicenseSet'.
*     Call the entity set generated method
     licenseset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  InstanceSet
*-------------------------------------------------------------------------*
      when 'InstanceSet'.
*     Call the entity set generated method
     instanceset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  ABAPClientSet
*-------------------------------------------------------------------------*
      when 'ABAPClientSet'.
*     Call the entity set generated method
     clientset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  SystemSet
*-------------------------------------------------------------------------*
      when 'SystemSet'.
*     Call the entity set generated method
     systemset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  ProductSet
*-------------------------------------------------------------------------*
      when 'ProductSet'.
*     Call the entity set generated method
     productset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

*-------------------------------------------------------------------------*
*             EntitySet -  SoftwareSet
*-------------------------------------------------------------------------*
      when 'SoftwareSet'.
*     Call the entity set generated method
     softwareset_delete_entity(
          EXPORTING iv_entity_name     = iv_entity_name
                    iv_entity_set_name = iv_entity_set_name
                    iv_source_name     = iv_source_name
                    it_key_tab         = it_key_tab
                    it_navigation_path = it_navigation_path
                    io_tech_request_context = io_tech_request_context
     ).

   when others.
     super->/iwbep/if_mgw_appl_srv_runtime~delete_entity(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_key_tab = it_key_tab
          it_navigation_path = it_navigation_path
 ).
 ENDCASE.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING(optional)
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING(optional)
* | [--->] IV_SOURCE_NAME                 TYPE        STRING(optional)
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [<---] ER_ENTITY                      TYPE REF TO DATA
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITY.
*&-----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_GETENTITY_BASE
*&* This class has been generated  on 23.11.2021 14:26:36 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZLMDB_REST_API_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA productset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_product.
 DATA systemlistset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_systemlist.
 DATA serviceset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_service.
 DATA softwareset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_softwarecomponent.
 DATA licenseset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_license.
 DATA instanceset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_instance.
 DATA systemset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_system.
 DATA clientset_get_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_abapclient.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data.       "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  ProductSet
*-------------------------------------------------------------------------*
      WHEN 'ProductSet'.
*     Call the entity set generated method
          productset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = productset_get_entity
                         es_response_context = es_response_context
          ).

        IF productset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = productset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemlistSet
*-------------------------------------------------------------------------*
      WHEN 'SystemlistSet'.
*     Call the entity set generated method
          systemlistset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = systemlistset_get_entity
                         es_response_context = es_response_context
          ).

        IF systemlistset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = systemlistset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  ServiceSet
*-------------------------------------------------------------------------*
      WHEN 'ServiceSet'.
*     Call the entity set generated method
          serviceset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = serviceset_get_entity
                         es_response_context = es_response_context
          ).

        IF serviceset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = serviceset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SoftwareSet
*-------------------------------------------------------------------------*
      WHEN 'SoftwareSet'.
*     Call the entity set generated method
          softwareset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = softwareset_get_entity
                         es_response_context = es_response_context
          ).

        IF softwareset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = softwareset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  LicenseSet
*-------------------------------------------------------------------------*
      WHEN 'LicenseSet'.
*     Call the entity set generated method
          licenseset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = licenseset_get_entity
                         es_response_context = es_response_context
          ).

        IF licenseset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = licenseset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  InstanceSet
*-------------------------------------------------------------------------*
      WHEN 'InstanceSet'.
*     Call the entity set generated method
          instanceset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = instanceset_get_entity
                         es_response_context = es_response_context
          ).

        IF instanceset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = instanceset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemSet
*-------------------------------------------------------------------------*
      WHEN 'SystemSet'.
*     Call the entity set generated method
          systemset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = systemset_get_entity
                         es_response_context = es_response_context
          ).

        IF systemset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = systemset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  ABAPClientSet
*-------------------------------------------------------------------------*
      WHEN 'ABAPClientSet'.
*     Call the entity set generated method
          clientset_get_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = clientset_get_entity
                         es_response_context = es_response_context
          ).

        IF clientset_get_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = clientset_get_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.

      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~get_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING(optional)
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING(optional)
* | [--->] IV_SOURCE_NAME                 TYPE        STRING(optional)
* | [--->] IT_FILTER_SELECT_OPTIONS       TYPE        /IWBEP/T_MGW_SELECT_OPTION(optional)
* | [--->] IT_ORDER                       TYPE        /IWBEP/T_MGW_SORTING_ORDER(optional)
* | [--->] IS_PAGING                      TYPE        /IWBEP/S_MGW_PAGING(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH(optional)
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [--->] IV_FILTER_STRING               TYPE        STRING(optional)
* | [--->] IV_SEARCH_STRING               TYPE        STRING(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITYSET(optional)
* | [<---] ER_ENTITYSET                   TYPE REF TO DATA
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TMP_ENTITYSET_BASE
*&* This class has been generated on 23.11.2021 14:26:36 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZLMDB_REST_API_DPC_EXT
*&-----------------------------------------------------------------------------------------------*
 DATA productset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_product.
 DATA clientset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_abapclient.
 DATA systemlistset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_systemlist.
 DATA systemset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_system.
 DATA instanceset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_instance.
 DATA serviceset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_service.
 DATA licenseset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_license.
 DATA softwareset_get_entityset TYPE zcl_zlmdb_rest_api_mpc=>tt_softwarecomponent.
 DATA lv_entityset_name TYPE string.

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  ProductSet
*-------------------------------------------------------------------------*
   WHEN 'ProductSet'.
*     Call the entity set generated method
      productset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = productset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = productset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  ABAPClientSet
*-------------------------------------------------------------------------*
   WHEN 'ABAPClientSet'.
*     Call the entity set generated method
      clientset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = clientset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = clientset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  SystemlistSet
*-------------------------------------------------------------------------*
   WHEN 'SystemlistSet'.
*     Call the entity set generated method
      systemlistset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = systemlistset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = systemlistset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  SystemSet
*-------------------------------------------------------------------------*
   WHEN 'SystemSet'.
*     Call the entity set generated method
      systemset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = systemset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = systemset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  InstanceSet
*-------------------------------------------------------------------------*
   WHEN 'InstanceSet'.
*     Call the entity set generated method
      instanceset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = instanceset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = instanceset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  ServiceSet
*-------------------------------------------------------------------------*
   WHEN 'ServiceSet'.
*     Call the entity set generated method
      serviceset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = serviceset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = serviceset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  LicenseSet
*-------------------------------------------------------------------------*
   WHEN 'LicenseSet'.
*     Call the entity set generated method
      licenseset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = licenseset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = licenseset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

*-------------------------------------------------------------------------*
*             EntitySet -  SoftwareSet
*-------------------------------------------------------------------------*
   WHEN 'SoftwareSet'.
*     Call the entity set generated method
      softwareset_get_entityset(
        EXPORTING
         iv_entity_name = iv_entity_name
         iv_entity_set_name = iv_entity_set_name
         iv_source_name = iv_source_name
         it_filter_select_options = it_filter_select_options
         it_order = it_order
         is_paging = is_paging
         it_navigation_path = it_navigation_path
         it_key_tab = it_key_tab
         iv_filter_string = iv_filter_string
         iv_search_string = iv_search_string
         io_tech_request_context = io_tech_request_context
       IMPORTING
         et_entityset = softwareset_get_entityset
         es_response_context = es_response_context
       ).
*     Send specific entity data to the caller interface
      copy_data_to_ref(
        EXPORTING
          is_data = softwareset_get_entityset
        CHANGING
          cr_data = er_entityset
      ).

    WHEN OTHERS.
      super->/iwbep/if_mgw_appl_srv_runtime~get_entityset(
        EXPORTING
          iv_entity_name = iv_entity_name
          iv_entity_set_name = iv_entity_set_name
          iv_source_name = iv_source_name
          it_filter_select_options = it_filter_select_options
          it_order = it_order
          is_paging = is_paging
          it_navigation_path = it_navigation_path
          it_key_tab = it_key_tab
          iv_filter_string = iv_filter_string
          iv_search_string = iv_search_string
          io_tech_request_context = io_tech_request_context
       IMPORTING
         er_entityset = er_entityset ).
 ENDCASE.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING(optional)
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING(optional)
* | [--->] IV_SOURCE_NAME                 TYPE        STRING(optional)
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [<---] ER_ENTITY                      TYPE REF TO DATA
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_MGW_APPL_SRV_RUNTIME~UPDATE_ENTITY.
*&----------------------------------------------------------------------------------------------*
*&  Include           /IWBEP/DPC_TEMP_UPD_ENTITY_BASE
*&* This class has been generated on 23.11.2021 14:26:36 in client 100
*&*
*&*       WARNING--> NEVER MODIFY THIS CLASS <--WARNING
*&*   If you want to change the DPC implementation, use the
*&*   generated methods inside the DPC provider subclass - ZCL_ZLMDB_REST_API_DPC_EXT
*&-----------------------------------------------------------------------------------------------*

 DATA licenseset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_license.
 DATA softwareset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_softwarecomponent.
 DATA instanceset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_instance.
 DATA serviceset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_service.
 DATA productset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_product.
 DATA clientset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_abapclient.
 DATA systemlistset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_systemlist.
 DATA systemset_update_entity TYPE zcl_zlmdb_rest_api_mpc=>ts_system.
 DATA lv_entityset_name TYPE string.
 DATA lr_entity TYPE REF TO data. "#EC NEEDED

lv_entityset_name = io_tech_request_context->get_entity_set_name( ).

CASE lv_entityset_name.
*-------------------------------------------------------------------------*
*             EntitySet -  LicenseSet
*-------------------------------------------------------------------------*
      WHEN 'LicenseSet'.
*     Call the entity set generated method
          licenseset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = licenseset_update_entity
          ).
       IF licenseset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = licenseset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SoftwareSet
*-------------------------------------------------------------------------*
      WHEN 'SoftwareSet'.
*     Call the entity set generated method
          softwareset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = softwareset_update_entity
          ).
       IF softwareset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = softwareset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  InstanceSet
*-------------------------------------------------------------------------*
      WHEN 'InstanceSet'.
*     Call the entity set generated method
          instanceset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = instanceset_update_entity
          ).
       IF instanceset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = instanceset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  ServiceSet
*-------------------------------------------------------------------------*
      WHEN 'ServiceSet'.
*     Call the entity set generated method
          serviceset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = serviceset_update_entity
          ).
       IF serviceset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = serviceset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  ProductSet
*-------------------------------------------------------------------------*
      WHEN 'ProductSet'.
*     Call the entity set generated method
          productset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = productset_update_entity
          ).
       IF productset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = productset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  ABAPClientSet
*-------------------------------------------------------------------------*
      WHEN 'ABAPClientSet'.
*     Call the entity set generated method
          clientset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = clientset_update_entity
          ).
       IF clientset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = clientset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemlistSet
*-------------------------------------------------------------------------*
      WHEN 'SystemlistSet'.
*     Call the entity set generated method
          systemlistset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = systemlistset_update_entity
          ).
       IF systemlistset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = systemlistset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
*-------------------------------------------------------------------------*
*             EntitySet -  SystemSet
*-------------------------------------------------------------------------*
      WHEN 'SystemSet'.
*     Call the entity set generated method
          systemset_update_entity(
               EXPORTING iv_entity_name     = iv_entity_name
                         iv_entity_set_name = iv_entity_set_name
                         iv_source_name     = iv_source_name
                         io_data_provider   = io_data_provider
                         it_key_tab         = it_key_tab
                         it_navigation_path = it_navigation_path
                         io_tech_request_context = io_tech_request_context
             	 IMPORTING er_entity          = systemset_update_entity
          ).
       IF systemset_update_entity IS NOT INITIAL.
*     Send specific entity data to the caller interface
          copy_data_to_ref(
            EXPORTING
              is_data = systemset_update_entity
            CHANGING
              cr_data = er_entity
          ).
        ELSE.
*         In case of initial values - unbind the entity reference
          er_entity = lr_entity.
        ENDIF.
      WHEN OTHERS.
        super->/iwbep/if_mgw_appl_srv_runtime~update_entity(
           EXPORTING
             iv_entity_name = iv_entity_name
             iv_entity_set_name = iv_entity_set_name
             iv_source_name = iv_source_name
             io_data_provider   = io_data_provider
             it_key_tab = it_key_tab
             it_navigation_path = it_navigation_path
          IMPORTING
            er_entity = er_entity
    ).
 ENDCASE.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~COMMIT_WORK
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_RFC_DEST                    TYPE        /IWBEP/DEFI_RFC_DEST(optional)
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~COMMIT_WORK.
* Call RFC commit work functionality
DATA lt_message      TYPE bapiret2. "#EC NEEDED
DATA lv_message_text TYPE BAPI_MSG.
DATA lo_logger       TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_subrc        TYPE syst-subrc.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

  IF iv_rfc_dest IS INITIAL OR iv_rfc_dest EQ 'NONE'.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      EXPORTING
      wait   = abap_true
    IMPORTING
      return = lt_message.
  ELSE.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
      DESTINATION iv_rfc_dest
    EXPORTING
      wait                  = abap_true
    IMPORTING
      return                = lt_message
    EXCEPTIONS
      communication_failure = 1000 MESSAGE lv_message_text
      system_failure        = 1001 MESSAGE lv_message_text
      OTHERS                = 1002.

  IF sy-subrc <> 0.
    lv_subrc = sy-subrc.
    /iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
        EXPORTING
          iv_subrc            = lv_subrc
          iv_exp_message_text = lv_message_text
          io_logger           = lo_logger ).
  ENDIF.
  ENDIF.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~GET_GENERATION_STRATEGY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RV_GENERATION_STRATEGY         TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~GET_GENERATION_STRATEGY.
* Get generation strategy
  rv_generation_strategy = '1'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~LOG_MESSAGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_MSG_TYPE                    TYPE        SYMSGTY
* | [--->] IV_MSG_ID                      TYPE        SYMSGID(optional)
* | [--->] IV_MSG_NUMBER                  TYPE        SYMSGNO(optional)
* | [--->] IV_MSG_V1                      TYPE        ANY(optional)
* | [--->] IV_MSG_V2                      TYPE        ANY(optional)
* | [--->] IV_MSG_V3                      TYPE        ANY(optional)
* | [--->] IV_MSG_V4                      TYPE        ANY(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~LOG_MESSAGE.
* Log message in the application log
DATA lo_logger TYPE REF TO /iwbep/cl_cos_logger.
DATA lv_text TYPE /iwbep/sup_msg_longtext.

  MESSAGE ID iv_msg_id TYPE iv_msg_type NUMBER iv_msg_number
    WITH iv_msg_v1 iv_msg_v2 iv_msg_v3 iv_msg_v4 INTO lv_text.

  lo_logger = mo_context->get_logger( ).
  lo_logger->log_message(
    EXPORTING
     iv_msg_type   = iv_msg_type
     iv_msg_id     = iv_msg_id
     iv_msg_number = iv_msg_number
     iv_msg_text   = lv_text
     iv_msg_v1     = iv_msg_v1
     iv_msg_v2     = iv_msg_v2
     iv_msg_v3     = iv_msg_v3
     iv_msg_v4     = iv_msg_v4
     iv_agent      = 'DPC' ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_EXCEPTION_HANDLING
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SUBRC                       TYPE        SY-SUBRC
* | [--->] IV_EXP_MESSAGE_TEXT            TYPE        /IWBEP/MGW_BOP_RFC_EXCEP_TEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_EXCEPTION_HANDLING.
* RFC call exception handling
DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.

lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).

/iwbep/cl_sb_gen_dpc_rt_util=>rfc_exception_handling(
  EXPORTING
    iv_subrc            = iv_subrc
    iv_exp_message_text = iv_exp_message_text
    io_logger           = lo_logger ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_SAVE_LOG
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_RETURN                      TYPE        ANY(optional)
* | [--->] IT_RETURN                      TYPE        ANY TABLE(optional)
* | [--->] IV_ENTITY_TYPE                 TYPE        STRING(optional)
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR(optional)
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~RFC_SAVE_LOG.
  DATA lo_logger  TYPE REF TO /iwbep/cl_cos_logger.
  DATA lo_message_container TYPE REF TO /iwbep/if_message_container.

  lo_logger = /iwbep/if_mgw_conv_srv_runtime~get_logger( ).
  lo_message_container = /iwbep/if_mgw_conv_srv_runtime~get_message_container( ).

  " Save the RFC call log in the application log
  /iwbep/cl_sb_gen_dpc_rt_util=>rfc_save_log(
    EXPORTING
      is_return            = is_return
      iv_entity_type       = iv_entity_type
      it_return            = it_return
      it_key_tab           = it_key_tab
      io_logger            = lo_logger
      io_message_container = lo_message_container ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZLMDB_REST_API_DPC->/IWBEP/IF_SB_DPC_COMM_SERVICES~SET_INJECTION
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_UNIT                        TYPE REF TO /IWBEP/IF_SB_GEN_DPC_INJECTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method /IWBEP/IF_SB_DPC_COMM_SERVICES~SET_INJECTION.
* Unit test injection
  IF io_unit IS BOUND.
    mo_injection = io_unit.
  ELSE.
    mo_injection = me.
  ENDIF.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CHECK_SUBSCRIPTION_AUTHORITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IS_SUBSCRIPTION_DATA           TYPE        /IWBEP/S_MGW_DB_SUB_DATA
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CHECK_SUBSCRIPTION_AUTHORITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CHECK_SUBSCRIPTION_AUTHORITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CLIENTSET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLIENTSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CLIENTSET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CLIENTSET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLIENTSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CLIENTSET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CLIENTSET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLIENTSET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CLIENTSET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CLIENTSET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_ABAPCLIENT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLIENTSET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CLIENTSET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->CLIENTSET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_ABAPCLIENT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLIENTSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'CLIENTSET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->INSTANCESET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSTANCESET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'INSTANCESET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->INSTANCESET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSTANCESET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'INSTANCESET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->INSTANCESET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSTANCESET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'INSTANCESET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->INSTANCESET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_INSTANCE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSTANCESET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'INSTANCESET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->INSTANCESET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_INSTANCE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method INSTANCESET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'INSTANCESET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->LICENSESET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method LICENSESET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'LICENSESET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->LICENSESET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method LICENSESET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'LICENSESET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->LICENSESET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method LICENSESET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'LICENSESET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->LICENSESET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_LICENSE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method LICENSESET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'LICENSESET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->LICENSESET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_LICENSE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method LICENSESET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'LICENSESET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->PRODUCTSET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method PRODUCTSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->PRODUCTSET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method PRODUCTSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->PRODUCTSET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method PRODUCTSET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->PRODUCTSET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_PRODUCT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method PRODUCTSET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->PRODUCTSET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_PRODUCT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method PRODUCTSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'PRODUCTSET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SERVICESET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SERVICESET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SERVICESET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SERVICESET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SERVICESET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SERVICESET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SERVICESET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SERVICESET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SERVICESET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SERVICESET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_SERVICE
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SERVICESET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SERVICESET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SERVICESET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SERVICE
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SERVICESET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SERVICESET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SOFTWARESET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SOFTWARESET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SOFTWARESET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SOFTWARESET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SOFTWARESET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SOFTWARESET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SOFTWARESET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SOFTWARESET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SOFTWARESET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SOFTWARESET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_SOFTWARECOMPONENT
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SOFTWARESET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SOFTWARESET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SOFTWARESET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SOFTWARECOMPONENT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SOFTWARESET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SOFTWARESET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMLISTSET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMLISTSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMLISTSET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMLISTSET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMLISTSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMLISTSET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMLISTSET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMLISTSET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMLISTSET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMLISTSET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_SYSTEMLIST
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMLISTSET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMLISTSET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMLISTSET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEMLIST
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMLISTSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMLISTSET_UPDATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMSET_CREATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_C(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMSET_CREATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMSET_CREATE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMSET_DELETE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_D(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMSET_DELETE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMSET_DELETE_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMSET_GET_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_REQUEST_OBJECT              TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_ENTITY_CNTXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMSET_GET_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMSET_GET_ENTITY'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMSET_GET_ENTITYSET
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
* | [<---] ET_ENTITYSET                   TYPE        ZCL_ZLMDB_REST_API_MPC=>TT_SYSTEM
* | [<---] ES_RESPONSE_CONTEXT            TYPE        /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MGW_RESPONSE_CONTEXT
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMSET_GET_ENTITYSET.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMSET_GET_ENTITYSET'.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_ZLMDB_REST_API_DPC->SYSTEMSET_UPDATE_ENTITY
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY_NAME                 TYPE        STRING
* | [--->] IV_ENTITY_SET_NAME             TYPE        STRING
* | [--->] IV_SOURCE_NAME                 TYPE        STRING
* | [--->] IT_KEY_TAB                     TYPE        /IWBEP/T_MGW_NAME_VALUE_PAIR
* | [--->] IO_TECH_REQUEST_CONTEXT        TYPE REF TO /IWBEP/IF_MGW_REQ_ENTITY_U(optional)
* | [--->] IT_NAVIGATION_PATH             TYPE        /IWBEP/T_MGW_NAVIGATION_PATH
* | [--->] IO_DATA_PROVIDER               TYPE REF TO /IWBEP/IF_MGW_ENTRY_PROVIDER(optional)
* | [<---] ER_ENTITY                      TYPE        ZCL_ZLMDB_REST_API_MPC=>TS_SYSTEM
* | [!CX!] /IWBEP/CX_MGW_BUSI_EXCEPTION
* | [!CX!] /IWBEP/CX_MGW_TECH_EXCEPTION
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SYSTEMSET_UPDATE_ENTITY.
  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
    EXPORTING
      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
      method = 'SYSTEMSET_UPDATE_ENTITY'.
  endmethod.
ENDCLASS.