CREATE DATABASE janice WITH TEMPLATE = template0 OWNER = postgres;

\connect janice

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

---
--- teams
---

CREATE TABLE teams (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    sys_admin boolean DEFAULT false,
    deleted_at timestamp without time zone,
    poc_name character varying DEFAULT ''::character varying NOT NULL,
    poc_email character varying DEFAULT ''::character varying NOT NULL,
    poc_name_hash character varying DEFAULT ''::character varying NOT NULL,
    poc_email_hash character varying DEFAULT ''::character varying NOT NULL,
    delivery_location text DEFAULT ''::text,
    access_key text DEFAULT ''::text,
    secret_key text DEFAULT ''::text,
    delivery_region text DEFAULT ''::text,
    awscustid text DEFAULT ''::text
);

ALTER TABLE teams OWNER TO postgres;
ALTER TABLE ONLY teams ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
CREATE INDEX index_teams_on_deleted_at ON teams USING btree (deleted_at);


---
--- team_users
---

CREATE TABLE team_users (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    team_id uuid NOT NULL,
    user_id uuid NOT NULL,
    role character varying NOT NULL,
    deleted_at timestamp without time zone,
    status character varying DEFAULT 'pending'::character varying,
    inviter uuid,
    invited_at timestamp without time zone
);

ALTER TABLE team_users OWNER TO postgres;
ALTER TABLE ONLY team_users ADD CONSTRAINT account_users_pkey PRIMARY KEY (id);
CREATE INDEX index_team_users_on_deleted_at ON team_users USING btree (deleted_at);
CREATE INDEX index_team_users_on_team_id ON team_users USING btree (team_id);
CREATE INDEX index_team_users_on_team_id_and_user_id ON team_users USING btree (team_id, user_id);
CREATE UNIQUE INDEX index_team_users_on_team_id_and_user_id_and_deleted_at ON team_users USING btree (team_id, user_id, deleted_at);
CREATE INDEX index_team_users_on_user_id ON team_users USING btree (user_id);
ALTER TABLE ONLY team_users ADD CONSTRAINT fk_rails_c96445f213 FOREIGN KEY (team_id) REFERENCES teams(id);



---
--- team_deliveries
---

CREATE TABLE team_deliveries (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id uuid NOT NULL,
    location character varying NOT NULL,
    access_key character varying,
    secret_key character varying,
    region character varying NOT NULL,
    name text NOT NULL,
    type text DEFAULT 's3'::text NOT NULL,
    deleted_at timestamp without time zone
);

ALTER TABLE team_deliveries OWNER TO postgres;
ALTER TABLE ONLY team_deliveries ADD CONSTRAINT team_deliveries_pkey PRIMARY KEY (id);
CREATE INDEX index_team_deliveries_on_team_id ON team_deliveries USING btree (team_id);
ALTER TABLE ONLY team_deliveries ADD CONSTRAINT fk_rails_e691012db0 FOREIGN KEY (team_id) REFERENCES teams(id);



---
--- users
---

CREATE TABLE users (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    username character varying,
    password_digest character varying,
    email character varying NOT NULL,
    chat_handle character varying,
    deleted_at timestamp without time zone,
    last_active_at timestamp without time zone DEFAULT '2018-05-31 16:59:23.50034'::timestamp without time zone,
    email_hash character varying DEFAULT ''::character varying NOT NULL,
    externally_managed boolean DEFAULT false,
    system boolean DEFAULT false
);

ALTER TABLE users OWNER TO postgres;
ALTER TABLE ONLY users ADD CONSTRAINT users_pkey PRIMARY KEY (id);
CREATE INDEX index_users_on_deleted_at ON users USING btree (deleted_at);
ALTER TABLE ONLY team_users ADD CONSTRAINT fk_rails_685e030c15 FOREIGN KEY (user_id) REFERENCES users(id);



---
--- user_metadata
---

CREATE TABLE user_metadata (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    username text NOT NULL,
    metadata text NOT NULL
);

