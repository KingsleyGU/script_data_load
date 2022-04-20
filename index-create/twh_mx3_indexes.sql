CREATE INDEX mxt_mktp_smile_rep_m_ref_data ON
    mxt_mktp_smile_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_mktp_vol_rep_m_ref_data ON
    mxt_mktp_vol_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_value_rep_saas_i ON
    mxt_trade_value_rep_saas (
        m_ref_data
    );
	
CREATE INDEX mxt_ci_rep_i ON
    mxt_ci_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_counterpart_rep_i ON
    mxt_counterpart_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_deltahedge_rep_i ON
    mxt_deltahedge_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_greeks_topo_rep_i ON
    mxt_greeks_topo_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_portfolio_rep_i ON
    mxt_portfolio_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_rho_topo_rep_i ON
    mxt_rho_topo_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_audit_rep_i ON
    mxt_trade_audit_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_cs_rep_i ON
    mxt_trade_cs_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_fix_rep_i ON
    mxt_trade_fix_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_pay_rep_i ON
    mxt_trade_pay_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_rep_i ON
    mxt_trade_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_rep_intraday_i ON
    mxt_trade_rep_intraday_saas (
        m_ref_data
    );

CREATE INDEX mxt_user_group_rep_i ON
    mxt_user_group_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_zc_rep_i ON
    mxt_zc_rep_saas (
        m_ref_data
    );

CREATE INDEX tremor1_basket_rep_i ON
    tremor1_basket_rep_saas (
        m_ref_data
    );

CREATE INDEX tremor1_outputs_rep_i ON
    tremor1_outputs_rep_saas (
        m_ref_data
    );

CREATE INDEX usr_info_dbf_rep_i ON
    usr_info_dbf_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_intr_rep_i ON
    mxt_trade_intr_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_trade_ts_rep_i ON
    mxt_trade_ts_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_pl_d_rep_i ON
    mxt_pl_d_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_var_mktop_rep_i ON
    mxt_var_mktop_rep_saas (
        m_ref_data
    );

CREATE INDEX intra_trade_val_rep_i ON
    intra_trade_val_rep_saas (
        m_ref_data
    );

CREATE INDEX job_audit_rep_i ON
    job_audit_rep_saas (
        m_ref_data
    );

CREATE INDEX mxt_intravar_rep_i ON
    mxt_intravar_rep_saas (
        m_ref_data
    );
