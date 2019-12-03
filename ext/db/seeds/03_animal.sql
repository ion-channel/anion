CREATE DATABASE animal WITH TEMPLATE = template0 OWNER = postgres;

\connect animal

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';

--
-- analyses
--

CREATE TABLE analyses (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id character varying,
    project_id character varying,
    build_number integer,
    name character varying,
    text character varying,
    type character varying,
    source character varying,
    branch character varying,
    description text,
    status character varying,
    ruleset_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    duration double precision DEFAULT 0.0,
    trigger_hash text DEFAULT ''::text,
    trigger_text text DEFAULT ''::text,
    trigger_author text DEFAULT ''::text,
    suspect boolean,
    public boolean DEFAULT false
);

ALTER TABLE analyses OWNER TO postgres;
ALTER TABLE ONLY analyses ADD CONSTRAINT analyses_pkey PRIMARY KEY (id);
CREATE INDEX index_analyses_on_id_and_team_id_and_project_id ON analyses USING btree (id, team_id, project_id);

--
-- Name: scans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE scans (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    analysis_id uuid,
    team_id character varying,
    project_id character varying,
    description text DEFAULT 'This scan data has not been evaluated against a rule.'::text,
    name text,
    summary text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    results json DEFAULT '{}'::json NOT NULL,
    duration double precision DEFAULT 0.0
);

ALTER TABLE scans OWNER TO postgres;
ALTER TABLE ONLY scans ADD CONSTRAINT scans_pkey PRIMARY KEY (id);
CREATE INDEX index_scans_on_analysis_id ON scans USING btree (analysis_id);
CREATE INDEX index_scans_on_analysis_id_and_team_id_and_project_id ON scans USING btree (analysis_id, team_id, project_id);



--
-- Data
--

COPY analyses (id, team_id, project_id, build_number, name, text, type, source, branch, description, status, ruleset_id, created_at, updated_at, duration, trigger_hash, trigger_text, trigger_author, suspect, public)
FROM '/docker-entrypoint-initdb.d/analyses.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY scans (id, analysis_id, team_id, project_id, description, name, summary, created_at, updated_at, results, duration)
FROM '/docker-entrypoint-initdb.d/scans.csv' WITH DELIMITER AS ';' ESCAPE '/' CSV HEADER;