CREATE SEQUENCE user_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE user_metadata OWNER TO postgres;
ALTER TABLE user_metadata_id_seq OWNER TO postgres;
ALTER SEQUENCE user_metadata_id_seq OWNED BY user_metadata.id;
ALTER TABLE ONLY user_metadata ALTER COLUMN id SET DEFAULT nextval('user_metadata_id_seq'::regclass);
ALTER TABLE ONLY user_metadata ADD CONSTRAINT user_metadata_pkey PRIMARY KEY (id);
CREATE INDEX index_user_metadata_on_user_id ON user_metadata USING btree (user_id);
ALTER TABLE ONLY user_metadata ADD CONSTRAINT fk_rails_4befb190c1 FOREIGN KEY (user_id) REFERENCES users(id);
SELECT pg_catalog.setval('user_metadata_id_seq', 1, false);



---
--- users to projects
---

CREATE TABLE users_to_projects (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    project_name text NOT NULL,
    project_versions character varying,
    org character varying
);

CREATE SEQUENCE users_to_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE users_to_projects OWNER TO postgres;
ALTER TABLE users_to_projects_id_seq OWNER TO postgres;
ALTER TABLE ONLY users_to_projects ADD CONSTRAINT fk_rails_0e2f4c96e4 FOREIGN KEY (user_id) REFERENCES users(id);
ALTER SEQUENCE users_to_projects_id_seq OWNED BY users_to_projects.id;
ALTER TABLE ONLY users_to_projects ADD CONSTRAINT users_to_projects_pkey PRIMARY KEY (id);
ALTER TABLE ONLY users_to_projects ALTER COLUMN id SET DEFAULT nextval('users_to_projects_id_seq'::regclass);
SELECT pg_catalog.setval('users_to_projects_id_seq', 1, false);



---
--- users to vulns
---

CREATE TABLE users_to_vulns (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    external_vuln_id text NOT NULL
);

CREATE SEQUENCE users_to_vulns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE users_to_vulns OWNER TO postgres;
ALTER TABLE users_to_vulns_id_seq OWNER TO postgres;
ALTER TABLE ONLY users_to_vulns ADD CONSTRAINT fk_rails_2fc61fd1d1 FOREIGN KEY (user_id) REFERENCES users(id);
ALTER SEQUENCE users_to_vulns_id_seq OWNED BY users_to_vulns.id;
ALTER TABLE ONLY users_to_vulns ALTER COLUMN id SET DEFAULT nextval('users_to_vulns_id_seq'::regclass);
SELECT pg_catalog.setval('users_to_vulns_id_seq', 1, false);
ALTER TABLE ONLY users_to_vulns ADD CONSTRAINT users_to_vulns_pkey PRIMARY KEY (id);



---
--- user preferences
---

CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    channel_preference text NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    all_vulns boolean
);

CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE user_preferences OWNER TO postgres;
ALTER TABLE user_preferences_id_seq OWNER TO postgres;
CREATE INDEX index_user_preferences_on_user_id ON user_preferences USING btree (user_id);
ALTER TABLE ONLY user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);
ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;
SELECT pg_catalog.setval('user_preferences_id_seq', 1, false);
ALTER TABLE ONLY user_preferences ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);
ALTER TABLE ONLY user_preferences ADD CONSTRAINT fk_rails_a69bfcfd81 FOREIGN KEY (user_id) REFERENCES users(id);



---
--- tokens
---

CREATE TABLE tokens (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id uuid,
    expires_at timestamp without time zone,
    name character varying,
    cli boolean DEFAULT false
);

ALTER TABLE tokens OWNER TO postgres;
ALTER TABLE ONLY tokens ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
CREATE INDEX index_tokens_on_user_id ON tokens USING btree (user_id);



---
--- Data
---

