CREATE DATABASE kermit WITH TEMPLATE = template0 OWNER = postgres;

\connect kermit;

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

--
-- analysis_statuses
--

CREATE TABLE analysis_statuses (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id text,
    project_id text,
    build_number text,
    status text,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    branch character varying DEFAULT 'master'::character varying NOT NULL,
    unreachable_error boolean DEFAULT false
);


ALTER TABLE analysis_statuses OWNER TO postgres;
ALTER TABLE ONLY analysis_statuses ADD CONSTRAINT analysis_statuses_pkey PRIMARY KEY (id);

--
-- deliveries
--

CREATE TABLE deliveries (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    analysis_id text,
    team_id text,
    project_id text,
    destination text,
    status text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    filename character varying,
    label character varying,
    hazh character varying,
    message character varying
);


ALTER TABLE deliveries OWNER TO postgres;
ALTER TABLE ONLY deliveries ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);

--
-- scan_statuses
--

CREATE TABLE scan_statuses (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    analysis_status_id uuid,
    team_id text,
    project_id text,
    name text,
    read text,
    status text,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE scan_statuses OWNER TO postgres;
ALTER TABLE ONLY scan_statuses ADD CONSTRAINT scan_statuses_pkey PRIMARY KEY (id);



--
-- Data
--

COPY analysis_statuses (id, team_id, project_id, build_number, status, message, created_at, updated_at, branch)
FROM '/docker-entrypoint-initdb.d/analysis_statuses.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY deliveries (id, analysis_id, team_id, project_id, destination, status, created_at, updated_at, filename, label, hazh, message)
FROM '/docker-entrypoint-initdb.d/deliveries.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY scan_statuses (id, analysis_status_id, team_id, project_id, name, read, status, message, created_at, updated_at)
FROM '/docker-entrypoint-initdb.d/scan_statuses.csv' WITH DELIMITER AS ',' CSV HEADER;
