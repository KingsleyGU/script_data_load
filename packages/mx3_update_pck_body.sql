--------------------------------------------------------
--  File created - Monday-June-07-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Package Body MX3_UPDATE_PCK
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "MX3"."MX3_UPDATE_PCK" AS

    PROCEDURE update_mxt_mktp_smile_rep;

    PROCEDURE update_mxt_mktp_vol_rep;

    PROCEDURE update_mxt_trade_value_rep;

    PROCEDURE update_mxt_cash_rep;

    PROCEDURE update_erm_im_main_agg_rep;

    PROCEDURE update_fric_cash_flows_rep;

    PROCEDURE update_intra_trade_val_rep;

    PROCEDURE update_job_audit_rep;

    PROCEDURE update_mxt_ci_rep;

    PROCEDURE update_mxt_deltahedge_rep;

    PROCEDURE update_mxt_fr_vol_rep;

    PROCEDURE update_mxt_greeks_topo_rep;

    PROCEDURE update_mxt_legal_agr_rep;

    PROCEDURE update_mxt_pl_bo_d_rep;

    PROCEDURE update_mxt_pl_fo_d_rep;

    PROCEDURE update_mxt_pl_var_rep;

    PROCEDURE update_mxt_portfolio_rep;

    PROCEDURE update_mxt_refspot_rep;

    PROCEDURE update_mxt_rho_topo_rep;

    PROCEDURE update_mxt_si_static_rep;

    PROCEDURE update_mxt_smc_intraday_rep;

    PROCEDURE update_mxt_tarf_data_rep;

    PROCEDURE update_mxt_tarf_data_rep_iday;

    PROCEDURE update_mxt_tarf_fixings_iday;

    PROCEDURE update_mxt_tarf_fixings_rep;

    PROCEDURE update_mxt_topo_rep;

    PROCEDURE update_mxt_trade_audit_rep;

    PROCEDURE update_mxt_trade_cs_rep;

    PROCEDURE update_mxt_trade_fix_rep;

    PROCEDURE update_mxt_trade_intr_rep;

    PROCEDURE update_mxt_trade_pay_rep;

    PROCEDURE update_mxt_trade_rep;

    PROCEDURE update_mxt_trade_rep_intraday;

    PROCEDURE update_mxt_trade_si_rep;

    PROCEDURE update_mxt_trade_ts_rep;

    PROCEDURE update_mxt_user_group_rep;

    PROCEDURE update_mxt_var_mktop_rep;

    PROCEDURE update_mxt_vol_intraday_rep;

    PROCEDURE update_mxt_zc_rep;

    PROCEDURE update_tremor1_basket_rep;

    PROCEDURE update_tremor1_outputs_rep;

    PROCEDURE update_trn_entd_dbf_rep;

    PROCEDURE update_usr_info_dbf_rep;

    PROCEDURE update_mxt_counterpart_rep;

    PROCEDURE update_mxt_intravar_rep;

    PROCEDURE update_mxt_var_v1;
	
	PROCEDURE update_mxt_event_rep;

    PROCEDURE truncate_target (
        target_table IN VARCHAR2
    );

    PROCEDURE delete_ref_data (
        target_table   IN   VARCHAR2,
        source_table   IN   VARCHAR2
    );
	
    PROCEDURE truncate_iday_tables AS
    t1         PLS_INTEGER;
    BEGIN
        
        dbms_output.put_line('truncate_iday_tables: start.');
        truncate_target('MXT_INTRAVAR_REP');
        truncate_target('MXT_TRADE_INTR_REP');
        truncate_target('MXT_VAR_MKTOP_REP');
        truncate_target('INTRA_TRADE_VAL_REP');
		truncate_target('MXT_TRADE_REP_INTRADAY');
        t1 := dbms_utility.get_time;
        delete from MX3.ERM_IM_MAIN_AGG_REP where M_VALUATION_DATE_CRIF < sysdate-31;
        dbms_output.put_line('MX3.ERM_IM_MAIN_AGG_REP'
                             || ' '
                             || SQL%rowcount
                             || ' rows deleted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');
        COMMIT;
        dbms_output.put_line('truncate_iday_tables: complete.');
    END truncate_iday_tables;
	
    PROCEDURE data_loader_grp_420 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_420: start.');
        update_mxt_mktp_smile_rep;
        update_mxt_mktp_vol_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_420: complete.');
    END data_loader_grp_420;

    PROCEDURE data_loader_grp_421 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_421: start.');
        update_mxt_trade_value_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_421: complete.');
    END data_loader_grp_421;

    PROCEDURE data_loader_grp_422 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_422: start.');
        update_mxt_trade_audit_rep;
        update_mxt_trade_cs_rep;
        update_mxt_trade_pay_rep;
        update_mxt_trade_fix_rep;
        update_mxt_trade_rep;
        update_mxt_tarf_fixings_rep;
        update_mxt_tarf_data_rep;
        update_tremor1_basket_rep;
        update_mxt_trade_ts_rep;
        update_tremor1_outputs_rep;
		update_mxt_event_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_422: complete.');
    END data_loader_grp_422;

    PROCEDURE data_loader_grp_423 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_423: start.');
        update_mxt_ci_rep;
        update_mxt_si_static_rep;
        update_mxt_portfolio_rep;
        update_mxt_counterpart_rep;
        update_mxt_legal_agr_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_423: complete.');
    END data_loader_grp_423;

    PROCEDURE data_loader_grp_424 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_424: start.');
        update_mxt_topo_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_424: complete.');
    END data_loader_grp_424;

    PROCEDURE data_loader_grp_425 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_425: start.');
        update_mxt_user_group_rep;
        update_usr_info_dbf_rep;
        update_mxt_cash_rep;
        update_mxt_refspot_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_425: complete.');
    END data_loader_grp_425;

    PROCEDURE data_loader_grp_426 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_426: start.');
        update_mxt_rho_topo_rep;
        update_mxt_greeks_topo_rep;
        update_mxt_deltahedge_rep;
        update_trn_entd_dbf_rep;
        update_mxt_zc_rep;
        update_mxt_var_v1;
        COMMIT;
        dbms_output.put_line('data_loader_grp_426: complete.');
    END data_loader_grp_426;

    PROCEDURE data_loader_grp_427 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_427: start.');
        update_mxt_pl_var_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_427: complete.');
    END data_loader_grp_427;

    PROCEDURE data_loader_grp_428 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_428: start.');
        update_mxt_trade_si_rep;
        update_mxt_var_mktop_rep;
        update_intra_trade_val_rep;
        update_mxt_trade_intr_rep;
        update_mxt_fr_vol_rep;
        update_mxt_intravar_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_428: complete.');
    END data_loader_grp_428;

    PROCEDURE data_loader_grp_429 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_429: start.');
        update_job_audit_rep;
        update_fric_cash_flows_rep;
        update_mxt_pl_bo_d_rep;
        update_erm_im_main_agg_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_429: complete.');
    END data_loader_grp_429;

    PROCEDURE data_loader_grp_431 AS
    BEGIN
        dbms_output.put_line('data_loader_grp_431: start.');
        update_mxt_tarf_fixings_iday;
        update_mxt_trade_rep_intraday;
        update_mxt_tarf_data_rep_iday;
        update_mxt_smc_intraday_rep;
        update_mxt_vol_intraday_rep;
        COMMIT;
        dbms_output.put_line('data_loader_grp_431: complete.');
    END data_loader_grp_431;

    PROCEDURE update_mxt_trade_value_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_VALUE_REP', 'MXT_TRADE_VALUE_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_value_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_tp_ipaycvc,
            m_tp_iqty,
            m_tp_moplstl,
            m_tp_nblti,
            m_tp_nomcur,
            m_tp_qtyeq,
            m_tp_status2,
            m_tp_valstat,
            m_package,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_pl_csnfcp2,
            m_pl_fmv2,
            m_pl_fmvcl2,
            m_pl_fmvth1,
            m_pl_fpfcp2,
            m_pl_nfmvcl2,
            m_qty_index,
            m_s_delta2,
            m_s_gamma2,
            m_s_rho2,
            m_s_rhof2,
            m_s_theta2,
            m_s_vanna2,
            m_s_vega2,
            m_s_volga2,
            m_tp_dscexo0,
            m_tp_fxbase,
            m_tp_fxpspt,
            m_tp_initsd,
            m_tp_ipay,
            m_tp_ipaycur,
            m_tp_ipaycv,
            m_contract,
            m_c_cur_pl,
            m_c_pl_dt,
            m_h_df_base,
            m_h_df_und,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_inval,
            m_h_pr_dfc,
            m_h_sys_date,
            m_h_timval,
            m_mp_spot2,
            m_nb,
            m_ref_data,
            m_cmp_typo,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_tp_ipaycvc,
                m_tp_iqty,
                m_tp_moplstl,
                m_tp_nblti,
                m_tp_nomcur,
                m_tp_qtyeq,
                m_tp_status2,
                m_tp_valstat,
                m_package,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_pl_csnfcp2,
                m_pl_fmv2,
                m_pl_fmvcl2,
                m_pl_fmvth1,
                m_pl_fpfcp2,
                m_pl_nfmvcl2,
                m_qty_index,
                m_s_delta2,
                m_s_gamma2,
                m_s_rho2,
                m_s_rhof2,
                m_s_theta2,
                m_s_vanna2,
                m_s_vega2,
                m_s_volga2,
                m_tp_dscexo0,
                m_tp_fxbase,
                m_tp_fxpspt,
                m_tp_initsd,
                m_tp_ipay,
                m_tp_ipaycur,
                m_tp_ipaycv,
                m_contract,
                m_c_cur_pl,
                m_c_pl_dt,
                m_h_df_base,
                m_h_df_und,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_inval,
                m_h_pr_dfc,
                m_h_sys_date,
                m_h_timval,
                m_mp_spot2,
                m_nb,
                m_ref_data,
                m_cmp_typo,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2
            FROM
                mx3.mxt_trade_value_rep_ext;

        dbms_output.put_line('MXT_TRADE_VALUE_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_value_rep;

    PROCEDURE update_mxt_mktp_vol_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_MKTP_VOL_REP', 'MXT_MKTP_VOL_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_mktp_vol_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_enddate,
            m_instrum,
            m_h_sys_date,
            m__date_,
            m_h_ext_time,
            m_lnkinst,
            m_nature,
            m_putask,
            m_callbid,
            m_putbid,
            m_smile,
            m_h_ext_date,
            m_timestamp_,
            m_callask,
            m_label,
            m_varmode,
            m_ref_data
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_enddate,
                m_instrum,
                m_h_sys_date,
                m__date_,
                m_h_ext_time,
                m_lnkinst,
                m_nature,
                m_putask,
                m_callbid,
                m_putbid,
                m_smile,
                m_h_ext_date,
                m_timestamp_,
                m_callask,
                m_label,
                m_varmode,
                m_ref_data
            FROM
                mx3.mxt_mktp_vol_rep_ext;

        dbms_output.put_line('MXT_MKTP_VOL_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_mktp_vol_rep;

    PROCEDURE update_mxt_mktp_smile_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_MKTP_SMILE_REP', 'MXT_MKTP_SMILE_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_mktp_smile_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_refval,
            m_h_ext_time,
            m_strike,
            m_type,
            m_callbid,
            m__date_,
            m_callask,
            m_putask,
            m_h_ext_date,
            m_lnkinst,
            m_ref_data,
            m_timestamp_,
            m_putbid,
            m_nbpoints,
            m_label,
            m_instrum,
            m_h_sys_date,
            m_spread
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_refval,
                m_h_ext_time,
                m_strike,
                m_type,
                m_callbid,
                m__date_,
                m_callask,
                m_putask,
                m_h_ext_date,
                m_lnkinst,
                m_ref_data,
                m_timestamp_,
                m_putbid,
                m_nbpoints,
                m_label,
                m_instrum,
                m_h_sys_date,
                m_spread
            FROM
                mx3.mxt_mktp_smile_rep_ext;

        dbms_output.put_line('MXT_MKTP_SMILE_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_mktp_smile_rep;

    PROCEDURE update_mxt_cash_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_CASH_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_cash_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_f_type,
            m_f_typenb,
            m_tp_moplstd,
            m_tp_moplstl,
            m_f_amount,
            m_f_currency,
            m_f_value,
            m_hcomment,
            m_cnt_vs2,
            m_contract,
            m_package,
            m_pkg_org,
            m_tp_int,
            m_tp_moplst,
            m_cnt_vs1,
            m_tp_cntrp,
            m_tp_dtesys,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_instrument,
            m_nb,
            m_cnt_typo,
            m_cnt_vs0,
            m_ref_data,
            m_trn_type,
            m_tp_pfolio,
            m_trn_grp,
            m_cmp_typo,
            m_cnt_org
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_f_type,
                m_f_typenb,
                m_tp_moplstd,
                m_tp_moplstl,
                m_f_amount,
                m_f_currency,
                m_f_value,
                m_hcomment,
                m_cnt_vs2,
                m_contract,
                m_package,
                m_pkg_org,
                m_tp_int,
                m_tp_moplst,
                m_cnt_vs1,
                m_tp_cntrp,
                m_tp_dtesys,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_instrument,
                m_nb,
                m_cnt_typo,
                m_cnt_vs0,
                m_ref_data,
                m_trn_type,
                m_tp_pfolio,
                m_trn_grp,
                m_cmp_typo,
                m_cnt_org
            FROM
                mx3.mxt_cash_rep_ext;

        dbms_output.put_line('MXT_CASH_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_cash_rep;

    PROCEDURE update_erm_im_main_agg_rep AS
        t1 PLS_INTEGER;
    BEGIN
        dbms_output.put_line('ERM_IM_MAIN_AGG_REP 0 rows deleted.');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.erm_im_main_agg_rep (
            m_calc_timestamp,
            m_trade_id,
            m_party_id,
            m_counterparty_id,
            m_portfolio_id,
            m_im_model,
            m_risk_type,
            m_product_class,
            m_valuation_date_crif,
            m_qualifier,
            m_bucket,
            m_label1,
            m_label2,
            m_amount_currency,
            m_amount,
            m_amount_usd,
            m_datasource
        )
            SELECT
                m_calc_timestamp,
                m_trade_id,
                m_party_id,
                m_counterparty_id,
                m_portfolio_id,
                m_im_model,
                m_risk_type,
                m_product_class,
                m_valuation_date_crif,
                m_qualifier,
                m_bucket,
                m_label1,
                m_label2,
                m_amount_currency,
                m_amount,
                m_amount_usd,
                m_datasource
            FROM
                mx3.erm_im_main_agg_rep_ext;

        dbms_output.put_line('ERM_IM_MAIN_AGG_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_erm_im_main_agg_rep;

    PROCEDURE update_fric_cash_flows_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('FRIC_CASH_FLOWS_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.fric_cash_flows_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_cash_flow,
            m_cash_flo1,
            m_currency,
            m_date,
            m_trade_num,
            m_typology,
            m_portfolio,
            m_ref_data,
            m_instrumen
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_cash_flow,
                m_cash_flo1,
                m_currency,
                m_date,
                m_trade_num,
                m_typology,
                m_portfolio,
                m_ref_data,
                m_instrumen
            FROM
                mx3.fric_cash_flows_rep_ext;

        dbms_output.put_line('FRIC_CASH_FLOWS_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_fric_cash_flows_rep;

    PROCEDURE update_intra_trade_val_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('INTRA_TRADE_VAL_REP', 'INTRA_TRADE_VAL_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.intra_trade_val_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_s_delta2,
            m_s_gamma0,
            m_mp_spot21,
            m_s_delta1,
            m_pl_fmv0,
            m_pl_fpfcp1,
            m_cnt_vs0,
            m_tp_valstat,
            m_trn_type,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs2,
            m_s_theta1,
            m_s_theta2,
            m_h_ext_time,
            m_h_inval,
            m_loc_disc1,
            m_s_rho0,
            m_s_rho1,
            m_pl_fpfcp2,
            m_pl_nfmv0,
            m_pl_fmvcl2,
            m_pl_nfmv1,
            m_pl_nfmv2,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_tp_moplstl,
            m_tp_nblti,
            m_h_df_und,
            m_h_ext_date,
            m_pl_csnfcp1,
            m_pl_csnfcp2,
            m_for_disc0,
            m_tp_fxund,
            m_tp_initsd,
            m_s_gamma1,
            m_s_gamma2,
            m_pl_nfmvcl0,
            m_pl_nfmvcl1,
            m_s_rhof2,
            m_s_theta0,
            m_tp_nomcur,
            m_tp_obartyp,
            m_tp_ae,
            m_tp_buy,
            m_tp_qtyeq,
            m_tp_status2,
            m_h_sys_date,
            m_h_timval,
            m_for_disc1,
            m_for_disc2,
            m_h_df_base,
            m_s_rho2,
            m_tp_dteexp,
            m_tp_fxbase,
            m_cnt_org,
            m_cnt_typo,
            m_mp_spot22,
            m_nb,
            m_cmp_typo,
            m_mp_spot1,
            m_tp_iqty,
            m_tp_lqty0,
            m_h_pr_dfc,
            m_ref_data,
            m_package,
            m_loc_disc2,
            m_mp_spot0,
            m_pl_csnfcp0,
            m_h_ext_sec,
            m_s_vanna0,
            m_s_vanna1,
            m_s_volga1,
            m_s_volga2,
            m_s_vanna2,
            m_s_vega0,
            m_tp_fxcpcur,
            m_s_rhof0,
            m_s_rhof1,
            m_pl_fmvth2,
            m_pl_fpfcp0,
            m_pl_fmv1,
            m_pl_fmv2,
            m_pl_fmvth0,
            m_pl_fmvth1,
            m_c_cur_pl,
            m_c_pl_dt,
            m_pl_fmvcl0,
            m_pl_fmvcl1,
            m_qty_index,
            m_s_delta0,
            m_tp_ipay,
            m_tp_ipaycur,
            m_tp_lqty2,
            m_tp_moplst,
            m_s_vega2,
            m_s_volga0,
            m_pl_nfmvcl2,
            m_instrument,
            m_loc_disc0,
            m_tp_lqty1,
            m_mp_spot2,
            m_mp_spot20,
            m_tp_cp,
            m_tp_dscexo0,
            m_pkg_vs1,
            m_s_vega1
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_s_delta2,
                m_s_gamma0,
                m_mp_spot21,
                m_s_delta1,
                m_pl_fmv0,
                m_pl_fpfcp1,
                m_cnt_vs0,
                m_tp_valstat,
                m_trn_type,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs2,
                m_s_theta1,
                m_s_theta2,
                m_h_ext_time,
                m_h_inval,
                m_loc_disc1,
                m_s_rho0,
                m_s_rho1,
                m_pl_fpfcp2,
                m_pl_nfmv0,
                m_pl_fmvcl2,
                m_pl_nfmv1,
                m_pl_nfmv2,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_tp_moplstl,
                m_tp_nblti,
                m_h_df_und,
                m_h_ext_date,
                m_pl_csnfcp1,
                m_pl_csnfcp2,
                m_for_disc0,
                m_tp_fxund,
                m_tp_initsd,
                m_s_gamma1,
                m_s_gamma2,
                m_pl_nfmvcl0,
                m_pl_nfmvcl1,
                m_s_rhof2,
                m_s_theta0,
                m_tp_nomcur,
                m_tp_obartyp,
                m_tp_ae,
                m_tp_buy,
                m_tp_qtyeq,
                m_tp_status2,
                m_h_sys_date,
                m_h_timval,
                m_for_disc1,
                m_for_disc2,
                m_h_df_base,
                m_s_rho2,
                m_tp_dteexp,
                m_tp_fxbase,
                m_cnt_org,
                m_cnt_typo,
                m_mp_spot22,
                m_nb,
                m_cmp_typo,
                m_mp_spot1,
                m_tp_iqty,
                m_tp_lqty0,
                m_h_pr_dfc,
                m_ref_data,
                m_package,
                m_loc_disc2,
                m_mp_spot0,
                m_pl_csnfcp0,
                m_h_ext_sec,
                m_s_vanna0,
                m_s_vanna1,
                m_s_volga1,
                m_s_volga2,
                m_s_vanna2,
                m_s_vega0,
                m_tp_fxcpcur,
                m_s_rhof0,
                m_s_rhof1,
                m_pl_fmvth2,
                m_pl_fpfcp0,
                m_pl_fmv1,
                m_pl_fmv2,
                m_pl_fmvth0,
                m_pl_fmvth1,
                m_c_cur_pl,
                m_c_pl_dt,
                m_pl_fmvcl0,
                m_pl_fmvcl1,
                m_qty_index,
                m_s_delta0,
                m_tp_ipay,
                m_tp_ipaycur,
                m_tp_lqty2,
                m_tp_moplst,
                m_s_vega2,
                m_s_volga0,
                m_pl_nfmvcl2,
                m_instrument,
                m_loc_disc0,
                m_tp_lqty1,
                m_mp_spot2,
                m_mp_spot20,
                m_tp_cp,
                m_tp_dscexo0,
                m_pkg_vs1,
                m_s_vega1
            FROM
                mx3.intra_trade_val_rep_ext;

        dbms_output.put_line('INTRA_TRADE_VAL_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_intra_trade_val_rep;

    PROCEDURE update_job_audit_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('JOB_AUDIT_REP', 'JOB_AUDIT_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.job_audit_rep (
            timestamp,
            m_identity,
            m_id,
            m_mx_ref_job,
            m_ref_data,
            m_datagen,
            m_user,
            m_grp,
            m_desk,
            m_desktype,
            m_date,
            m_time,
            m_endtime,
            m_status,
            m_batch,
            m_ctx
        )
            SELECT
                0,
                0,
                m_id,
                m_mx_ref_job,
                m_ref_data,
                m_datagen,
                m_user,
                m_grp,
                m_desk,
                m_desktype,
                m_date,
                m_time,
                m_endtime,
                m_status,
                m_batch,
                m_ctx
            FROM
                mx3.job_audit_rep_ext;

        dbms_output.put_line('JOB_AUDIT_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_job_audit_rep;

    PROCEDURE update_mxt_ci_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_CI_REP', 'MXT_CI_REP_EXT');
        INSERT INTO mx3.mxt_ci_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_address_4,
            m_add_id,
            m_language,
            m_address_2,
            m_fax,
            m_address_1,
            m_custominfo,
            m_email,
            m_contact2,
            m_contact1,
            m_swift,
            m_doctype,
            m_id,
            m_master,
            m_h_ext_time,
            m_filter,
            m_h_ext_date,
            m_label,
            m_custnum,
            m_address_3,
            m_ref_data,
            m_addrtype,
            m_code
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_address_4,
                m_add_id,
                m_language,
                m_address_2,
                m_fax,
                m_address_1,
                m_custominfo,
                m_email,
                m_contact2,
                m_contact1,
                m_swift,
                m_doctype,
                m_id,
                m_master,
                m_h_ext_time,
                m_filter,
                m_h_ext_date,
                m_label,
                m_custnum,
                m_address_3,
                m_ref_data,
                m_addrtype,
                m_code
            FROM
                mx3.mxt_ci_rep_ext;

        dbms_output.put_line('MXT_CI_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_ci_rep;

    PROCEDURE update_mxt_deltahedge_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_DELTAHEDGE_REP', 'MXT_DELTAHEDGE_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_deltahedge_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_typology,
            m_xdup_flag,
            m_xsum_count,
            m_h_sys_date,
            m_instrumen,
            m_optional,
            m_optional1,
            m_portfolio,
            m_total,
            m_xsum_det,
            m_ref_data,
            m_total1,
            m_trade_num,
            m_flow1,
            m_h_ext_time,
            m_market_v1,
            m_market_va,
            m_currency,
            m_date,
            m_flow
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_typology,
                m_xdup_flag,
                m_xsum_count,
                m_h_sys_date,
                m_instrumen,
                m_optional,
                m_optional1,
                m_portfolio,
                m_total,
                m_xsum_det,
                m_ref_data,
                m_total1,
                m_trade_num,
                m_flow1,
                m_h_ext_time,
                m_market_v1,
                m_market_va,
                m_currency,
                m_date,
                m_flow
            FROM
                mx3.mxt_deltahedge_rep_ext;

        dbms_output.put_line('MXT_DELTAHEDGE_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_deltahedge_rep;

    PROCEDURE update_mxt_fr_vol_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_FR_VOL_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_fr_vol_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_h_ext_date,
            m_enddate,
            m__date_,
            m_putask,
            m_instrum,
            m_nature,
            m_callbid,
            m_h_ext_time,
            m_smile,
            m_ref_data,
            m_putbid,
            m_label,
            m_lnkinst,
            m_callask,
            m_varmode,
            m_h_sys_date,
            m_timestamp_
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_h_ext_date,
                m_enddate,
                m__date_,
                m_putask,
                m_instrum,
                m_nature,
                m_callbid,
                m_h_ext_time,
                m_smile,
                m_ref_data,
                m_putbid,
                m_label,
                m_lnkinst,
                m_callask,
                m_varmode,
                m_h_sys_date,
                m_timestamp_
            FROM
                mx3.mxt_fr_vol_rep_ext;

        dbms_output.put_line('MXT_FR_VOL_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_fr_vol_rep;

    PROCEDURE update_mxt_greeks_topo_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_GREEKS_TOPO_REP', 'MXT_GREEKS_TOPO_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_greeks_topo_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_fx_gamma,
            m_fx_vanna,
            m_fx_vega,
            m_fx_volga,
            m_ref_data,
            m_h_ext_time,
            m_h_sys_date,
            m_instrumen,
            m_portfolio,
            m_date,
            m_dated,
            m_fx_delta,
            m_call_put,
            m_conventio,
            m_currency,
            m_cut_off,
            m_quantity,
            m_strategy,
            m_trade_num,
            m_typology
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_fx_gamma,
                m_fx_vanna,
                m_fx_vega,
                m_fx_volga,
                m_ref_data,
                m_h_ext_time,
                m_h_sys_date,
                m_instrumen,
                m_portfolio,
                m_date,
                m_dated,
                m_fx_delta,
                m_call_put,
                m_conventio,
                m_currency,
                m_cut_off,
                m_quantity,
                m_strategy,
                m_trade_num,
                m_typology
            FROM
                mx3.mxt_greeks_topo_rep_ext;

        dbms_output.put_line('MXT_GREEKS_TOPO_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_greeks_topo_rep;

    PROCEDURE update_mxt_legal_agr_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_LEGAL_AGR_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_legal_agr_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_end_date,
            m_ext_sig_dt,
            m_label,
            m_master,
            m_ref_data,
            m_start_date,
            m_ins_date,
            m_h_sys_date
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_end_date,
                m_ext_sig_dt,
                m_label,
                m_master,
                m_ref_data,
                m_start_date,
                m_ins_date,
                m_h_sys_date
            FROM
                mx3.mxt_legal_agr_rep_ext;

        dbms_output.put_line('MXT_LEGAL_AGR_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_legal_agr_rep;

    PROCEDURE update_mxt_pl_bo_d_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_PL_D_REP', 'MXT_PL_D_REP_BO_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_pl_d_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_trade_num,
            m_typology,
            m_ref_data,
            m_instrumen,
            m_pl_abs,
            m_portfolio,
            m_currency
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_trade_num,
                m_typology,
                m_ref_data,
                m_instrumen,
                m_pl_abs,
                m_portfolio,
                m_currency
            FROM
                mx3.mxt_pl_d_rep_bo_ext;

        dbms_output.put_line('MXT_PL_D_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_pl_bo_d_rep;

    PROCEDURE update_mxt_pl_fo_d_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_PL_D_REP', 'MXT_PL_D_REP_FO_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_pl_d_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_trade_num,
            m_typology,
            m_ref_data,
            m_instrumen,
            m_pl_abs,
            m_portfolio,
            m_currency
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_trade_num,
                m_typology,
                m_ref_data,
                m_instrumen,
                m_pl_abs,
                m_portfolio,
                m_currency
            FROM
                mx3.mxt_pl_d_rep_fo_ext;

        dbms_output.put_line('MXT_PL_D_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_pl_fo_d_rep;

    PROCEDURE update_mxt_pl_var_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_PL_VAR_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_pl_var_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_contract1,
            m_contract2,
            m_type,
            m_xdup_flag,
            m_package_n,
            m_pl_effect,
            m_contract3,
            m_contract_,
            m_effect,
            m_trade_num,
            m_trade_typ,
            m_xsum_count,
            m_xsum_det,
            m_portfolio,
            m_p_l_varia,
            m_risk_sect,
            m_h_ext_date,
            m_maturity,
            m_ref_data
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_contract1,
                m_contract2,
                m_type,
                m_xdup_flag,
                m_package_n,
                m_pl_effect,
                m_contract3,
                m_contract_,
                m_effect,
                m_trade_num,
                m_trade_typ,
                m_xsum_count,
                m_xsum_det,
                m_portfolio,
                m_p_l_varia,
                m_risk_sect,
                m_h_ext_date,
                m_maturity,
                m_ref_data
            FROM
                mx3.mxt_pl_var_rep_ext;

        dbms_output.put_line('MXT_PL_VAR_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_pl_var_rep;

    PROCEDURE update_mxt_portfolio_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_PORTFOLIO_REP', 'MXT_PORTFOLIO_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_portfolio_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_comment0,
            m_desc,
            m_entity,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_sys_date,
            m_h_traderid,
            m_label,
            m_ref_data
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_comment0,
                m_desc,
                m_entity,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_sys_date,
                m_h_traderid,
                m_label,
                m_ref_data
            FROM
                mx3.mxt_portfolio_rep_ext;

        dbms_output.put_line('MXT_PORTFOLIO_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_portfolio_rep;

    PROCEDURE update_mxt_refspot_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_REFSPOT_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_refspot_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_instrum,
            m_refspot,
            m__date_
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_instrum,
                m_refspot,
                m__date_
            FROM
                mx3.mxt_refspot_rep_ext;

        dbms_output.put_line('MXT_REFSPOT_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_refspot_rep;

    PROCEDURE update_mxt_rho_topo_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_RHO_TOPO_REP', 'MXT_RHO_TOPO_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_rho_topo_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_fx_rho_eu,
            m_h_ext_time,
            m_h_sys_date,
            m_instrumen,
            m_portfolio,
            m_ref_data,
            m_curve_ref,
            m_date,
            m_dated,
            m_fx_rhof_e,
            m_strategy,
            m_trade_num,
            m_typology
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_fx_rho_eu,
                m_h_ext_time,
                m_h_sys_date,
                m_instrumen,
                m_portfolio,
                m_ref_data,
                m_curve_ref,
                m_date,
                m_dated,
                m_fx_rhof_e,
                m_strategy,
                m_trade_num,
                m_typology
            FROM
                mx3.mxt_rho_topo_rep_ext;

        dbms_output.put_line('MXT_RHO_TOPO_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_rho_topo_rep;

    PROCEDURE update_mxt_si_static_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_SI_STATIC_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_si_static_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_aw_short,
            m_aw_swift,
            m_ben_acc,
            m_ben_short,
            m_ben_swift,
            m_code,
            m_currency,
            m_cust_acc,
            m_h_sys_date,
            m_int_short,
            m_int_swift,
            m_label,
            m_rec_short,
            m_rec_swift,
            m_ref,
            m_ref_data,
            m_set_method,
            m_stl_method
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_aw_short,
                m_aw_swift,
                m_ben_acc,
                m_ben_short,
                m_ben_swift,
                m_code,
                m_currency,
                m_cust_acc,
                m_h_sys_date,
                m_int_short,
                m_int_swift,
                m_label,
                m_rec_short,
                m_rec_swift,
                m_ref,
                m_ref_data,
                m_set_method,
                m_stl_method
            FROM
                mx3.mxt_si_static_rep_ext;

        dbms_output.put_line('MXT_SI_STATIC_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_si_static_rep;

    PROCEDURE update_mxt_smc_intraday_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_SMC_INTRADAY_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_smc_intraday_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_callask,
            m_callbid,
            m_fly,
            m_instrum,
            m_label,
            m_rr,
            m_strike
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_callask,
                m_callbid,
                m_fly,
                m_instrum,
                m_label,
                m_rr,
                m_strike
            FROM
                mx3.mxt_smc_intraday_rep_ext;

        dbms_output.put_line('MXT_SMC_INTRADAY_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_smc_intraday_rep;

    PROCEDURE update_mxt_tarf_data_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TARF_DATA_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_tarf_data_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_xexp,
            m_xedate,
            m_xexprbt,
            m_xfigur,
            m_xlow,
            m_xmid,
            m_xmultin,
            m_xschd,
            m_xsdate,
            m_xsetcur,
            m_xsettl,
            m_xshift,
            m_xtquot,
            m_xtstyle,
            m_xup,
            m_xarch,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs,
            m_contract,
            m_nb,
            m_pack_ref,
            m_pkg_org,
            m_pkg_vs,
            m_cmp_typo,
            m_xccyhol,
            m_xchr,
            m_xclr,
            m_xcp,
            m_xcrtarg,
            m_xcstrik,
            m_xcweigh,
            m_xdeliv
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_xexp,
                m_xedate,
                m_xexprbt,
                m_xfigur,
                m_xlow,
                m_xmid,
                m_xmultin,
                m_xschd,
                m_xsdate,
                m_xsetcur,
                m_xsettl,
                m_xshift,
                m_xtquot,
                m_xtstyle,
                m_xup,
                m_xarch,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs,
                m_contract,
                m_nb,
                m_pack_ref,
                m_pkg_org,
                m_pkg_vs,
                m_cmp_typo,
                m_xccyhol,
                m_xchr,
                m_xclr,
                m_xcp,
                m_xcrtarg,
                m_xcstrik,
                m_xcweigh,
                m_xdeliv
            FROM
                mx3.mxt_tarf_data_rep_ext;

        dbms_output.put_line('MXT_TARF_DATA_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_tarf_data_rep;

    PROCEDURE update_mxt_tarf_data_rep_iday AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TARF_DATA_REP_INTRADAY');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_tarf_data_rep_intraday (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_xexp,
            m_xedate,
            m_xexprbt,
            m_xfigur,
            m_xlow,
            m_xmid,
            m_xmultin,
            m_xschd,
            m_xsdate,
            m_xsetcur,
            m_xsettl,
            m_xshift,
            m_xtquot,
            m_xtstyle,
            m_xup,
            m_xarch,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs,
            m_contract,
            m_nb,
            m_pack_ref,
            m_pkg_org,
            m_pkg_vs,
            m_schedule,
            m_cmp_typo,
            m_xccyhol,
            m_xchr,
            m_xclr,
            m_xcp,
            m_xcrtarg,
            m_xcstrik,
            m_xcweigh,
            m_xdeliv
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_xexp,
                m_xedate,
                m_xexprbt,
                m_xfigur,
                m_xlow,
                m_xmid,
                m_xmultin,
                m_xschd,
                m_xsdate,
                m_xsetcur,
                m_xsettl,
                m_xshift,
                m_xtquot,
                m_xtstyle,
                m_xup,
                m_xarch,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs,
                m_contract,
                m_nb,
                m_pack_ref,
                m_pkg_org,
                m_pkg_vs,
                m_schedule,
                m_cmp_typo,
                m_xccyhol,
                m_xchr,
                m_xclr,
                m_xcp,
                m_xcrtarg,
                m_xcstrik,
                m_xcweigh,
                m_xdeliv
            FROM
                mx3.mxt_tarf_data_rep_intraday_ext;

        dbms_output.put_line('MXT_TARF_DATA_REP_INTRADAY: '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_tarf_data_rep_iday;

    PROCEDURE update_mxt_tarf_fixings_iday AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TARF_FIXINGS_REP_INTRADAY');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_tarf_fixings_rep_intraday (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_cnt_ver,
            m_nb,
            m_xfxvdat,
            m_pack_ref,
            m_pkg_ver,
            m_xlrg,
            m_xfxlevl,
            m_xhrg,
            m_xfxval,
            m_cmp_typo,
            m_pkg_orig,
            m_xfxdate,
            m_ref_data,
            m_cnt_typo,
            m_xfxpdat,
            m_xweight,
            m_contract,
            m_cnt_orig
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_cnt_ver,
                m_nb,
                m_xfxvdat,
                m_pack_ref,
                m_pkg_ver,
                m_xlrg,
                m_xfxlevl,
                m_xhrg,
                m_xfxval,
                m_cmp_typo,
                m_pkg_orig,
                m_xfxdate,
                m_ref_data,
                m_cnt_typo,
                m_xfxpdat,
                m_xweight,
                m_contract,
                m_cnt_orig
            FROM
                mx3.mxt_tarf_fixings_rep_iday_ext;

        dbms_output.put_line('MXT_TARF_FIXINGS_REP_INTRADAY '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_tarf_fixings_iday;

    PROCEDURE update_mxt_tarf_fixings_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TARF_FIXINGS_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_tarf_fixings_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_cnt_ver,
            m_nb,
            m_xfxvdat,
            m_pack_ref,
            m_pkg_ver,
            m_xlrg,
            m_xfxlevl,
            m_xhrg,
            m_xfxval,
            m_cmp_typo,
            m_pkg_orig,
            m_xfxdate,
            m_ref_data,
            m_cnt_typo,
            m_xfxpdat,
            m_xweight,
            m_contract,
            m_cnt_orig
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_cnt_ver,
                m_nb,
                m_xfxvdat,
                m_pack_ref,
                m_pkg_ver,
                m_xlrg,
                m_xfxlevl,
                m_xhrg,
                m_xfxval,
                m_cmp_typo,
                m_pkg_orig,
                m_xfxdate,
                m_ref_data,
                m_cnt_typo,
                m_xfxpdat,
                m_xweight,
                m_contract,
                m_cnt_orig
            FROM
                mx3.mxt_tarf_fixings_rep_ext;

        dbms_output.put_line('MXT_TARF_FIXINGS_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_tarf_fixings_rep;

    PROCEDURE update_mxt_topo_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TOPO_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_topo_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_level0,
            m_level1,
            m_lev_quot,
            m_mat0,
            m_mat1,
            m_portfolio,
            m_ref_data,
            m_user,
            m_vcurr,
            m_vega,
            m_view,
            m_dcurr,
            m_delta,
            m_gamma,
            m_gcurr,
            m_quantity
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_level0,
                m_level1,
                m_lev_quot,
                m_mat0,
                m_mat1,
                m_portfolio,
                m_ref_data,
                m_user,
                m_vcurr,
                m_vega,
                m_view,
                m_dcurr,
                m_delta,
                m_gamma,
                m_gcurr,
                m_quantity
            FROM
                mx3.mxt_topo_rep_ext;

        dbms_output.put_line('MXT_TOPO_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_topo_rep;

    PROCEDURE update_mxt_trade_audit_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_AUDIT_REP', 'MXT_TRADE_AUDIT_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_audit_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_time_zone,
            m_ref_data,
            m_cnt_typo,
            m_type,
            m_time_cmp,
            m_h_ext_date,
            m_action,
            m_usr_name,
            m_h_sys_date,
            m_act_com1,
            m_pkg_orig,
            m_pack_ref,
            m_pkg_ver,
            m_contract,
            m_date_cmp,
            m_usr_group,
            m_h_ext_time,
            m_act_nb2,
            m_date,
            m_act_com2,
            m_cnt_ver,
            m_h_ext_sec,
            m_act_com0,
            m_cmp_typo,
            m_act_nb1,
            m_act_nb0,
            m_cnt_orig
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_time_zone,
                m_ref_data,
                m_cnt_typo,
                m_type,
                m_time_cmp,
                m_h_ext_date,
                m_action,
                m_usr_name,
                m_h_sys_date,
                m_act_com1,
                m_pkg_orig,
                m_pack_ref,
                m_pkg_ver,
                m_contract,
                m_date_cmp,
                m_usr_group,
                m_h_ext_time,
                m_act_nb2,
                m_date,
                m_act_com2,
                m_cnt_ver,
                m_h_ext_sec,
                m_act_com0,
                m_cmp_typo,
                m_act_nb1,
                m_act_nb0,
                m_cnt_orig
            FROM
                mx3.mxt_trade_audit_rep_ext;

        dbms_output.put_line('MXT_TRADE_AUDIT_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_audit_rep;

    PROCEDURE update_mxt_trade_cs_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_CS_REP', 'MXT_TRADE_CS_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_cs_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_f_typelab0,
            m_f_typelab1,
            m_f_typelab2,
            m_f_typelab3,
            m_f_typelab4,
            m_f_typenb,
            m_f_value,
            m_h_event,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_f_amount,
            m_f_ctrp,
            m_f_currency,
            m_f_type,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_qty_index,
            m_tp_creator,
            m_tp_dtesys,
            m_tp_dtetrn,
            m_tp_entity,
            m_tp_initsd,
            m_tp_nblti,
            m_tp_pfolio,
            m_tp_timsys,
            m_tp_trntype,
            m_cmp_typo,
            m_cntlevtdt0,
            m_cntlevtdt1,
            m_cntlevtdt2,
            m_cnt_org,
            m_cnt_typo,
            m_ref_data,
            m_h_event_t,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_rnd_amt,
            m_h_sys_date,
            m_nb,
            m_package,
            m_tp_cntrp
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_f_typelab0,
                m_f_typelab1,
                m_f_typelab2,
                m_f_typelab3,
                m_f_typelab4,
                m_f_typenb,
                m_f_value,
                m_h_event,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_f_amount,
                m_f_ctrp,
                m_f_currency,
                m_f_type,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_qty_index,
                m_tp_creator,
                m_tp_dtesys,
                m_tp_dtetrn,
                m_tp_entity,
                m_tp_initsd,
                m_tp_nblti,
                m_tp_pfolio,
                m_tp_timsys,
                m_tp_trntype,
                m_cmp_typo,
                m_cntlevtdt0,
                m_cntlevtdt1,
                m_cntlevtdt2,
                m_cnt_org,
                m_cnt_typo,
                m_ref_data,
                m_h_event_t,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_rnd_amt,
                m_h_sys_date,
                m_nb,
                m_package,
                m_tp_cntrp
            FROM
                mx3.mxt_trade_cs_rep_ext;

        dbms_output.put_line('MXT_TRADE_CS_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_cs_rep;

    PROCEDURE update_mxt_trade_fix_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_FIX_REP', 'MXT_TRADE_FIX_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_fix_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_xg_fixwg1,
            m_xg_paymnt,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_tp_dtesys,
            m_tp_dtetrn,
            m_xg_fixed,
            m_xg_fixing,
            m_xg_fixkey,
            m_xg_fixpdt,
            m_xg_fixrt1,
            m_h_event,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_sys_date,
            m_nb,
            m_package,
            m_pkg_org,
            m_ref_data,
            m_cmp_typo,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_xg_fixwg1,
                m_xg_paymnt,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_tp_dtesys,
                m_tp_dtetrn,
                m_xg_fixed,
                m_xg_fixing,
                m_xg_fixkey,
                m_xg_fixpdt,
                m_xg_fixrt1,
                m_h_event,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_sys_date,
                m_nb,
                m_package,
                m_pkg_org,
                m_ref_data,
                m_cmp_typo,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract
            FROM
                mx3.mxt_trade_fix_rep_ext;

        dbms_output.put_line('MXT_TRADE_FIX_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_fix_rep;

    PROCEDURE update_mxt_trade_intr_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_INTR_REP', 'MXT_TRADE_INTR_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_intr_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_h_dte_amd,
            m_h_event,
            m_h_event_t,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_mop_st,
            m_h_mrplflag,
            m_h_mrpl_onb,
            m_tp_smrte,
            m_tp_sptfwd,
            m_tp_stat32,
            m_tp_strike,
            m_tp_striken,
            m_tp_strtgy,
            m_tp_timsys,
            m_tp_trader,
            m_tp_uqty,
            m_tp_uqtyeq,
            m_trn_fmly,
            m_ref_data,
            m_cmp_typo,
            m_tp_fxqtorf,
            m_tp_fxqtorn,
            m_tp_fxrtchd,
            m_tp_fxstden,
            m_tp_fxstff,
            m_tp_fxstnum,
            m_tp_fxswp,
            m_tp_fxund,
            m_tp_fxust,
            m_tp_fxustde,
            m_tp_dsctype,
            m_tp_dteexp,
            m_tp_dtefxgf,
            m_tp_dtefxgl,
            m_tp_dtelbl,
            m_tp_dtepmt,
            m_tp_dtesys,
            m_tp_dtetrn,
            m_tp_dteund,
            m_trn_grp,
            m_trn_type,
            m_tp_fxbrrd,
            m_tp_fxbrrff,
            m_tp_fxbrrn,
            m_tp_fxbrwed,
            m_tp_fxbrwsd,
            m_tp_fxcpcur,
            m_tp_fxqtocu,
            m_tp_fxqtor,
            m_tp_fxqtord,
            m_tp_rtdpc02,
            m_tp_rtfv0,
            m_tp_rtmcnv0,
            m_tp_rtmrte0,
            m_tp_rtpr0,
            m_tp_rtvlc00,
            m_tp_rtvlc01,
            m_tp_rtvlc02,
            m_tp_smamt,
            m_tp_smcur,
            m_tp_feecur2,
            m_tp_feecur3,
            m_tp_feesrc0,
            m_tp_feesrc1,
            m_tp_feesrc2,
            m_tp_feesrc3,
            m_tp_feetyp0,
            m_tp_feetyp1,
            m_tp_feetyp2,
            m_tp_feetyp3,
            m_tp_fxbase,
            m_tp_cntrp,
            m_tp_cp,
            m_tp_creator,
            m_tp_cutoff,
            m_tp_digpay,
            m_tp_digpayc,
            m_tp_dscexo,
            m_tp_dscexo0,
            m_tp_dscexo1,
            m_tp_dscexo2,
            m_qty_index,
            m_tp_ae,
            m_tp_broker0,
            m_tp_broker1,
            m_tp_broker2,
            m_tp_broker3,
            m_tp_buy,
            m_tp_client,
            m_h_sys_date,
            m_instrument,
            m_mrpl_date,
            m_mrpl_onb,
            m_nb,
            m_package,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_h_comment1,
            m_h_comment2,
            m_h_comment3,
            m_tp_prcdff,
            m_tp_prcdnum,
            m_tp_price,
            m_tp_priced,
            m_tp_pricedn,
            m_tp_qtyeq,
            m_tp_rtamc00,
            m_tp_rtamc01,
            m_tp_rtamc02,
            m_tp_rtbuy,
            m_tp_rtcap0,
            m_tp_rtcur0,
            m_tp_rtdcc00,
            m_tp_rtdcc01,
            m_tp_rtdcc02,
            m_tp_rtdkc00,
            m_tp_rtdkc01,
            m_tp_rtdkc02,
            m_tp_rtdpc00,
            m_tp_rtdpc01,
            m_tp_fxustff,
            m_tp_fxustnu,
            m_tp_initsd,
            m_tp_int,
            m_tp_ipay,
            m_tp_ipaycur,
            m_tp_ipaydte,
            m_tp_iqty,
            m_tp_mktndx,
            m_tp_moplst,
            m_tp_moplstd,
            m_tp_moplstl,
            m_tp_nblti,
            m_tp_nomcur,
            m_tp_obar1,
            m_tp_obar2,
            m_tp_obarrb1,
            m_tp_obarrb2,
            m_tp_obartyp,
            m_tp_pfolio,
            m_tp_prcdden,
            m_tp_dteundd,
            m_tp_dvcs,
            m_tp_entity,
            m_tp_fee0,
            m_tp_fee1,
            m_tp_fee2,
            m_tp_fee3,
            m_tp_feecur0,
            m_tp_feecur1
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_h_dte_amd,
                m_h_event,
                m_h_event_t,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_mop_st,
                m_h_mrplflag,
                m_h_mrpl_onb,
                m_tp_smrte,
                m_tp_sptfwd,
                m_tp_stat32,
                m_tp_strike,
                m_tp_striken,
                m_tp_strtgy,
                m_tp_timsys,
                m_tp_trader,
                m_tp_uqty,
                m_tp_uqtyeq,
                m_trn_fmly,
                m_ref_data,
                m_cmp_typo,
                m_tp_fxqtorf,
                m_tp_fxqtorn,
                m_tp_fxrtchd,
                m_tp_fxstden,
                m_tp_fxstff,
                m_tp_fxstnum,
                m_tp_fxswp,
                m_tp_fxund,
                m_tp_fxust,
                m_tp_fxustde,
                m_tp_dsctype,
                m_tp_dteexp,
                m_tp_dtefxgf,
                m_tp_dtefxgl,
                m_tp_dtelbl,
                m_tp_dtepmt,
                m_tp_dtesys,
                m_tp_dtetrn,
                m_tp_dteund,
                m_trn_grp,
                m_trn_type,
                m_tp_fxbrrd,
                m_tp_fxbrrff,
                m_tp_fxbrrn,
                m_tp_fxbrwed,
                m_tp_fxbrwsd,
                m_tp_fxcpcur,
                m_tp_fxqtocu,
                m_tp_fxqtor,
                m_tp_fxqtord,
                m_tp_rtdpc02,
                m_tp_rtfv0,
                m_tp_rtmcnv0,
                m_tp_rtmrte0,
                m_tp_rtpr0,
                m_tp_rtvlc00,
                m_tp_rtvlc01,
                m_tp_rtvlc02,
                m_tp_smamt,
                m_tp_smcur,
                m_tp_feecur2,
                m_tp_feecur3,
                m_tp_feesrc0,
                m_tp_feesrc1,
                m_tp_feesrc2,
                m_tp_feesrc3,
                m_tp_feetyp0,
                m_tp_feetyp1,
                m_tp_feetyp2,
                m_tp_feetyp3,
                m_tp_fxbase,
                m_tp_cntrp,
                m_tp_cp,
                m_tp_creator,
                m_tp_cutoff,
                m_tp_digpay,
                m_tp_digpayc,
                m_tp_dscexo,
                m_tp_dscexo0,
                m_tp_dscexo1,
                m_tp_dscexo2,
                m_qty_index,
                m_tp_ae,
                m_tp_broker0,
                m_tp_broker1,
                m_tp_broker2,
                m_tp_broker3,
                m_tp_buy,
                m_tp_client,
                m_h_sys_date,
                m_instrument,
                m_mrpl_date,
                m_mrpl_onb,
                m_nb,
                m_package,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_h_comment1,
                m_h_comment2,
                m_h_comment3,
                m_tp_prcdff,
                m_tp_prcdnum,
                m_tp_price,
                m_tp_priced,
                m_tp_pricedn,
                m_tp_qtyeq,
                m_tp_rtamc00,
                m_tp_rtamc01,
                m_tp_rtamc02,
                m_tp_rtbuy,
                m_tp_rtcap0,
                m_tp_rtcur0,
                m_tp_rtdcc00,
                m_tp_rtdcc01,
                m_tp_rtdcc02,
                m_tp_rtdkc00,
                m_tp_rtdkc01,
                m_tp_rtdkc02,
                m_tp_rtdpc00,
                m_tp_rtdpc01,
                m_tp_fxustff,
                m_tp_fxustnu,
                m_tp_initsd,
                m_tp_int,
                m_tp_ipay,
                m_tp_ipaycur,
                m_tp_ipaydte,
                m_tp_iqty,
                m_tp_mktndx,
                m_tp_moplst,
                m_tp_moplstd,
                m_tp_moplstl,
                m_tp_nblti,
                m_tp_nomcur,
                m_tp_obar1,
                m_tp_obar2,
                m_tp_obarrb1,
                m_tp_obarrb2,
                m_tp_obartyp,
                m_tp_pfolio,
                m_tp_prcdden,
                m_tp_dteundd,
                m_tp_dvcs,
                m_tp_entity,
                m_tp_fee0,
                m_tp_fee1,
                m_tp_fee2,
                m_tp_fee3,
                m_tp_feecur0,
                m_tp_feecur1
            FROM
                mx3.mxt_trade_intr_rep_ext;

        dbms_output.put_line('MXT_TRADE_INTR_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_intr_rep;

    PROCEDURE update_mxt_trade_pay_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_PAY_REP', 'MXT_TRADE_PAY_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_pay_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_df_qty,
            m_df_vdate,
            m_df_type0,
            m_df_ttypo,
            m_df_status,
            m_df_tparty,
            m_df_rev,
            m_df_type3,
            m_df_cref,
            m_df_pr,
            m_df_ent,
            m_df_cntver,
            m_df_date,
            m_df_type1,
            m_df_trdref,
            m_ref_data,
            m_dc_rndqty,
            m_df_evtcl,
            m_df_ttype,
            m_df_type4,
            m_df_type2,
            m_df_ldate,
            m_df_ocntref,
            m_df_cmpdate,
            m_df_adate,
            m_df_cntref,
            m_dc_cur,
            m_df_ptf
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_df_qty,
                m_df_vdate,
                m_df_type0,
                m_df_ttypo,
                m_df_status,
                m_df_tparty,
                m_df_rev,
                m_df_type3,
                m_df_cref,
                m_df_pr,
                m_df_ent,
                m_df_cntver,
                m_df_date,
                m_df_type1,
                m_df_trdref,
                m_ref_data,
                m_dc_rndqty,
                m_df_evtcl,
                m_df_ttype,
                m_df_type4,
                m_df_type2,
                m_df_ldate,
                m_df_ocntref,
                m_df_cmpdate,
                m_df_adate,
                m_df_cntref,
                m_dc_cur,
                m_df_ptf
            FROM
                mx3.mxt_trade_pay_rep_ext;

        dbms_output.put_line('MXT_TRADE_PAY_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_pay_rep;

    PROCEDURE update_mxt_trade_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_REP', 'MXT_TRADE_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_tp_ipaycv,
            m_tp_ipaycvc,
            m_tp_ipaydte,
            m_tp_iqty,
            m_tp_lqty2,
            m_tp_mktndx,
            m_tp_dscexo0,
            m_tp_dscexo1,
            m_tp_dscexo2,
            m_tp_dsctype,
            m_tp_dteexp,
            m_tp_dtefxgf,
            m_tp_feesrc2,
            m_tp_feesrc3,
            m_tp_feetyp0,
            m_tp_feetyp1,
            m_tp_feetyp2,
            m_tp_feetyp3,
            m_tp_strtgy,
            m_tp_timsys,
            m_tp_trader,
            m_tp_uqty,
            m_tp_uqtyeq,
            m_trn_fmly,
            m_trn_grp,
            m_trn_type,
            m_tp_moplst,
            m_tp_moplstd,
            m_tp_moplstl,
            m_tp_nblti,
            m_tp_nomcur,
            m_tp_obar1,
            m_tp_obar2,
            m_tp_prcdnum,
            m_tp_fxqtocu,
            m_tp_fxqtor,
            m_tp_fxqtord,
            m_tp_fxqtorf,
            m_tp_fxqtorn,
            m_tp_fxrtchd,
            m_tp_fxustff,
            m_tp_fxustnu,
            m_tp_initsd,
            m_tp_int,
            m_tp_ipay,
            m_tp_ipaycur,
            m_h_sys_date,
            m_instrument,
            m_nb,
            m_package,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_qty_index,
            m_tp_ae,
            m_tp_broker0,
            m_tp_dvcs,
            m_tp_entity,
            m_tp_fee0,
            m_tp_fee1,
            m_tp_fee2,
            m_tp_fee3,
            m_tp_cp,
            m_tp_creator,
            m_tp_cutoff,
            m_tp_digpay,
            m_tp_digpayc,
            m_tp_dscexo,
            m_tp_dtefxgl,
            m_tp_dtelbl,
            m_tp_dtepmt,
            m_tp_dtesys,
            m_tp_dtetrn,
            m_tp_dteund,
            m_tp_dteundd,
            m_tp_obarrb1,
            m_tp_obarrb2,
            m_tp_obartyp,
            m_tp_pfolio,
            m_tp_prcdden,
            m_tp_prcdff,
            m_ref_data,
            m_tp_fxbase,
            m_tp_fxbrrd,
            m_tp_fxbrrff,
            m_tp_fxbrrn,
            m_tp_fxbrwed,
            m_tp_fxbrwsd,
            m_tp_fxcpcur,
            m_tp_broker1,
            m_tp_broker2,
            m_tp_broker3,
            m_tp_buy,
            m_tp_client,
            m_tp_cntrp,
            m_tp_rtdcc02,
            m_tp_rtdkc00,
            m_tp_rtdkc01,
            m_tp_rtdkc02,
            m_tp_rtdpc00,
            m_tp_rtdpc01,
            m_tp_rtdpc02,
            m_tp_price,
            m_tp_priced,
            m_tp_pricedn,
            m_tp_qtyeq,
            m_tp_rtamc00,
            m_tp_rtamc01,
            m_tp_rtfv0,
            m_tp_rtmcnv0,
            m_tp_rtmrte0,
            m_tp_rtpr0,
            m_tp_rtvlc00,
            m_tp_rtvlc01,
            m_tp_rtvlc02,
            m_wwr,
            m_xamount,
            m_xcstrike,
            m_xc_p,
            m_xdeliv,
            m_xexp,
            m_xorig_amt,
            m_tp_smamt,
            m_tp_smcur,
            m_tp_smrte,
            m_tp_sptfwd,
            m_tp_stat32,
            m_tp_strike,
            m_tp_striken,
            m_tp_fxstden,
            m_tp_fxstff,
            m_tp_fxstnum,
            m_tp_fxswp,
            m_tp_fxund,
            m_tp_fxust,
            m_tp_fxustde,
            m_tp_feecur0,
            m_tp_feecur1,
            m_tp_feecur2,
            m_tp_feecur3,
            m_tp_feesrc0,
            m_tp_feesrc1,
            m_xpaymth,
            m_xpoptfpric,
            m_xrisk_quot,
            m_h_event_t,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_mop_st,
            m_tp_rtamc02,
            m_tp_rtbuy,
            m_tp_rtcap0,
            m_tp_rtcur0,
            m_tp_rtdcc00,
            m_tp_rtdcc01,
            m_cmp_typo,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_h_comment1,
            m_h_comment2,
            m_h_comment3,
            m_h_event,
            m_x_dscexo0,
            m_h_broker
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_tp_ipaycv,
                m_tp_ipaycvc,
                m_tp_ipaydte,
                m_tp_iqty,
                m_tp_lqty2,
                m_tp_mktndx,
                m_tp_dscexo0,
                m_tp_dscexo1,
                m_tp_dscexo2,
                m_tp_dsctype,
                m_tp_dteexp,
                m_tp_dtefxgf,
                m_tp_feesrc2,
                m_tp_feesrc3,
                m_tp_feetyp0,
                m_tp_feetyp1,
                m_tp_feetyp2,
                m_tp_feetyp3,
                m_tp_strtgy,
                m_tp_timsys,
                m_tp_trader,
                m_tp_uqty,
                m_tp_uqtyeq,
                m_trn_fmly,
                m_trn_grp,
                m_trn_type,
                m_tp_moplst,
                m_tp_moplstd,
                m_tp_moplstl,
                m_tp_nblti,
                m_tp_nomcur,
                m_tp_obar1,
                m_tp_obar2,
                m_tp_prcdnum,
                m_tp_fxqtocu,
                m_tp_fxqtor,
                m_tp_fxqtord,
                m_tp_fxqtorf,
                m_tp_fxqtorn,
                m_tp_fxrtchd,
                m_tp_fxustff,
                m_tp_fxustnu,
                m_tp_initsd,
                m_tp_int,
                m_tp_ipay,
                m_tp_ipaycur,
                m_h_sys_date,
                m_instrument,
                m_nb,
                m_package,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_qty_index,
                m_tp_ae,
                m_tp_broker0,
                m_tp_dvcs,
                m_tp_entity,
                m_tp_fee0,
                m_tp_fee1,
                m_tp_fee2,
                m_tp_fee3,
                m_tp_cp,
                m_tp_creator,
                m_tp_cutoff,
                m_tp_digpay,
                m_tp_digpayc,
                m_tp_dscexo,
                m_tp_dtefxgl,
                m_tp_dtelbl,
                m_tp_dtepmt,
                m_tp_dtesys,
                m_tp_dtetrn,
                m_tp_dteund,
                m_tp_dteundd,
                m_tp_obarrb1,
                m_tp_obarrb2,
                m_tp_obartyp,
                m_tp_pfolio,
                m_tp_prcdden,
                m_tp_prcdff,
                m_ref_data,
                m_tp_fxbase,
                m_tp_fxbrrd,
                m_tp_fxbrrff,
                m_tp_fxbrrn,
                m_tp_fxbrwed,
                m_tp_fxbrwsd,
                m_tp_fxcpcur,
                m_tp_broker1,
                m_tp_broker2,
                m_tp_broker3,
                m_tp_buy,
                m_tp_client,
                m_tp_cntrp,
                m_tp_rtdcc02,
                m_tp_rtdkc00,
                m_tp_rtdkc01,
                m_tp_rtdkc02,
                m_tp_rtdpc00,
                m_tp_rtdpc01,
                m_tp_rtdpc02,
                m_tp_price,
                m_tp_priced,
                m_tp_pricedn,
                m_tp_qtyeq,
                m_tp_rtamc00,
                m_tp_rtamc01,
                m_tp_rtfv0,
                m_tp_rtmcnv0,
                m_tp_rtmrte0,
                m_tp_rtpr0,
                m_tp_rtvlc00,
                m_tp_rtvlc01,
                m_tp_rtvlc02,
                m_wwr,
                m_xamount,
                m_xcstrike,
                m_xc_p,
                m_xdeliv,
                m_xexp,
                m_xorig_amt,
                m_tp_smamt,
                m_tp_smcur,
                m_tp_smrte,
                m_tp_sptfwd,
                m_tp_stat32,
                m_tp_strike,
                m_tp_striken,
                m_tp_fxstden,
                m_tp_fxstff,
                m_tp_fxstnum,
                m_tp_fxswp,
                m_tp_fxund,
                m_tp_fxust,
                m_tp_fxustde,
                m_tp_feecur0,
                m_tp_feecur1,
                m_tp_feecur2,
                m_tp_feecur3,
                m_tp_feesrc0,
                m_tp_feesrc1,
                m_xpaymth,
                m_xpoptfpric,
                m_xrisk_quot,
                m_h_event_t,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_mop_st,
                m_tp_rtamc02,
                m_tp_rtbuy,
                m_tp_rtcap0,
                m_tp_rtcur0,
                m_tp_rtdcc00,
                m_tp_rtdcc01,
                m_cmp_typo,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_h_comment1,
                m_h_comment2,
                m_h_comment3,
                m_h_event,
                m_x_dscexo0,
                m_h_broker
            FROM
                mx3.mxt_trade_rep_ext;

        dbms_output.put_line('MXT_TRADE_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_rep;

    PROCEDURE update_mxt_trade_rep_intraday AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_REP_INTRADAY', 'MXT_TRADE_REP_INTRADAY_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_rep_intraday (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_tp_ipaycv,
            m_tp_ipaycvc,
            m_tp_ipaydte,
            m_tp_iqty,
            m_tp_lqty2,
            m_tp_mktndx,
            m_tp_dscexo0,
            m_tp_dscexo1,
            m_tp_dscexo2,
            m_tp_dsctype,
            m_tp_dteexp,
            m_tp_dtefxgf,
            m_tp_feesrc2,
            m_tp_feesrc3,
            m_tp_feetyp0,
            m_tp_feetyp1,
            m_tp_feetyp2,
            m_tp_feetyp3,
            m_tp_strtgy,
            m_tp_timsys,
            m_tp_trader,
            m_tp_uqty,
            m_tp_uqtyeq,
            m_trn_fmly,
            m_trn_grp,
            m_trn_type,
            m_tp_moplst,
            m_tp_moplstd,
            m_tp_moplstl,
            m_tp_nblti,
            m_tp_nomcur,
            m_tp_obar1,
            m_tp_obar2,
            m_tp_prcdnum,
            m_tp_fxqtocu,
            m_tp_fxqtor,
            m_tp_fxqtord,
            m_tp_fxqtorf,
            m_tp_fxqtorn,
            m_tp_fxrtchd,
            m_tp_fxustff,
            m_tp_fxustnu,
            m_tp_initsd,
            m_tp_int,
            m_tp_ipay,
            m_tp_ipaycur,
            m_h_sys_date,
            m_instrument,
            m_nb,
            m_package,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_qty_index,
            m_tp_ae,
            m_tp_broker0,
            m_tp_dvcs,
            m_tp_entity,
            m_tp_fee0,
            m_tp_fee1,
            m_tp_fee2,
            m_tp_fee3,
            m_tp_cp,
            m_tp_creator,
            m_tp_cutoff,
            m_tp_digpay,
            m_tp_digpayc,
            m_tp_dscexo,
            m_tp_dtefxgl,
            m_tp_dtelbl,
            m_tp_dtepmt,
            m_tp_dtesys,
            m_tp_dtetrn,
            m_tp_dteund,
            m_tp_dteundd,
            m_tp_obarrb1,
            m_tp_obarrb2,
            m_tp_obartyp,
            m_tp_pfolio,
            m_tp_prcdden,
            m_tp_prcdff,
            m_ref_data,
            m_tp_fxbase,
            m_tp_fxbrrd,
            m_tp_fxbrrff,
            m_tp_fxbrrn,
            m_tp_fxbrwed,
            m_tp_fxbrwsd,
            m_tp_fxcpcur,
            m_tp_broker1,
            m_tp_broker2,
            m_tp_broker3,
            m_tp_buy,
            m_tp_client,
            m_tp_cntrp,
            m_tp_rtdcc02,
            m_tp_rtdkc00,
            m_tp_rtdkc01,
            m_tp_rtdkc02,
            m_tp_rtdpc00,
            m_tp_rtdpc01,
            m_tp_rtdpc02,
            m_tp_price,
            m_tp_priced,
            m_tp_pricedn,
            m_tp_qtyeq,
            m_tp_rtamc00,
            m_tp_rtamc01,
            m_tp_rtfv0,
            m_tp_rtmcnv0,
            m_tp_rtmrte0,
            m_tp_rtpr0,
            m_tp_rtvlc00,
            m_tp_rtvlc01,
            m_tp_rtvlc02,
            m_wwr,
            m_xamount,
            m_xcstrike,
            m_xc_p,
            m_xdeliv,
            m_xexp,
            m_xorig_amt,
            m_tp_smamt,
            m_tp_smcur,
            m_tp_smrte,
            m_tp_sptfwd,
            m_tp_stat32,
            m_tp_strike,
            m_tp_striken,
            m_tp_fxstden,
            m_tp_fxstff,
            m_tp_fxstnum,
            m_tp_fxswp,
            m_tp_fxund,
            m_tp_fxust,
            m_tp_fxustde,
            m_tp_feecur0,
            m_tp_feecur1,
            m_tp_feecur2,
            m_tp_feecur3,
            m_tp_feesrc0,
            m_tp_feesrc1,
            m_xpaymth,
            m_xpoptfpric,
            m_xrisk_quot,
            m_h_event_t,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_mop_st,
            m_tp_rtamc02,
            m_tp_rtbuy,
            m_tp_rtcap0,
            m_tp_rtcur0,
            m_tp_rtdcc00,
            m_tp_rtdcc01,
            m_cmp_typo,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_h_comment1,
            m_h_comment2,
            m_h_comment3,
            m_h_event,
            m_x_dscexo0,
            m_h_broker,
            m_tp_tsd
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_tp_ipaycv,
                m_tp_ipaycvc,
                m_tp_ipaydte,
                m_tp_iqty,
                m_tp_lqty2,
                m_tp_mktndx,
                m_tp_dscexo0,
                m_tp_dscexo1,
                m_tp_dscexo2,
                m_tp_dsctype,
                m_tp_dteexp,
                m_tp_dtefxgf,
                m_tp_feesrc2,
                m_tp_feesrc3,
                m_tp_feetyp0,
                m_tp_feetyp1,
                m_tp_feetyp2,
                m_tp_feetyp3,
                m_tp_strtgy,
                m_tp_timsys,
                m_tp_trader,
                m_tp_uqty,
                m_tp_uqtyeq,
                m_trn_fmly,
                m_trn_grp,
                m_trn_type,
                m_tp_moplst,
                m_tp_moplstd,
                m_tp_moplstl,
                m_tp_nblti,
                m_tp_nomcur,
                m_tp_obar1,
                m_tp_obar2,
                m_tp_prcdnum,
                m_tp_fxqtocu,
                m_tp_fxqtor,
                m_tp_fxqtord,
                m_tp_fxqtorf,
                m_tp_fxqtorn,
                m_tp_fxrtchd,
                m_tp_fxustff,
                m_tp_fxustnu,
                m_tp_initsd,
                m_tp_int,
                m_tp_ipay,
                m_tp_ipaycur,
                m_h_sys_date,
                m_instrument,
                m_nb,
                m_package,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_qty_index,
                m_tp_ae,
                m_tp_broker0,
                m_tp_dvcs,
                m_tp_entity,
                m_tp_fee0,
                m_tp_fee1,
                m_tp_fee2,
                m_tp_fee3,
                m_tp_cp,
                m_tp_creator,
                m_tp_cutoff,
                m_tp_digpay,
                m_tp_digpayc,
                m_tp_dscexo,
                m_tp_dtefxgl,
                m_tp_dtelbl,
                m_tp_dtepmt,
                m_tp_dtesys,
                m_tp_dtetrn,
                m_tp_dteund,
                m_tp_dteundd,
                m_tp_obarrb1,
                m_tp_obarrb2,
                m_tp_obartyp,
                m_tp_pfolio,
                m_tp_prcdden,
                m_tp_prcdff,
                m_ref_data,
                m_tp_fxbase,
                m_tp_fxbrrd,
                m_tp_fxbrrff,
                m_tp_fxbrrn,
                m_tp_fxbrwed,
                m_tp_fxbrwsd,
                m_tp_fxcpcur,
                m_tp_broker1,
                m_tp_broker2,
                m_tp_broker3,
                m_tp_buy,
                m_tp_client,
                m_tp_cntrp,
                m_tp_rtdcc02,
                m_tp_rtdkc00,
                m_tp_rtdkc01,
                m_tp_rtdkc02,
                m_tp_rtdpc00,
                m_tp_rtdpc01,
                m_tp_rtdpc02,
                m_tp_price,
                m_tp_priced,
                m_tp_pricedn,
                m_tp_qtyeq,
                m_tp_rtamc00,
                m_tp_rtamc01,
                m_tp_rtfv0,
                m_tp_rtmcnv0,
                m_tp_rtmrte0,
                m_tp_rtpr0,
                m_tp_rtvlc00,
                m_tp_rtvlc01,
                m_tp_rtvlc02,
                m_wwr,
                m_xamount,
                m_xcstrike,
                m_xc_p,
                m_xdeliv,
                m_xexp,
                m_xorig_amt,
                m_tp_smamt,
                m_tp_smcur,
                m_tp_smrte,
                m_tp_sptfwd,
                m_tp_stat32,
                m_tp_strike,
                m_tp_striken,
                m_tp_fxstden,
                m_tp_fxstff,
                m_tp_fxstnum,
                m_tp_fxswp,
                m_tp_fxund,
                m_tp_fxust,
                m_tp_fxustde,
                m_tp_feecur0,
                m_tp_feecur1,
                m_tp_feecur2,
                m_tp_feecur3,
                m_tp_feesrc0,
                m_tp_feesrc1,
                m_xpaymth,
                m_xpoptfpric,
                m_xrisk_quot,
                m_h_event_t,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_mop_st,
                m_tp_rtamc02,
                m_tp_rtbuy,
                m_tp_rtcap0,
                m_tp_rtcur0,
                m_tp_rtdcc00,
                m_tp_rtdcc01,
                m_cmp_typo,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_h_comment1,
                m_h_comment2,
                m_h_comment3,
                m_h_event,
                m_x_dscexo0,
                m_h_broker,
                m_tp_tsd
            FROM
                mx3.mxt_trade_rep_intraday_ext;

        dbms_output.put_line('MXT_TRADE_REP_INTRADAY '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_rep_intraday;

    PROCEDURE update_mxt_trade_si_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_TRADE_SI_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_si_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_h_sys_date,
            m_aw_short,
            m_cnt_orig,
            m_cnt_ver,
            m_charges,
            m_ben_acc,
            m_flow_id,
            m_int_swift,
            m_pkg_ver,
            m_cmp_typo,
            m_ben_swift,
            m_value_date,
            m_trn_id,
            m_ref,
            m_reference,
            m_ref_data,
            m_cnt_typo,
            m_send_short,
            m_aw_swift,
            m_set_method,
            m_rec_swift,
            m_rec_short,
            m_ben_short,
            m_send_swift,
            m_send_acc,
            m_cust_acc,
            m_pack_ref,
            m_pkg_orig,
            m_int_short
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_h_sys_date,
                m_aw_short,
                m_cnt_orig,
                m_cnt_ver,
                m_charges,
                m_ben_acc,
                m_flow_id,
                m_int_swift,
                m_pkg_ver,
                m_cmp_typo,
                m_ben_swift,
                m_value_date,
                m_trn_id,
                m_ref,
                m_reference,
                m_ref_data,
                m_cnt_typo,
                m_send_short,
                m_aw_swift,
                m_set_method,
                m_rec_swift,
                m_rec_short,
                m_ben_short,
                m_send_swift,
                m_send_acc,
                m_cust_acc,
                m_pack_ref,
                m_pkg_orig,
                m_int_short
            FROM
                mx3.mxt_trade_si_rep_ext;

        dbms_output.put_line('MXT_TRADE_SI_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_si_rep;

    PROCEDURE update_mxt_trade_ts_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_TRADE_TS_REP', 'MXT_TRADE_TS_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_trade_ts_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_cmp_typo,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs2,
            m_contract,
            m_c_cur_pl,
            m_h_ext_date,
            m_h_ext_sec,
            m_h_ext_time,
            m_h_mp_spcv0,
            m_h_sys_date,
            m_h_trn_sec,
            m_nb,
            m_package,
            m_pkg_org,
            m_pkg_vs2,
            m_pl_fmv2,
            m_pl_fpfcp2,
            m_pl_fpnfcp2,
            m_pl_nfmv2,
            m_qty_index,
            m_s_delta2,
            m_tp_dtetrn,
            m_tp_initsd,
            m_ref_data,
            m_tp_ipay,
            m_tp_ipaycur,
            m_tp_timsys
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_cmp_typo,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs2,
                m_contract,
                m_c_cur_pl,
                m_h_ext_date,
                m_h_ext_sec,
                m_h_ext_time,
                m_h_mp_spcv0,
                m_h_sys_date,
                m_h_trn_sec,
                m_nb,
                m_package,
                m_pkg_org,
                m_pkg_vs2,
                m_pl_fmv2,
                m_pl_fpfcp2,
                m_pl_fpnfcp2,
                m_pl_nfmv2,
                m_qty_index,
                m_s_delta2,
                m_tp_dtetrn,
                m_tp_initsd,
                m_ref_data,
                m_tp_ipay,
                m_tp_ipaycur,
                m_tp_timsys
            FROM
                mx3.mxt_trade_ts_rep_ext;

        dbms_output.put_line('MXT_TRADE_TS_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_trade_ts_rep;

    PROCEDURE update_mxt_user_group_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_USER_GROUP_REP', 'MXT_USER_GROUP_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_user_group_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_group,
            m_ref_data,
            m_h_sys_date,
            m_h_ext_time,
            m_timestamp_,
            m_h_ext_date,
            m_user
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_group,
                m_ref_data,
                m_h_sys_date,
                m_h_ext_time,
                m_timestamp_,
                m_h_ext_date,
                m_user
            FROM
                mx3.mxt_user_group_rep_ext;

        dbms_output.put_line('MXT_USER_GROUP_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_user_group_rep;

    PROCEDURE update_mxt_var_mktop_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_VAR_MKTOP_REP', 'MXT_VAR_MKTOP_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_var_mktop_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_cmp_typo,
            m_cntcevtcl,
            m_cntlevtld2,
            m_cnt_org,
            m_cnt_typo,
            m_cnt_vs0,
            m_cnt_vs1,
            m_cnt_vs2,
            m_contract,
            m_h_mk_bocnf,
            m_h_mk_bosgn,
            m_h_mk_type,
            m_h_mopcrtd,
            m_h_mopcrtl,
            m_h_mrplflag,
            m_h_mrpl_onb,
            m_ref_data,
            m_qty_index,
            m_tp_cntrp,
            m_tp_int,
            m_tp_iqty,
            m_tp_lqty0,
            m_tp_lqty1,
            m_tp_lqty2,
            m_tp_mopcrt,
            m_tp_mopcrtd,
            m_tp_mopcrtl,
            m_tp_mopcrts,
            m_tp_moplst,
            m_tp_moplstd,
            m_tp_moplstl,
            m_tp_pfolio,
            m_tp_stat32,
            m_tp_status2,
            m_tp_timsys,
            m_instrument,
            m_mk_bocmt,
            m_mk_bocnf,
            m_mk_bosgn,
            m_mk_brother,
            m_mk_clpr0,
            m_mk_clpr1,
            m_mk_clpr2,
            m_mk_dest,
            m_mk_dte,
            m_mk_dteacc,
            m_mk_level,
            m_mk_nb,
            m_mk_origin,
            m_mk_plcur,
            m_mk_qty,
            m_mk_stlamt,
            m_mk_stlcur,
            m_mk_stldte,
            m_mk_stlprc,
            m_mk_subtype,
            m_mk_time,
            m_mk_type,
            m_mrpl_date,
            m_mrpl_flag,
            m_mrpl_onb,
            m_nb,
            m_package,
            m_pkg_org,
            m_pkg_vs0,
            m_pkg_vs1,
            m_pkg_vs2,
            m_pl_cur,
            m_v_actor,
            m_v_brother,
            m_v_cnt_dest,
            m_v_cnt_src,
            m_v_date,
            m_v_evstlamt,
            m_v_evstlcur,
            m_v_evstldte,
            m_v_evt_ref,
            m_v_impqty,
            m_v_tsd,
            m_v_tsh
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_cmp_typo,
                m_cntcevtcl,
                m_cntlevtld2,
                m_cnt_org,
                m_cnt_typo,
                m_cnt_vs0,
                m_cnt_vs1,
                m_cnt_vs2,
                m_contract,
                m_h_mk_bocnf,
                m_h_mk_bosgn,
                m_h_mk_type,
                m_h_mopcrtd,
                m_h_mopcrtl,
                m_h_mrplflag,
                m_h_mrpl_onb,
                m_ref_data,
                m_qty_index,
                m_tp_cntrp,
                m_tp_int,
                m_tp_iqty,
                m_tp_lqty0,
                m_tp_lqty1,
                m_tp_lqty2,
                m_tp_mopcrt,
                m_tp_mopcrtd,
                m_tp_mopcrtl,
                m_tp_mopcrts,
                m_tp_moplst,
                m_tp_moplstd,
                m_tp_moplstl,
                m_tp_pfolio,
                m_tp_stat32,
                m_tp_status2,
                m_tp_timsys,
                m_instrument,
                m_mk_bocmt,
                m_mk_bocnf,
                m_mk_bosgn,
                m_mk_brother,
                m_mk_clpr0,
                m_mk_clpr1,
                m_mk_clpr2,
                m_mk_dest,
                m_mk_dte,
                m_mk_dteacc,
                m_mk_level,
                m_mk_nb,
                m_mk_origin,
                m_mk_plcur,
                m_mk_qty,
                m_mk_stlamt,
                m_mk_stlcur,
                m_mk_stldte,
                m_mk_stlprc,
                m_mk_subtype,
                m_mk_time,
                m_mk_type,
                m_mrpl_date,
                m_mrpl_flag,
                m_mrpl_onb,
                m_nb,
                m_package,
                m_pkg_org,
                m_pkg_vs0,
                m_pkg_vs1,
                m_pkg_vs2,
                m_pl_cur,
                m_v_actor,
                m_v_brother,
                m_v_cnt_dest,
                m_v_cnt_src,
                m_v_date,
                m_v_evstlamt,
                m_v_evstlcur,
                m_v_evstldte,
                m_v_evt_ref,
                m_v_impqty,
                m_v_tsd,
                m_v_tsh
            FROM
                mx3.mxt_var_mktop_rep_ext;

        dbms_output.put_line('MXT_VAR_MKTOP_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_var_mktop_rep;

    PROCEDURE update_mxt_vol_intraday_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_VOL_INTRADAY_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_vol_intraday_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_callask,
            m_callbid,
            m_expirydate,
            m_instrum,
            m_label,
            m_today,
            m_vol_mid
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_callask,
                m_callbid,
                m_expirydate,
                m_instrum,
                m_label,
                m_today,
                m_vol_mid
            FROM
                mx3.mxt_vol_intraday_rep_ext;

        dbms_output.put_line('MXT_VOL_INTRADAY_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_vol_intraday_rep;

    PROCEDURE update_mxt_zc_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_ZC_REP', 'MXT_ZC_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_zc_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_disc_rate_bid,
            m_maturity_date,
            m_computing_mode,
            m_disc_factor_bid,
            m_disc_rate_ask,
            m_h_ext_date,
            m_day_count_fraction,
            m_curve,
            m_start_date,
            m_tenor,
            m_mkt_quote_ask,
            m_h_sys_date,
            m_type,
            m_ref_data,
            m_disc_factor_ask,
            m_mkt_quote_bid,
            m_generator
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_disc_rate_bid,
                m_maturity_date,
                m_computing_mode,
                m_disc_factor_bid,
                m_disc_rate_ask,
                m_h_ext_date,
                m_day_count_fraction,
                m_curve,
                m_start_date,
                m_tenor,
                m_mkt_quote_ask,
                m_h_sys_date,
                m_type,
                m_ref_data,
                m_disc_factor_ask,
                m_mkt_quote_bid,
                m_generator
            FROM
                mx3.mxt_zc_rep_ext;

        dbms_output.put_line('MXT_ZC_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_zc_rep;

    PROCEDURE update_tremor1_basket_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('TREMOR1_BASKET_REP', 'TREMOR1_BASKET_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.tremor1_basket_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_date,
            m_error_pri,
            m_error_vol,
            m_implied_p,
            m_implied_v,
            m_market_pr,
            m_market_vo,
            m_opt_expir,
            m_pl_instru,
            m_ref_data_o,
            m_ref_job_o,
            m_strike,
            m_strike_sc,
            m_weight
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_date,
                m_error_pri,
                m_error_vol,
                m_implied_p,
                m_implied_v,
                m_market_pr,
                m_market_vo,
                m_opt_expir,
                m_pl_instru,
                m_ref_data_o,
                m_ref_job_o,
                m_strike,
                m_strike_sc,
                m_weight
            FROM
                mx3.tremor1_basket_rep_ext;

        dbms_output.put_line('TREMOR1_BASKET_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_tremor1_basket_rep;

    PROCEDURE update_tremor1_outputs_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('TREMOR1_OUTPUTS_REP', 'TREMOR1_OUTPUTS_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.tremor1_outputs_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_correlati,
            m_cursor,
            m_date,
            m_initial_v,
            m_kappa,
            m_normalisa,
            m_opt_expir,
            m_parabola_,
            m_pl_instru,
            m_ref_data_o,
            m_ref_job_o,
            m_slope,
            m_vol_of_va
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_correlati,
                m_cursor,
                m_date,
                m_initial_v,
                m_kappa,
                m_normalisa,
                m_opt_expir,
                m_parabola_,
                m_pl_instru,
                m_ref_data_o,
                m_ref_job_o,
                m_slope,
                m_vol_of_va
            FROM
                mx3.tremor1_outputs_rep_ext;

        dbms_output.put_line('TREMOR1_OUTPUTS_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_tremor1_outputs_rep;

    PROCEDURE update_trn_entd_dbf_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('TRN_ENTD_DBF_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.trn_entd_dbf_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_pcg_date
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_pcg_date
            FROM
                mx3.trn_entd_dbf_rep_ext;

        dbms_output.put_line('TRN_ENTD_DBF_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_trn_entd_dbf_rep;

    PROCEDURE update_usr_info_dbf_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('USR_INFO_DBF_REP', 'USR_INFO_DBF_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.usr_info_dbf_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_ref_data,
            m_desc,
            m_group,
            m_user_name,
            m_sess_date
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_ref_data,
                m_desc,
                m_group,
                m_user_name,
                m_sess_date
            FROM
                mx3.usr_info_dbf_rep_ext;

        dbms_output.put_line('USR_INFO_DBF_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_usr_info_dbf_rep;

 PROCEDURE update_mxt_counterpart_rep AS
        t1 PLS_INTEGER;
    BEGIN
        delete_ref_data('MXT_RHO_TOPO_REP', 'MXT_RHO_TOPO_REP_EXT');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_counterpart_rep (
            timestamp,
            m_identity,
            m_mx_ref_job,
            m_other,
            m_h_ext_sec,
            m_status,
            m_corporate,
            m_address0,
            m_name,
            m_h_ext_date,
            m_sft,
            m_comment1,
            m_country,
            m_broker,
            m_h_sys_date,
            m_label,
            m_bank,
            m_h_ext_time,
            m_state,
            m_pay_net,
            m_address1,
            m_leg_ent,
            m_comment0,
            m_code,
            m_fax,
            m_address3,
            m_address2,
            m_city,
            m_confirm,
            m_id,
            m_tel,
            m_ref_data,
            m_dsp_label
        )
            SELECT
                0,
                0,
                m_mx_ref_job,
                m_other,
                m_h_ext_sec,
                m_status,
                m_corporate,
                m_address0,
                m_name,
                m_h_ext_date,
                m_sft,
                m_comment1,
                m_country,
                m_broker,
                m_h_sys_date,
                m_label,
                m_bank,
                m_h_ext_time,
                m_state,
                m_pay_net,
                m_address1,
                m_leg_ent,
                m_comment0,
                m_code,
                m_fax,
                m_address3,
                m_address2,
                m_city,
                m_confirm,
                m_id,
                m_tel,
                m_ref_data,
                m_dsp_label
            FROM
                mx3.mxt_counterpart_rep_ext;

        dbms_output.put_line('MXT_COUNTERPART_REP '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END update_mxt_counterpart_rep;


    PROCEDURE update_mxt_var_v1 AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_VAR_V1');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_var_v1 (
            m_date,
            m_cur,
            m_ptfolio,
            m_dealnum,
            m_scenario,
            m_result,
            m_resultv,
            m_h_sys_date,
            m_timestamp
        )
            SELECT
                m_date,
                m_cur,
                m_ptfolio,
                m_dealnum,
                m_scenario,
                m_result,
                m_resultv,
                m_h_sys_date,
                m_timestamp
            FROM
                mx3.mxt_var_v1_ext;

        dbms_output.put_line('MXT_VAR_V1: '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds');

    END update_mxt_var_v1;

    PROCEDURE update_mxt_intravar_rep AS
        t1 PLS_INTEGER;
    BEGIN
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_intravar_rep (
            timestamp,
            m_identity,
            m_ref_data,
            m_mx_ref_job,
            m_h_sys_date,
            m_sourcedate,
            m_cur,
            m_ptfolio,
            m_dealnum,
            m_scenario,
            m_result,
            m_resultv,
            m_timestamp_
        )
            SELECT
                0,
                0,
                0,
                0,
                m_h_sys_date,
                m_date,
                m_cur,
                m_ptfolio,
                m_dealnum,
                m_scenario,
                m_result,
                m_resultv,
                m_timestamp_
            FROM
                mx3.mxt_intravar_rep_ext;

        dbms_output.put_line('MXT_INTRAVAR_REP: '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds');

    END update_mxt_intravar_rep;

    PROCEDURE update_mxt_event_rep AS
        t1 PLS_INTEGER;
    BEGIN
        truncate_target('MXT_EVENT_REP');
        t1 := dbms_utility.get_time;
        INSERT INTO mx3.mxt_event_rep (
		m_contract,   
		m_v_date,
		m_v_evt_cmnt, 
		m_event,
		m_v_evt_grp, 
		m_v_evt_ref
        )
            SELECT
				m_contract,   
				m_v_date,
				m_v_evt_cmnt, 
				m_event,
				m_v_evt_grp, 
				m_v_evt_ref
            FROM
                mx3.mxt_event_rep_ext;

        dbms_output.put_line('mxt_event_rep: '
                             || SQL%rowcount
                             || ' rows inserted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds');

    END update_mxt_event_rep;

    PROCEDURE truncate_target (
        target_table IN VARCHAR2
    ) AS
        truncate_s   VARCHAR2(150);
        t1           PLS_INTEGER;
    BEGIN
        truncate_s := 'TRUNCATE TABLE ' || target_table;
        t1 := dbms_utility.get_time;
        dbms_utility.exec_ddl_statement(truncate_s);
        dbms_output.put_line(target_table
                             || ' truncated in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END truncate_target;

    PROCEDURE delete_ref_data (
        target_table   IN   VARCHAR2,
        source_table   IN   VARCHAR2
    ) AS
        delete_s   VARCHAR2(550);
        t1         PLS_INTEGER;
    BEGIN
        t1 := dbms_utility.get_time;
        delete_s := 'DELETE FROM '
                    || target_table
                    || ' WHERE m_ref_data IN (
                SELECT
                    m_ref_data
                FROM
                    '
                    || source_table
                    || ')';
        EXECUTE IMMEDIATE delete_s;
        COMMIT;
        dbms_output.put_line(target_table
                             || ' '
                             || SQL%rowcount
                             || ' rows deleted in '
                             ||(dbms_utility.get_time - t1) / 100
                             || ' seconds.');

    END;

    PROCEDURE test_external_tables AS

        CURSOR c1 IS
        SELECT
            table_name
        FROM
            user_tables
        WHERE
            table_name LIKE '%_EXT%';

        cnt   NUMBER;
        cmd   VARCHAR(250);
    BEGIN
        FOR rec IN c1 LOOP
            cmd := 'select count(*) from ' || rec.table_name;
            EXECUTE IMMEDIATE cmd
            INTO cnt;
            dbms_output.put_line(rec.table_name
                                 || ' has '
                                 || cnt
                                 || ' rows.');
        END LOOP;
    END;

END mx3_update_pck;

/