COPY teams (id, created_at, updated_at, name, sys_admin, deleted_at, poc_name, poc_email, poc_name_hash, poc_email_hash) FROM stdin;
bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	2018-05-31 16:59:24.334349	2018-05-31 16:59:24.334349	ion-channel	t	\N	ylU/wv2ZeJye28uZ3C2tNuyEfeHntY4FbQ/CAj0YL20=\n	2ZO4Ht/AwVRx1HL0z35e3UUqSBMRsUoAAraZJrEJqHOYy3Db+U56no9eAwIQ\nH3W7\n	d6806158f75334002321a9333b6b02b9b84b51433400afb68bb197bddc2db6a5	b8a7b17eed63f5f860bfe2c0e7574ce6409678d5e2c801bf7486631142de4bf2
bdfda532-4450-4b64-8150-338d72fb4f41	2018-05-31 16:59:34.62809	2018-05-31 16:59:34.62809	Team 2	f	\N	ylU/wv2ZeJye28uZ3C2tNuyEfeHntY4FbQ/CAj0YL20=\n	2ZO4Ht/AwVRx1HL0z35e3UUqSBMRsUoAAraZJrEJqHOYy3Db+U56no9eAwIQ\nH3W7\n	d6806158f75334002321a9333b6b02b9b84b51433400afb68bb197bddc2db6a5	b8a7b17eed63f5f860bfe2c0e7574ce6409678d5e2c801bf7486631142de4bf2
\.


COPY users (id, created_at, updated_at, username, password_digest, email, chat_handle, deleted_at, last_active_at, email_hash, externally_managed) FROM stdin;
fe42a04c-ebcb-49ac-8579-1e0f875d70f0	2018-05-31 16:59:24.475189	2018-05-31 16:59:24.475189	foo	$2a$10$nu5q4dvNYOlooLh4yov5Fu.em3CNDWxyR5laQkDxYV/NDa1DV1l2W	2KIekVIrPtPw02/lNrUh40HItkp7cCh4excXVTADSQY=\n	\N	\N	2018-05-31 16:59:23.50034	a5722037c06f32b227f667d9b34f0018ee2e0c7ff968a6d1e2836d88cd5aa9fd	t
756c290d-e653-41d9-875d-f62317d3bb23	2018-05-31 16:59:34.467549	2018-05-31 16:59:34.467549	updateuser	$2a$10$LUNEow28gBHfVBdMnjIoAOUnT6ncOntOjaMqQ7iHjIgHerAi3bM.e	MSevvZnA2LEoVmGe67qA25lUe6dTmR6xprRoWHG545/RwMnAkqz7li6Fi83c\nRRn2\n	\N	\N	2018-05-31 16:59:23.50034	57086149736ce136eced0ae1de9d371986ffa937cab06763fbb4e0301b08feb2	f
4f5bbc94-448a-40e2-90a6-ac95687491ac	2018-05-31 16:59:32.402924	2018-05-31 16:59:32.402924	normaluser	$2a$10$6O2K74E4hd9oiQskSL6EYuC9qFsQ7oOlut8U4KsgKC.wxBg0FCI2W	rhqsBQEElHPpBJyyskUR7BPlG8mUz9Tlz7XCqZM8Ek1e/t0pzuze6JTJ56F6\n6694\n	\N	\N	2018-05-31 16:59:23.50034	64f1ae90caad1096a784da07fb2c0b04a88716fa1de95821a3d2e6f8294b999e	f
fc0cf7cd-2d2c-486f-b153-ea1c2b38c914	2018-05-31 16:59:34.575433	2018-05-31 16:59:34.575433	inviteuser	$2a$10$cPrhXbEFhhYGMG5KcAblhOsHoH2jJSiezfmtuietWyHsBYUgvuBPG	MGIovG3WNF5Aex2litvbPtpwMeia3JOMikyimsEFMxtCQsQT8A7JIu0nHNWu\nacSQ\n	\N	\N	2018-05-31 16:59:23.50034	8c0cef481a74f74b5b96e0801f9b187390bbdcb77a4309068676c6ad0a00913f	f
d14d0fd6-ab4e-446c-94fb-2b18b9a9e799	2018-05-31 16:59:32.562971	2018-05-31 16:59:32.562971	inviteuser2	$2a$10$sjiFMUR.oGjyxL/VcYQvreR2j9L5h8J3jtZj2pSyZ7DR0zRHpSh3.	Q+5Bk0cVRBBfJTNbAhHEJqSi83p0oqQgyEmRpRF59ieuKcnBxY9awY7SF98v\n5OtI\n	\N	\N	2018-05-31 16:59:23.50034	90a84b342bb10e577e1af94904b9853dd4fde710fc1fa94e0ad263e72ae1aea5	f
834c6653-a2ad-46a0-a869-43fab13fabe3	2018-05-31 16:59:32.687689	2018-05-31 16:59:32.687689	inviteuser3	$2a$10$ckt02fhrBRvwrrDwlHLpv.sizTGe6cBJg2DPhbDFr8S/5ybck8Lay	C/20wUPksg0NRXXG/iXC1vyyGoA3yHhm6nKSIsrRh7yLftvycIpn5BLHexfe\noM3a\n	\N	\N	2018-05-31 16:59:23.50034	f325e4d46d3116ef6c9a5fc64801a4186abca81c94c17ea78cef61bcb80253b3	f
eaf1080e-48d4-4169-a2dc-d92569ddd7a4	2018-05-31 16:59:24.303814	2018-05-31 16:59:34.614221	ion	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	1TtZk9y+4JN+ZmM7lwq38umjKV/pY/VUSLqNGE/7MxXtYDhUMnZ+TyHXFshY\nPu/A\n	\N	\N	2018-05-31 16:59:34.683904	b8a7b17eed63f5f860bfe2c0e7574ce6409678d5e2c801bf7486631142de4bf2	f
\.


