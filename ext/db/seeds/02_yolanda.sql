CREATE DATABASE yolanda WITH TEMPLATE = template0 OWNER = postgres;

\connect yolanda

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

-- Ruleset change history

CREATE TABLE projects_ruleset_history (
    project_id uuid NOT NULL,
    ruleset_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_id uuid NOT NULL
);

ALTER TABLE projects_ruleset_history OWNER TO postgres;
CREATE UNIQUE INDEX index_projects_ruleset_history_on_projectid_rulsetid_createdat ON projects_ruleset_history USING btree (project_id, ruleset_id, created_at);
ALTER TABLE projects_ruleset_history ADD COLUMN IF NOT EXISTS ruleset_id_changed_from uuid;
ALTER TABLE projects_ruleset_history RENAME COLUMN ruleset_id TO ruleset_id_changed_to;

---
--- projects
---

CREATE TABLE projects (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id character varying,
    ruleset_id character varying,
    name character varying,
    type character varying,
    source character varying,
    branch character varying,
    description text,
    active boolean,
    chat_channel character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deploy_key text DEFAULT ''::text,
    should_monitor boolean DEFAULT false,
    monitor_frequency varchar(100),
    poc_name character varying DEFAULT ''::character varying NOT NULL,
    poc_email character varying DEFAULT ''::character varying NOT NULL,
    username character varying DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    key_fingerprint character varying DEFAULT ''::character varying,
    poc_name_hash character varying DEFAULT ''::character varying NOT NULL,
    poc_email_hash character varying DEFAULT ''::character varying NOT NULL
);

ALTER TABLE projects OWNER TO postgres;
ALTER TABLE ONLY projects ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_projects_on_branch_and_source_and_team_id ON projects USING btree (branch, source, team_id);

---
--- aliases
---

CREATE TABLE aliases (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    version character varying,
    org character varying
);

ALTER TABLE aliases OWNER TO postgres;
ALTER TABLE ONLY aliases ADD CONSTRAINT tags_pkey PRIMARY KEY (id);

---
--- aliases_projects
---

CREATE TABLE aliases_projects (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    alias_id uuid,
    project_id uuid
);

ALTER TABLE aliases_projects OWNER TO postgres;
ALTER TABLE ONLY aliases_projects ADD CONSTRAINT projects_tags_pkey PRIMARY KEY (id);
CREATE INDEX index_aliases_projects_on_alias_id ON aliases_projects USING btree (alias_id);
CREATE INDEX index_aliases_projects_on_project_id ON aliases_projects USING btree (project_id);

---
--- tags
---

CREATE TABLE tags (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id character varying,
    name character varying NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

ALTER TABLE tags OWNER TO postgres;
ALTER TABLE ONLY tags ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);
CREATE INDEX index_tags_on_team_id ON tags USING btree (team_id);

---
--- projects_tags
---

CREATE TABLE projects_tags (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    tag_id uuid,
    project_id uuid
);

ALTER TABLE projects_tags OWNER TO postgres;
ALTER TABLE ONLY projects_tags ADD CONSTRAINT portfolios_projects_pkey PRIMARY KEY (id);
CREATE INDEX index_projects_tags_on_project_id ON projects_tags USING btree (project_id);
CREATE INDEX index_projects_tags_on_tag_id ON projects_tags USING btree (tag_id);

---
--- Data
---

COPY projects (id, team_id, ruleset_id, name, type, source, branch, description, active, chat_channel, created_at, updated_at, deploy_key, should_monitor, monitor_frequency, poc_name, poc_email, username, password)
FROM '/docker-entrypoint-initdb.d/projects.csv' WITH DELIMITER AS ',' NULL 'null' CSV HEADER;

COPY aliases (id, name, created_at, updated_at, version, org)
FROM '/docker-entrypoint-initdb.d/aliases.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY aliases_projects (id, alias_id, project_id)
FROM '/docker-entrypoint-initdb.d/aliases_projects.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY tags (id, team_id, name, description, created_at, updated_at)
FROM '/docker-entrypoint-initdb.d/tags.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY projects_tags (id, tag_id, project_id)
FROM '/docker-entrypoint-initdb.d/projects_tags.csv' WITH DELIMITER AS ',' CSV HEADER;
