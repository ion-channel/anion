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
    system boolean DEFAULT false,
    status text
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

COPY teams (id, created_at, updated_at, name, sys_admin, deleted_at, poc_name, poc_email, poc_name_hash, poc_email_hash)
FROM '/docker-entrypoint-initdb.d/teams.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY users (id, created_at, updated_at, username, password_digest, email, chat_handle, deleted_at, last_active_at, email_hash, externally_managed)
FROM '/docker-entrypoint-initdb.d/users.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY team_users (id, created_at, updated_at, team_id, user_id, role, deleted_at, status, inviter, invited_at)
FROM '/docker-entrypoint-initdb.d/team_users.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY team_deliveries (id, team_id, location, access_key, secret_key, region, name, type, deleted_at)
FROM '/docker-entrypoint-initdb.d/team_deliveries.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY user_metadata (id, user_id, username, metadata)
FROM '/docker-entrypoint-initdb.d/user_metadata.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY users_to_projects (id, user_id, project_name, project_versions, org)
FROM '/docker-entrypoint-initdb.d/users_to_projects.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY users_to_vulns (id, user_id, external_vuln_id)
FROM '/docker-entrypoint-initdb.d/users_to_vulns.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY user_preferences (id, user_id, channel_preference, deleted_at, created_at, updated_at, all_vulns)
FROM '/docker-entrypoint-initdb.d/user_preferences.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY tokens (id, created_at, updated_at, user_id, expires_at, name, cli)
FROM '/docker-entrypoint-initdb.d/tokens.csv' WITH DELIMITER AS ',' CSV HEADER;