COPY team_users (id, created_at, updated_at, team_id, user_id, role, deleted_at, status, inviter, invited_at) FROM stdin;
6794c0fa-fde8-43e8-a608-13a76d610388	2018-05-31 16:59:24.380315	2018-05-31 16:59:24.380315	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	eaf1080e-48d4-4169-a2dc-d92569ddd7a4	admin	\N	active	\N	2018-05-31 16:59:24.381168
903f97be-2d7f-4640-bef8-499f7963dd9e	2018-05-31 16:59:32.475379	2018-05-31 16:59:32.475379	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	4f5bbc94-448a-40e2-90a6-ac95687491ac	member	\N	pending	eaf1080e-48d4-4169-a2dc-d92569ddd7a4	2018-05-31 16:59:32.475564
e0adb970-d217-4e7e-b295-e869ba34c364	2018-05-31 16:59:32.598814	2018-05-31 16:59:32.598814	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	d14d0fd6-ab4e-446c-94fb-2b18b9a9e799	member	\N	pending	eaf1080e-48d4-4169-a2dc-d92569ddd7a4	2018-05-31 16:59:32.598931
19b27b67-a1de-439b-b2ee-0570a6c9e54b	2018-05-31 16:59:32.753366	2018-05-31 16:59:32.753366	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	834c6653-a2ad-46a0-a869-43fab13fabe3	member	\N	pending	eaf1080e-48d4-4169-a2dc-d92569ddd7a4	2018-05-31 16:59:32.753502
\.


COPY team_deliveries (id, team_id, location, access_key, secret_key, region, name, type, deleted_at) FROM stdin;
22ecbc90-c0f4-46cb-958b-81c8f725588b	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	somebucketpath	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	us-east-1	testing-env	s3	\N
503098ac-d01e-44ee-b802-dee7eacf9e8b	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	anotherbucket	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	us-east-1	prod-env	s3	\N
39941d46-8a31-4053-a7be-1b1f428c190d	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	deletedthisone	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	$2a$10$kvNu2113r/o5l6rpSoH1POdzQFyE.sVizIYrMQWfTX96ro1i5PwZK	us-east-1	prod-env	s3	2018-05-31 16:59:24.381168
\.


COPY user_metadata (id, user_id, username, metadata) FROM stdin;
\.


COPY users_to_projects (id, user_id, project_name, project_versions, org) FROM stdin;
\.


COPY users_to_vulns (id, user_id, external_vuln_id) FROM stdin;
\.


COPY user_preferences (id, user_id, channel_preference, deleted_at, created_at, updated_at, all_vulns) FROM stdin;
\.

COPY tokens (id, created_at, updated_at, user_id, expires_at, name, cli) FROM stdin;
d55f3a73-ad9e-4e58-b8f6-6c578d5bf39d	2018-05-31 16:59:32.18595	2018-05-31 16:59:32.18595	eaf1080e-48d4-4169-a2dc-d92569ddd7a4	2018-05-31 17:14:32.178665	\N	f
\.
