CREATE DATABASE waldorf WITH TEMPLATE = template0 OWNER = postgres;

\connect waldorf

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- rule_evaluations
--

CREATE TABLE rule_evaluations (
    project_id character varying,
    team_id character varying,
    analysis_id character varying NOT NULL,
    rule_evaluation_summary json,
    rule_eval_created_at character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

ALTER TABLE rule_evaluations OWNER TO postgres;
CREATE INDEX index_rule_evaluations_on_analysis_id ON rule_evaluations USING btree (analysis_id);
CREATE INDEX trifecta_of_doom ON rule_evaluations USING btree (team_id, project_id, analysis_id);


--
-- rules
--

CREATE TABLE rules (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    scan_type character varying,
    name character varying,
    description text,
    category character varying,
    policy_url character varying,
    remediation_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deprecated boolean
);

ALTER TABLE rules OWNER TO postgres;
ALTER TABLE ONLY rules ADD CONSTRAINT rules_pkey PRIMARY KEY (id);
CREATE INDEX index_rules_on_id ON rules USING btree (id);


--
-- rulesets
--

CREATE TABLE rulesets (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    team_id character varying,
    name character varying,
    description character varying,
    rule_ids json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

ALTER TABLE rulesets OWNER TO postgres;
ALTER TABLE ONLY rulesets ADD CONSTRAINT rulesets_pkey PRIMARY KEY (id);
CREATE INDEX index_rulesets_on_id ON rulesets USING btree (id);
CREATE INDEX index_rulesets_on_id_and_team_id ON rulesets USING btree (id, team_id);


--
-- rulesets_rules
--

CREATE TABLE rulesets_rules (
    ruleset_id uuid,
    rule_id uuid,
    threshold json
);

ALTER TABLE rulesets_rules OWNER TO postgres;
CREATE INDEX index_rulesets_rules_on_ruleset_id_and_rule_id ON rulesets_rules USING btree (ruleset_id, rule_id);



--
-- Data
--
--

COPY rule_evaluations (project_id, team_id, analysis_id, rule_evaluation_summary, rule_eval_created_at, created_at, updated_at)
FROM '/docker-entrypoint-initdb.d/evaluations.csv' WITH DELIMITER AS ';' ESCAPE '/' CSV HEADER;

COPY rules (id, scan_type, name, description, category, policy_url, remediation_url, created_at, updated_at, deprecated)
FROM '/docker-entrypoint-initdb.d/rules.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY rulesets (id, team_id, name, description, rule_ids, created_at, updated_at)
FROM '/docker-entrypoint-initdb.d/rulesets.csv' WITH DELIMITER AS ',' CSV HEADER;

COPY rulesets_rules (ruleset_id, rule_id)
FROM '/docker-entrypoint-initdb.d/rulesets_rules.csv' WITH DELIMITER AS ',' CSV HEADER;
