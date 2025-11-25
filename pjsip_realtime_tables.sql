-- ============================================================================
-- PJSIP Realtime Tables for Asterisk
-- Run this SQL to create the tables Asterisk needs for realtime PJSIP
-- ============================================================================

-- ps_endpoints - Main endpoint configuration
CREATE TABLE IF NOT EXISTS ps_endpoints (
    id VARCHAR(40) PRIMARY KEY NOT NULL,
    transport VARCHAR(40),
    aors VARCHAR(200),
    auth VARCHAR(40),
    context VARCHAR(40),
    disallow VARCHAR(200),
    allow VARCHAR(200),
    direct_media VARCHAR(10),
    connected_line_method VARCHAR(40),
    direct_media_method VARCHAR(40),
    direct_media_glare_mitigation VARCHAR(40),
    disable_direct_media_on_nat VARCHAR(10),
    dtmf_mode VARCHAR(40),
    external_media_address VARCHAR(40),
    force_rport VARCHAR(10),
    ice_support VARCHAR(10),
    identify_by VARCHAR(40),
    mailboxes VARCHAR(40),
    moh_suggest VARCHAR(40),
    outbound_auth VARCHAR(40),
    outbound_proxy VARCHAR(40),
    rewrite_contact VARCHAR(10),
    rtp_ipv6 VARCHAR(10),
    rtp_symmetric VARCHAR(10),
    send_diversion VARCHAR(10),
    send_pai VARCHAR(10),
    send_rpid VARCHAR(10),
    timers_min_se INTEGER,
    timers VARCHAR(40),
    timers_sess_expires INTEGER,
    callerid VARCHAR(40),
    callerid_privacy VARCHAR(40),
    callerid_tag VARCHAR(40),
    "100rel" VARCHAR(40),
    aggregate_mwi VARCHAR(10),
    trust_id_inbound VARCHAR(10),
    trust_id_outbound VARCHAR(10),
    use_ptime VARCHAR(10),
    use_avpf VARCHAR(10),
    media_encryption VARCHAR(10),
    inband_progress VARCHAR(10),
    call_group VARCHAR(40),
    pickup_group VARCHAR(40),
    named_call_group VARCHAR(40),
    named_pickup_group VARCHAR(40),
    device_state_busy_at INTEGER,
    fax_detect VARCHAR(10),
    t38_udptl VARCHAR(10),
    t38_udptl_ec VARCHAR(40),
    t38_udptl_maxdatagram INTEGER,
    t38_udptl_nat VARCHAR(10),
    t38_udptl_ipv6 VARCHAR(10),
    tone_zone VARCHAR(40),
    language VARCHAR(40),
    one_touch_recording VARCHAR(10),
    record_on_feature VARCHAR(40),
    record_off_feature VARCHAR(40),
    rtp_engine VARCHAR(40),
    allow_transfer VARCHAR(10),
    allow_subscribe VARCHAR(10),
    sdp_owner VARCHAR(40),
    sdp_session VARCHAR(40),
    tos_audio VARCHAR(10),
    tos_video VARCHAR(10),
    sub_min_expiry INTEGER,
    from_domain VARCHAR(40),
    from_user VARCHAR(40),
    mwi_from_user VARCHAR(40),
    dtls_verify VARCHAR(40),
    dtls_rekey INTEGER,
    dtls_cert_file VARCHAR(200),
    dtls_private_key VARCHAR(200),
    dtls_cipher VARCHAR(200),
    dtls_ca_file VARCHAR(200),
    dtls_ca_path VARCHAR(200),
    dtls_setup VARCHAR(40),
    srtp_tag_32 VARCHAR(10),
    media_address VARCHAR(40),
    redirect_method VARCHAR(40),
    set_var TEXT,
    cos_audio INTEGER,
    cos_video INTEGER,
    message_context VARCHAR(40),
    force_avp VARCHAR(10),
    media_use_received_transport VARCHAR(10),
    accountcode VARCHAR(80),
    user_eq_phone VARCHAR(10),
    moh_passthrough VARCHAR(10),
    media_encryption_optimistic VARCHAR(10),
    rpid_immediate VARCHAR(10),
    g726_non_standard VARCHAR(10),
    rtp_keepalive INTEGER,
    rtp_timeout INTEGER,
    rtp_timeout_hold INTEGER,
    bind_rtp_to_media_address VARCHAR(10),
    voicemail_extension VARCHAR(40),
    mwi_subscribe_replaces_unsolicited VARCHAR(10),
    deny VARCHAR(95),
    permit VARCHAR(95),
    acl VARCHAR(40),
    contact_deny VARCHAR(95),
    contact_permit VARCHAR(95),
    contact_acl VARCHAR(40),
    subscribe_context VARCHAR(40),
    fax_detect_timeout INTEGER,
    contact_user VARCHAR(80),
    preferred_codec_only VARCHAR(10),
    asymmetric_rtp_codec VARCHAR(10),
    rtcp_mux VARCHAR(10),
    allow_overlap VARCHAR(10),
    refer_blind_progress VARCHAR(10),
    notify_early_inuse_ringing VARCHAR(10),
    max_audio_streams INTEGER,
    max_video_streams INTEGER,
    webrtc VARCHAR(10),
    dtls_fingerprint VARCHAR(40),
    incoming_mwi_mailbox VARCHAR(40),
    bundle VARCHAR(10),
    dtls_auto_generate_cert VARCHAR(10),
    follow_early_media_fork VARCHAR(10),
    accept_multiple_sdp_answers VARCHAR(10),
    suppress_q850_reason_headers VARCHAR(10),
    trust_connected_line VARCHAR(10),
    send_connected_line VARCHAR(10),
    ignore_183_without_sdp VARCHAR(10),
    stir_shaken VARCHAR(10),
    stir_shaken_profile VARCHAR(80),
    allow_unauthenticated_options VARCHAR(10),
    geoloc_incoming_call_profile VARCHAR(80),
    geoloc_outgoing_call_profile VARCHAR(80),
    incoming_call_offer_pref VARCHAR(40),
    outgoing_call_offer_pref VARCHAR(40),
    send_aoc VARCHAR(10),
    codec_prefs_incoming_offer VARCHAR(128),
    codec_prefs_outgoing_offer VARCHAR(128),
    codec_prefs_incoming_answer VARCHAR(128),
    codec_prefs_outgoing_answer VARCHAR(128),
    UNIQUE(id)
);

