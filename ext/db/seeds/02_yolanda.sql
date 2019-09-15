CREATE DATABASE yolanda WITH TEMPLATE = template0 OWNER = postgres;

\connect yolanda

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

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

COPY projects (id, team_id, ruleset_id, name, type, source, branch, description, active, chat_channel, created_at, updated_at, deploy_key, should_monitor, poc_name, poc_email, username, password) FROM stdin;
8ca10aea-7451-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	cat-project	git	cat-hub	cat-master		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
81838d7e-3ecb-4989-ad9c-ca156a538391	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	virus-project	git	git@github.com:ion-channel/eicar.git	master		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
8ca10aea-7449-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	no-virus-project	git	cat-hub	cat-mini		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
a4d92c7e-1678-411a-9f6f-03d4d50ceb0d	bdfda532-4450-4b64-8150-338d72fb4f41	003c6378-c8ef-4a74-9bc1-334e95d24d2b	dog-project	git	dog-hub	dog-master		t	dog-channel	2018-05-31 16:59:34.687187	2018-05-31 16:59:34.687187		f			\N	\N
8ca10aea-7448-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	many-virus-project	git	cat-hub	cat-minion		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
\.


COPY aliases (id, name, created_at, updated_at, version, org) FROM stdin;
\.


COPY aliases_projects (id, alias_id, project_id) FROM stdin;
\.


COPY tags (id, team_id, name, description, created_at, updated_at) FROM stdin;
\.


COPY projects_tags (id, tag_id, project_id) FROM stdin;
\.
