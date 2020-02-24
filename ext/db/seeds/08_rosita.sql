CREATE DATABASE rosita WITH TEMPLATE = template0 OWNER = postgres;

\connect rosita

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- product_queries
--

CREATE TABLE product_queries (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	query text,
	found bool,
	verified bool DEFAULT false,
	last_queried timestamp(6) NULL,
	better_query text,
	value json
);

ALTER TABLE product_queries OWNER TO postgres;
ALTER TABLE product_queries ADD PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE;
CREATE UNIQUE INDEX  product_queries_index ON product_queries USING btree(query);

--
-- repo_queries
--

DROP TABLE IF EXISTS repo_queries;
CREATE TABLE repo_queries (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	query text,
	found bool,
	verified bool DEFAULT false,
	last_queried timestamp(6) NULL,
	better_query text,
	value json
);

ALTER TABLE repo_queries OWNER TO postgres;
ALTER TABLE repo_queries ADD PRIMARY KEY (id) NOT DEFERRABLE INITIALLY IMMEDIATE;
CREATE UNIQUE INDEX  repo_queries_index ON repo_queries USING btree(query);