-- ps_auths - Authentication configuration
CREATE TABLE IF NOT EXISTS ps_auths (
    id VARCHAR(40) PRIMARY KEY NOT NULL,
    auth_type VARCHAR(40),
    nonce_lifetime INTEGER,
    md5_cred VARCHAR(40),
    password VARCHAR(80),
    realm VARCHAR(40),
    username VARCHAR(40),
    refresh_token VARCHAR(200),
    oauth_clientid VARCHAR(200),
    oauth_secret VARCHAR(200),
    UNIQUE(id)
);

-- ps_aors - Address of Record (registration) configuration
CREATE TABLE IF NOT EXISTS ps_aors (
    id VARCHAR(40) PRIMARY KEY NOT NULL,
    contact VARCHAR(255),
    default_expiration INTEGER,
    mailboxes VARCHAR(80),
    max_contacts INTEGER,
    minimum_expiration INTEGER,
    remove_existing VARCHAR(10),
    qualify_frequency INTEGER,
    authenticate_qualify VARCHAR(10),
    maximum_expiration INTEGER,
    outbound_proxy VARCHAR(40),
    support_path VARCHAR(10),
    qualify_timeout FLOAT,
    voicemail_extension VARCHAR(40),
    remove_unavailable VARCHAR(10),
    UNIQUE(id)
);

-- ps_endpoint_id_ips - IP-based endpoint identification
CREATE TABLE IF NOT EXISTS ps_endpoint_id_ips (
    id VARCHAR(40) PRIMARY KEY NOT NULL,
    endpoint VARCHAR(40),
    match VARCHAR(80),
    srv_lookups VARCHAR(10),
    match_header VARCHAR(255),
    UNIQUE(id)
);

-- ============================================================================
-- Indexes for better query performance
-- ============================================================================
CREATE INDEX IF NOT EXISTS ps_endpoints_id ON ps_endpoints (id);
CREATE INDEX IF NOT EXISTS ps_auths_id ON ps_auths (id);
CREATE INDEX IF NOT EXISTS ps_aors_id ON ps_aors (id);
CREATE INDEX IF NOT EXISTS ps_endpoint_id_ips_id ON ps_endpoint_id_ips (id);

-- ============================================================================
-- Function to sync agents table to PJSIP realtime tables
-- Call this after inserting/updating/deleting from agents table
-- ============================================================================
CREATE OR REPLACE FUNCTION sync_agent_to_pjsip(
    p_extension VARCHAR,
    p_password VARCHAR,
    p_full_name VARCHAR,
    p_enabled BOOLEAN
) RETURNS VOID AS $$
BEGIN
    IF p_enabled THEN
        -- Insert/Update endpoint
        INSERT INTO ps_endpoints (
            id, transport, aors, auth, context, disallow, allow,
            direct_media, rtp_symmetric, force_rport, rewrite_contact, callerid
        ) VALUES (
            p_extension, 'transport-udp', p_extension, p_extension, 'from-internal',
            'all', 'ulaw', 'no', 'yes', 'yes', 'yes', p_full_name
        )
        ON CONFLICT (id) DO UPDATE SET
            transport = EXCLUDED.transport,
            aors = EXCLUDED.aors,
            auth = EXCLUDED.auth,
            context = EXCLUDED.context,
            disallow = EXCLUDED.disallow,
            allow = EXCLUDED.allow,
            direct_media = EXCLUDED.direct_media,
            rtp_symmetric = EXCLUDED.rtp_symmetric,
            force_rport = EXCLUDED.force_rport,
            rewrite_contact = EXCLUDED.rewrite_contact,
            callerid = EXCLUDED.callerid;

        -- Insert/Update auth
        INSERT INTO ps_auths (id, auth_type, password, username)
        VALUES (p_extension, 'userpass', p_password, p_extension)
        ON CONFLICT (id) DO UPDATE SET
            auth_type = EXCLUDED.auth_type,
            password = EXCLUDED.password,
            username = EXCLUDED.username;

        -- Insert/Update AOR
        INSERT INTO ps_aors (id, max_contacts, maximum_expiration)
        VALUES (p_extension, 5, 60)
        ON CONFLICT (id) DO UPDATE SET
            max_contacts = EXCLUDED.max_contacts,
            maximum_expiration = EXCLUDED.maximum_expiration;
    ELSE
        -- Remove disabled agents from PJSIP tables
        DELETE FROM ps_endpoints WHERE id = p_extension;
        DELETE FROM ps_auths WHERE id = p_extension;
        DELETE FROM ps_aors WHERE id = p_extension;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- Trigger function to automatically sync agents to PJSIP
-- ============================================================================
CREATE OR REPLACE FUNCTION trigger_sync_agent_to_pjsip()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        -- Remove from PJSIP tables
        DELETE FROM ps_endpoints WHERE id = OLD.extension;
        DELETE FROM ps_auths WHERE id = OLD.extension;
        DELETE FROM ps_aors WHERE id = OLD.extension;
        RETURN OLD;
    ELSE
        -- Insert or Update
        PERFORM sync_agent_to_pjsip(NEW.extension, NEW.password, NEW.full_name, NEW.enabled);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- Create trigger on agents table (if it exists)
-- ============================================================================
DROP TRIGGER IF EXISTS agents_pjsip_sync ON agents;
CREATE TRIGGER agents_pjsip_sync
    AFTER INSERT OR UPDATE OR DELETE ON agents
    FOR EACH ROW
    EXECUTE FUNCTION trigger_sync_agent_to_pjsip();

-- ============================================================================
-- Initial sync: Populate PJSIP tables from existing agents
-- ============================================================================
DO $$
DECLARE
    agent_rec RECORD;
BEGIN
    -- Check if agents table exists
    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'agents') THEN
        FOR agent_rec IN SELECT * FROM agents WHERE enabled = true LOOP
            PERFORM sync_agent_to_pjsip(
                agent_rec.extension,
                agent_rec.password,
                agent_rec.full_name,
                agent_rec.enabled
            );
        END LOOP;
        RAISE NOTICE 'Synced existing agents to PJSIP realtime tables';
    ELSE
        RAISE NOTICE 'agents table not found - skipping initial sync';
    END IF;
END $$;

-- ============================================================================
-- Sample data: Insert test agents (uncomment if needed)
-- ============================================================================
-- INSERT INTO agents (extension, password, full_name, enabled) VALUES
--     ('101', 'Password123!', 'Agent One', true),
--     ('102', 'Password123!', 'Agent Two', true)
-- ON CONFLICT DO NOTHING;
