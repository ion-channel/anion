--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Database creation
--

CREATE DATABASE kermit WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE animal WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE bunsen WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE waldorf WITH TEMPLATE = template0 OWNER = postgres;


\connect animal

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: analyses; Type: TABLE; Schema: public; Owner: postgres
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
    suspect boolean
);


ALTER TABLE analyses OWNER TO postgres;

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

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Data for Name: analyses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY analyses (id, team_id, project_id, build_number, name, text, type, source, branch, description, status, ruleset_id, created_at, updated_at, duration, trigger_hash, trigger_text, trigger_author, suspect) FROM stdin;
87ccb240-1150-4cc7-8194-8bd5685b9b59	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	1	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.036733	14676.6540310018008				\N
1696f98c-474f-484d-9264-d6b2fd4fe2bd	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	2	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.137955	14676.6540310018008				\N
a826623e-af74-4372-90cd-582dac8194e7	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	3	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.226921	14676.6540310018008				\N
5822bb2b-9979-4800-bc0c-f09f71af2abb	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	4	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.326308	14676.6540310018008				\N
66b2d951-1983-485c-aca8-c901424eb4a1	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	5	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.423636	14676.6540310018008				\N
b7641c70-ac56-4e28-b5be-c0fe3d63b26a	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	6	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.527993	14676.6540310018008				\N
7c52cffe-a4e9-4b15-946b-506f4a3aa672	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	7	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.626128	14676.6540310018008				\N
51dc7eda-7238-42a4-b5bb-db8c609a8a69	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	8	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.723052	14676.6540310018008				\N
79493587-3ce2-448e-9a75-6286f114e773	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	9	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.815311	14676.6540310018008				\N
f4a0fbd7-3a64-46ab-a59b-78dd0aa5a713	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	10	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
17862ff3-3887-4135-baaa-b01cdd454107	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	11	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:34	2018-05-31 16:59:34.008828	14676.6540310018008				\N
82a4fd62-6eeb-4f9c-97cb-d9928d97c2fa	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	12	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:34	2018-05-31 16:59:34.103244	14676.6540310018008				\N
d9401f7a-703b-4179-abb6-a8ca674e0938	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	13	compliance analysis	\N	git	git@github.com:ion-channel/ionmockjavaapp.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:34	2018-05-31 16:59:34.194496	14676.6540310018008				\N
c32671c4-d76f-47a6-8902-ce6d81728b58	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	81838d7e-3ecb-4989-ad9c-ca156a538391	10	compliance analysis	\N	git	git@github.com:ion-channel/eicar.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
7074b7f2-8f3c-4494-9e1a-af858e536c57	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7448-4fba-920e-e0abab735071	11	compliance analysis	\N	git	git@github.com:ion-channel/eicar.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
00788850-9b58-4280-97f9-fd34281e022e	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	11	compliance analysis	\N	git	git@github.com:ion-channel/noeicar.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
4428a359-5f6f-445c-8f10-2ea5de800448	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	12	compliance analysis	\N	git	git@github.com:ion-channel/eicar.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
b182a814-c4c2-4c07-8c06-ec81104cdc95	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	12	compliance analysis	\N	git	git@github.com:ion-channel/eicar.git	master	somedescription	finished	85d05a6b-bc96-430e-8e81-ba87cab84230	2018-05-31 16:59:33	2018-05-31 16:59:33.916014	14676.6540310018008				\N
\.

-- b182a814-c4c2-4c07-8c06-ec81104cdc95
--
--
-- 81838d7e-3ecb-4989-ad9c-ca156a538391	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	virus-project	git	git@github.com:ion-channel/eicar.git	master		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
-- 8ca10aea-7449-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	no-virus-project	git	cat-hub	cat-mini		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
-- a4d92c7e-1678-411a-9f6f-03d4d50ceb0d	bdfda532-4450-4b64-8150-338d72fb4f41	003c6378-c8ef-4a74-9bc1-334e95d24d2b	dog-project	git	dog-hub	dog-master		t	dog-channel	2018-05-31 16:59:34.687187	2018-05-31 16:59:34.687187		f			\N	\N
-- 8ca10aea-7448-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	85d05a6b-bc96-430e-8e81-ba87cab84230	many-virus-project	git	cat-hub	cat-minion		t	cat-channel	2018-05-31 16:59:32.969012	2018-05-31 16:59:32.969012		f			\N	\N
--

--
-- Data for Name: scans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scans (id, analysis_id, team_id, project_id, description, name, summary, created_at, updated_at, results, duration) FROM stdin;
3a9374c4-063e-4fbb-a45b-d2fdfce5aa91	87ccb240-1150-4cc7-8194-8bd5685b9b59	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.064844	2018-05-31 16:59:33.064844	{"coverage":{"value":69.8}}	6000
e71292c0-6b57-456a-9293-4c959f18dff7	87ccb240-1150-4cc7-8194-8bd5685b9b59	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.08651	2018-05-31 16:59:33.08651	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
65ff7ebb-df00-44af-b5a8-37e40a70b56e	87ccb240-1150-4cc7-8194-8bd5685b9b59	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.111875	2018-05-31 16:59:33.111875	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
812439ee-0c8f-4633-9a6a-3576fbf349b9	1696f98c-474f-484d-9264-d6b2fd4fe2bd	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.157163	2018-05-31 16:59:33.157163	{"coverage":{"value":69.8}}	6000
a362f523-c508-4b57-9c4c-fc7d30bf9052	1696f98c-474f-484d-9264-d6b2fd4fe2bd	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.17668	2018-05-31 16:59:33.17668	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
a92d3608-5b74-4d76-a2f1-e3ec1fed3740	1696f98c-474f-484d-9264-d6b2fd4fe2bd	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.202351	2018-05-31 16:59:33.202351	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
af5d6b22-e4da-4e89-a349-c6f0f4ff5730	a826623e-af74-4372-90cd-582dac8194e7	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.245936	2018-05-31 16:59:33.245936	{"coverage":{"value":69.8}}	6000
9961f301-e66f-4b79-b785-4e703a92157a	a826623e-af74-4372-90cd-582dac8194e7	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.26737	2018-05-31 16:59:33.26737	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
ec827375-49e0-48fc-bfdc-167497063417	a826623e-af74-4372-90cd-582dac8194e7	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.289483	2018-05-31 16:59:33.289483	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
ee114068-3a7a-40ce-b4e8-2d1e89e12013	5822bb2b-9979-4800-bc0c-f09f71af2abb	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.345573	2018-05-31 16:59:33.345573	{"coverage":{"value":69.8}}	6000
ea22ea96-e8ef-4782-b4dd-665ba86c851a	5822bb2b-9979-4800-bc0c-f09f71af2abb	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.366169	2018-05-31 16:59:33.366169	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
6558c5b2-e5e5-4dfc-99cb-7341d796deb8	5822bb2b-9979-4800-bc0c-f09f71af2abb	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.391365	2018-05-31 16:59:33.391365	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
a7fdcd4b-c9bf-4eb6-b843-57e92cfbdc3a	66b2d951-1983-485c-aca8-c901424eb4a1	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.453447	2018-05-31 16:59:33.453447	{"coverage":{"value":69.8}}	6000
69ba6155-5491-444a-a76e-d7c9816b5645	66b2d951-1983-485c-aca8-c901424eb4a1	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.476061	2018-05-31 16:59:33.476061	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
f683ae2e-ae50-4b13-b74c-6dd182c5951f	66b2d951-1983-485c-aca8-c901424eb4a1	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.500847	2018-05-31 16:59:33.500847	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
b9e8fc17-6a25-468e-a280-37813ba69105	b7641c70-ac56-4e28-b5be-c0fe3d63b26a	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.548162	2018-05-31 16:59:33.548162	{"coverage":{"value":69.8}}	6000
3bc41b21-46d4-455c-b9d6-996db5cc92d4	b7641c70-ac56-4e28-b5be-c0fe3d63b26a	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.571021	2018-05-31 16:59:33.571021	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
cda07998-dc13-451b-a29f-111f4e9c4f58	b7641c70-ac56-4e28-b5be-c0fe3d63b26a	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.59611	2018-05-31 16:59:33.59611	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
6c166614-af8f-4d8d-ab6f-90199392882a	7c52cffe-a4e9-4b15-946b-506f4a3aa672	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.645867	2018-05-31 16:59:33.645867	{"coverage":{"value":69.8}}	6000
cc5c9fca-e5cc-44fe-a23b-0084dad10b02	7c52cffe-a4e9-4b15-946b-506f4a3aa672	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.668248	2018-05-31 16:59:33.668248	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
b97a3a01-6463-4fd8-86fa-26dccc4abe8d	7c52cffe-a4e9-4b15-946b-506f4a3aa672	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.693252	2018-05-31 16:59:33.693252	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
2bb07f58-39da-404d-80a7-5407f042ae60	51dc7eda-7238-42a4-b5bb-db8c609a8a69	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.741551	2018-05-31 16:59:33.741551	{"coverage":{"value":69.8}}	6000
e5068d06-ff69-4ff1-9800-38b9aca2fc1a	51dc7eda-7238-42a4-b5bb-db8c609a8a69	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.761612	2018-05-31 16:59:33.761612	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
d021e544-daf9-4262-8563-812b72299522	51dc7eda-7238-42a4-b5bb-db8c609a8a69	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.785023	2018-05-31 16:59:33.785023	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
5c23e23a-43b0-42f1-9ead-7f44784098c4	79493587-3ce2-448e-9a75-6286f114e773	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.835522	2018-05-31 16:59:33.835522	{"coverage":{"value":69.8}}	6000
40341031-3c65-4134-8655-4f08479361f5	79493587-3ce2-448e-9a75-6286f114e773	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.859219	2018-05-31 16:59:33.859219	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
35dcdbef-8e60-4dcf-b3f3-e805ed222381	79493587-3ce2-448e-9a75-6286f114e773	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.889166	2018-05-31 16:59:33.889166	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
1e2f54f8-8fb2-4ad6-abbb-7b5e0cea192c	f4a0fbd7-3a64-46ab-a59b-78dd0aa5a713	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:33.935661	2018-05-31 16:59:33.935661	{"coverage":{"value":69.8}}	6000
35b7e009-0376-4072-87e1-8b76ca220180	f4a0fbd7-3a64-46ab-a59b-78dd0aa5a713	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:33.955151	2018-05-31 16:59:33.955151	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
d434e462-13f6-42f2-a0da-fb2a91a42ffb	f4a0fbd7-3a64-46ab-a59b-78dd0aa5a713	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:33.979312	2018-05-31 16:59:33.979312	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
ab9be0d1-1eb6-49d6-936e-c1504f6b3bd7	17862ff3-3887-4135-baaa-b01cdd454107	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:34.028623	2018-05-31 16:59:34.028623	{"coverage":{"value":69.8}}	6000
8d31bdad-bc09-4d97-bf79-6e4af4edb94c	17862ff3-3887-4135-baaa-b01cdd454107	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:34.050398	2018-05-31 16:59:34.050398	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
5f1ab724-17de-4bcd-9b06-e960465bc6ab	17862ff3-3887-4135-baaa-b01cdd454107	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:34.075731	2018-05-31 16:59:34.075731	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
b31f7718-e461-4fb4-b51e-ea09c444f738	82a4fd62-6eeb-4f9c-97cb-d9928d97c2fa	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:34.123337	2018-05-31 16:59:34.123337	{"coverage":{"value":69.8}}	6000
d4dd29f0-266b-41c8-b881-738c81ed35ef	82a4fd62-6eeb-4f9c-97cb-d9928d97c2fa	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:34.142321	2018-05-31 16:59:34.142321	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
7bb2f27c-98e1-4eae-a51a-2f3bcbb9d907	82a4fd62-6eeb-4f9c-97cb-d9928d97c2fa	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:34.167809	2018-05-31 16:59:34.167809	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
4e985dad-5096-45c3-a918-3643e4cc2f0a	d9401f7a-703b-4179-abb6-a8ca674e0938	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	external_coverage	\N	2018-05-31 16:59:34.221016	2018-05-31 16:59:34.221016	{"coverage":{"value":69.8}}	6000
7a03c4b7-b4c0-41fd-bf64-005ce821ff0c	d9401f7a-703b-4179-abb6-a8ca674e0938	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	dependency	\N	2018-05-31 16:59:34.246486	2018-05-31 16:59:34.246486	{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}}	6000
234435b9-7b85-4ec4-99e3-12674dd300f5	d9401f7a-703b-4179-abb6-a8ca674e0938	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	This scan data has not been evaluated against a rule.	vulnerability	\N	2018-05-31 16:59:34.279019	2018-05-31 16:59:34.279019	{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":64149,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}}	6000
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
\.


--
-- Name: analyses analyses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analyses
    ADD CONSTRAINT analyses_pkey PRIMARY KEY (id);

 ALTER TABLE ONLY analyses ADD COLUMN "public" boolean DEFAULT false;

 UPDATE analyses SET "public" = true WHERE id = 'd9401f7a-703b-4179-abb6-a8ca674e0938';

--
-- Name: scans scans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scans
    ADD CONSTRAINT scans_pkey PRIMARY KEY (id);


--
-- Name: index_analyses_on_id_and_team_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_analyses_on_id_and_team_id_and_project_id ON analyses USING btree (id, team_id, project_id);


--
-- Name: index_scans_on_analysis_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_scans_on_analysis_id ON scans USING btree (analysis_id);


--
-- Name: index_scans_on_analysis_id_and_team_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_scans_on_analysis_id_and_team_id_and_project_id ON scans USING btree (analysis_id, team_id, project_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

\connect bunsen

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


SET search_path = public, pg_catalog;

--
-- Name: update_cv_pointers(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_cv_pointers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
          with latest_versions as (
            select max(modified_at) as mod
              from vulnerability_versions
             where external_id = NEW.external_id
          )
          insert into current_vulnerabilities
            (vulnerability_version_id, external_id, created_at, updated_at)
          select vv.id, vv.external_id,
            now() at time zone 'utc',
            now() at time zone 'utc'
          from latest_versions lv
          join vulnerability_versions vv
            on vv.modified_at = lv.mod
         where vv.external_id = NEW.external_id
          on conflict (external_id) do
           update set vulnerability_version_id = excluded.vulnerability_version_id,
            updated_at = now() at time zone 'utc'
          ;
          RETURN NEW;
      END;
      $$;


ALTER FUNCTION public.update_cv_pointers() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bunsen_nvd_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bunsen_nvd_versions (
    id integer NOT NULL,
    version_type character varying,
    version character varying,
    applied timestamp without time zone
);


ALTER TABLE bunsen_nvd_versions OWNER TO postgres;

--
-- Name: bunsen_nvd_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bunsen_nvd_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bunsen_nvd_versions_id_seq OWNER TO postgres;

--
-- Name: bunsen_nvd_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bunsen_nvd_versions_id_seq OWNED BY bunsen_nvd_versions.id;


--
-- Name: current_vulnerabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE current_vulnerabilities (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    vulnerability_version_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE current_vulnerabilities OWNER TO postgres;

--
-- Name: current_vulnerabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE current_vulnerabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE current_vulnerabilities_id_seq OWNER TO postgres;

--
-- Name: current_vulnerabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE current_vulnerabilities_id_seq OWNED BY current_vulnerabilities.id;


--
-- Name: dependencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dependencies (
    id integer NOT NULL,
    name character varying NOT NULL,
    org character varying DEFAULT ''::character varying NOT NULL,
    version character varying NOT NULL,
    up character varying,
    edition character varying,
    aliases character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    "references" json,
    part character varying,
    language character varying,
    external_id character varying NOT NULL,
    cpe23 character varying,
    target_hw character varying,
    target_sw character varying,
    sw_edition character varying,
    other character varying
);


ALTER TABLE dependencies OWNER TO postgres;

--
-- Name: dependencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dependencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dependencies_id_seq OWNER TO postgres;

--
-- Name: dependencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dependencies_id_seq OWNED BY dependencies.id;


--
-- Name: dependency_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dependency_sources (
    dependency_id integer,
    source_id integer
);


ALTER TABLE dependency_sources OWNER TO postgres;

--
-- Name: dependency_vulnerabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dependency_vulnerabilities (
    dependency_id integer,
    vulnerability_id integer
);


ALTER TABLE dependency_vulnerabilities OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sources (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    attribution text,
    license text,
    copyright_url character varying
);


ALTER TABLE sources OWNER TO postgres;

--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sources_id_seq OWNER TO postgres;

--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: vulnerability_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vulnerability_versions (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    title character varying NOT NULL,
    summary character varying NOT NULL,
    score numeric,
    vector character varying,
    access_complexity character varying,
    vulnerability_authentication character varying,
    confidentiality_impact character varying,
    integrity_impact character varying,
    availability_impact character varying,
    vulnerability_source character varying,
    assessment_check json,
    scanner json,
    recommendation character varying,
    "references" json,
    modified_at timestamp without time zone NOT NULL,
    published_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    score_version character varying DEFAULT '2.0'::character varying NOT NULL,
    score_system character varying DEFAULT 'CVSS'::character varying NOT NULL,
    score_details json DEFAULT '{}'::json NOT NULL
);


ALTER TABLE vulnerability_versions OWNER TO postgres;

--
-- Name: vulnerabilities; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW vulnerabilities AS
 SELECT cv.vulnerability_version_id AS id,
    cv.external_id,
    vv.title,
    vv.summary,
    vv.score,
    vv.score_version,
    vv.score_system,
    vv.score_details,
    vv.vector,
    vv.access_complexity,
    vv.vulnerability_authentication,
    vv.confidentiality_impact,
    vv.integrity_impact,
    vv.availability_impact,
    vv.vulnerability_source,
    vv.assessment_check,
    vv.scanner,
    vv.recommendation,
    vv."references",
    vv.modified_at,
    vv.published_at,
    vv.created_at,
    vv.updated_at
   FROM (current_vulnerabilities cv
     JOIN vulnerability_versions vv ON ((vv.id = cv.vulnerability_version_id)));


ALTER TABLE vulnerabilities OWNER TO postgres;

--
-- Name: vulnerability_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vulnerability_sources (
    vulnerability_id integer,
    source_id integer
);


ALTER TABLE vulnerability_sources OWNER TO postgres;

--
-- Name: vulnerability_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vulnerability_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vulnerability_versions_id_seq OWNER TO postgres;

--
-- Name: vulnerability_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vulnerability_versions_id_seq OWNED BY vulnerability_versions.id;


--
-- Name: bunsen_nvd_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bunsen_nvd_versions ALTER COLUMN id SET DEFAULT nextval('bunsen_nvd_versions_id_seq'::regclass);


--
-- Name: current_vulnerabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY current_vulnerabilities ALTER COLUMN id SET DEFAULT nextval('current_vulnerabilities_id_seq'::regclass);


--
-- Name: dependencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependencies ALTER COLUMN id SET DEFAULT nextval('dependencies_id_seq'::regclass);


--
-- Name: sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: vulnerability_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vulnerability_versions ALTER COLUMN id SET DEFAULT nextval('vulnerability_versions_id_seq'::regclass);


--
-- Data for Name: bunsen_nvd_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bunsen_nvd_versions (id, version_type, version, applied) FROM stdin;
\.


--
-- Name: bunsen_nvd_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bunsen_nvd_versions_id_seq', 1, false);


--
-- Data for Name: current_vulnerabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY current_vulnerabilities (id, external_id, vulnerability_version_id, created_at, updated_at) FROM stdin;
1	CVE-2014-1457	1	2018-05-31 16:59:55.493153	2018-05-31 16:59:55.493153
2	CVE-2012-1531	2	2018-05-31 16:59:58.355934	2018-05-31 16:59:58.355934
3	CVE-2012-3216	3	2018-05-31 16:59:59.525263	2018-05-31 16:59:59.525263
4	CVE-2016-3458	4	2018-05-31 17:00:00.010962	2018-05-31 17:00:00.010962
5	CVE-2016-0002	5	2018-05-31 17:00:01.340942	2018-05-31 17:00:01.340942
6	CVE-2015-3982	6	2018-05-31 17:00:02.632098	2018-05-31 17:00:02.632098
7	CVE-2015-3983	7	2018-05-31 17:00:03.96677	2018-05-31 17:00:03.96677
8	CVE-2013-0424	8	2018-05-31 17:00:06.041014	2018-05-31 17:00:06.041014
\.


--
-- Name: current_vulnerabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('current_vulnerabilities_id_seq', 8, true);


--
-- Data for Name: dependencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dependencies (id, name, org, version, up, edition, aliases, created_at, updated_at, title, "references", part, language, external_id, cpe23, target_hw, target_sw, sw_edition, other) FROM stdin;
1	testproduct001	testvendor001	testversion001	testupdate001	\N	\N	2018-05-31 16:59:24.663465	2018-05-31 16:59:24.663465	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion001:testUpdate001	\N	\N	\N	\N	\N
2	testproduct001	testvendor001	testversion002	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion002:testUpdate001	\N	\N	\N	\N	\N
3	testproduct001	testvendor001	testversion003	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion003:testUpdate001	\N	\N	\N	\N	\N
4	testproduct001	testvendor001	testversion004	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion004:testUpdate001	\N	\N	\N	\N	\N
5	testproduct001	testvendor001	testversion005	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion005:testUpdate001	\N	\N	\N	\N	\N
6	testproduct001	testvendor001	testversion006	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion006:testUpdate001	\N	\N	\N	\N	\N
7	testproduct001	testvendor001	testversion007	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion007:testUpdate001	\N	\N	\N	\N	\N
8	testproduct001	testvendor001	testversion008	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion008:testUpdate001	\N	\N	\N	\N	\N
9	testproduct001	testvendor001	testversion009	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion009:testUpdate001	\N	\N	\N	\N	\N
10	testproduct001	testvendor001	testversion010	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion010:testUpdate001	\N	\N	\N	\N	\N
11	testproduct001	testvendor001	testversion011	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion011:testUpdate001	\N	\N	\N	\N	\N
12	testproduct001	testvendor001	testversion012	testupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:testVendor001:testProduct001:testVersion012:testUpdate001	\N	\N	\N	\N	\N
13	sometestproduct001	sometestvendor001	sometestversion001	sometestupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:sometestVendor001:sometestProduct001:sometestVersion001:sometestUpdate001	\N	\N	\N	\N	\N
14	sometestproduct001	sometestvendor002	sometestversion001	sometestupdate001	\N	\N	2018-05-31 16:59:24.72565	2018-05-31 16:59:24.72565	\N	\N	\N	\N	cpe:/a:sometestVendor002:sometestProduct001:sometestVersion001:sometestUpdate001	\N	\N	\N	\N	\N
15	jdk	oracle	1.6.0	update_71	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Oracle JDK 1.6.0 Update 71	[{"April 2014 CPU":"http://www.oracle.com/technetwork/topics/security/cpuapr2014-1972952.html"}]	/a	*	cpe:/a:oracle:jdk:1.6.0:update_71	cpe:2.3:a:oracle:jdk:1.6.0:update_71:*:*:*:*:*:*	*	*	*	*
16	jdk	oracle	1.7.0	update_71	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Oracle JDK 1.7.0 Update 71	[{"January 2015 CPU":"http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html"}]	/a	*	cpe:/a:oracle:jdk:1.7.0:update_71	cpe:2.3:a:oracle:jdk:1.7.0:update_71:*:*:*:*:*:*	*	*	*	*
17	jdk	oracle	1.8.0	update_73	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Oracle JDK 1.8.0 Update 73	[{"Advisory":"http://www.oracle.com/technetwork/topics/security/linuxbulletinapr2016-2952096.html"}]	/a	*	cpe:/a:oracle:jdk:1.8.0:update_73	cpe:2.3:a:oracle:jdk:1.8.0:update_73:*:*:*:*:*:*	*	*	*	*
18	jdk	oracle	1.7.0	update_72	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Oracle JDK 1.7.0 update72	[{"January 2015 CPU":"http://www.oracle.com/technetwork/topics/security/cpujan2015-1972971.html"}]	/a	*	cpe:/a:oracle:jdk:1.7.0:update_72	cpe:2.3:a:oracle:jdk:1.7.0:update_72:*:*:*:*:*:*	*	*	*	*
20	jdk	oracle	1.4.2_40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Oracle JDK 1.4.2_40	[]	/a	*	cpe:/a:oracle:jdk:1.4.2_40	cpe:2.3:a:oracle:jdk:1.4.2_40:*:*:*:*:*:*:*	*	*	*	*
24	$0.99_kindle_books	$0.99_kindle_books_project	6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	$0.99 Kindle Books project $0.99 Kindle Books (aka com.kindle.books.for99) for android 6.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.kindle.books.for99"},{"Government Advisory":"https://docs.google.com/spreadsheets/d/1t5GXwjw82SyunALVJb2w0zi3FoLRIkfGPc7AMjRF0r4/edit?pli=1#gid=1053404143"}]	/a	*	cpe:/a:%240.99_kindle_books_project:%240.99_kindle_books:6::~~~android~~	cpe:2.3:a:\\$0.99_kindle_books_project:\\$0.99_kindle_books:6:*:*:*:*:android:*:*	*	*	*	*
25	1024_cms	1024cms	0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 0.7	[]	/a	*	cpe:/a:1024cms:1024_cms:0.7	cpe:2.3:a:1024cms:1024_cms:0.7:*:*:*:*:*:*:*	*	*	*	*
26	1024_cms	1024cms	1.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 1.2.5	[]	/a	*	cpe:/a:1024cms:1024_cms:1.2.5	cpe:2.3:a:1024cms:1024_cms:1.2.5:*:*:*:*:*:*:*	*	*	*	*
27	1024_cms	1024cms	1.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 1.3.1	[]	/a	*	cpe:/a:1024cms:1024_cms:1.3.1	cpe:2.3:a:1024cms:1024_cms:1.3.1:*:*:*:*:*:*:*	*	*	*	*
28	1024_cms	1024cms	1.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 1.4.1	[]	/a	*	cpe:/a:1024cms:1024_cms:1.4.1	cpe:2.3:a:1024cms:1024_cms:1.4.1:*:*:*:*:*:*:*	*	*	*	*
29	1024_cms	1024cms	1.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 1.4.2	[]	/a	*	cpe:/a:1024cms:1024_cms:1.4.2	cpe:2.3:a:1024cms:1024_cms:1.4.2:*:*:*:*:*:*:*	*	*	*	*
30	1024_cms	1024cms	1.4.2	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 1.4.2 beta	[]	/a	*	cpe:/a:1024cms:1024_cms:1.4.2:beta	cpe:2.3:a:1024cms:1024_cms:1.4.2:beta:*:*:*:*:*:*	*	*	*	*
31	1024_cms	1024cms	2.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1024cms.org 1024 CMS 2.1.1	[]	/a	*	cpe:/a:1024cms:1024_cms:2.1.1	cpe:2.3:a:1024cms:1024_cms:2.1.1:*:*:*:*:*:*:*	*	*	*	*
32	11in1	11in1	1.2.1	stable_12-31-2011	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	11in1 1.2.1 stable 12-31-2011	[]	/a	*	cpe:/a:11in1:11in1:1.2.1:stable_12-31-2011	cpe:2.3:a:11in1:11in1:1.2.1:stable_12-31-2011:*:*:*:*:*:*	*	*	*	*
33	zombie_diary	129zou	1.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	129zou Zombie Diary (aka com.ezjoy.feelingtouch.zombiediary) for android 1.2.2	[{"Product information":"https://play.google.com/store/apps/details?id=com.ezjoy.feelingtouch.zombiediary"},{"Vendor website":"http://129zou.com"}]	/a	*	cpe:/a:129zou:zombie_diary:1.2.2::~~~android~~	cpe:2.3:a:129zou:zombie_diary:1.2.2:*:*:*:*:android:*:*	*	*	*	*
78	3c16115-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム WebCache 1000	[]	/a	*	cpe:/a:3com:3c16115-us:-	cpe:2.3:a:3com:3c16115-us:-:*:*:*:*:*:*:*	*	*	*	*
21	jdk	oracle	1.5.0	update_36		\N	2018-05-31 16:59:43	2018-05-31 17:00:05.655076	Oracle Jdk 1.5.0	[]	/a		cpe:/a:oracle:jdk:1.5.0:update_36	cpe:2.3:a:oracle:jdk:1.5.0:update_36:*:*:*:*:*:*	*	*	*	*
22	jdk	oracle	1.5.0	update_38		\N	2018-05-31 16:59:43	2018-05-31 17:00:05.659869	Oracle Jdk 1.5.0	[]	/a		cpe:/a:oracle:jdk:1.5.0:update_38	cpe:2.3:a:oracle:jdk:1.5.0:update_38:*:*:*:*:*:*	*	*	*	*
19	jdk	oracle	1.4.2_38			\N	2018-05-31 16:59:43	2018-05-31 17:00:05.830973	Oracle Jdk 1.4.2_38	[]	/a		cpe:/a:oracle:jdk:1.4.2_38	cpe:2.3:a:oracle:jdk:1.4.2_38:*:*:*:*:*:*:*	*	*	*	*
34	login_rebuilder	12net	1.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.0.0	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.0.0::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.0.0:*:*:*:*:wordpress:*:*	*	*	*	*
35	login_rebuilder	12net	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.0.1	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.0.1::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.0.1:*:*:*:*:wordpress:*:*	*	*	*	*
36	login_rebuilder	12net	1.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.0.2	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.0.2::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.0.2:*:*:*:*:wordpress:*:*	*	*	*	*
37	login_rebuilder	12net	1.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.0.3	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.0.3::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.0.3:*:*:*:*:wordpress:*:*	*	*	*	*
38	login_rebuilder	12net	1.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.1.0	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.1.0::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.1.0:*:*:*:*:wordpress:*:*	*	*	*	*
39	login_rebuilder	12net	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.1.1	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.1.1::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.1.1:*:*:*:*:wordpress:*:*	*	*	*	*
40	login_rebuilder	12net	1.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.1.2	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.1.2::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.1.2:*:*:*:*:wordpress:*:*	*	*	*	*
41	login_rebuilder	12net	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.1.3	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.1.3::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.1.3:*:*:*:*:wordpress:*:*	*	*	*	*
42	login_rebuilder	12net	1.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.2.0	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.2.0::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.2.0:*:*:*:*:wordpress:*:*	*	*	*	*
43	login_rebuilder	12net	1.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.2.1	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.2.1::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.2.1:*:*:*:*:wordpress:*:*	*	*	*	*
44	login_rebuilder	12net	1.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.2.2	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.2.2::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.2.2:*:*:*:*:wordpress:*:*	*	*	*	*
45	login_rebuilder	12net	1.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	12net Login Rebuilder (login_rebuilder) for WordPress 1.2.3	[{"product changelog":"http://wordpress.org/plugins/login-rebuilder/changelog/"},{"vendor website":"http://12net.jp"}]	/a	*	cpe:/a:12net:login_rebuilder:1.2.3::~~~wordpress~~	cpe:2.3:a:12net:login_rebuilder:1.2.3:*:*:*:*:wordpress:*:*	*	*	*	*
46	flight_manager	133	4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	133 Flight Manager (aka com.flightmanager.view) for android 4.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.flightmanager.view"},{"Vendor website":"http://www.133.cn"}]	/a	*	cpe:/a:133:flight_manager:4::~~~android~~	cpe:2.3:a:133:flight_manager:4:*:*:*:*:android:*:*	*	*	*	*
47	netease_movie	163	4.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	163 netease movie (aka com.netease.movie) for Android 4.7.2	[{"Product Information":"https://play.google.com/store/apps/details?id=com.netease.movie"},{"Vendor Website":"http://www.163.com/"}]	/a	*	cpe:/a:163:netease_movie:4.7.2::~~~android~~	cpe:2.3:a:163:netease_movie:4.7.2:*:*:*:*:android:*:*	*	*	*	*
48	1800contacts_app	1800contacts	2.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1800contacts 1800CONTACTS App (aka com.contacts1800.ecomapp) for Android 2.7.0	[{"product information":"https://play.google.com/store/apps/details?id=com.contacts1800.ecomapp"},{"vendor website":"http://www.1800contacts.com/"}]	/a	*	cpe:/a:1800contacts:1800contacts_app:2.7.0::~~~android~~	cpe:2.3:a:1800contacts:1800contacts_app:2.7.0:*:*:*:*:android:*:*	*	*	*	*
49	qianxun_yingshi	1kxun	1.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1kxun QianXun YingShi (com.qianxun.yingshi) application 1.2.3 	[]	/a	*	cpe:/a:1kxun:qianxun_yingshi:1.2.3	cpe:2.3:a:1kxun:qianxun_yingshi:1.2.3:*:*:*:*:*:*:*	*	*	*	*
50	qianxun_yingshi	1kxun	1.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	1kxun QianXun YingShi (com.qianxun.yingshi) application 1.3.4	[]	/a	*	cpe:/a:1kxun:qianxun_yingshi:1.3.4	cpe:2.3:a:1kxun:qianxun_yingshi:1.3.4:*:*:*:*:*:*:*	*	*	*	*
51	2g_live_tv	2g_live_tv_project	0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2G Live Tv Project 2G Live Tv (aka com.ww2GLiveTv) for Android 0.9	[{"Product Information":"https://play.google.com/store/apps/details?id=com.ww2GLiveTv"}]	/a	*	cpe:/a:2g_live_tv_project:2g_live_tv:0.9::~~~android~~	cpe:2.3:a:2g_live_tv_project:2g_live_tv:0.9:*:*:*:*:android:*:*	*	*	*	*
52	com_sexypolling	2glux	0.9.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.1	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.1:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.1:-:-:*:-:joomla\\!:*:*	*	*	-	*
53	com_sexypolling	2glux	0.9.2	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.2	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.2:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.2:-:-:*:-:joomla\\!:*:*	*	*	-	*
79	3c16115-us	3com	2.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com WebCache 1000 2.01	[]	/a	*	cpe:/a:3com:3c16115-us:2.01	cpe:2.3:a:3com:3c16115-us:2.01:*:*:*:*:*:*:*	*	*	*	*
2711	jdk	oracle	1.6.0	update_31		\N	2018-05-31 16:59:57.047653	2018-05-31 16:59:57.047653	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_31	\N	\N	\N	\N	\N
54	com_sexypolling	2glux	0.9.4	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.4	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.4:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.4:-:-:*:-:joomla\\!:*:*	*	*	-	*
55	com_sexypolling	2glux	0.9.5	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.5	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.5:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.5:-:-:*:-:joomla\\!:*:*	*	*	-	*
56	com_sexypolling	2glux	0.9.6	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.6	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.6:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.6:-:-:*:-:joomla\\!:*:*	*	*	-	*
57	com_sexypolling	2glux	0.9.7	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 0.9.7	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:0.9.7:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:0.9.7:-:-:*:-:joomla\\!:*:*	*	*	-	*
58	com_sexypolling	2glux	1.0.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.1	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.1:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.1:-:-:*:-:joomla\\!:*:*	*	*	-	*
59	com_sexypolling	2glux	1.0.2	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.2	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.2:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.2:-:-:*:-:joomla\\!:*:*	*	*	-	*
60	com_sexypolling	2glux	1.0.3	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.3	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.3:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.3:-:-:*:-:joomla\\!:*:*	*	*	-	*
61	com_sexypolling	2glux	1.0.4	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.4	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.4:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.4:-:-:*:-:joomla\\!:*:*	*	*	-	*
62	com_sexypolling	2glux	1.0.5	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.5	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.5:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.5:-:-:*:-:joomla\\!:*:*	*	*	-	*
63	com_sexypolling	2glux	1.0.6	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.6	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.6:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.6:-:-:*:-:joomla\\!:*:*	*	*	-	*
64	com_sexypolling	2glux	1.0.7	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.7	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.7:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.7:-:-:*:-:joomla\\!:*:*	*	*	-	*
65	com_sexypolling	2glux	1.0.8	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.8	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.8:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.8:-:-:*:-:joomla\\!:*:*	*	*	-	*
66	com_sexypolling	2glux	1.0.9	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2Glux Sexy Polling (com_sexypolling) component for Joomla! 1.0.9	[{"version information":"https://code.google.com/p/sexy-polling/downloads/list"},{"product information":"http://2glux.com/projects/sexypolling"}]	/a	*	cpe:/a:2glux:com_sexypolling:1.0.9:-:~-~-~joomla%21~~	cpe:2.3:a:2glux:com_sexypolling:1.0.9:-:-:*:-:joomla\\!:*:*	*	*	-	*
67	dr._sheikh_adnan_ibrahim	2rv	1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	2rv Dr. Sheikh Adnan Ibrahim (aka com.amitaff.adnanIbrahim) for android 1.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.amitaff.adnanIbrahim"},{"Vendor website":"http://www.2rv.us"}]	/a	*	cpe:/a:2rv:dr._sheikh_adnan_ibrahim:1::~~~android~~	cpe:2.3:a:2rv:dr._sheikh_adnan_ibrahim:1:*:*:*:*:android:*:*	*	*	*	*
68	30a	30a	5.26.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	30A 30A (aka com.app30a) for Android 5.26.2	[{"Product Information":"https://play.google.com/store/apps/details?id=com.app30a"},{"Vendor Website":"http://30a.com/"}]	/a	*	cpe:/a:30a:30a:5.26.2::~~~android~~	cpe:2.3:a:30a:30a:5.26.2:*:*:*:*:android:*:*	*	*	*	*
69	141701	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Hiper ARC	[]	/h	*	cpe:/h:3com:141701:-	cpe:2.3:h:3com:141701:-:*:*:*:*:*:*:*	*	*	*	*
70	3c13612	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Router 3012	[]	/h	*	cpe:/h:3com:3c13612:-	cpe:2.3:h:3com:3c13612:-:*:*:*:*:*:*:*	*	*	*	*
71	3c13613	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Router 3013	[]	/h	*	cpe:/h:3com:3c13613:-	cpe:2.3:h:3com:3c13613:-:*:*:*:*:*:*:*	*	*	*	*
72	3c13616	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Router 3016	[]	/h	*	cpe:/h:3com:3c13616:-	cpe:2.3:h:3com:3c13616:-:*:*:*:*:*:*:*	*	*	*	*
73	3c13700	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Router 5009	[]	/h	*	cpe:/h:3com:3c13700:-	cpe:2.3:h:3com:3c13700:-:*:*:*:*:*:*:*	*	*	*	*
74	3c13750	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Router 5231	[]	/h	*	cpe:/h:3com:3c13750:-	cpe:2.3:h:3com:3c13750:-:*:*:*:*:*:*:*	*	*	*	*
75	3c13754	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Router 5640	[]	/h	*	cpe:/h:3com:3c13754:-	cpe:2.3:h:3com:3c13754:-:*:*:*:*:*:*:*	*	*	*	*
76	3c13758	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Router 5680	[]	/h	*	cpe:/h:3com:3c13758:-	cpe:2.3:h:3com:3c13758:-:*:*:*:*:*:*:*	*	*	*	*
77	3c15100d	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Network Supervisor	[]	/a	*	cpe:/a:3com:3c15100d:-	cpe:2.3:a:3com:3c15100d:-:*:*:*:*:*:*:*	*	*	*	*
80	3c16116-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム WebCache 3000	[]	/a	*	cpe:/a:3com:3c16116-us:-	cpe:2.3:a:3com:3c16116-us:-:*:*:*:*:*:*:*	*	*	*	*
81	3c16116-us	3com	2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム WebCache 3000 2.0	[]	/a	*	cpe:/a:3com:3c16116-us:2.0	cpe:2.3:a:3com:3c16116-us:2.0:*:*:*:*:*:*:*	*	*	*	*
82	3c16450-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com PS Hub 50	[]	/h	*	cpe:/h:3com:3c16450-us:-	cpe:2.3:h:3com:3c16450-us:-:*:*:*:*:*:*:*	*	*	*	*
83	3c16450-us	3com	2.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム PS Hub 50 2.15	[]	/h	*	cpe:/h:3com:3c16450-us:2.15	cpe:2.3:h:3com:3c16450-us:2.15:*:*:*:*:*:*:*	*	*	*	*
84	3c16450-us	3com	2.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com PS Hub 50 2.16	[]	/h	*	cpe:/h:3com:3c16450-us:2.16	cpe:2.3:h:3com:3c16450-us:2.16:*:*:*:*:*:*:*	*	*	*	*
85	3c16479	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Baseline Switch 2824	[]	/h	*	cpe:/h:3com:3c16479:-	cpe:2.3:h:3com:3c16479:-:*:*:*:*:*:*:*	*	*	*	*
86	3c16485	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Baseline Switch 2816	[]	/h	*	cpe:/h:3com:3c16485:-	cpe:2.3:h:3com:3c16485:-:*:*:*:*:*:*:*	*	*	*	*
87	3c16486	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Baseline Switch 2848-SFP Plus	[]	/h	*	cpe:/h:3com:3c16486:-	cpe:2.3:h:3com:3c16486:-:*:*:*:*:*:*:*	*	*	*	*
88	3c16486	3com	1.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Baseline Switch 2848-SFP Plus 1.0.2	[]	/h	*	cpe:/h:3com:3c16486:1.0.2	cpe:2.3:h:3com:3c16486:1.0.2:*:*:*:*:*:*:*	*	*	*	*
89	3c16811-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 4007	[]	/h	*	cpe:/h:3com:3c16811-us:-	cpe:2.3:h:3com:3c16811-us:-:*:*:*:*:*:*:*	*	*	*	*
90	3c16950-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Switch 1100	[]	/h	*	cpe:/h:3com:3c16950-us:-	cpe:2.3:h:3com:3c16950-us:-:*:*:*:*:*:*:*	*	*	*	*
91	3c16950-us	3com	2.67	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 1100 2.67	[]	/h	*	cpe:/h:3com:3c16950-us:2.67	cpe:2.3:h:3com:3c16950-us:2.67:*:*:*:*:*:*:*	*	*	*	*
92	3c16950-us	3com	2.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Switch 1100 2.68	[]	/h	*	cpe:/h:3com:3c16950-us:2.68	cpe:2.3:h:3com:3c16950-us:2.68:*:*:*:*:*:*:*	*	*	*	*
93	3c16986a-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 3300 TM	[]	/h	*	cpe:/h:3com:3c16986a-us:-	cpe:2.3:h:3com:3c16986a-us:-:*:*:*:*:*:*:*	*	*	*	*
94	3c16987a-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 3300 SM	[]	/h	*	cpe:/h:3com:3c16987a-us:-	cpe:2.3:h:3com:3c16987a-us:-:*:*:*:*:*:*:*	*	*	*	*
95	3c16988a-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 3300 MM	[]	/h	*	cpe:/h:3com:3c16988a-us:-	cpe:2.3:h:3com:3c16988a-us:-:*:*:*:*:*:*:*	*	*	*	*
96	3c17100-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 4300	[]	/h	*	cpe:/h:3com:3c17100-us:-	cpe:2.3:h:3com:3c17100-us:-:*:*:*:*:*:*:*	*	*	*	*
97	3c17203-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4400 24-Port	[]	/h	*	cpe:/h:3com:3c17203-us:-	cpe:2.3:h:3com:3c17203-us:-:*:*:*:*:*:*:*	*	*	*	*
98	3c17204-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 4400 48-Port	[]	/h	*	cpe:/h:3com:3c17204-us:-	cpe:2.3:h:3com:3c17204-us:-:*:*:*:*:*:*:*	*	*	*	*
99	3c17205-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4400 PWR	[]	/h	*	cpe:/h:3com:3c17205-us:-	cpe:2.3:h:3com:3c17205-us:-:*:*:*:*:*:*:*	*	*	*	*
100	3c17210-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 4400 FX	[]	/h	*	cpe:/h:3com:3c17210-us:-	cpe:2.3:h:3com:3c17210-us:-:*:*:*:*:*:*:*	*	*	*	*
101	3c17300	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4226T	[]	/h	*	cpe:/h:3com:3c17300:-	cpe:2.3:h:3com:3c17300:-:*:*:*:*:*:*:*	*	*	*	*
102	3c17302	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4250T	[]	/h	*	cpe:/h:3com:3c17302:-	cpe:2.3:h:3com:3c17302:-:*:*:*:*:*:*:*	*	*	*	*
103	3c17304	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4228G	[]	/h	*	cpe:/h:3com:3c17304:-	cpe:2.3:h:3com:3c17304:-:*:*:*:*:*:*:*	*	*	*	*
104	3c17400	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 3824	[]	/h	*	cpe:/h:3com:3c17400:-	cpe:2.3:h:3com:3c17400:-:*:*:*:*:*:*:*	*	*	*	*
105	3c17401	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 3812	[]	/h	*	cpe:/h:3com:3c17401:-	cpe:2.3:h:3com:3c17401:-:*:*:*:*:*:*:*	*	*	*	*
106	3c17701-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack 3 Switch 4924	[]	/h	*	cpe:/h:3com:3c17701-us:-	cpe:2.3:h:3com:3c17701-us:-:*:*:*:*:*:*:*	*	*	*	*
107	3c17702-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4900 SX	[]	/h	*	cpe:/h:3com:3c17702-us:-	cpe:2.3:h:3com:3c17702-us:-:*:*:*:*:*:*:*	*	*	*	*
108	3c17706-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4950	[]	/h	*	cpe:/h:3com:3c17706-us:-	cpe:2.3:h:3com:3c17706-us:-:*:*:*:*:*:*:*	*	*	*	*
109	3c17707-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 4070	[]	/h	*	cpe:/h:3com:3c17707-us:-	cpe:2.3:h:3com:3c17707-us:-:*:*:*:*:*:*:*	*	*	*	*
110	3c17708-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 4050	[]	/h	*	cpe:/h:3com:3c17708-us:-	cpe:2.3:h:3com:3c17708-us:-:*:*:*:*:*:*:*	*	*	*	*
111	3c17709-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Switch 4060	[]	/h	*	cpe:/h:3com:3c17709-us:-	cpe:2.3:h:3com:3c17709-us:-:*:*:*:*:*:*:*	*	*	*	*
112	3c250100a	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Switch 2500	[]	/h	*	cpe:/h:3com:3c250100a:-	cpe:2.3:h:3com:3c250100a:-:*:*:*:*:*:*:*	*	*	*	*
113	3c39024-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack II 3900	[]	/h	*	cpe:/h:3com:3c39024-us:-	cpe:2.3:h:3com:3c39024-us:-:*:*:*:*:*:*:*	*	*	*	*
114	3c6012-901	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 6012	[]	/h	*	cpe:/h:3com:3c6012-901:-	cpe:2.3:h:3com:3c6012-901:-:*:*:*:*:*:*:*	*	*	*	*
115	3c6012-902	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Switch 6012	[]	/h	*	cpe:/h:3com:3c6012-902:-	cpe:2.3:h:3com:3c6012-902:-:*:*:*:*:*:*:*	*	*	*	*
116	3c840-us	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com OfficeConnect ADSL Router 840	[]	/h	*	cpe:/h:3com:3c840-us:-	cpe:2.3:h:3com:3c840-us:-:*:*:*:*:*:*:*	*	*	*	*
117	3c8432	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack SI 432 Router	[]	/h	*	cpe:/h:3com:3c8432:-	cpe:2.3:h:3com:3c8432:-:*:*:*:*:*:*:*	*	*	*	*
118	3c8462	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack SI 462 Router	[]	/h	*	cpe:/h:3com:3c8462:-	cpe:2.3:h:3com:3c8462:-:*:*:*:*:*:*:*	*	*	*	*
119	3c8532	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack SI 532 Router	[]	/h	*	cpe:/h:3com:3c8532:-	cpe:2.3:h:3com:3c8532:-:*:*:*:*:*:*:*	*	*	*	*
2782	jdk	sun	1.5.0	update21		\N	2018-05-31 16:59:57.489928	2018-05-31 16:59:57.489928	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update21	\N	\N	\N	\N	\N
120	3cb9e16	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム CoreBuilder 9000	[]	/h	*	cpe:/h:3com:3cb9e16:-	cpe:2.3:h:3com:3cb9e16:-:*:*:*:*:*:*:*	*	*	*	*
121	3cdaemon	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3CDaemon	[]	/a	*	cpe:/a:3com:3cdaemon:-	cpe:2.3:a:3com:3cdaemon:-:*:*:*:*:*:*:*	*	*	*	*
122	3cnj220	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com IntelliJack Switch NJ220	[]	/h	*	cpe:/h:3com:3cnj220:-	cpe:2.3:h:3com:3cnj220:-:*:*:*:*:*:*:*	*	*	*	*
123	3cnj220	3com	2.0.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム IntelliJack Switch NJ220 2.0.22	[]	/h	*	cpe:/h:3com:3cnj220:2.0.22	cpe:2.3:h:3com:3cnj220:2.0.22:*:*:*:*:*:*:*	*	*	*	*
124	3cp4144	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Router 812	[]	/h	*	cpe:/h:3com:3cp4144:-	cpe:2.3:h:3com:3cp4144:-:*:*:*:*:*:*:*	*	*	*	*
125	3cp4144	3com	1.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com OfficeConnect ADSL Router 812 1.1.7	[]	/h	*	cpe:/h:3com:3cp4144:1.1.7	cpe:2.3:h:3com:3cp4144:1.1.7:*:*:*:*:*:*:*	*	*	*	*
126	3cp4144	3com	1.1.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Router 812 1.1.9	[]	/h	*	cpe:/h:3com:3cp4144:1.1.9	cpe:2.3:h:3com:3cp4144:1.1.9:*:*:*:*:*:*:*	*	*	*	*
127	3cp4144	3com	1.1.9.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect Remote 812 ADSL Router 1.1.9.4	[]	/h	*	cpe:/h:3com:3cp4144:1.1.9.4	cpe:2.3:h:3com:3cp4144:1.1.9.4:*:*:*:*:*:*:*	*	*	*	*
128	3cr29223	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com HomeConnect Cable Modem External with USB	[]	/h	*	cpe:/h:3com:3cr29223:-	cpe:2.3:h:3com:3cr29223:-:*:*:*:*:*:*:*	*	*	*	*
129	3cr860-95	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com OfficeConnect Secure Router	[]	/h	*	cpe:/h:3com:3cr860-95:-	cpe:2.3:h:3com:3cr860-95:-:*:*:*:*:*:*:*	*	*	*	*
130	3cradsl72	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Wireless Router 3CRADSL72	[]	/h	*	cpe:/h:3com:3cradsl72:-	cpe:2.3:h:3com:3cradsl72:-:*:*:*:*:*:*:*	*	*	*	*
131	3crtpx505-73	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IMS X505	[]	/h	*	cpe:/h:3com:3crtpx505-73:-	cpe:2.3:h:3com:3crtpx505-73:-:*:*:*:*:*:*:*	*	*	*	*
132	3crwe454g72	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com OfficeConnect Wireless11g Access Point	[]	/h	*	cpe:/h:3com:3crwe454g72:-	cpe:2.3:h:3com:3crwe454g72:-:*:*:*:*:*:*:*	*	*	*	*
133	3crwe454g72	3com	1.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.0.2	[]	/h	*	cpe:/h:3com:3crwe454g72:1.0.2	cpe:2.3:h:3com:3crwe454g72:1.0.2:*:*:*:*:*:*:*	*	*	*	*
134	3crwe454g72	3com	1.0.2.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.0.2.11	[]	/h	*	cpe:/h:3com:3crwe454g72:1.0.2.11	cpe:2.3:h:3com:3crwe454g72:1.0.2.11:*:*:*:*:*:*:*	*	*	*	*
135	3crwe454g72	3com	1.0.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.0.3.5	[]	/h	*	cpe:/h:3com:3crwe454g72:1.0.3.5	cpe:2.3:h:3com:3crwe454g72:1.0.3.5:*:*:*:*:*:*:*	*	*	*	*
136	3crwe454g72	3com	1.02.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.02.00	[]	/h	*	cpe:/h:3com:3crwe454g72:1.02.00	cpe:2.3:h:3com:3crwe454g72:1.02.00:*:*:*:*:*:*:*	*	*	*	*
137	3crwe454g72	3com	1.02.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.02.11	[]	/h	*	cpe:/h:3com:3crwe454g72:1.02.11	cpe:2.3:h:3com:3crwe454g72:1.02.11:*:*:*:*:*:*:*	*	*	*	*
138	3crwe454g72	3com	1.03.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.03.05	[]	/h	*	cpe:/h:3com:3crwe454g72:1.03.05	cpe:2.3:h:3com:3crwe454g72:1.03.05:*:*:*:*:*:*:*	*	*	*	*
139	3crwe454g72	3com	1.03.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.03.07	[]	/h	*	cpe:/h:3com:3crwe454g72:1.03.07	cpe:2.3:h:3com:3crwe454g72:1.03.07:*:*:*:*:*:*:*	*	*	*	*
140	3crwe454g72	3com	1.03.07a	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com OfficeConnect Wireless11g Access Point 3CRWE454G72 1.03.07A	[]	/h	*	cpe:/h:3com:3crwe454g72:1.03.07a	cpe:2.3:h:3com:3crwe454g72:1.03.07a:*:*:*:*:*:*:*	*	*	*	*
141	3crwe554g72t	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com OfficeConnect Wireless 11g Cable_DSL Router	[]	/h	*	cpe:/h:3com:3crwe554g72t:-	cpe:2.3:h:3com:3crwe554g72t:-:*:*:*:*:*:*:*	*	*	*	*
142	3crwe747a	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com AirConnect AP-4111	[]	/h	*	cpe:/h:3com:3crwe747a:-	cpe:2.3:h:3com:3crwe747a:-:*:*:*:*:*:*:*	*	*	*	*
143	3crwe754g72-a	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Wireless 11g Firewall Router	[]	/h	*	cpe:/h:3com:3crwe754g72-a:-	cpe:2.3:h:3com:3crwe754g72-a:-:*:*:*:*:*:*:*	*	*	*	*
144	3crwe754g72-a	3com	1.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Wireless 11g Firewall Router 1.13 firmware	[]	/h	*	cpe:/h:3com:3crwe754g72-a:1.13	cpe:2.3:h:3com:3crwe754g72-a:1.13:*:*:*:*:*:*:*	*	*	*	*
145	3crwe754g72-a	3com	1.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Wireless 11g Firewall Router 1.23 firmware	[]	/h	*	cpe:/h:3com:3crwe754g72-a:1.23	cpe:2.3:h:3com:3crwe754g72-a:1.23:*:*:*:*:*:*:*	*	*	*	*
146	3crwe754g72-a	3com	1.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com OfficeConnect ADSL Wireless 11g Firewall Router 1.24 firmware	[]	/h	*	cpe:/h:3com:3crwe754g72-a:1.24	cpe:2.3:h:3com:3crwe754g72-a:1.24:*:*:*:*:*:*:*	*	*	*	*
147	3crwe754g72-a	3com	1.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム OfficeConnect ADSL Wireless 11g Firewall Router 1.27 firmware	[]	/h	*	cpe:/h:3com:3crwe754g72-a:1.27	cpe:2.3:h:3com:3crwe754g72-a:1.27:*:*:*:*:*:*:*	*	*	*	*
148	3crx506-96	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IMS X506	[]	/h	*	cpe:/h:3com:3crx506-96:-	cpe:2.3:h:3com:3crx506-96:-:*:*:*:*:*:*:*	*	*	*	*
149	3cserver	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3CServer	[]	/a	*	cpe:/a:3com:3cserver:-	cpe:2.3:a:3com:3cserver:-:*:*:*:*:*:*:*	*	*	*	*
150	3cserver	3com	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3CServer 1.1	[]	/a	*	cpe:/a:3com:3cserver:1.1	cpe:2.3:a:3com:3cserver:1.1:*:*:*:*:*:*:*	*	*	*	*
151	3ctftpsvc	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3CTftpSvc	[]	/a	*	cpe:/a:3com:3ctftpsvc:-	cpe:2.3:a:3com:3ctftpsvc:-:*:*:*:*:*:*:*	*	*	*	*
152	3ctftpsvc	3com	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3CTftpSvc 2.0.1	[]	/a	*	cpe:/a:3com:3ctftpsvc:2.0.1	cpe:2.3:a:3com:3ctftpsvc:2.0.1:*:*:*:*:*:*:*	*	*	*	*
153	hiperarc	3com	4.2.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム Hiper ARC 4.2.29	[]	/h	*	cpe:/h:3com:hiperarc:4.2.29	cpe:2.3:h:3com:hiperarc:4.2.29:*:*:*:*:*:*:*	*	*	*	*
154	nbx_1000	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com NBX 1000	[]	/h	*	cpe:/h:3com:nbx_1000:-	cpe:2.3:h:3com:nbx_1000:-:*:*:*:*:*:*:*	*	*	*	*
155	netbuilder_2_bridge_router	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Netbuilder II Router	[]	/h	*	cpe:/h:3com:netbuilder_2_bridge_router:-	cpe:2.3:h:3com:netbuilder_2_bridge_router:-:*:*:*:*:*:*:*	*	*	*	*
156	superstack_3_switch_4924	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム SuperStack 3 Switch 4924d	[]	/h	*	cpe:/h:3com:superstack_3_switch_4924:-	cpe:2.3:h:3com:superstack_3_switch_4924:-:*:*:*:*:*:*:*	*	*	*	*
157	superstack_ii_2000	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com SuperStack II 200	[]	/h	*	cpe:/h:3com:superstack_ii_2000:-	cpe:2.3:h:3com:superstack_ii_2000:-:*:*:*:*:*:*:*	*	*	*	*
158	switch_4005	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 4005	[]	/h	*	cpe:/h:3com:switch_4005:-	cpe:2.3:h:3com:switch_4005:-:*:*:*:*:*:*:*	*	*	*	*
159	switch_4007r	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Switch 4007R	[]	/h	*	cpe:/h:3com:switch_4007r:-	cpe:2.3:h:3com:switch_4007r:-:*:*:*:*:*:*:*	*	*	*	*
160	tftp_server	3com	1.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3COM TFTP Server 1.05	[]	/a	*	cpe:/a:3com:tftp_server:1.05	cpe:2.3:a:3com:tftp_server:1.05:*:*:*:*:*:*:*	*	*	*	*
161	tippingpoint_200	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IMS 200	[]	/h	*	cpe:/h:3com:tippingpoint_200:-	cpe:2.3:h:3com:tippingpoint_200:-:*:*:*:*:*:*:*	*	*	*	*
162	tippingpoint_200e	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IMS 200E	[]	/h	*	cpe:/h:3com:tippingpoint_200e:-	cpe:2.3:h:3com:tippingpoint_200e:-:*:*:*:*:*:*:*	*	*	*	*
163	tippingpoint_2400e	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IMS 2400E	[]	/h	*	cpe:/h:3com:tippingpoint_2400e:-	cpe:2.3:h:3com:tippingpoint_2400e:-:*:*:*:*:*:*:*	*	*	*	*
164	tippingpoint_50	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IMS 50	[]	/h	*	cpe:/h:3com:tippingpoint_50:-	cpe:2.3:h:3com:tippingpoint_50:-:*:*:*:*:*:*:*	*	*	*	*
165	tippingpoint_5000e	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IMS 5000E	[]	/h	*	cpe:/h:3com:tippingpoint_5000e:-	cpe:2.3:h:3com:tippingpoint_5000e:-:*:*:*:*:*:*:*	*	*	*	*
166	tippingpoint_600e	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IMS 600E	[]	/h	*	cpe:/h:3com:tippingpoint_600e:-	cpe:2.3:h:3com:tippingpoint_600e:-:*:*:*:*:*:*:*	*	*	*	*
167	tippingpoint_ips	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS	[]	/a	*	cpe:/a:3com:tippingpoint_ips:-	cpe:2.3:a:3com:tippingpoint_ips:-:*:*:*:*:*:*:*	*	*	*	*
168	tippingpoint_ips	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS	[]	/h	*	cpe:/h:3com:tippingpoint_ips:-	cpe:2.3:h:3com:tippingpoint_ips:-:*:*:*:*:*:*:*	*	*	*	*
169	tippingpoint_ips_1200e	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS 1200E	[]	/h	*	cpe:/h:3com:tippingpoint_ips_1200e:-	cpe:2.3:h:3com:tippingpoint_ips_1200e:-:*:*:*:*:*:*:*	*	*	*	*
170	tippingpoint_ips_tos	3com	2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.1	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.1	cpe:2.3:a:3com:tippingpoint_ips_tos:2.1:*:*:*:*:*:*:*	*	*	*	*
171	tippingpoint_ips_tos	3com	2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.1	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.1	cpe:2.3:o:3com:tippingpoint_ips_tos:2.1:*:*:*:*:*:*:*	*	*	*	*
172	tippingpoint_ips_tos	3com	2.1.3.6323	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.1.3.6323	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.1.3.6323	cpe:2.3:a:3com:tippingpoint_ips_tos:2.1.3.6323:*:*:*:*:*:*:*	*	*	*	*
173	tippingpoint_ips_tos	3com	2.1.3.6323	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.1.3.6323	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.1.3.6323	cpe:2.3:o:3com:tippingpoint_ips_tos:2.1.3.6323:*:*:*:*:*:*:*	*	*	*	*
174	tippingpoint_ips_tos	3com	2.1.4.6324	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.1.4.6324	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.1.4.6324	cpe:2.3:a:3com:tippingpoint_ips_tos:2.1.4.6324:*:*:*:*:*:*:*	*	*	*	*
175	tippingpoint_ips_tos	3com	2.1.4.6324	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.1.4.6324	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.1.4.6324	cpe:2.3:o:3com:tippingpoint_ips_tos:2.1.4.6324:*:*:*:*:*:*:*	*	*	*	*
176	tippingpoint_ips_tos	3com	2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2:*:*:*:*:*:*:*	*	*	*	*
177	tippingpoint_ips_tos	3com	2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.2	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2:*:*:*:*:*:*:*	*	*	*	*
178	tippingpoint_ips_tos	3com	2.2.0.6504	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.0.6504	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.0.6504	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.0.6504:*:*:*:*:*:*:*	*	*	*	*
179	tippingpoint_ips_tos	3com	2.2.0.6504	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.2.0.6504	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.0.6504	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.0.6504:*:*:*:*:*:*:*	*	*	*	*
180	tippingpoint_ips_tos	3com	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.1	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.1	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.1:*:*:*:*:*:*:*	*	*	*	*
181	tippingpoint_ips_tos	3com	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.1	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.1	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.1:*:*:*:*:*:*:*	*	*	*	*
182	tippingpoint_ips_tos	3com	2.2.1.6506	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.1.6506	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.1.6506	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.1.6506:*:*:*:*:*:*:*	*	*	*	*
183	tippingpoint_ips_tos	3com	2.2.1.6506	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.2.1.6506	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.1.6506	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.1.6506:*:*:*:*:*:*:*	*	*	*	*
184	tippingpoint_ips_tos	3com	2.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.2	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.2	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.2:*:*:*:*:*:*:*	*	*	*	*
185	tippingpoint_ips_tos	3com	2.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.2	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.2	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.2:*:*:*:*:*:*:*	*	*	*	*
186	tippingpoint_ips_tos	3com	2.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.3	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.3	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.3:*:*:*:*:*:*:*	*	*	*	*
187	tippingpoint_ips_tos	3com	2.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.2.3	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.3	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.3:*:*:*:*:*:*:*	*	*	*	*
188	tippingpoint_ips_tos	3com	2.2.3.6514	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.3.6514	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.3.6514	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.3.6514:*:*:*:*:*:*:*	*	*	*	*
189	tippingpoint_ips_tos	3com	2.2.3.6514	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.3.6514	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.3.6514	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.3.6514:*:*:*:*:*:*:*	*	*	*	*
190	tippingpoint_ips_tos	3com	2.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.4	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.2.4	cpe:2.3:a:3com:tippingpoint_ips_tos:2.2.4:*:*:*:*:*:*:*	*	*	*	*
191	tippingpoint_ips_tos	3com	2.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.2.4	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.2.4	cpe:2.3:o:3com:tippingpoint_ips_tos:2.2.4:*:*:*:*:*:*:*	*	*	*	*
192	tippingpoint_ips_tos	3com	2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.5	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.5	cpe:2.3:a:3com:tippingpoint_ips_tos:2.5:*:*:*:*:*:*:*	*	*	*	*
193	tippingpoint_ips_tos	3com	2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム TippingPoint IPS TOS 2.5	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.5	cpe:2.3:o:3com:tippingpoint_ips_tos:2.5:*:*:*:*:*:*:*	*	*	*	*
194	tippingpoint_ips_tos	3com	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.5.1	[]	/a	*	cpe:/a:3com:tippingpoint_ips_tos:2.5.1	cpe:2.3:a:3com:tippingpoint_ips_tos:2.5.1:*:*:*:*:*:*:*	*	*	*	*
195	tippingpoint_ips_tos	3com	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint IPS TOS 2.5.1	[]	/o	*	cpe:/o:3com:tippingpoint_ips_tos:2.5.1	cpe:2.3:o:3com:tippingpoint_ips_tos:2.5.1:*:*:*:*:*:*:*	*	*	*	*
196	tippingpoint_sms_client	3com	3.1.1.7943	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3com Tippingpoint Sms Client 3.1.1.7943	[]	/a	*	cpe:/a:3com:tippingpoint_sms_client:3.1.1.7943	cpe:2.3:a:3com:tippingpoint_sms_client:3.1.1.7943:*:*:*:*:*:*:*	*	*	*	*
197	tippingpoint_sms_server	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint SMS Server	[]	/h	*	cpe:/h:3com:tippingpoint_sms_server:-	cpe:2.3:h:3com:tippingpoint_sms_server:-:*:*:*:*:*:*:*	*	*	*	*
198	tippingpoint_sms_server	3com	2.2.1.4477	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com TippingPoint SMS Server 2.2.1.4477	[]	/h	*	cpe:/h:3com:tippingpoint_sms_server:2.2.1.4477	cpe:2.3:h:3com:tippingpoint_sms_server:2.2.1.4477:*:*:*:*:*:*:*	*	*	*	*
199	total_control_netserver_card	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Total Control NETServer Card	[]	/h	*	cpe:/h:3com:total_control_netserver_card:-	cpe:2.3:h:3com:total_control_netserver_card:-:*:*:*:*:*:*:*	*	*	*	*
200	total_control_netserver_card	3com	3.7.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com Total Control NETServer Card 3.7.24	[]	/h	*	cpe:/h:3com:total_control_netserver_card:3.7.24	cpe:2.3:h:3com:total_control_netserver_card:3.7.24:*:*:*:*:*:*:*	*	*	*	*
201	webbngss3nbxnts	3com	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com SuperStack 3 NBX	[]	/h	*	cpe:/h:3com:webbngss3nbxnts:-	cpe:2.3:h:3com:webbngss3nbxnts:-:*:*:*:*:*:*:*	*	*	*	*
202	webbngss3nbxnts	3com	4.0.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com SuperStack 3 NBX 4.0.17	[]	/h	*	cpe:/h:3com:webbngss3nbxnts:4.0.17	cpe:2.3:h:3com:webbngss3nbxnts:4.0.17:*:*:*:*:*:*:*	*	*	*	*
203	webbngss3nbxnts	3com	4.1.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	スリーコム 3Com SuperStack 3 NBX 4.1.21	[]	/h	*	cpe:/h:3com:webbngss3nbxnts:4.1.21	cpe:2.3:h:3com:webbngss3nbxnts:4.1.21:*:*:*:*:*:*:*	*	*	*	*
204	webbngss3nbxnts	3com	4.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com SuperStack 3 NBX 4.1.4	[]	/h	*	cpe:/h:3com:webbngss3nbxnts:4.1.4	cpe:2.3:h:3com:webbngss3nbxnts:4.1.4:*:*:*:*:*:*:*	*	*	*	*
205	webbngss3nbxnts	3com	4.2.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3Com 3Com SuperStack 3 NBX 4.2.7	[]	/h	*	cpe:/h:3com:webbngss3nbxnts:4.2.7	cpe:2.3:h:3com:webbngss3nbxnts:4.2.7:*:*:*:*:*:*:*	*	*	*	*
206	3d_eqsecure	3dprotect	4.2	-	professional	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3dprotect 3D EQSecure Professional Edition 4.2	[]	/a	*	cpe:/a:3dprotect:3d_eqsecure:4.2:-:professional	cpe:2.3:a:3dprotect:3d_eqsecure:4.2:-:professional:*:*:*:*:*	*	*	*	*
207	3dvia_composer	3ds	6.8.1.1652	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3DS 3DVIA Composer 6.8.1.1652	[]	/a	*	cpe:/a:3ds:3dvia_composer:6.8.1.1652	cpe:2.3:a:3ds:3dvia_composer:6.8.1.1652:*:*:*:*:*:*:*	*	*	*	*
208	mpeg-4	3ivx	4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3LVX MPEG-4 4.5	[]	/a	*	cpe:/a:3ivx:mpeg-4:4.5	cpe:2.3:a:3ivx:mpeg-4:4.5:*:*:*:*:*:*:*	*	*	*	*
209	mpeg-4	3ivx	4.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3LVX MPEG-4 4.5.1	[]	/a	*	cpe:/a:3ivx:mpeg-4:4.5.1	cpe:2.3:a:3ivx:mpeg-4:4.5.1:*:*:*:*:*:*:*	*	*	*	*
210	mpeg-4	3ivx	5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3LVX MPEG-4 5.0	[]	/a	*	cpe:/a:3ivx:mpeg-4:5.0	cpe:2.3:a:3ivx:mpeg-4:5.0:*:*:*:*:*:*:*	*	*	*	*
211	mpeg-4	3ivx	5.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3LVX MPEG-4 5.0.1	[]	/a	*	cpe:/a:3ivx:mpeg-4:5.0.1	cpe:2.3:a:3ivx:mpeg-4:5.0.1:*:*:*:*:*:*:*	*	*	*	*
212	mpeg-4	3ivx	5.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3LVX MPEG-4 5.0.2	[]	/a	*	cpe:/a:3ivx:mpeg-4:5.0.2	cpe:2.3:a:3ivx:mpeg-4:5.0.2:*:*:*:*:*:*:*	*	*	*	*
213	inform_command_line_interface	3par	2.3.1.330	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3par Inform Command Line Interface(CLI) 2.3.1.330	[]	/a	*	cpe:/a:3par:inform_command_line_interface:2.3.1.330	cpe:2.3:a:3par:inform_command_line_interface:2.3.1.330:*:*:*:*:*:*:*	*	*	*	*
214	inform_management_console	3par	4.1.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3par Inform Management Console 4.1.1.5	[]	/a	*	cpe:/a:3par:inform_management_console:4.1.1.5	cpe:2.3:a:3par:inform_management_console:4.1.1.5:*:*:*:*:*:*:*	*	*	*	*
215	codesys_gateway-server	3s-software	2.3.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.5.1	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.5.1	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.5.1:*:*:*:*:*:*:*	*	*	*	*
216	codesys_gateway-server	3s-software	2.3.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.5.2	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.5.2	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.5.2:*:*:*:*:*:*:*	*	*	*	*
217	codesys_gateway-server	3s-software	2.3.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.5.3	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.5.3	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.5.3:*:*:*:*:*:*:*	*	*	*	*
218	codesys_gateway-server	3s-software	2.3.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.6.0	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.6.0	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.6.0:*:*:*:*:*:*:*	*	*	*	*
219	codesys_gateway-server	3s-software	2.3.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.7.0	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.7.0	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.7.0:*:*:*:*:*:*:*	*	*	*	*
220	codesys_gateway-server	3s-software	2.3.8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.8.0	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.8.0	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.8.0:*:*:*:*:*:*:*	*	*	*	*
221	codesys_gateway-server	3s-software	2.3.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.8.1	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.8.1	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.8.1:*:*:*:*:*:*:*	*	*	*	*
222	codesys_gateway-server	3s-software	2.3.8.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.8.2	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.8.2	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.8.2:*:*:*:*:*:*:*	*	*	*	*
223	codesys_gateway-server	3s-software	2.3.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9:*:*:*:*:*:*:*	*	*	*	*
224	codesys_gateway-server	3s-software	2.3.9.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.1	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.1	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.1:*:*:*:*:*:*:*	*	*	*	*
225	codesys_gateway-server	3s-software	2.3.9.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.18	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.18	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.18:*:*:*:*:*:*:*	*	*	*	*
226	codesys_gateway-server	3s-software	2.3.9.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.19	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.19	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.19:*:*:*:*:*:*:*	*	*	*	*
227	codesys_gateway-server	3s-software	2.3.9.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.2	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.2	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.2:*:*:*:*:*:*:*	*	*	*	*
228	codesys_gateway-server	3s-software	2.3.9.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.27	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.27	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.27:*:*:*:*:*:*:*	*	*	*	*
229	codesys_gateway-server	3s-software	2.3.9.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.3	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.3	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.3:*:*:*:*:*:*:*	*	*	*	*
230	codesys_gateway-server	3s-software	2.3.9.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.38	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.38	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.38:*:*:*:*:*:*:*	*	*	*	*
231	codesys_gateway-server	3s-software	2.3.9.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.4	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.4	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.4:*:*:*:*:*:*:*	*	*	*	*
232	codesys_gateway-server	3s-software	2.3.9.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Gateway-Server 2.3.9.5	[]	/a	*	cpe:/a:3s-software:codesys_gateway-server:2.3.9.5	cpe:2.3:a:3s-software:codesys_gateway-server:2.3.9.5:*:*:*:*:*:*:*	*	*	*	*
233	codesys_runtime_system	3s-software	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System	[{"Vendor":"http://www.codesys.com/"}]	/a	*	cpe:/a:3s-software:codesys_runtime_system:-	cpe:2.3:a:3s-software:codesys_runtime_system:-:*:*:*:*:*:*:*	*	*	*	*
234	codesys_runtime_system	3s-software	2.3.9.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System 2.3.9.35	[]	/a	*	cpe:/a:3s-software:codesys_runtime_system:2.3.9.35	cpe:2.3:a:3s-software:codesys_runtime_system:2.3.9.35:*:*:*:*:*:*:*	*	*	*	*
235	codesys_runtime_system	3s-software	2.3.9.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System 2.3.9.36	[]	/a	*	cpe:/a:3s-software:codesys_runtime_system:2.3.9.36	cpe:2.3:a:3s-software:codesys_runtime_system:2.3.9.36:*:*:*:*:*:*:*	*	*	*	*
236	codesys_runtime_system	3s-software	2.3.9.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System 2.3.9.37	[]	/a	*	cpe:/a:3s-software:codesys_runtime_system:2.3.9.37	cpe:2.3:a:3s-software:codesys_runtime_system:2.3.9.37:*:*:*:*:*:*:*	*	*	*	*
237	codesys_runtime_system	3s-software	2.3.9.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System 2.3.9.47	[{"Vendor":"http://www.codesys.com/"}]	/a	*	cpe:/a:3s-software:codesys_runtime_system:2.3.9.47	cpe:2.3:a:3s-software:codesys_runtime_system:2.3.9.47:*:*:*:*:*:*:*	*	*	*	*
238	codesys_runtime_system	3s-software	2.3.9.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3s-Software CODESYS Runtime System 2.3.9.8	[]	/a	*	cpe:/a:3s-software:codesys_runtime_system:2.3.9.8	cpe:2.3:a:3s-software:codesys_runtime_system:2.3.9.8:*:*:*:*:*:*:*	*	*	*	*
239	t2css	3sgroup	2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	3sgroup T2css 2.0	[]	/a	*	cpe:/a:3sgroup:t2css:2.0	cpe:2.3:a:3sgroup:t2css:2.0:*:*:*:*:*:*:*	*	*	*	*
240	tray_minimizer_free	4t-niagara	4.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	4T Niagara Tray Minimizer Free 4.40	[]	/a	*	cpe:/a:4t-niagara:tray_minimizer_free:4.40	cpe:2.3:a:4t-niagara:tray_minimizer_free:4.40:*:*:*:*:*:*:*	*	*	*	*
241	tray_minimizer_pro	4t-niagara	4.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	4T Niagara Tray Minimizer Pro 4.40	[]	/a	*	cpe:/a:4t-niagara:tray_minimizer_pro:4.40	cpe:2.3:a:4t-niagara:tray_minimizer_pro:4.40:*:*:*:*:*:*:*	*	*	*	*
242	com_jphone	4you-studio	1.0	alpha3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	4you-studio JPhone (com_jphone) component 1.0 Alpha3 for Joomla!	[]	/a	*	cpe:/a:4you-studio:com_jphone:1.0:alpha3	cpe:2.3:a:4you-studio:com_jphone:1.0:alpha3:*:*:*:*:*:*	*	*	*	*
243	com_jphone	4you-studio	1.0	alpha4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	4you-studio JPhone (com_jphone) component 1.0 Alpha4 for Joomla!	[]	/a	*	cpe:/a:4you-studio:com_jphone:1.0:alpha4	cpe:2.3:a:4you-studio:com_jphone:1.0:alpha4:*:*:*:*:*:*	*	*	*	*
244	supercron	63reasons	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	63reasons Supercron Module for Drupal	[]	/a	*	cpe:/a:63reasons:supercron:-	cpe:2.3:a:63reasons:supercron:-:*:*:*:*:*:*:*	*	*	*	*
245	girls_games_-_shoes_maker	6677g	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	6677g Girls Games - Shoes Maker (aka com.g6677.android.shoemaker) for Android 1.0.1	[{"Product Information":"https://play.google.com/store/apps/details?id=com.g6677.android.shoemaker"},{"Vendor Website":"http://www.6677g.com/index.html?lang=en\\u0026v=pc"}]	/a	*	cpe:/a:6677g:girls_games_-_shoes_maker:1.0.1::~~~android~~	cpe:2.3:a:6677g:girls_games_-_shoes_maker:1.0.1:*:*:*:*:android:*:*	*	*	*	*
246	7-zip	7-zip	15.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 15.14	[{"Version":"http://www.7-zip.org/history.txt"}]	/a	*	cpe:/a:7-zip:7-zip:15.14	cpe:2.3:a:7-zip:7-zip:15.14:*:*:*:*:*:*:*	*	*	*	*
247	7-zip	7-zip	3.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 3.13	[]	/a	*	cpe:/a:7-zip:7-zip:3.13	cpe:2.3:a:7-zip:7-zip:3.13:*:*:*:*:*:*:*	*	*	*	*
248	7-zip	7-zip	4.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.20	[]	/a	*	cpe:/a:7-zip:7-zip:4.20	cpe:2.3:a:7-zip:7-zip:4.20:*:*:*:*:*:*:*	*	*	*	*
249	7-zip	7-zip	4.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.23	[]	/a	*	cpe:/a:7-zip:7-zip:4.23	cpe:2.3:a:7-zip:7-zip:4.23:*:*:*:*:*:*:*	*	*	*	*
250	7-zip	7-zip	4.24	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.24 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.24:beta	cpe:2.3:a:7-zip:7-zip:4.24:beta:*:*:*:*:*:*	*	*	*	*
251	7-zip	7-zip	4.25	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.25 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.25:beta	cpe:2.3:a:7-zip:7-zip:4.25:beta:*:*:*:*:*:*	*	*	*	*
252	7-zip	7-zip	4.26	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.26 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.26:beta	cpe:2.3:a:7-zip:7-zip:4.26:beta:*:*:*:*:*:*	*	*	*	*
2712	jdk	oracle	1.6.0	update_32		\N	2018-05-31 16:59:57.053597	2018-05-31 16:59:57.053597	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_32	\N	\N	\N	\N	\N
253	7-zip	7-zip	4.27	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.27 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.27:beta	cpe:2.3:a:7-zip:7-zip:4.27:beta:*:*:*:*:*:*	*	*	*	*
254	7-zip	7-zip	4.28	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.28 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.28:beta	cpe:2.3:a:7-zip:7-zip:4.28:beta:*:*:*:*:*:*	*	*	*	*
255	7-zip	7-zip	4.29	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.29 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.29:beta	cpe:2.3:a:7-zip:7-zip:4.29:beta:*:*:*:*:*:*	*	*	*	*
256	7-zip	7-zip	4.30	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.30 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.30:beta	cpe:2.3:a:7-zip:7-zip:4.30:beta:*:*:*:*:*:*	*	*	*	*
257	7-zip	7-zip	4.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.31	[]	/a	*	cpe:/a:7-zip:7-zip:4.31	cpe:2.3:a:7-zip:7-zip:4.31:*:*:*:*:*:*:*	*	*	*	*
258	7-zip	7-zip	4.32	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.32	[]	/a	*	cpe:/a:7-zip:7-zip:4.32	cpe:2.3:a:7-zip:7-zip:4.32:*:*:*:*:*:*:*	*	*	*	*
259	7-zip	7-zip	4.33	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.33 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.33:beta	cpe:2.3:a:7-zip:7-zip:4.33:beta:*:*:*:*:*:*	*	*	*	*
260	7-zip	7-zip	4.34	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.34 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.34:beta	cpe:2.3:a:7-zip:7-zip:4.34:beta:*:*:*:*:*:*	*	*	*	*
261	7-zip	7-zip	4.35	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.35 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.35:beta	cpe:2.3:a:7-zip:7-zip:4.35:beta:*:*:*:*:*:*	*	*	*	*
262	7-zip	7-zip	4.36	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.36 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.36:beta	cpe:2.3:a:7-zip:7-zip:4.36:beta:*:*:*:*:*:*	*	*	*	*
263	7-zip	7-zip	4.37	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.37 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.37:beta	cpe:2.3:a:7-zip:7-zip:4.37:beta:*:*:*:*:*:*	*	*	*	*
264	7-zip	7-zip	4.38	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.38 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.38:beta	cpe:2.3:a:7-zip:7-zip:4.38:beta:*:*:*:*:*:*	*	*	*	*
265	7-zip	7-zip	4.39	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.39 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.39:beta	cpe:2.3:a:7-zip:7-zip:4.39:beta:*:*:*:*:*:*	*	*	*	*
266	7-zip	7-zip	4.40	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.40 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.40:beta	cpe:2.3:a:7-zip:7-zip:4.40:beta:*:*:*:*:*:*	*	*	*	*
267	7-zip	7-zip	4.41	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.41 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.41:beta	cpe:2.3:a:7-zip:7-zip:4.41:beta:*:*:*:*:*:*	*	*	*	*
268	7-zip	7-zip	4.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.42	[]	/a	*	cpe:/a:7-zip:7-zip:4.42	cpe:2.3:a:7-zip:7-zip:4.42:*:*:*:*:*:*:*	*	*	*	*
269	7-zip	7-zip	4.43	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.43 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.43:beta	cpe:2.3:a:7-zip:7-zip:4.43:beta:*:*:*:*:*:*	*	*	*	*
270	7-zip	7-zip	4.44	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.44 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.44:beta	cpe:2.3:a:7-zip:7-zip:4.44:beta:*:*:*:*:*:*	*	*	*	*
271	7-zip	7-zip	4.45	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.45 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.45:beta	cpe:2.3:a:7-zip:7-zip:4.45:beta:*:*:*:*:*:*	*	*	*	*
272	7-zip	7-zip	4.46	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.46 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.46:beta	cpe:2.3:a:7-zip:7-zip:4.46:beta:*:*:*:*:*:*	*	*	*	*
273	7-zip	7-zip	4.47	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.47 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.47:beta	cpe:2.3:a:7-zip:7-zip:4.47:beta:*:*:*:*:*:*	*	*	*	*
274	7-zip	7-zip	4.48	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.48 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.48:beta	cpe:2.3:a:7-zip:7-zip:4.48:beta:*:*:*:*:*:*	*	*	*	*
275	7-zip	7-zip	4.49	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.49 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.49:beta	cpe:2.3:a:7-zip:7-zip:4.49:beta:*:*:*:*:*:*	*	*	*	*
276	7-zip	7-zip	4.50	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.50 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.50:beta	cpe:2.3:a:7-zip:7-zip:4.50:beta:*:*:*:*:*:*	*	*	*	*
277	7-zip	7-zip	4.51	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.51 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.51:beta	cpe:2.3:a:7-zip:7-zip:4.51:beta:*:*:*:*:*:*	*	*	*	*
278	7-zip	7-zip	4.52	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.52 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.52:beta	cpe:2.3:a:7-zip:7-zip:4.52:beta:*:*:*:*:*:*	*	*	*	*
279	7-zip	7-zip	4.53	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.53 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.53:beta	cpe:2.3:a:7-zip:7-zip:4.53:beta:*:*:*:*:*:*	*	*	*	*
280	7-zip	7-zip	4.54	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.54 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.54:beta	cpe:2.3:a:7-zip:7-zip:4.54:beta:*:*:*:*:*:*	*	*	*	*
281	7-zip	7-zip	4.55	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.55 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.55:beta	cpe:2.3:a:7-zip:7-zip:4.55:beta:*:*:*:*:*:*	*	*	*	*
282	7-zip	7-zip	4.56	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.56 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.56:beta	cpe:2.3:a:7-zip:7-zip:4.56:beta:*:*:*:*:*:*	*	*	*	*
283	7-zip	7-zip	4.57	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 7-Zip 4.57	[]	/a	*	cpe:/a:7-zip:7-zip:4.57	cpe:2.3:a:7-zip:7-zip:4.57:*:*:*:*:*:*:*	*	*	*	*
284	7-zip	7-zip	4.58	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 7-Zip 4.58 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.58:beta	cpe:2.3:a:7-zip:7-zip:4.58:beta:*:*:*:*:*:*	*	*	*	*
285	7-zip	7-zip	4.59	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 7-Zip 4.59 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.59:beta	cpe:2.3:a:7-zip:7-zip:4.59:beta:*:*:*:*:*:*	*	*	*	*
286	7-zip	7-zip	4.60	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 7-Zip 4.60 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.60:beta	cpe:2.3:a:7-zip:7-zip:4.60:beta:*:*:*:*:*:*	*	*	*	*
287	7-zip	7-zip	4.61	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 7-Zip 4.61 beta	[]	/a	*	cpe:/a:7-zip:7-zip:4.61:beta	cpe:2.3:a:7-zip:7-zip:4.61:beta:*:*:*:*:*:*	*	*	*	*
288	7-zip	7-zip	4.62	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.62	[]	/a	*	cpe:/a:7-zip:7-zip:4.62	cpe:2.3:a:7-zip:7-zip:4.62:*:*:*:*:*:*:*	*	*	*	*
289	7-zip	7-zip	4.63	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.63	[]	/a	*	cpe:/a:7-zip:7-zip:4.63	cpe:2.3:a:7-zip:7-zip:4.63:*:*:*:*:*:*:*	*	*	*	*
290	7-zip	7-zip	4.64	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.64	[]	/a	*	cpe:/a:7-zip:7-zip:4.64	cpe:2.3:a:7-zip:7-zip:4.64:*:*:*:*:*:*:*	*	*	*	*
291	7-zip	7-zip	4.65	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 4.65	[]	/a	*	cpe:/a:7-zip:7-zip:4.65	cpe:2.3:a:7-zip:7-zip:4.65:*:*:*:*:*:*:*	*	*	*	*
292	7-zip	7-zip	4.65	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip 4.65 (x64) 64-bit	[]	/a	*	cpe:/a:7-zip:7-zip:4.65::~~~~x64~	cpe:2.3:a:7-zip:7-zip:4.65:*:*:*:*:*:x64:*	x64	x64	*	*
293	7-zip	7-zip	9.04	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 9.04 beta	[]	/a	*	cpe:/a:7-zip:7-zip:9.04:beta	cpe:2.3:a:7-zip:7-zip:9.04:beta:*:*:*:*:*:*	*	*	*	*
294	7-zip	7-zip	9.06	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 9.06 beta	[]	/a	*	cpe:/a:7-zip:7-zip:9.06:beta	cpe:2.3:a:7-zip:7-zip:9.06:beta:*:*:*:*:*:*	*	*	*	*
295	7-zip	7-zip	9.07	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 9.07 beta	[]	/a	*	cpe:/a:7-zip:7-zip:9.07:beta	cpe:2.3:a:7-zip:7-zip:9.07:beta:*:*:*:*:*:*	*	*	*	*
296	7-zip	7-zip	9.10	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip Beta 9.10	[]	/a	*	cpe:/a:7-zip:7-zip:9.10:beta	cpe:2.3:a:7-zip:7-zip:9.10:beta:*:*:*:*:*:*	*	*	*	*
297	7-zip	7-zip	9.11	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip 9.11 Beta	[]	/a	*	cpe:/a:7-zip:7-zip:9.11:beta	cpe:2.3:a:7-zip:7-zip:9.11:beta:*:*:*:*:*:*	*	*	*	*
298	7-zip	7-zip	9.12	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip Beta 9.12	[]	/a	*	cpe:/a:7-zip:7-zip:9.12:beta	cpe:2.3:a:7-zip:7-zip:9.12:beta:*:*:*:*:*:*	*	*	*	*
299	7-zip	7-zip	9.13	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip Beta 9.13	[]	/a	*	cpe:/a:7-zip:7-zip:9.13:beta	cpe:2.3:a:7-zip:7-zip:9.13:beta:*:*:*:*:*:*	*	*	*	*
300	7-zip	7-zip	9.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip 9.20	[]	/a	*	cpe:/a:7-zip:7-zip:9.20	cpe:2.3:a:7-zip:7-zip:9.20:*:*:*:*:*:*:*	*	*	*	*
301	7-zip	7-zip	9.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip 9.20 (x64) 64-bit	[]	/a	*	cpe:/a:7-zip:7-zip:9.20::~~~~x64~	cpe:2.3:a:7-zip:7-zip:9.20:*:*:*:*:*:x64:*	x64	x64	*	*
302	7-zip	7-zip	9.22	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-zip Beta 9.22	[]	/a	*	cpe:/a:7-zip:7-zip:9.22:beta	cpe:2.3:a:7-zip:7-zip:9.22:beta:*:*:*:*:*:*	*	*	*	*
303	7zip	7-zip	15.05	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 15.05 Beta	[{"Version":"http://www.7-zip.org/history.txt"},{"Vendor":"http://www.7-zip.org/"}]	/a	*	cpe:/a:7-zip:7zip:15.05:beta	cpe:2.3:a:7-zip:7zip:15.05:beta:*:*:*:*:*:*	*	*	*	*
304	7zip	7-zip	9.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip 7Zip 9.20	[{"Version":"http://www.7-zip.org/history.txt"},{"Vendor":"http://www.7-zip.org/"}]	/a	*	cpe:/a:7-zip:7zip:9.20	cpe:2.3:a:7-zip:7zip:9.20:*:*:*:*:*:*:*	*	*	*	*
305	p7zip	7-zip	0.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 0.80	[]	/a	*	cpe:/a:7-zip:p7zip:0.80	cpe:2.3:a:7-zip:p7zip:0.80:*:*:*:*:*:*:*	*	*	*	*
306	p7zip	7-zip	0.81	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 0.81	[]	/a	*	cpe:/a:7-zip:p7zip:0.81	cpe:2.3:a:7-zip:p7zip:0.81:*:*:*:*:*:*:*	*	*	*	*
307	p7zip	7-zip	0.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 0.90	[]	/a	*	cpe:/a:7-zip:p7zip:0.90	cpe:2.3:a:7-zip:p7zip:0.90:*:*:*:*:*:*:*	*	*	*	*
308	p7zip	7-zip	0.91	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 0.91	[]	/a	*	cpe:/a:7-zip:p7zip:0.91	cpe:2.3:a:7-zip:p7zip:0.91:*:*:*:*:*:*:*	*	*	*	*
309	p7zip	7-zip	16.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 16.02	[{"Vendor":"http://www.7-zip.org/"},{"Advisory":"https://sourceforge.net/p/p7zip/bugs/185/"}]	/a	*	cpe:/a:7-zip:p7zip:16.02	cpe:2.3:a:7-zip:p7zip:16.02:*:*:*:*:*:*:*	*	*	*	*
310	p7zip	7-zip	4.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.10	[]	/a	*	cpe:/a:7-zip:p7zip:4.10	cpe:2.3:a:7-zip:p7zip:4.10:*:*:*:*:*:*:*	*	*	*	*
311	p7zip	7-zip	4.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.12	[]	/a	*	cpe:/a:7-zip:p7zip:4.12	cpe:2.3:a:7-zip:p7zip:4.12:*:*:*:*:*:*:*	*	*	*	*
312	p7zip	7-zip	4.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.13	[]	/a	*	cpe:/a:7-zip:p7zip:4.13	cpe:2.3:a:7-zip:p7zip:4.13:*:*:*:*:*:*:*	*	*	*	*
313	p7zip	7-zip	4.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.14	[]	/a	*	cpe:/a:7-zip:p7zip:4.14	cpe:2.3:a:7-zip:p7zip:4.14:*:*:*:*:*:*:*	*	*	*	*
314	p7zip	7-zip	4.14.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.14.01	[]	/a	*	cpe:/a:7-zip:p7zip:4.14.01	cpe:2.3:a:7-zip:p7zip:4.14.01:*:*:*:*:*:*:*	*	*	*	*
315	p7zip	7-zip	4.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.16	[]	/a	*	cpe:/a:7-zip:p7zip:4.16	cpe:2.3:a:7-zip:p7zip:4.16:*:*:*:*:*:*:*	*	*	*	*
316	p7zip	7-zip	4.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.18	[]	/a	*	cpe:/a:7-zip:p7zip:4.18	cpe:2.3:a:7-zip:p7zip:4.18:*:*:*:*:*:*:*	*	*	*	*
317	p7zip	7-zip	4.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.20	[]	/a	*	cpe:/a:7-zip:p7zip:4.20	cpe:2.3:a:7-zip:p7zip:4.20:*:*:*:*:*:*:*	*	*	*	*
318	p7zip	7-zip	4.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.27	[]	/a	*	cpe:/a:7-zip:p7zip:4.27	cpe:2.3:a:7-zip:p7zip:4.27:*:*:*:*:*:*:*	*	*	*	*
319	p7zip	7-zip	4.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.29	[]	/a	*	cpe:/a:7-zip:p7zip:4.29	cpe:2.3:a:7-zip:p7zip:4.29:*:*:*:*:*:*:*	*	*	*	*
320	p7zip	7-zip	4.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.30	[]	/a	*	cpe:/a:7-zip:p7zip:4.30	cpe:2.3:a:7-zip:p7zip:4.30:*:*:*:*:*:*:*	*	*	*	*
321	p7zip	7-zip	4.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.33	[]	/a	*	cpe:/a:7-zip:p7zip:4.33	cpe:2.3:a:7-zip:p7zip:4.33:*:*:*:*:*:*:*	*	*	*	*
322	p7zip	7-zip	4.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.37	[]	/a	*	cpe:/a:7-zip:p7zip:4.37	cpe:2.3:a:7-zip:p7zip:4.37:*:*:*:*:*:*:*	*	*	*	*
323	p7zip	7-zip	4.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	7-Zip p7zip 4.39	[]	/a	*	cpe:/a:7-zip:p7zip:4.39	cpe:2.3:a:7-zip:p7zip:4.39:*:*:*:*:*:*:*	*	*	*	*
324	rt105i	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.18	[]	/o	*	cpe:/o:yahama:rt105i:6.03.18	cpe:2.3:o:yahama:rt105i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
325	rt105i	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.25	[]	/o	*	cpe:/o:yahama:rt105i:6.03.25	cpe:2.3:o:yahama:rt105i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
326	rt105i	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.28	[]	/o	*	cpe:/o:yahama:rt105i:6.03.28	cpe:2.3:o:yahama:rt105i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
327	rt105i	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.33	[]	/o	*	cpe:/o:yahama:rt105i:6.03.33	cpe:2.3:o:yahama:rt105i:6.03.33:*:*:*:*:*:*:*	*	*	*	*
328	rt105i	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105i 6.03.34	[]	/o	*	cpe:/o:yahama:rt105i:6.03.34	cpe:2.3:o:yahama:rt105i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
329	rt105p	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.03	[]	/o	*	cpe:/o:yahama:rt105p:6.02.03	cpe:2.3:o:yahama:rt105p:6.02.03:*:*:*:*:*:*:*	*	*	*	*
330	rt105p	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.04	[]	/o	*	cpe:/o:yahama:rt105p:6.02.04	cpe:2.3:o:yahama:rt105p:6.02.04:*:*:*:*:*:*:*	*	*	*	*
331	rt105p	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.07	[]	/o	*	cpe:/o:yahama:rt105p:6.02.07	cpe:2.3:o:yahama:rt105p:6.02.07:*:*:*:*:*:*:*	*	*	*	*
332	rt105p	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.16	[]	/o	*	cpe:/o:yahama:rt105p:6.02.16	cpe:2.3:o:yahama:rt105p:6.02.16:*:*:*:*:*:*:*	*	*	*	*
333	rt105p	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.19	[]	/o	*	cpe:/o:yahama:rt105p:6.02.19	cpe:2.3:o:yahama:rt105p:6.02.19:*:*:*:*:*:*:*	*	*	*	*
334	rt105p	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.04	[]	/o	*	cpe:/o:yahama:rt105p:6.03.04	cpe:2.3:o:yahama:rt105p:6.03.04:*:*:*:*:*:*:*	*	*	*	*
2783	jdk	sun	1.5.0	update22		\N	2018-05-31 16:59:57.495482	2018-05-31 16:59:57.495482	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update22	\N	\N	\N	\N	\N
335	rt105p	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.08	[]	/o	*	cpe:/o:yahama:rt105p:6.03.08	cpe:2.3:o:yahama:rt105p:6.03.08:*:*:*:*:*:*:*	*	*	*	*
336	rt105p	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.11	[]	/o	*	cpe:/o:yahama:rt105p:6.03.11	cpe:2.3:o:yahama:rt105p:6.03.11:*:*:*:*:*:*:*	*	*	*	*
337	rt105p	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.15	[]	/o	*	cpe:/o:yahama:rt105p:6.03.15	cpe:2.3:o:yahama:rt105p:6.03.15:*:*:*:*:*:*:*	*	*	*	*
338	rt105p	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.18	[]	/o	*	cpe:/o:yahama:rt105p:6.03.18	cpe:2.3:o:yahama:rt105p:6.03.18:*:*:*:*:*:*:*	*	*	*	*
339	rt105p	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.25	[]	/o	*	cpe:/o:yahama:rt105p:6.03.25	cpe:2.3:o:yahama:rt105p:6.03.25:*:*:*:*:*:*:*	*	*	*	*
340	rt105p	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.28	[]	/o	*	cpe:/o:yahama:rt105p:6.03.28	cpe:2.3:o:yahama:rt105p:6.03.28:*:*:*:*:*:*:*	*	*	*	*
341	rt105p	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.33	[]	/o	*	cpe:/o:yahama:rt105p:6.03.33	cpe:2.3:o:yahama:rt105p:6.03.33:*:*:*:*:*:*:*	*	*	*	*
342	rt105p	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.34	[]	/o	*	cpe:/o:yahama:rt105p:6.03.34	cpe:2.3:o:yahama:rt105p:6.03.34:*:*:*:*:*:*:*	*	*	*	*
343	rt107e	yahama	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.06	[]	/o	*	cpe:/o:yahama:rt107e:8.03.06	cpe:2.3:o:yahama:rt107e:8.03.06:*:*:*:*:*:*:*	*	*	*	*
344	rt107e	yahama	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.08	[]	/o	*	cpe:/o:yahama:rt107e:8.03.08	cpe:2.3:o:yahama:rt107e:8.03.08:*:*:*:*:*:*:*	*	*	*	*
345	rt107e	yahama	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.24	[]	/o	*	cpe:/o:yahama:rt107e:8.03.24	cpe:2.3:o:yahama:rt107e:8.03.24:*:*:*:*:*:*:*	*	*	*	*
346	rt107e	yahama	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.26	[]	/o	*	cpe:/o:yahama:rt107e:8.03.26	cpe:2.3:o:yahama:rt107e:8.03.26:*:*:*:*:*:*:*	*	*	*	*
347	rt107e	yahama	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.37	[]	/o	*	cpe:/o:yahama:rt107e:8.03.37	cpe:2.3:o:yahama:rt107e:8.03.37:*:*:*:*:*:*:*	*	*	*	*
348	rt107e	yahama	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.41	[]	/o	*	cpe:/o:yahama:rt107e:8.03.41	cpe:2.3:o:yahama:rt107e:8.03.41:*:*:*:*:*:*:*	*	*	*	*
349	rt107e	yahama	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.42	[]	/o	*	cpe:/o:yahama:rt107e:8.03.42	cpe:2.3:o:yahama:rt107e:8.03.42:*:*:*:*:*:*:*	*	*	*	*
350	rt107e	yahama	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.46	[]	/o	*	cpe:/o:yahama:rt107e:8.03.46	cpe:2.3:o:yahama:rt107e:8.03.46:*:*:*:*:*:*:*	*	*	*	*
351	rt107e	yahama	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.60	[]	/o	*	cpe:/o:yahama:rt107e:8.03.60	cpe:2.3:o:yahama:rt107e:8.03.60:*:*:*:*:*:*:*	*	*	*	*
352	rt107e	yahama	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.61	[]	/o	*	cpe:/o:yahama:rt107e:8.03.61	cpe:2.3:o:yahama:rt107e:8.03.61:*:*:*:*:*:*:*	*	*	*	*
353	rt107e	yahama	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.68	[]	/o	*	cpe:/o:yahama:rt107e:8.03.68	cpe:2.3:o:yahama:rt107e:8.03.68:*:*:*:*:*:*:*	*	*	*	*
354	rt107e	yahama	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.70	[]	/o	*	cpe:/o:yahama:rt107e:8.03.70	cpe:2.3:o:yahama:rt107e:8.03.70:*:*:*:*:*:*:*	*	*	*	*
355	rt107e	yahama	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.75	[]	/o	*	cpe:/o:yahama:rt107e:8.03.75	cpe:2.3:o:yahama:rt107e:8.03.75:*:*:*:*:*:*:*	*	*	*	*
356	rt107e	yahama	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.76	[]	/o	*	cpe:/o:yahama:rt107e:8.03.76	cpe:2.3:o:yahama:rt107e:8.03.76:*:*:*:*:*:*:*	*	*	*	*
357	rt107e	yahama	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.77	[]	/o	*	cpe:/o:yahama:rt107e:8.03.77	cpe:2.3:o:yahama:rt107e:8.03.77:*:*:*:*:*:*:*	*	*	*	*
358	rt107e	yahama	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.78	[]	/o	*	cpe:/o:yahama:rt107e:8.03.78	cpe:2.3:o:yahama:rt107e:8.03.78:*:*:*:*:*:*:*	*	*	*	*
359	rt107e	yahama	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.80	[]	/o	*	cpe:/o:yahama:rt107e:8.03.80	cpe:2.3:o:yahama:rt107e:8.03.80:*:*:*:*:*:*:*	*	*	*	*
360	rt107e	yahama	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.82	[]	/o	*	cpe:/o:yahama:rt107e:8.03.82	cpe:2.3:o:yahama:rt107e:8.03.82:*:*:*:*:*:*:*	*	*	*	*
361	rt107e	yahama	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.83	[]	/o	*	cpe:/o:yahama:rt107e:8.03.83	cpe:2.3:o:yahama:rt107e:8.03.83:*:*:*:*:*:*:*	*	*	*	*
362	rt107e	yahama	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.87	[]	/o	*	cpe:/o:yahama:rt107e:8.03.87	cpe:2.3:o:yahama:rt107e:8.03.87:*:*:*:*:*:*:*	*	*	*	*
363	rt107e	yahama	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.88	[]	/o	*	cpe:/o:yahama:rt107e:8.03.88	cpe:2.3:o:yahama:rt107e:8.03.88:*:*:*:*:*:*:*	*	*	*	*
364	rt107e	yahama	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.90	[]	/o	*	cpe:/o:yahama:rt107e:8.03.90	cpe:2.3:o:yahama:rt107e:8.03.90:*:*:*:*:*:*:*	*	*	*	*
365	rt140e	yahama	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.01.06	[]	/o	*	cpe:/o:yahama:rt140e:6.01.06	cpe:2.3:o:yahama:rt140e:6.01.06:*:*:*:*:*:*:*	*	*	*	*
366	rt140e	yahama	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.01.07	[]	/o	*	cpe:/o:yahama:rt140e:6.01.07	cpe:2.3:o:yahama:rt140e:6.01.07:*:*:*:*:*:*:*	*	*	*	*
367	rt140e	yahama	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.01.09	[]	/o	*	cpe:/o:yahama:rt140e:6.01.09	cpe:2.3:o:yahama:rt140e:6.01.09:*:*:*:*:*:*:*	*	*	*	*
368	rt140e	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.02.03	[]	/o	*	cpe:/o:yahama:rt140e:6.02.03	cpe:2.3:o:yahama:rt140e:6.02.03:*:*:*:*:*:*:*	*	*	*	*
369	rt140e	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.04	[]	/o	*	cpe:/o:yahama:rt140e:6.02.04	cpe:2.3:o:yahama:rt140e:6.02.04:*:*:*:*:*:*:*	*	*	*	*
370	rt140e	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.02.07	[]	/o	*	cpe:/o:yahama:rt140e:6.02.07	cpe:2.3:o:yahama:rt140e:6.02.07:*:*:*:*:*:*:*	*	*	*	*
371	rt140e	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.16	[]	/o	*	cpe:/o:yahama:rt140e:6.02.16	cpe:2.3:o:yahama:rt140e:6.02.16:*:*:*:*:*:*:*	*	*	*	*
372	rt140e	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.19	[]	/o	*	cpe:/o:yahama:rt140e:6.02.19	cpe:2.3:o:yahama:rt140e:6.02.19:*:*:*:*:*:*:*	*	*	*	*
373	rt140e	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.04	[]	/o	*	cpe:/o:yahama:rt140e:6.03.04	cpe:2.3:o:yahama:rt140e:6.03.04:*:*:*:*:*:*:*	*	*	*	*
374	rt140e	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.08	[]	/o	*	cpe:/o:yahama:rt140e:6.03.08	cpe:2.3:o:yahama:rt140e:6.03.08:*:*:*:*:*:*:*	*	*	*	*
375	rt140e	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.11	[]	/o	*	cpe:/o:yahama:rt140e:6.03.11	cpe:2.3:o:yahama:rt140e:6.03.11:*:*:*:*:*:*:*	*	*	*	*
376	rt140e	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.15	[]	/o	*	cpe:/o:yahama:rt140e:6.03.15	cpe:2.3:o:yahama:rt140e:6.03.15:*:*:*:*:*:*:*	*	*	*	*
377	rt140e	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.18	[]	/o	*	cpe:/o:yahama:rt140e:6.03.18	cpe:2.3:o:yahama:rt140e:6.03.18:*:*:*:*:*:*:*	*	*	*	*
378	rt140e	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.25	[]	/o	*	cpe:/o:yahama:rt140e:6.03.25	cpe:2.3:o:yahama:rt140e:6.03.25:*:*:*:*:*:*:*	*	*	*	*
379	rt140e	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.28	[]	/o	*	cpe:/o:yahama:rt140e:6.03.28	cpe:2.3:o:yahama:rt140e:6.03.28:*:*:*:*:*:*:*	*	*	*	*
380	rt140e	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.33	[]	/o	*	cpe:/o:yahama:rt140e:6.03.33	cpe:2.3:o:yahama:rt140e:6.03.33:*:*:*:*:*:*:*	*	*	*	*
381	rt140e	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.34	[]	/o	*	cpe:/o:yahama:rt140e:6.03.34	cpe:2.3:o:yahama:rt140e:6.03.34:*:*:*:*:*:*:*	*	*	*	*
382	rt140f	yahama	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.01.06	[]	/o	*	cpe:/o:yahama:rt140f:6.01.06	cpe:2.3:o:yahama:rt140f:6.01.06:*:*:*:*:*:*:*	*	*	*	*
383	rt140f	yahama	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.01.07	[]	/o	*	cpe:/o:yahama:rt140f:6.01.07	cpe:2.3:o:yahama:rt140f:6.01.07:*:*:*:*:*:*:*	*	*	*	*
384	rt140f	yahama	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.01.09	[]	/o	*	cpe:/o:yahama:rt140f:6.01.09	cpe:2.3:o:yahama:rt140f:6.01.09:*:*:*:*:*:*:*	*	*	*	*
385	rt140f	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.02.03	[]	/o	*	cpe:/o:yahama:rt140f:6.02.03	cpe:2.3:o:yahama:rt140f:6.02.03:*:*:*:*:*:*:*	*	*	*	*
386	rt140f	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.04	[]	/o	*	cpe:/o:yahama:rt140f:6.02.04	cpe:2.3:o:yahama:rt140f:6.02.04:*:*:*:*:*:*:*	*	*	*	*
387	rt140f	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.07	[]	/o	*	cpe:/o:yahama:rt140f:6.02.07	cpe:2.3:o:yahama:rt140f:6.02.07:*:*:*:*:*:*:*	*	*	*	*
388	rt140f	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.16	[]	/o	*	cpe:/o:yahama:rt140f:6.02.16	cpe:2.3:o:yahama:rt140f:6.02.16:*:*:*:*:*:*:*	*	*	*	*
389	rt140f	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.19	[]	/o	*	cpe:/o:yahama:rt140f:6.02.19	cpe:2.3:o:yahama:rt140f:6.02.19:*:*:*:*:*:*:*	*	*	*	*
390	rt140f	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.04	[]	/o	*	cpe:/o:yahama:rt140f:6.03.04	cpe:2.3:o:yahama:rt140f:6.03.04:*:*:*:*:*:*:*	*	*	*	*
391	rt140f	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.08	[]	/o	*	cpe:/o:yahama:rt140f:6.03.08	cpe:2.3:o:yahama:rt140f:6.03.08:*:*:*:*:*:*:*	*	*	*	*
392	rt140f	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.11	[]	/o	*	cpe:/o:yahama:rt140f:6.03.11	cpe:2.3:o:yahama:rt140f:6.03.11:*:*:*:*:*:*:*	*	*	*	*
393	rt140f	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.15	[]	/o	*	cpe:/o:yahama:rt140f:6.03.15	cpe:2.3:o:yahama:rt140f:6.03.15:*:*:*:*:*:*:*	*	*	*	*
394	rt140f	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.18	[]	/o	*	cpe:/o:yahama:rt140f:6.03.18	cpe:2.3:o:yahama:rt140f:6.03.18:*:*:*:*:*:*:*	*	*	*	*
395	rt140f	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.25	[]	/o	*	cpe:/o:yahama:rt140f:6.03.25	cpe:2.3:o:yahama:rt140f:6.03.25:*:*:*:*:*:*:*	*	*	*	*
396	rt140f	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.28	[]	/o	*	cpe:/o:yahama:rt140f:6.03.28	cpe:2.3:o:yahama:rt140f:6.03.28:*:*:*:*:*:*:*	*	*	*	*
397	rt140f	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.33	[]	/o	*	cpe:/o:yahama:rt140f:6.03.33	cpe:2.3:o:yahama:rt140f:6.03.33:*:*:*:*:*:*:*	*	*	*	*
398	rt140f	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.34	[]	/o	*	cpe:/o:yahama:rt140f:6.03.34	cpe:2.3:o:yahama:rt140f:6.03.34:*:*:*:*:*:*:*	*	*	*	*
399	rt140i	yahama	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.01.06	[]	/o	*	cpe:/o:yahama:rt140i:6.01.06	cpe:2.3:o:yahama:rt140i:6.01.06:*:*:*:*:*:*:*	*	*	*	*
400	rt140i	yahama	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.01.07	[]	/o	*	cpe:/o:yahama:rt140i:6.01.07	cpe:2.3:o:yahama:rt140i:6.01.07:*:*:*:*:*:*:*	*	*	*	*
401	rt140i	yahama	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.01.09	[]	/o	*	cpe:/o:yahama:rt140i:6.01.09	cpe:2.3:o:yahama:rt140i:6.01.09:*:*:*:*:*:*:*	*	*	*	*
402	rt140i	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.03	[]	/o	*	cpe:/o:yahama:rt140i:6.02.03	cpe:2.3:o:yahama:rt140i:6.02.03:*:*:*:*:*:*:*	*	*	*	*
403	rt140i	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.02.04	[]	/o	*	cpe:/o:yahama:rt140i:6.02.04	cpe:2.3:o:yahama:rt140i:6.02.04:*:*:*:*:*:*:*	*	*	*	*
404	rt140i	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.07	[]	/o	*	cpe:/o:yahama:rt140i:6.02.07	cpe:2.3:o:yahama:rt140i:6.02.07:*:*:*:*:*:*:*	*	*	*	*
405	rt140i	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.02.16	[]	/o	*	cpe:/o:yahama:rt140i:6.02.16	cpe:2.3:o:yahama:rt140i:6.02.16:*:*:*:*:*:*:*	*	*	*	*
406	rt140i	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.19	[]	/o	*	cpe:/o:yahama:rt140i:6.02.19	cpe:2.3:o:yahama:rt140i:6.02.19:*:*:*:*:*:*:*	*	*	*	*
407	rt140i	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.04	[]	/o	*	cpe:/o:yahama:rt140i:6.03.04	cpe:2.3:o:yahama:rt140i:6.03.04:*:*:*:*:*:*:*	*	*	*	*
408	rt140i	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.08	[]	/o	*	cpe:/o:yahama:rt140i:6.03.08	cpe:2.3:o:yahama:rt140i:6.03.08:*:*:*:*:*:*:*	*	*	*	*
409	rt140i	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.11	[]	/o	*	cpe:/o:yahama:rt140i:6.03.11	cpe:2.3:o:yahama:rt140i:6.03.11:*:*:*:*:*:*:*	*	*	*	*
410	rt140i	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.15	[]	/o	*	cpe:/o:yahama:rt140i:6.03.15	cpe:2.3:o:yahama:rt140i:6.03.15:*:*:*:*:*:*:*	*	*	*	*
411	rt140i	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.18	[]	/o	*	cpe:/o:yahama:rt140i:6.03.18	cpe:2.3:o:yahama:rt140i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
412	rt140i	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.25	[]	/o	*	cpe:/o:yahama:rt140i:6.03.25	cpe:2.3:o:yahama:rt140i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
413	rt140i	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.28	[]	/o	*	cpe:/o:yahama:rt140i:6.03.28	cpe:2.3:o:yahama:rt140i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
414	rt140i	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.33	[]	/o	*	cpe:/o:yahama:rt140i:6.03.33	cpe:2.3:o:yahama:rt140i:6.03.33:*:*:*:*:*:*:*	*	*	*	*
415	rt140i	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.34	[]	/o	*	cpe:/o:yahama:rt140i:6.03.34	cpe:2.3:o:yahama:rt140i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
416	rt140p	yahama	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.01.06	[]	/o	*	cpe:/o:yahama:rt140p:6.01.06	cpe:2.3:o:yahama:rt140p:6.01.06:*:*:*:*:*:*:*	*	*	*	*
417	rt140p	yahama	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.01.07	[]	/o	*	cpe:/o:yahama:rt140p:6.01.07	cpe:2.3:o:yahama:rt140p:6.01.07:*:*:*:*:*:*:*	*	*	*	*
418	rt140p	yahama	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.01.09	[]	/o	*	cpe:/o:yahama:rt140p:6.01.09	cpe:2.3:o:yahama:rt140p:6.01.09:*:*:*:*:*:*:*	*	*	*	*
419	rt140p	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.02.03	[]	/o	*	cpe:/o:yahama:rt140p:6.02.03	cpe:2.3:o:yahama:rt140p:6.02.03:*:*:*:*:*:*:*	*	*	*	*
420	rt140p	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.02.04	[]	/o	*	cpe:/o:yahama:rt140p:6.02.04	cpe:2.3:o:yahama:rt140p:6.02.04:*:*:*:*:*:*:*	*	*	*	*
421	rt140p	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.02.07	[]	/o	*	cpe:/o:yahama:rt140p:6.02.07	cpe:2.3:o:yahama:rt140p:6.02.07:*:*:*:*:*:*:*	*	*	*	*
422	rt140p	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.02.16	[]	/o	*	cpe:/o:yahama:rt140p:6.02.16	cpe:2.3:o:yahama:rt140p:6.02.16:*:*:*:*:*:*:*	*	*	*	*
423	rt140p	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.02.19	[]	/o	*	cpe:/o:yahama:rt140p:6.02.19	cpe:2.3:o:yahama:rt140p:6.02.19:*:*:*:*:*:*:*	*	*	*	*
424	rt140p	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.04	[]	/o	*	cpe:/o:yahama:rt140p:6.03.04	cpe:2.3:o:yahama:rt140p:6.03.04:*:*:*:*:*:*:*	*	*	*	*
425	rt140p	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.08	[]	/o	*	cpe:/o:yahama:rt140p:6.03.08	cpe:2.3:o:yahama:rt140p:6.03.08:*:*:*:*:*:*:*	*	*	*	*
426	rt140p	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.11	[]	/o	*	cpe:/o:yahama:rt140p:6.03.11	cpe:2.3:o:yahama:rt140p:6.03.11:*:*:*:*:*:*:*	*	*	*	*
427	rt140p	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.15	[]	/o	*	cpe:/o:yahama:rt140p:6.03.15	cpe:2.3:o:yahama:rt140p:6.03.15:*:*:*:*:*:*:*	*	*	*	*
428	rt140p	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.18	[]	/o	*	cpe:/o:yahama:rt140p:6.03.18	cpe:2.3:o:yahama:rt140p:6.03.18:*:*:*:*:*:*:*	*	*	*	*
429	rt140p	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.25	[]	/o	*	cpe:/o:yahama:rt140p:6.03.25	cpe:2.3:o:yahama:rt140p:6.03.25:*:*:*:*:*:*:*	*	*	*	*
430	rt140p	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.28	[]	/o	*	cpe:/o:yahama:rt140p:6.03.28	cpe:2.3:o:yahama:rt140p:6.03.28:*:*:*:*:*:*:*	*	*	*	*
431	rt140p	yahama	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.33	[]	/o	*	cpe:/o:yahama:rt140p:6.03.33	cpe:2.3:o:yahama:rt140p:6.03.33:*:*:*:*:*:*:*	*	*	*	*
432	rt140p	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.34	[]	/o	*	cpe:/o:yahama:rt140p:6.03.34	cpe:2.3:o:yahama:rt140p:6.03.34:*:*:*:*:*:*:*	*	*	*	*
433	rt200i	yahama	2.00.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.00.06	[]	/o	*	cpe:/o:yahama:rt200i:2.00.06	cpe:2.3:o:yahama:rt200i:2.00.06:*:*:*:*:*:*:*	*	*	*	*
434	rt200i	yahama	2.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.00.07	[]	/o	*	cpe:/o:yahama:rt200i:2.00.07	cpe:2.3:o:yahama:rt200i:2.00.07:*:*:*:*:*:*:*	*	*	*	*
435	rt200i	yahama	2.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.01.07	[]	/o	*	cpe:/o:yahama:rt200i:2.01.07	cpe:2.3:o:yahama:rt200i:2.01.07:*:*:*:*:*:*:*	*	*	*	*
436	rt200i	yahama	2.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.11	[]	/o	*	cpe:/o:yahama:rt200i:2.01.11	cpe:2.3:o:yahama:rt200i:2.01.11:*:*:*:*:*:*:*	*	*	*	*
437	rt200i	yahama	2.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.14	[]	/o	*	cpe:/o:yahama:rt200i:2.01.14	cpe:2.3:o:yahama:rt200i:2.01.14:*:*:*:*:*:*:*	*	*	*	*
438	rt200i	yahama	2.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.19	[]	/o	*	cpe:/o:yahama:rt200i:2.01.19	cpe:2.3:o:yahama:rt200i:2.01.19:*:*:*:*:*:*:*	*	*	*	*
439	rt200i	yahama	2.01.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.20	[]	/o	*	cpe:/o:yahama:rt200i:2.01.20	cpe:2.3:o:yahama:rt200i:2.01.20:*:*:*:*:*:*:*	*	*	*	*
440	rt200i	yahama	2.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.21	[]	/o	*	cpe:/o:yahama:rt200i:2.01.21	cpe:2.3:o:yahama:rt200i:2.01.21:*:*:*:*:*:*:*	*	*	*	*
441	rt200i	yahama	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.15	[]	/o	*	cpe:/o:yahama:rt200i:2.02.15	cpe:2.3:o:yahama:rt200i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
442	rt200i	yahama	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.17	[]	/o	*	cpe:/o:yahama:rt200i:2.02.17	cpe:2.3:o:yahama:rt200i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
443	rt200i	yahama	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.19	[]	/o	*	cpe:/o:yahama:rt200i:2.02.19	cpe:2.3:o:yahama:rt200i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
444	rt200i	yahama	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.23	[]	/o	*	cpe:/o:yahama:rt200i:2.02.23	cpe:2.3:o:yahama:rt200i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
445	rt200i	yahama	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.27	[]	/o	*	cpe:/o:yahama:rt200i:2.02.27	cpe:2.3:o:yahama:rt200i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
446	rt200i	yahama	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.28	[]	/o	*	cpe:/o:yahama:rt200i:2.02.28	cpe:2.3:o:yahama:rt200i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
447	rt200i	yahama	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.29	[]	/o	*	cpe:/o:yahama:rt200i:2.02.29	cpe:2.3:o:yahama:rt200i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
448	rt200i	yahama	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.31	[]	/o	*	cpe:/o:yahama:rt200i:2.02.31	cpe:2.3:o:yahama:rt200i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
449	rt200i	yahama	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.33	[]	/o	*	cpe:/o:yahama:rt200i:2.02.33	cpe:2.3:o:yahama:rt200i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
450	rt200i	yahama	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.34	[]	/o	*	cpe:/o:yahama:rt200i:2.02.34	cpe:2.3:o:yahama:rt200i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
451	rt200i	yahama	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.35	[]	/o	*	cpe:/o:yahama:rt200i:2.02.35	cpe:2.3:o:yahama:rt200i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
452	rt200i	yahama	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.36	[]	/o	*	cpe:/o:yahama:rt200i:2.02.36	cpe:2.3:o:yahama:rt200i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
453	rt200i	yahama	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.38	[]	/o	*	cpe:/o:yahama:rt200i:2.02.38	cpe:2.3:o:yahama:rt200i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
454	rt200i	yahama	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.39	[]	/o	*	cpe:/o:yahama:rt200i:2.02.39	cpe:2.3:o:yahama:rt200i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
455	rt200i	yahama	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.40	[]	/o	*	cpe:/o:yahama:rt200i:2.02.40	cpe:2.3:o:yahama:rt200i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
456	rt200i	yahama	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.41	[]	/o	*	cpe:/o:yahama:rt200i:2.02.41	cpe:2.3:o:yahama:rt200i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
457	rt200i	yahama	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.44	[]	/o	*	cpe:/o:yahama:rt200i:2.02.44	cpe:2.3:o:yahama:rt200i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
458	rt200i	yahama	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.45	[]	/o	*	cpe:/o:yahama:rt200i:2.02.45	cpe:2.3:o:yahama:rt200i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
459	rt200i	yahama	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.46	[]	/o	*	cpe:/o:yahama:rt200i:2.02.46	cpe:2.3:o:yahama:rt200i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
460	rt200i	yahama	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.09	[]	/o	*	cpe:/o:yahama:rt200i:3.00.09	cpe:2.3:o:yahama:rt200i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
461	rt200i	yahama	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.16	[]	/o	*	cpe:/o:yahama:rt200i:3.00.16	cpe:2.3:o:yahama:rt200i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
462	rt200i	yahama	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.18	[]	/o	*	cpe:/o:yahama:rt200i:3.00.18	cpe:2.3:o:yahama:rt200i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
463	rt200i	yahama	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.23	[]	/o	*	cpe:/o:yahama:rt200i:3.00.23	cpe:2.3:o:yahama:rt200i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
464	rt200i	yahama	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.28	[]	/o	*	cpe:/o:yahama:rt200i:3.00.28	cpe:2.3:o:yahama:rt200i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
465	rt200i	yahama	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.30	[]	/o	*	cpe:/o:yahama:rt200i:3.00.30	cpe:2.3:o:yahama:rt200i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
466	rt200i	yahama	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.31	[]	/o	*	cpe:/o:yahama:rt200i:3.00.31	cpe:2.3:o:yahama:rt200i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
467	rt200i	yahama	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.33	[]	/o	*	cpe:/o:yahama:rt200i:3.00.33	cpe:2.3:o:yahama:rt200i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
468	rt200i	yahama	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.35	[]	/o	*	cpe:/o:yahama:rt200i:3.00.35	cpe:2.3:o:yahama:rt200i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
469	rt200i	yahama	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.36	[]	/o	*	cpe:/o:yahama:rt200i:3.00.36	cpe:2.3:o:yahama:rt200i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
470	rt200i	yahama	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.37	[]	/o	*	cpe:/o:yahama:rt200i:3.00.37	cpe:2.3:o:yahama:rt200i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
471	rt200i	yahama	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.42	[]	/o	*	cpe:/o:yahama:rt200i:3.00.42	cpe:2.3:o:yahama:rt200i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
472	rt200i	yahama	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.44	[]	/o	*	cpe:/o:yahama:rt200i:3.00.44	cpe:2.3:o:yahama:rt200i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
473	rt200i	yahama	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.45	[]	/o	*	cpe:/o:yahama:rt200i:3.00.45	cpe:2.3:o:yahama:rt200i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
474	rt200i	yahama	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.46	[]	/o	*	cpe:/o:yahama:rt200i:3.00.46	cpe:2.3:o:yahama:rt200i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
475	rt200i	yahama	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.47	[]	/o	*	cpe:/o:yahama:rt200i:3.00.47	cpe:2.3:o:yahama:rt200i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
476	rt200i	yahama	4.00.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.02	[]	/o	*	cpe:/o:yahama:rt200i:4.00.02	cpe:2.3:o:yahama:rt200i:4.00.02:*:*:*:*:*:*:*	*	*	*	*
477	rt200i	yahama	4.00.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.05	[]	/o	*	cpe:/o:yahama:rt200i:4.00.05	cpe:2.3:o:yahama:rt200i:4.00.05:*:*:*:*:*:*:*	*	*	*	*
478	rt200i	yahama	4.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.07	[]	/o	*	cpe:/o:yahama:rt200i:4.00.07	cpe:2.3:o:yahama:rt200i:4.00.07:*:*:*:*:*:*:*	*	*	*	*
479	rt200i	yahama	4.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.09	[]	/o	*	cpe:/o:yahama:rt200i:4.00.09	cpe:2.3:o:yahama:rt200i:4.00.09:*:*:*:*:*:*:*	*	*	*	*
480	rt200i	yahama	4.00.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.11	[]	/o	*	cpe:/o:yahama:rt200i:4.00.11	cpe:2.3:o:yahama:rt200i:4.00.11:*:*:*:*:*:*:*	*	*	*	*
481	rt200i	yahama	4.00.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.13	[]	/o	*	cpe:/o:yahama:rt200i:4.00.13	cpe:2.3:o:yahama:rt200i:4.00.13:*:*:*:*:*:*:*	*	*	*	*
482	rt200i	yahama	4.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.14	[]	/o	*	cpe:/o:yahama:rt200i:4.00.14	cpe:2.3:o:yahama:rt200i:4.00.14:*:*:*:*:*:*:*	*	*	*	*
483	rt200i	yahama	4.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.18	[]	/o	*	cpe:/o:yahama:rt200i:4.00.18	cpe:2.3:o:yahama:rt200i:4.00.18:*:*:*:*:*:*:*	*	*	*	*
484	rt200i	yahama	4.00.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.21	[]	/o	*	cpe:/o:yahama:rt200i:4.00.21	cpe:2.3:o:yahama:rt200i:4.00.21:*:*:*:*:*:*:*	*	*	*	*
485	rt200i	yahama	4.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.22	[]	/o	*	cpe:/o:yahama:rt200i:4.00.22	cpe:2.3:o:yahama:rt200i:4.00.22:*:*:*:*:*:*:*	*	*	*	*
486	rt200i	yahama	4.00.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.24	[]	/o	*	cpe:/o:yahama:rt200i:4.00.24	cpe:2.3:o:yahama:rt200i:4.00.24:*:*:*:*:*:*:*	*	*	*	*
487	rt200i	yahama	4.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.25	[]	/o	*	cpe:/o:yahama:rt200i:4.00.25	cpe:2.3:o:yahama:rt200i:4.00.25:*:*:*:*:*:*:*	*	*	*	*
488	rt200i	yahama	4.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.33	[]	/o	*	cpe:/o:yahama:rt200i:4.00.33	cpe:2.3:o:yahama:rt200i:4.00.33:*:*:*:*:*:*:*	*	*	*	*
489	rt200i	yahama	4.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.35	[]	/o	*	cpe:/o:yahama:rt200i:4.00.35	cpe:2.3:o:yahama:rt200i:4.00.35:*:*:*:*:*:*:*	*	*	*	*
490	rt200i	yahama	4.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.36	[]	/o	*	cpe:/o:yahama:rt200i:4.00.36	cpe:2.3:o:yahama:rt200i:4.00.36:*:*:*:*:*:*:*	*	*	*	*
491	rt200i	yahama	4.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.37	[]	/o	*	cpe:/o:yahama:rt200i:4.00.37	cpe:2.3:o:yahama:rt200i:4.00.37:*:*:*:*:*:*:*	*	*	*	*
492	rt200i	yahama	4.00.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.38	[]	/o	*	cpe:/o:yahama:rt200i:4.00.38	cpe:2.3:o:yahama:rt200i:4.00.38:*:*:*:*:*:*:*	*	*	*	*
493	rt200i	yahama	4.00.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.39	[]	/o	*	cpe:/o:yahama:rt200i:4.00.39	cpe:2.3:o:yahama:rt200i:4.00.39:*:*:*:*:*:*:*	*	*	*	*
494	rt200i	yahama	4.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.40	[]	/o	*	cpe:/o:yahama:rt200i:4.00.40	cpe:2.3:o:yahama:rt200i:4.00.40:*:*:*:*:*:*:*	*	*	*	*
495	rt200i	yahama	4.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.44	[]	/o	*	cpe:/o:yahama:rt200i:4.00.44	cpe:2.3:o:yahama:rt200i:4.00.44:*:*:*:*:*:*:*	*	*	*	*
496	rt200i	yahama	4.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.48	[]	/o	*	cpe:/o:yahama:rt200i:4.00.48	cpe:2.3:o:yahama:rt200i:4.00.48:*:*:*:*:*:*:*	*	*	*	*
497	rt200i	yahama	4.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.53	[]	/o	*	cpe:/o:yahama:rt200i:4.00.53	cpe:2.3:o:yahama:rt200i:4.00.53:*:*:*:*:*:*:*	*	*	*	*
498	rt200i	yahama	4.00.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.54	[]	/o	*	cpe:/o:yahama:rt200i:4.00.54	cpe:2.3:o:yahama:rt200i:4.00.54:*:*:*:*:*:*:*	*	*	*	*
499	rt250i	yahama	8.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.19	[]	/o	*	cpe:/o:yahama:rt250i:8.02.19	cpe:2.3:o:yahama:rt250i:8.02.19:*:*:*:*:*:*:*	*	*	*	*
500	rt250i	yahama	8.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.28	[]	/o	*	cpe:/o:yahama:rt250i:8.02.28	cpe:2.3:o:yahama:rt250i:8.02.28:*:*:*:*:*:*:*	*	*	*	*
501	rt250i	yahama	8.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.31	[]	/o	*	cpe:/o:yahama:rt250i:8.02.31	cpe:2.3:o:yahama:rt250i:8.02.31:*:*:*:*:*:*:*	*	*	*	*
502	rt250i	yahama	8.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.35	[]	/o	*	cpe:/o:yahama:rt250i:8.02.35	cpe:2.3:o:yahama:rt250i:8.02.35:*:*:*:*:*:*:*	*	*	*	*
503	rt250i	yahama	8.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.36	[]	/o	*	cpe:/o:yahama:rt250i:8.02.36	cpe:2.3:o:yahama:rt250i:8.02.36:*:*:*:*:*:*:*	*	*	*	*
504	rt250i	yahama	8.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.40	[]	/o	*	cpe:/o:yahama:rt250i:8.02.40	cpe:2.3:o:yahama:rt250i:8.02.40:*:*:*:*:*:*:*	*	*	*	*
505	rt250i	yahama	8.02.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.42	[]	/o	*	cpe:/o:yahama:rt250i:8.02.42	cpe:2.3:o:yahama:rt250i:8.02.42:*:*:*:*:*:*:*	*	*	*	*
506	rt250i	yahama	8.02.43	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.43	[]	/o	*	cpe:/o:yahama:rt250i:8.02.43	cpe:2.3:o:yahama:rt250i:8.02.43:*:*:*:*:*:*:*	*	*	*	*
507	rt250i	yahama	8.02.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.48	[]	/o	*	cpe:/o:yahama:rt250i:8.02.48	cpe:2.3:o:yahama:rt250i:8.02.48:*:*:*:*:*:*:*	*	*	*	*
508	rt250i	yahama	8.02.50	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.50	[]	/o	*	cpe:/o:yahama:rt250i:8.02.50	cpe:2.3:o:yahama:rt250i:8.02.50:*:*:*:*:*:*:*	*	*	*	*
509	rt300i	yahama	6.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.09	[]	/o	*	cpe:/o:yahama:rt300i:6.00.09	cpe:2.3:o:yahama:rt300i:6.00.09:*:*:*:*:*:*:*	*	*	*	*
510	rt300i	yahama	6.00.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.11	[]	/o	*	cpe:/o:yahama:rt300i:6.00.11	cpe:2.3:o:yahama:rt300i:6.00.11:*:*:*:*:*:*:*	*	*	*	*
511	rt300i	yahama	6.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.15	[]	/o	*	cpe:/o:yahama:rt300i:6.00.15	cpe:2.3:o:yahama:rt300i:6.00.15:*:*:*:*:*:*:*	*	*	*	*
512	rt300i	yahama	6.00.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.17	[]	/o	*	cpe:/o:yahama:rt300i:6.00.17	cpe:2.3:o:yahama:rt300i:6.00.17:*:*:*:*:*:*:*	*	*	*	*
513	rt300i	yahama	6.00.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.20	[]	/o	*	cpe:/o:yahama:rt300i:6.00.20	cpe:2.3:o:yahama:rt300i:6.00.20:*:*:*:*:*:*:*	*	*	*	*
514	rt300i	yahama	6.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.22	[]	/o	*	cpe:/o:yahama:rt300i:6.00.22	cpe:2.3:o:yahama:rt300i:6.00.22:*:*:*:*:*:*:*	*	*	*	*
515	rt300i	yahama	6.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.25	[]	/o	*	cpe:/o:yahama:rt300i:6.00.25	cpe:2.3:o:yahama:rt300i:6.00.25:*:*:*:*:*:*:*	*	*	*	*
516	rt300i	yahama	6.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.27	[]	/o	*	cpe:/o:yahama:rt300i:6.00.27	cpe:2.3:o:yahama:rt300i:6.00.27:*:*:*:*:*:*:*	*	*	*	*
517	rt300i	yahama	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.01.06	[]	/o	*	cpe:/o:yahama:rt300i:6.01.06	cpe:2.3:o:yahama:rt300i:6.01.06:*:*:*:*:*:*:*	*	*	*	*
518	rt300i	yahama	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.01.07	[]	/o	*	cpe:/o:yahama:rt300i:6.01.07	cpe:2.3:o:yahama:rt300i:6.01.07:*:*:*:*:*:*:*	*	*	*	*
519	rt300i	yahama	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.01.09	[]	/o	*	cpe:/o:yahama:rt300i:6.01.09	cpe:2.3:o:yahama:rt300i:6.01.09:*:*:*:*:*:*:*	*	*	*	*
520	rt300i	yahama	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.02.03	[]	/o	*	cpe:/o:yahama:rt300i:6.02.03	cpe:2.3:o:yahama:rt300i:6.02.03:*:*:*:*:*:*:*	*	*	*	*
521	rt300i	yahama	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.04	[]	/o	*	cpe:/o:yahama:rt300i:6.02.04	cpe:2.3:o:yahama:rt300i:6.02.04:*:*:*:*:*:*:*	*	*	*	*
522	rt300i	yahama	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.07	[]	/o	*	cpe:/o:yahama:rt300i:6.02.07	cpe:2.3:o:yahama:rt300i:6.02.07:*:*:*:*:*:*:*	*	*	*	*
523	rt300i	yahama	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.02.16	[]	/o	*	cpe:/o:yahama:rt300i:6.02.16	cpe:2.3:o:yahama:rt300i:6.02.16:*:*:*:*:*:*:*	*	*	*	*
524	rt300i	yahama	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.19	[]	/o	*	cpe:/o:yahama:rt300i:6.02.19	cpe:2.3:o:yahama:rt300i:6.02.19:*:*:*:*:*:*:*	*	*	*	*
525	rt300i	yahama	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.04	[]	/o	*	cpe:/o:yahama:rt300i:6.03.04	cpe:2.3:o:yahama:rt300i:6.03.04:*:*:*:*:*:*:*	*	*	*	*
526	rt300i	yahama	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.08	[]	/o	*	cpe:/o:yahama:rt300i:6.03.08	cpe:2.3:o:yahama:rt300i:6.03.08:*:*:*:*:*:*:*	*	*	*	*
527	rt300i	yahama	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.11	[]	/o	*	cpe:/o:yahama:rt300i:6.03.11	cpe:2.3:o:yahama:rt300i:6.03.11:*:*:*:*:*:*:*	*	*	*	*
528	rt300i	yahama	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.03.15	[]	/o	*	cpe:/o:yahama:rt300i:6.03.15	cpe:2.3:o:yahama:rt300i:6.03.15:*:*:*:*:*:*:*	*	*	*	*
529	rt300i	yahama	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.18	[]	/o	*	cpe:/o:yahama:rt300i:6.03.18	cpe:2.3:o:yahama:rt300i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
530	rt300i	yahama	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.25	[]	/o	*	cpe:/o:yahama:rt300i:6.03.25	cpe:2.3:o:yahama:rt300i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
531	rt300i	yahama	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.03.28	[]	/o	*	cpe:/o:yahama:rt300i:6.03.28	cpe:2.3:o:yahama:rt300i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
532	rt300i	yahama	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.34	[]	/o	*	cpe:/o:yahama:rt300i:6.03.34	cpe:2.3:o:yahama:rt300i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
533	rt56v	yahama	4.07.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.11	[]	/o	*	cpe:/o:yahama:rt56v:4.07.11	cpe:2.3:o:yahama:rt56v:4.07.11:*:*:*:*:*:*:*	*	*	*	*
534	rt56v	yahama	4.07.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.19	[]	/o	*	cpe:/o:yahama:rt56v:4.07.19	cpe:2.3:o:yahama:rt56v:4.07.19:*:*:*:*:*:*:*	*	*	*	*
535	rt56v	yahama	4.07.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.22	[]	/o	*	cpe:/o:yahama:rt56v:4.07.22	cpe:2.3:o:yahama:rt56v:4.07.22:*:*:*:*:*:*:*	*	*	*	*
536	rt56v	yahama	4.07.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.30	[]	/o	*	cpe:/o:yahama:rt56v:4.07.30	cpe:2.3:o:yahama:rt56v:4.07.30:*:*:*:*:*:*:*	*	*	*	*
537	rt56v	yahama	4.07.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.37	[]	/o	*	cpe:/o:yahama:rt56v:4.07.37	cpe:2.3:o:yahama:rt56v:4.07.37:*:*:*:*:*:*:*	*	*	*	*
538	rt56v	yahama	4.07.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.45	[]	/o	*	cpe:/o:yahama:rt56v:4.07.45	cpe:2.3:o:yahama:rt56v:4.07.45:*:*:*:*:*:*:*	*	*	*	*
539	rt56v	yahama	4.07.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.49	[]	/o	*	cpe:/o:yahama:rt56v:4.07.49	cpe:2.3:o:yahama:rt56v:4.07.49:*:*:*:*:*:*:*	*	*	*	*
540	rt56v	yahama	4.07.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.54	[]	/o	*	cpe:/o:yahama:rt56v:4.07.54	cpe:2.3:o:yahama:rt56v:4.07.54:*:*:*:*:*:*:*	*	*	*	*
541	rt57i	yahama	8.00.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.13	[]	/o	*	cpe:/o:yahama:rt57i:8.00.13	cpe:2.3:o:yahama:rt57i:8.00.13:*:*:*:*:*:*:*	*	*	*	*
542	rt57i	yahama	8.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.14	[]	/o	*	cpe:/o:yahama:rt57i:8.00.14	cpe:2.3:o:yahama:rt57i:8.00.14:*:*:*:*:*:*:*	*	*	*	*
543	rt57i	yahama	8.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.19	[]	/o	*	cpe:/o:yahama:rt57i:8.00.19	cpe:2.3:o:yahama:rt57i:8.00.19:*:*:*:*:*:*:*	*	*	*	*
544	rt57i	yahama	8.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.27	[]	/o	*	cpe:/o:yahama:rt57i:8.00.27	cpe:2.3:o:yahama:rt57i:8.00.27:*:*:*:*:*:*:*	*	*	*	*
545	rt57i	yahama	8.00.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.41	[]	/o	*	cpe:/o:yahama:rt57i:8.00.41	cpe:2.3:o:yahama:rt57i:8.00.41:*:*:*:*:*:*:*	*	*	*	*
546	rt57i	yahama	8.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.46	[]	/o	*	cpe:/o:yahama:rt57i:8.00.46	cpe:2.3:o:yahama:rt57i:8.00.46:*:*:*:*:*:*:*	*	*	*	*
547	rt57i	yahama	8.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.48	[]	/o	*	cpe:/o:yahama:rt57i:8.00.48	cpe:2.3:o:yahama:rt57i:8.00.48:*:*:*:*:*:*:*	*	*	*	*
548	rt57i	yahama	8.00.57	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.57	[]	/o	*	cpe:/o:yahama:rt57i:8.00.57	cpe:2.3:o:yahama:rt57i:8.00.57:*:*:*:*:*:*:*	*	*	*	*
549	rt57i	yahama	8.00.66	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.66	[]	/o	*	cpe:/o:yahama:rt57i:8.00.66	cpe:2.3:o:yahama:rt57i:8.00.66:*:*:*:*:*:*:*	*	*	*	*
550	rt57i	yahama	8.00.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.70	[]	/o	*	cpe:/o:yahama:rt57i:8.00.70	cpe:2.3:o:yahama:rt57i:8.00.70:*:*:*:*:*:*:*	*	*	*	*
551	rt57i	yahama	8.00.71	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.71	[]	/o	*	cpe:/o:yahama:rt57i:8.00.71	cpe:2.3:o:yahama:rt57i:8.00.71:*:*:*:*:*:*:*	*	*	*	*
552	rt57i	yahama	8.00.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.83	[]	/o	*	cpe:/o:yahama:rt57i:8.00.83	cpe:2.3:o:yahama:rt57i:8.00.83:*:*:*:*:*:*:*	*	*	*	*
553	rt57i	yahama	8.00.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.87	[]	/o	*	cpe:/o:yahama:rt57i:8.00.87	cpe:2.3:o:yahama:rt57i:8.00.87:*:*:*:*:*:*:*	*	*	*	*
554	rt57i	yahama	8.00.89	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.89	[]	/o	*	cpe:/o:yahama:rt57i:8.00.89	cpe:2.3:o:yahama:rt57i:8.00.89:*:*:*:*:*:*:*	*	*	*	*
555	rt57i	yahama	8.00.91	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.91	[]	/o	*	cpe:/o:yahama:rt57i:8.00.91	cpe:2.3:o:yahama:rt57i:8.00.91:*:*:*:*:*:*:*	*	*	*	*
556	rt58i	yahama	9.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.11	[]	/o	*	cpe:/o:yahama:rt58i:9.01.11	cpe:2.3:o:yahama:rt58i:9.01.11:*:*:*:*:*:*:*	*	*	*	*
557	rt58i	yahama	9.01.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.13	[]	/o	*	cpe:/o:yahama:rt58i:9.01.13	cpe:2.3:o:yahama:rt58i:9.01.13:*:*:*:*:*:*:*	*	*	*	*
558	rt58i	yahama	9.01.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.18	[]	/o	*	cpe:/o:yahama:rt58i:9.01.18	cpe:2.3:o:yahama:rt58i:9.01.18:*:*:*:*:*:*:*	*	*	*	*
559	rt58i	yahama	9.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.19	[]	/o	*	cpe:/o:yahama:rt58i:9.01.19	cpe:2.3:o:yahama:rt58i:9.01.19:*:*:*:*:*:*:*	*	*	*	*
560	rt58i	yahama	9.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.21	[]	/o	*	cpe:/o:yahama:rt58i:9.01.21	cpe:2.3:o:yahama:rt58i:9.01.21:*:*:*:*:*:*:*	*	*	*	*
561	rt58i	yahama	9.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.29	[]	/o	*	cpe:/o:yahama:rt58i:9.01.29	cpe:2.3:o:yahama:rt58i:9.01.29:*:*:*:*:*:*:*	*	*	*	*
562	rt58i	yahama	9.01.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.33	[]	/o	*	cpe:/o:yahama:rt58i:9.01.33	cpe:2.3:o:yahama:rt58i:9.01.33:*:*:*:*:*:*:*	*	*	*	*
563	rt58i	yahama	9.01.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.36	[]	/o	*	cpe:/o:yahama:rt58i:9.01.36	cpe:2.3:o:yahama:rt58i:9.01.36:*:*:*:*:*:*:*	*	*	*	*
564	rt58i	yahama	9.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.41	[]	/o	*	cpe:/o:yahama:rt58i:9.01.41	cpe:2.3:o:yahama:rt58i:9.01.41:*:*:*:*:*:*:*	*	*	*	*
565	rt58i	yahama	9.01.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.44	[]	/o	*	cpe:/o:yahama:rt58i:9.01.44	cpe:2.3:o:yahama:rt58i:9.01.44:*:*:*:*:*:*:*	*	*	*	*
566	rt58i	yahama	9.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.48	[]	/o	*	cpe:/o:yahama:rt58i:9.01.48	cpe:2.3:o:yahama:rt58i:9.01.48:*:*:*:*:*:*:*	*	*	*	*
567	rt58i	yahama	9.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.49	[]	/o	*	cpe:/o:yahama:rt58i:9.01.49	cpe:2.3:o:yahama:rt58i:9.01.49:*:*:*:*:*:*:*	*	*	*	*
568	rt60w	yahama	5.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT60w 5.01.14	[]	/o	*	cpe:/o:yahama:rt60w:5.01.14	cpe:2.3:o:yahama:rt60w:5.01.14:*:*:*:*:*:*:*	*	*	*	*
569	rt60w	yahama	5.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT60w 5.01.16	[]	/o	*	cpe:/o:yahama:rt60w:5.01.16	cpe:2.3:o:yahama:rt60w:5.01.16:*:*:*:*:*:*:*	*	*	*	*
570	rt60w	yahama	5.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT60w 5.01.21	[]	/o	*	cpe:/o:yahama:rt60w:5.01.21	cpe:2.3:o:yahama:rt60w:5.01.21:*:*:*:*:*:*:*	*	*	*	*
571	rt80i	yahama	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.15	[]	/o	*	cpe:/o:yahama:rt80i:2.02.15	cpe:2.3:o:yahama:rt80i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
572	rt80i	yahama	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.17	[]	/o	*	cpe:/o:yahama:rt80i:2.02.17	cpe:2.3:o:yahama:rt80i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
573	rt80i	yahama	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.19	[]	/o	*	cpe:/o:yahama:rt80i:2.02.19	cpe:2.3:o:yahama:rt80i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
574	rt80i	yahama	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.23	[]	/o	*	cpe:/o:yahama:rt80i:2.02.23	cpe:2.3:o:yahama:rt80i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
2713	jdk	oracle	1.6.0	update_33		\N	2018-05-31 16:59:57.059749	2018-05-31 16:59:57.059749	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_33	\N	\N	\N	\N	\N
575	rt80i	yahama	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.27	[]	/o	*	cpe:/o:yahama:rt80i:2.02.27	cpe:2.3:o:yahama:rt80i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
576	rt80i	yahama	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.28	[]	/o	*	cpe:/o:yahama:rt80i:2.02.28	cpe:2.3:o:yahama:rt80i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
577	rt80i	yahama	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.29	[]	/o	*	cpe:/o:yahama:rt80i:2.02.29	cpe:2.3:o:yahama:rt80i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
578	rt80i	yahama	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.31	[]	/o	*	cpe:/o:yahama:rt80i:2.02.31	cpe:2.3:o:yahama:rt80i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
579	rt80i	yahama	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.33	[]	/o	*	cpe:/o:yahama:rt80i:2.02.33	cpe:2.3:o:yahama:rt80i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
580	rt80i	yahama	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.34	[]	/o	*	cpe:/o:yahama:rt80i:2.02.34	cpe:2.3:o:yahama:rt80i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
581	rt80i	yahama	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.35	[]	/o	*	cpe:/o:yahama:rt80i:2.02.35	cpe:2.3:o:yahama:rt80i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
582	rt80i	yahama	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.36	[]	/o	*	cpe:/o:yahama:rt80i:2.02.36	cpe:2.3:o:yahama:rt80i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
583	rt80i	yahama	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.38	[]	/o	*	cpe:/o:yahama:rt80i:2.02.38	cpe:2.3:o:yahama:rt80i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
584	rt80i	yahama	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.39	[]	/o	*	cpe:/o:yahama:rt80i:2.02.39	cpe:2.3:o:yahama:rt80i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
585	rt80i	yahama	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.40	[]	/o	*	cpe:/o:yahama:rt80i:2.02.40	cpe:2.3:o:yahama:rt80i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
586	rt80i	yahama	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.41	[]	/o	*	cpe:/o:yahama:rt80i:2.02.41	cpe:2.3:o:yahama:rt80i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
587	rt80i	yahama	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.44	[]	/o	*	cpe:/o:yahama:rt80i:2.02.44	cpe:2.3:o:yahama:rt80i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
588	rt80i	yahama	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.45	[]	/o	*	cpe:/o:yahama:rt80i:2.02.45	cpe:2.3:o:yahama:rt80i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
589	rt80i	yahama	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.46	[]	/o	*	cpe:/o:yahama:rt80i:2.02.46	cpe:2.3:o:yahama:rt80i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
590	rt80i	yahama	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.09	[]	/o	*	cpe:/o:yahama:rt80i:3.00.09	cpe:2.3:o:yahama:rt80i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
591	rt80i	yahama	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.16	[]	/o	*	cpe:/o:yahama:rt80i:3.00.16	cpe:2.3:o:yahama:rt80i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
592	rt80i	yahama	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.18	[]	/o	*	cpe:/o:yahama:rt80i:3.00.18	cpe:2.3:o:yahama:rt80i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
593	rt80i	yahama	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.23	[]	/o	*	cpe:/o:yahama:rt80i:3.00.23	cpe:2.3:o:yahama:rt80i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
594	rt80i	yahama	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.28	[]	/o	*	cpe:/o:yahama:rt80i:3.00.28	cpe:2.3:o:yahama:rt80i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
595	rt80i	yahama	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.30	[]	/o	*	cpe:/o:yahama:rt80i:3.00.30	cpe:2.3:o:yahama:rt80i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
596	rt80i	yahama	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.31	[]	/o	*	cpe:/o:yahama:rt80i:3.00.31	cpe:2.3:o:yahama:rt80i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
597	rt80i	yahama	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.33	[]	/o	*	cpe:/o:yahama:rt80i:3.00.33	cpe:2.3:o:yahama:rt80i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
598	rt80i	yahama	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.35	[]	/o	*	cpe:/o:yahama:rt80i:3.00.35	cpe:2.3:o:yahama:rt80i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
599	rt80i	yahama	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.36	[]	/o	*	cpe:/o:yahama:rt80i:3.00.36	cpe:2.3:o:yahama:rt80i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
600	rt80i	yahama	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.37	[]	/o	*	cpe:/o:yahama:rt80i:3.00.37	cpe:2.3:o:yahama:rt80i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
601	rt80i	yahama	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.42	[]	/o	*	cpe:/o:yahama:rt80i:3.00.42	cpe:2.3:o:yahama:rt80i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
602	rt80i	yahama	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.44	[]	/o	*	cpe:/o:yahama:rt80i:3.00.44	cpe:2.3:o:yahama:rt80i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
603	rt80i	yahama	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.45	[]	/o	*	cpe:/o:yahama:rt80i:3.00.45	cpe:2.3:o:yahama:rt80i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
604	rt80i	yahama	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.46	[]	/o	*	cpe:/o:yahama:rt80i:3.00.46	cpe:2.3:o:yahama:rt80i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
605	rt80i	yahama	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.47	[]	/o	*	cpe:/o:yahama:rt80i:3.00.47	cpe:2.3:o:yahama:rt80i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
606	rta50i	yahama	3.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.02.15	[]	/o	*	cpe:/o:yahama:rta50i:3.02.15	cpe:2.3:o:yahama:rta50i:3.02.15:*:*:*:*:*:*:*	*	*	*	*
607	rta50i	yahama	3.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.02.17	[]	/o	*	cpe:/o:yahama:rta50i:3.02.17	cpe:2.3:o:yahama:rta50i:3.02.17:*:*:*:*:*:*:*	*	*	*	*
608	rta50i	yahama	3.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.02.19	[]	/o	*	cpe:/o:yahama:rta50i:3.02.19	cpe:2.3:o:yahama:rta50i:3.02.19:*:*:*:*:*:*:*	*	*	*	*
609	rta50i	yahama	3.02.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.02.21	[]	/o	*	cpe:/o:yahama:rta50i:3.02.21	cpe:2.3:o:yahama:rta50i:3.02.21:*:*:*:*:*:*:*	*	*	*	*
610	rta50i	yahama	3.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.03.25	[]	/o	*	cpe:/o:yahama:rta50i:3.03.25	cpe:2.3:o:yahama:rta50i:3.03.25:*:*:*:*:*:*:*	*	*	*	*
611	rta50i	yahama	3.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.03.28	[]	/o	*	cpe:/o:yahama:rta50i:3.03.28	cpe:2.3:o:yahama:rta50i:3.03.28:*:*:*:*:*:*:*	*	*	*	*
612	rta50i	yahama	3.03.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.29	[]	/o	*	cpe:/o:yahama:rta50i:3.03.29	cpe:2.3:o:yahama:rta50i:3.03.29:*:*:*:*:*:*:*	*	*	*	*
613	rta50i	yahama	3.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.34	[]	/o	*	cpe:/o:yahama:rta50i:3.03.34	cpe:2.3:o:yahama:rta50i:3.03.34:*:*:*:*:*:*:*	*	*	*	*
614	rta50i	yahama	3.03.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.03.35	[]	/o	*	cpe:/o:yahama:rta50i:3.03.35	cpe:2.3:o:yahama:rta50i:3.03.35:*:*:*:*:*:*:*	*	*	*	*
2784	jdk	sun	1.5.0	update23		\N	2018-05-31 16:59:57.50124	2018-05-31 16:59:57.50124	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update23	\N	\N	\N	\N	\N
615	rta50i	yahama	3.04.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.04.39	[]	/o	*	cpe:/o:yahama:rta50i:3.04.39	cpe:2.3:o:yahama:rta50i:3.04.39:*:*:*:*:*:*:*	*	*	*	*
616	rta50i	yahama	3.04.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.04.44	[]	/o	*	cpe:/o:yahama:rta50i:3.04.44	cpe:2.3:o:yahama:rta50i:3.04.44:*:*:*:*:*:*:*	*	*	*	*
617	rta50i	yahama	3.04.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.04.47	[]	/o	*	cpe:/o:yahama:rta50i:3.04.47	cpe:2.3:o:yahama:rta50i:3.04.47:*:*:*:*:*:*:*	*	*	*	*
618	rta50i	yahama	3.05.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.05.28	[]	/o	*	cpe:/o:yahama:rta50i:3.05.28	cpe:2.3:o:yahama:rta50i:3.05.28:*:*:*:*:*:*:*	*	*	*	*
619	rta50i	yahama	3.05.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.05.30	[]	/o	*	cpe:/o:yahama:rta50i:3.05.30	cpe:2.3:o:yahama:rta50i:3.05.30:*:*:*:*:*:*:*	*	*	*	*
620	rta50i	yahama	3.05.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.05.35	[]	/o	*	cpe:/o:yahama:rta50i:3.05.35	cpe:2.3:o:yahama:rta50i:3.05.35:*:*:*:*:*:*:*	*	*	*	*
621	rta50i	yahama	3.05.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.05.38	[]	/o	*	cpe:/o:yahama:rta50i:3.05.38	cpe:2.3:o:yahama:rta50i:3.05.38:*:*:*:*:*:*:*	*	*	*	*
622	rta50i	yahama	3.05.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.05.42	[]	/o	*	cpe:/o:yahama:rta50i:3.05.42	cpe:2.3:o:yahama:rta50i:3.05.42:*:*:*:*:*:*:*	*	*	*	*
623	rta52i	yahama	3.06.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 3.06.20	[]	/o	*	cpe:/o:yahama:rta52i:3.06.20	cpe:2.3:o:yahama:rta52i:3.06.20:*:*:*:*:*:*:*	*	*	*	*
624	rta52i	yahama	3.06.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 3.06.25	[]	/o	*	cpe:/o:yahama:rta52i:3.06.25	cpe:2.3:o:yahama:rta52i:3.06.25:*:*:*:*:*:*:*	*	*	*	*
625	rta52i	yahama	4.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.06	[]	/o	*	cpe:/o:yahama:rta52i:4.01.06	cpe:2.3:o:yahama:rta52i:4.01.06:*:*:*:*:*:*:*	*	*	*	*
626	rta52i	yahama	4.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.09	[]	/o	*	cpe:/o:yahama:rta52i:4.01.09	cpe:2.3:o:yahama:rta52i:4.01.09:*:*:*:*:*:*:*	*	*	*	*
627	rta52i	yahama	4.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.11	[]	/o	*	cpe:/o:yahama:rta52i:4.01.11	cpe:2.3:o:yahama:rta52i:4.01.11:*:*:*:*:*:*:*	*	*	*	*
628	rta52i	yahama	4.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.14	[]	/o	*	cpe:/o:yahama:rta52i:4.01.14	cpe:2.3:o:yahama:rta52i:4.01.14:*:*:*:*:*:*:*	*	*	*	*
629	rta52i	yahama	4.01.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.15	[]	/o	*	cpe:/o:yahama:rta52i:4.01.15	cpe:2.3:o:yahama:rta52i:4.01.15:*:*:*:*:*:*:*	*	*	*	*
630	rta52i	yahama	4.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.17	[]	/o	*	cpe:/o:yahama:rta52i:4.01.17	cpe:2.3:o:yahama:rta52i:4.01.17:*:*:*:*:*:*:*	*	*	*	*
631	rta54i	yahama	4.03.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA54i 4.03.12	[]	/o	*	cpe:/o:yahama:rta54i:4.03.12	cpe:2.3:o:yahama:rta54i:4.03.12:*:*:*:*:*:*:*	*	*	*	*
632	rta54i	yahama	4.04.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.04.03	[]	/o	*	cpe:/o:yahama:rta54i:4.04.03	cpe:2.3:o:yahama:rta54i:4.04.03:*:*:*:*:*:*:*	*	*	*	*
633	rta54i	yahama	4.04.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.04.05	[]	/o	*	cpe:/o:yahama:rta54i:4.04.05	cpe:2.3:o:yahama:rta54i:4.04.05:*:*:*:*:*:*:*	*	*	*	*
634	rta54i	yahama	4.04.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.04.08	[]	/o	*	cpe:/o:yahama:rta54i:4.04.08	cpe:2.3:o:yahama:rta54i:4.04.08:*:*:*:*:*:*:*	*	*	*	*
635	rta54i	yahama	4.05.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.05.14	[]	/o	*	cpe:/o:yahama:rta54i:4.05.14	cpe:2.3:o:yahama:rta54i:4.05.14:*:*:*:*:*:*:*	*	*	*	*
636	rta55i	yahama	4.06.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.28	[]	/o	*	cpe:/o:yahama:rta55i:4.06.28	cpe:2.3:o:yahama:rta55i:4.06.28:*:*:*:*:*:*:*	*	*	*	*
637	rta55i	yahama	4.06.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.35	[]	/o	*	cpe:/o:yahama:rta55i:4.06.35	cpe:2.3:o:yahama:rta55i:4.06.35:*:*:*:*:*:*:*	*	*	*	*
638	rta55i	yahama	4.06.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.47	[]	/o	*	cpe:/o:yahama:rta55i:4.06.47	cpe:2.3:o:yahama:rta55i:4.06.47:*:*:*:*:*:*:*	*	*	*	*
639	rta55i	yahama	4.06.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.54	[]	/o	*	cpe:/o:yahama:rta55i:4.06.54	cpe:2.3:o:yahama:rta55i:4.06.54:*:*:*:*:*:*:*	*	*	*	*
640	rta55i	yahama	4.06.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.60	[]	/o	*	cpe:/o:yahama:rta55i:4.06.60	cpe:2.3:o:yahama:rta55i:4.06.60:*:*:*:*:*:*:*	*	*	*	*
641	rta55i	yahama	4.06.67	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.67	[]	/o	*	cpe:/o:yahama:rta55i:4.06.67	cpe:2.3:o:yahama:rta55i:4.06.67:*:*:*:*:*:*:*	*	*	*	*
642	rtv700	yahama	8.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.31	[]	/o	*	cpe:/o:yahama:rtv700:8.00.31	cpe:2.3:o:yahama:rtv700:8.00.31:*:*:*:*:*:*:*	*	*	*	*
643	rtv700	yahama	8.00.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.39	[]	/o	*	cpe:/o:yahama:rtv700:8.00.39	cpe:2.3:o:yahama:rtv700:8.00.39:*:*:*:*:*:*:*	*	*	*	*
644	rtv700	yahama	8.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.45	[]	/o	*	cpe:/o:yahama:rtv700:8.00.45	cpe:2.3:o:yahama:rtv700:8.00.45:*:*:*:*:*:*:*	*	*	*	*
645	rtv700	yahama	8.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.53	[]	/o	*	cpe:/o:yahama:rtv700:8.00.53	cpe:2.3:o:yahama:rtv700:8.00.53:*:*:*:*:*:*:*	*	*	*	*
646	rtv700	yahama	8.00.56	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.56	[]	/o	*	cpe:/o:yahama:rtv700:8.00.56	cpe:2.3:o:yahama:rtv700:8.00.56:*:*:*:*:*:*:*	*	*	*	*
647	rtv700	yahama	8.00.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.60	[]	/o	*	cpe:/o:yahama:rtv700:8.00.60	cpe:2.3:o:yahama:rtv700:8.00.60:*:*:*:*:*:*:*	*	*	*	*
648	rtv700	yahama	8.00.62	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.62	[]	/o	*	cpe:/o:yahama:rtv700:8.00.62	cpe:2.3:o:yahama:rtv700:8.00.62:*:*:*:*:*:*:*	*	*	*	*
649	rtv700	yahama	8.00.69	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.69	[]	/o	*	cpe:/o:yahama:rtv700:8.00.69	cpe:2.3:o:yahama:rtv700:8.00.69:*:*:*:*:*:*:*	*	*	*	*
650	rtv700	yahama	8.00.72	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.72	[]	/o	*	cpe:/o:yahama:rtv700:8.00.72	cpe:2.3:o:yahama:rtv700:8.00.72:*:*:*:*:*:*:*	*	*	*	*
651	rtv700	yahama	8.00.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.77	[]	/o	*	cpe:/o:yahama:rtv700:8.00.77	cpe:2.3:o:yahama:rtv700:8.00.77:*:*:*:*:*:*:*	*	*	*	*
652	rtv700	yahama	8.00.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.80	[]	/o	*	cpe:/o:yahama:rtv700:8.00.80	cpe:2.3:o:yahama:rtv700:8.00.80:*:*:*:*:*:*:*	*	*	*	*
653	rtv700	yahama	8.00.81	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.81	[]	/o	*	cpe:/o:yahama:rtv700:8.00.81	cpe:2.3:o:yahama:rtv700:8.00.81:*:*:*:*:*:*:*	*	*	*	*
654	rtv700	yahama	8.00.84	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.84	[]	/o	*	cpe:/o:yahama:rtv700:8.00.84	cpe:2.3:o:yahama:rtv700:8.00.84:*:*:*:*:*:*:*	*	*	*	*
655	rtv700	yahama	8.00.86	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.86	[]	/o	*	cpe:/o:yahama:rtv700:8.00.86	cpe:2.3:o:yahama:rtv700:8.00.86:*:*:*:*:*:*:*	*	*	*	*
656	rtv700	yahama	8.00.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.88	[]	/o	*	cpe:/o:yahama:rtv700:8.00.88	cpe:2.3:o:yahama:rtv700:8.00.88:*:*:*:*:*:*:*	*	*	*	*
657	rtw65b	yahama	5.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65b 5.03.11	[]	/o	*	cpe:/o:yahama:rtw65b:5.03.11	cpe:2.3:o:yahama:rtw65b:5.03.11:*:*:*:*:*:*:*	*	*	*	*
658	rtw65b	yahama	5.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65b 5.03.15	[]	/o	*	cpe:/o:yahama:rtw65b:5.03.15	cpe:2.3:o:yahama:rtw65b:5.03.15:*:*:*:*:*:*:*	*	*	*	*
659	rtw65b	yahama	5.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65b 5.03.25	[]	/o	*	cpe:/o:yahama:rtw65b:5.03.25	cpe:2.3:o:yahama:rtw65b:5.03.25:*:*:*:*:*:*:*	*	*	*	*
660	rtw65i	yahama	5.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65i 5.03.11	[]	/o	*	cpe:/o:yahama:rtw65i:5.03.11	cpe:2.3:o:yahama:rtw65i:5.03.11:*:*:*:*:*:*:*	*	*	*	*
661	rtw65i	yahama	5.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65i 5.03.15	[]	/o	*	cpe:/o:yahama:rtw65i:5.03.15	cpe:2.3:o:yahama:rtw65i:5.03.15:*:*:*:*:*:*:*	*	*	*	*
662	rtw65i	yahama	5.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65i 5.03.25	[]	/o	*	cpe:/o:yahama:rtw65i:5.03.25	cpe:2.3:o:yahama:rtw65i:5.03.25:*:*:*:*:*:*:*	*	*	*	*
663	rtx1000	yahama	7.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.14	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.14	cpe:2.3:o:yahama:rtx1000:7.00.14:*:*:*:*:*:*:*	*	*	*	*
664	rtx1000	yahama	7.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.15	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.15	cpe:2.3:o:yahama:rtx1000:7.00.15:*:*:*:*:*:*:*	*	*	*	*
665	rtx1000	yahama	7.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.16	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.16	cpe:2.3:o:yahama:rtx1000:7.00.16:*:*:*:*:*:*:*	*	*	*	*
666	rtx1000	yahama	7.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.19	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.19	cpe:2.3:o:yahama:rtx1000:7.00.19:*:*:*:*:*:*:*	*	*	*	*
667	rtx1000	yahama	7.00.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.26	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.26	cpe:2.3:o:yahama:rtx1000:7.00.26:*:*:*:*:*:*:*	*	*	*	*
668	rtx1000	yahama	7.00.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.29	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.29	cpe:2.3:o:yahama:rtx1000:7.00.29:*:*:*:*:*:*:*	*	*	*	*
669	rtx1000	yahama	7.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.30	[]	/o	*	cpe:/o:yahama:rtx1000:7.00.30	cpe:2.3:o:yahama:rtx1000:7.00.30:*:*:*:*:*:*:*	*	*	*	*
670	rtx1000	yahama	7.01.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.04	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.04	cpe:2.3:o:yahama:rtx1000:7.01.04:*:*:*:*:*:*:*	*	*	*	*
671	rtx1000	yahama	7.01.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.05	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.05	cpe:2.3:o:yahama:rtx1000:7.01.05:*:*:*:*:*:*:*	*	*	*	*
672	rtx1000	yahama	7.01.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.08	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.08	cpe:2.3:o:yahama:rtx1000:7.01.08:*:*:*:*:*:*:*	*	*	*	*
673	rtx1000	yahama	7.01.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.15	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.15	cpe:2.3:o:yahama:rtx1000:7.01.15:*:*:*:*:*:*:*	*	*	*	*
674	rtx1000	yahama	7.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.16	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.16	cpe:2.3:o:yahama:rtx1000:7.01.16:*:*:*:*:*:*:*	*	*	*	*
675	rtx1000	yahama	7.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.17	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.17	cpe:2.3:o:yahama:rtx1000:7.01.17:*:*:*:*:*:*:*	*	*	*	*
676	rtx1000	yahama	7.01.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.26	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.26	cpe:2.3:o:yahama:rtx1000:7.01.26:*:*:*:*:*:*:*	*	*	*	*
677	rtx1000	yahama	7.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.29	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.29	cpe:2.3:o:yahama:rtx1000:7.01.29:*:*:*:*:*:*:*	*	*	*	*
678	rtx1000	yahama	7.01.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.34	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.34	cpe:2.3:o:yahama:rtx1000:7.01.34:*:*:*:*:*:*:*	*	*	*	*
679	rtx1000	yahama	7.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.41	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.41	cpe:2.3:o:yahama:rtx1000:7.01.41:*:*:*:*:*:*:*	*	*	*	*
680	rtx1000	yahama	7.01.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.47	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.47	cpe:2.3:o:yahama:rtx1000:7.01.47:*:*:*:*:*:*:*	*	*	*	*
681	rtx1000	yahama	7.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.48	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.48	cpe:2.3:o:yahama:rtx1000:7.01.48:*:*:*:*:*:*:*	*	*	*	*
682	rtx1000	yahama	7.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.49	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.49	cpe:2.3:o:yahama:rtx1000:7.01.49:*:*:*:*:*:*:*	*	*	*	*
683	rtx1000	yahama	7.01.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.53	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.53	cpe:2.3:o:yahama:rtx1000:7.01.53:*:*:*:*:*:*:*	*	*	*	*
684	rtx1000	yahama	7.01.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.54	[]	/o	*	cpe:/o:yahama:rtx1000:7.01.54	cpe:2.3:o:yahama:rtx1000:7.01.54:*:*:*:*:*:*:*	*	*	*	*
685	rtx1100	yahama	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.06	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.06	cpe:2.3:o:yahama:rtx1100:8.03.06:*:*:*:*:*:*:*	*	*	*	*
686	rtx1100	yahama	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.08	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.08	cpe:2.3:o:yahama:rtx1100:8.03.08:*:*:*:*:*:*:*	*	*	*	*
687	rtx1100	yahama	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.24	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.24	cpe:2.3:o:yahama:rtx1100:8.03.24:*:*:*:*:*:*:*	*	*	*	*
688	rtx1100	yahama	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.26	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.26	cpe:2.3:o:yahama:rtx1100:8.03.26:*:*:*:*:*:*:*	*	*	*	*
689	rtx1100	yahama	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.37	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.37	cpe:2.3:o:yahama:rtx1100:8.03.37:*:*:*:*:*:*:*	*	*	*	*
690	rtx1100	yahama	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.41	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.41	cpe:2.3:o:yahama:rtx1100:8.03.41:*:*:*:*:*:*:*	*	*	*	*
691	rtx1100	yahama	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.42	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.42	cpe:2.3:o:yahama:rtx1100:8.03.42:*:*:*:*:*:*:*	*	*	*	*
692	rtx1100	yahama	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.46	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.46	cpe:2.3:o:yahama:rtx1100:8.03.46:*:*:*:*:*:*:*	*	*	*	*
693	rtx1100	yahama	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.60	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.60	cpe:2.3:o:yahama:rtx1100:8.03.60:*:*:*:*:*:*:*	*	*	*	*
694	rtx1100	yahama	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.61	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.61	cpe:2.3:o:yahama:rtx1100:8.03.61:*:*:*:*:*:*:*	*	*	*	*
695	rtx1100	yahama	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.68	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.68	cpe:2.3:o:yahama:rtx1100:8.03.68:*:*:*:*:*:*:*	*	*	*	*
696	rtx1100	yahama	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.70	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.70	cpe:2.3:o:yahama:rtx1100:8.03.70:*:*:*:*:*:*:*	*	*	*	*
697	rtx1100	yahama	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.75	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.75	cpe:2.3:o:yahama:rtx1100:8.03.75:*:*:*:*:*:*:*	*	*	*	*
698	rtx1100	yahama	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.76	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.76	cpe:2.3:o:yahama:rtx1100:8.03.76:*:*:*:*:*:*:*	*	*	*	*
699	rtx1100	yahama	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.77	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.77	cpe:2.3:o:yahama:rtx1100:8.03.77:*:*:*:*:*:*:*	*	*	*	*
700	rtx1100	yahama	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.78	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.78	cpe:2.3:o:yahama:rtx1100:8.03.78:*:*:*:*:*:*:*	*	*	*	*
701	rtx1100	yahama	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.80	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.80	cpe:2.3:o:yahama:rtx1100:8.03.80:*:*:*:*:*:*:*	*	*	*	*
702	rtx1100	yahama	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.82	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.82	cpe:2.3:o:yahama:rtx1100:8.03.82:*:*:*:*:*:*:*	*	*	*	*
703	rtx1100	yahama	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.83	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.83	cpe:2.3:o:yahama:rtx1100:8.03.83:*:*:*:*:*:*:*	*	*	*	*
704	rtx1100	yahama	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.87	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.87	cpe:2.3:o:yahama:rtx1100:8.03.87:*:*:*:*:*:*:*	*	*	*	*
705	rtx1100	yahama	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.88	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.88	cpe:2.3:o:yahama:rtx1100:8.03.88:*:*:*:*:*:*:*	*	*	*	*
706	rtx1100	yahama	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.90	[]	/o	*	cpe:/o:yahama:rtx1100:8.03.90	cpe:2.3:o:yahama:rtx1100:8.03.90:*:*:*:*:*:*:*	*	*	*	*
707	rtx1200	yahama	10.01.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.08	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.08	cpe:2.3:o:yahama:rtx1200:10.01.08:*:*:*:*:*:*:*	*	*	*	*
708	rtx1200	yahama	10.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.11	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.11	cpe:2.3:o:yahama:rtx1200:10.01.11:*:*:*:*:*:*:*	*	*	*	*
709	rtx1200	yahama	10.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.16	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.16	cpe:2.3:o:yahama:rtx1200:10.01.16:*:*:*:*:*:*:*	*	*	*	*
710	rtx1200	yahama	10.01.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.22	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.22	cpe:2.3:o:yahama:rtx1200:10.01.22:*:*:*:*:*:*:*	*	*	*	*
711	rtx1200	yahama	10.01.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.24	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.24	cpe:2.3:o:yahama:rtx1200:10.01.24:*:*:*:*:*:*:*	*	*	*	*
712	rtx1200	yahama	10.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1200 10.01.29	[]	/o	*	cpe:/o:yahama:rtx1200:10.01.29	cpe:2.3:o:yahama:rtx1200:10.01.29:*:*:*:*:*:*:*	*	*	*	*
713	rtx1500	yahama	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.06	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.06	cpe:2.3:o:yahama:rtx1500:8.03.06:*:*:*:*:*:*:*	*	*	*	*
714	rtx1500	yahama	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.08	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.08	cpe:2.3:o:yahama:rtx1500:8.03.08:*:*:*:*:*:*:*	*	*	*	*
715	rtx1500	yahama	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.24	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.24	cpe:2.3:o:yahama:rtx1500:8.03.24:*:*:*:*:*:*:*	*	*	*	*
716	rtx1500	yahama	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.26	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.26	cpe:2.3:o:yahama:rtx1500:8.03.26:*:*:*:*:*:*:*	*	*	*	*
717	rtx1500	yahama	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.37	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.37	cpe:2.3:o:yahama:rtx1500:8.03.37:*:*:*:*:*:*:*	*	*	*	*
718	rtx1500	yahama	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.41	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.41	cpe:2.3:o:yahama:rtx1500:8.03.41:*:*:*:*:*:*:*	*	*	*	*
719	rtx1500	yahama	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.42	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.42	cpe:2.3:o:yahama:rtx1500:8.03.42:*:*:*:*:*:*:*	*	*	*	*
720	rtx1500	yahama	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.46	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.46	cpe:2.3:o:yahama:rtx1500:8.03.46:*:*:*:*:*:*:*	*	*	*	*
721	rtx1500	yahama	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.60	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.60	cpe:2.3:o:yahama:rtx1500:8.03.60:*:*:*:*:*:*:*	*	*	*	*
722	rtx1500	yahama	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.61	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.61	cpe:2.3:o:yahama:rtx1500:8.03.61:*:*:*:*:*:*:*	*	*	*	*
723	rtx1500	yahama	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.68	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.68	cpe:2.3:o:yahama:rtx1500:8.03.68:*:*:*:*:*:*:*	*	*	*	*
724	rtx1500	yahama	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.70	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.70	cpe:2.3:o:yahama:rtx1500:8.03.70:*:*:*:*:*:*:*	*	*	*	*
725	rtx1500	yahama	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.75	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.75	cpe:2.3:o:yahama:rtx1500:8.03.75:*:*:*:*:*:*:*	*	*	*	*
726	rtx1500	yahama	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.76	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.76	cpe:2.3:o:yahama:rtx1500:8.03.76:*:*:*:*:*:*:*	*	*	*	*
727	rtx1500	yahama	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.77	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.77	cpe:2.3:o:yahama:rtx1500:8.03.77:*:*:*:*:*:*:*	*	*	*	*
728	rtx1500	yahama	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.78	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.78	cpe:2.3:o:yahama:rtx1500:8.03.78:*:*:*:*:*:*:*	*	*	*	*
729	rtx1500	yahama	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.80	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.80	cpe:2.3:o:yahama:rtx1500:8.03.80:*:*:*:*:*:*:*	*	*	*	*
730	rtx1500	yahama	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.82	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.82	cpe:2.3:o:yahama:rtx1500:8.03.82:*:*:*:*:*:*:*	*	*	*	*
731	rtx1500	yahama	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.83	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.83	cpe:2.3:o:yahama:rtx1500:8.03.83:*:*:*:*:*:*:*	*	*	*	*
732	rtx1500	yahama	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.87	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.87	cpe:2.3:o:yahama:rtx1500:8.03.87:*:*:*:*:*:*:*	*	*	*	*
733	rtx1500	yahama	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.88	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.88	cpe:2.3:o:yahama:rtx1500:8.03.88:*:*:*:*:*:*:*	*	*	*	*
2714	jdk	oracle	1.6.0	update_34		\N	2018-05-31 16:59:57.065215	2018-05-31 16:59:57.065215	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_34	\N	\N	\N	\N	\N
734	rtx1500	yahama	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.90	[]	/o	*	cpe:/o:yahama:rtx1500:8.03.90	cpe:2.3:o:yahama:rtx1500:8.03.90:*:*:*:*:*:*:*	*	*	*	*
735	rtx2000	yahama	7.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.14	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.14	cpe:2.3:o:yahama:rtx2000:7.00.14:*:*:*:*:*:*:*	*	*	*	*
736	rtx2000	yahama	7.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.15	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.15	cpe:2.3:o:yahama:rtx2000:7.00.15:*:*:*:*:*:*:*	*	*	*	*
737	rtx2000	yahama	7.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.16	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.16	cpe:2.3:o:yahama:rtx2000:7.00.16:*:*:*:*:*:*:*	*	*	*	*
738	rtx2000	yahama	7.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.19	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.19	cpe:2.3:o:yahama:rtx2000:7.00.19:*:*:*:*:*:*:*	*	*	*	*
739	rtx2000	yahama	7.00.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.00.26	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.26	cpe:2.3:o:yahama:rtx2000:7.00.26:*:*:*:*:*:*:*	*	*	*	*
740	rtx2000	yahama	7.00.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.29	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.29	cpe:2.3:o:yahama:rtx2000:7.00.29:*:*:*:*:*:*:*	*	*	*	*
741	rtx2000	yahama	7.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.30	[]	/o	*	cpe:/o:yahama:rtx2000:7.00.30	cpe:2.3:o:yahama:rtx2000:7.00.30:*:*:*:*:*:*:*	*	*	*	*
742	rtx2000	yahama	7.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.17	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.17	cpe:2.3:o:yahama:rtx2000:7.01.17:*:*:*:*:*:*:*	*	*	*	*
743	rtx2000	yahama	7.01.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.26	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.26	cpe:2.3:o:yahama:rtx2000:7.01.26:*:*:*:*:*:*:*	*	*	*	*
744	rtx2000	yahama	7.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.29	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.29	cpe:2.3:o:yahama:rtx2000:7.01.29:*:*:*:*:*:*:*	*	*	*	*
745	rtx2000	yahama	7.01.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.34	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.34	cpe:2.3:o:yahama:rtx2000:7.01.34:*:*:*:*:*:*:*	*	*	*	*
746	rtx2000	yahama	7.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.41	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.41	cpe:2.3:o:yahama:rtx2000:7.01.41:*:*:*:*:*:*:*	*	*	*	*
747	rtx2000	yahama	7.01.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.47	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.47	cpe:2.3:o:yahama:rtx2000:7.01.47:*:*:*:*:*:*:*	*	*	*	*
748	rtx2000	yahama	7.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.48	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.48	cpe:2.3:o:yahama:rtx2000:7.01.48:*:*:*:*:*:*:*	*	*	*	*
749	rtx2000	yahama	7.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.49	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.49	cpe:2.3:o:yahama:rtx2000:7.01.49:*:*:*:*:*:*:*	*	*	*	*
750	rtx2000	yahama	7.01.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.53	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.53	cpe:2.3:o:yahama:rtx2000:7.01.53:*:*:*:*:*:*:*	*	*	*	*
751	rtx2000	yahama	7.01.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.54	[]	/o	*	cpe:/o:yahama:rtx2000:7.01.54	cpe:2.3:o:yahama:rtx2000:7.01.54:*:*:*:*:*:*:*	*	*	*	*
752	rtx3000	yahama	9.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.15	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.15	cpe:2.3:o:yahama:rtx3000:9.00.15:*:*:*:*:*:*:*	*	*	*	*
753	rtx3000	yahama	9.00.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.20	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.20	cpe:2.3:o:yahama:rtx3000:9.00.20:*:*:*:*:*:*:*	*	*	*	*
754	rtx3000	yahama	9.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.22	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.22	cpe:2.3:o:yahama:rtx3000:9.00.22:*:*:*:*:*:*:*	*	*	*	*
755	rtx3000	yahama	9.00.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.24	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.24	cpe:2.3:o:yahama:rtx3000:9.00.24:*:*:*:*:*:*:*	*	*	*	*
756	rtx3000	yahama	9.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.25	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.25	cpe:2.3:o:yahama:rtx3000:9.00.25:*:*:*:*:*:*:*	*	*	*	*
757	rtx3000	yahama	9.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.31	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.31	cpe:2.3:o:yahama:rtx3000:9.00.31:*:*:*:*:*:*:*	*	*	*	*
758	rtx3000	yahama	9.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.37	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.37	cpe:2.3:o:yahama:rtx3000:9.00.37:*:*:*:*:*:*:*	*	*	*	*
759	rtx3000	yahama	9.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.40	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.40	cpe:2.3:o:yahama:rtx3000:9.00.40:*:*:*:*:*:*:*	*	*	*	*
760	rtx3000	yahama	9.00.43	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.43	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.43	cpe:2.3:o:yahama:rtx3000:9.00.43:*:*:*:*:*:*:*	*	*	*	*
761	rtx3000	yahama	9.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.44	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.44	cpe:2.3:o:yahama:rtx3000:9.00.44:*:*:*:*:*:*:*	*	*	*	*
762	rtx3000	yahama	9.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.47	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.47	cpe:2.3:o:yahama:rtx3000:9.00.47:*:*:*:*:*:*:*	*	*	*	*
763	rtx3000	yahama	9.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.48	[]	/o	*	cpe:/o:yahama:rtx3000:9.00.48	cpe:2.3:o:yahama:rtx3000:9.00.48:*:*:*:*:*:*:*	*	*	*	*
764	srt100	yahama	10.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.09	[]	/o	*	cpe:/o:yahama:srt100:10.00.09	cpe:2.3:o:yahama:srt100:10.00.09:*:*:*:*:*:*:*	*	*	*	*
765	srt100	yahama	10.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.19	[]	/o	*	cpe:/o:yahama:srt100:10.00.19	cpe:2.3:o:yahama:srt100:10.00.19:*:*:*:*:*:*:*	*	*	*	*
766	srt100	yahama	10.00.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.21	[]	/o	*	cpe:/o:yahama:srt100:10.00.21	cpe:2.3:o:yahama:srt100:10.00.21:*:*:*:*:*:*:*	*	*	*	*
767	srt100	yahama	10.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.22	[]	/o	*	cpe:/o:yahama:srt100:10.00.22	cpe:2.3:o:yahama:srt100:10.00.22:*:*:*:*:*:*:*	*	*	*	*
768	srt100	yahama	10.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.27	[]	/o	*	cpe:/o:yahama:srt100:10.00.27	cpe:2.3:o:yahama:srt100:10.00.27:*:*:*:*:*:*:*	*	*	*	*
769	srt100	yahama	10.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.28	[]	/o	*	cpe:/o:yahama:srt100:10.00.28	cpe:2.3:o:yahama:srt100:10.00.28:*:*:*:*:*:*:*	*	*	*	*
770	srt100	yahama	10.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.31	[]	/o	*	cpe:/o:yahama:srt100:10.00.31	cpe:2.3:o:yahama:srt100:10.00.31:*:*:*:*:*:*:*	*	*	*	*
771	srt100	yahama	10.00.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.38	[]	/o	*	cpe:/o:yahama:srt100:10.00.38	cpe:2.3:o:yahama:srt100:10.00.38:*:*:*:*:*:*:*	*	*	*	*
772	srt100	yahama	10.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.40	[]	/o	*	cpe:/o:yahama:srt100:10.00.40	cpe:2.3:o:yahama:srt100:10.00.40:*:*:*:*:*:*:*	*	*	*	*
773	srt100	yahama	10.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.44	[]	/o	*	cpe:/o:yahama:srt100:10.00.44	cpe:2.3:o:yahama:srt100:10.00.44:*:*:*:*:*:*:*	*	*	*	*
774	srt100	yahama	10.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.46	[]	/o	*	cpe:/o:yahama:srt100:10.00.46	cpe:2.3:o:yahama:srt100:10.00.46:*:*:*:*:*:*:*	*	*	*	*
775	srt100	yahama	10.00.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.49	[]	/o	*	cpe:/o:yahama:srt100:10.00.49	cpe:2.3:o:yahama:srt100:10.00.49:*:*:*:*:*:*:*	*	*	*	*
776	srt100	yahama	10.00.52	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.52	[]	/o	*	cpe:/o:yahama:srt100:10.00.52	cpe:2.3:o:yahama:srt100:10.00.52:*:*:*:*:*:*:*	*	*	*	*
777	srt100	yahama	10.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.53	[]	/o	*	cpe:/o:yahama:srt100:10.00.53	cpe:2.3:o:yahama:srt100:10.00.53:*:*:*:*:*:*:*	*	*	*	*
778	srt100	yahama	10.00.56	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.56	[]	/o	*	cpe:/o:yahama:srt100:10.00.56	cpe:2.3:o:yahama:srt100:10.00.56:*:*:*:*:*:*:*	*	*	*	*
779	audio_conferencing_activex_control	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Audio Conferencing ActiveX Control	[]	/a	*	cpe:/a:yahoo:audio_conferencing_activex_control:-	cpe:2.3:a:yahoo:audio_conferencing_activex_control:-:*:*:*:*:*:*:*	*	*	*	*
780	autosync	yahoo	1.0.4.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Autosync 1.0.4.9	[]	/a	*	cpe:/a:yahoo:autosync:1.0.4.9	cpe:2.3:a:yahoo:autosync:1.0.4.9:*:*:*:*:*:*:*	*	*	*	*
781	desktop_login	yahoo	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Desktop Login 1.0.1	[]	/a	*	cpe:/a:yahoo:desktop_login:1.0.1	cpe:2.3:a:yahoo:desktop_login:1.0.1:*:*:*:*:*:*:*	*	*	*	*
782	japan_shopping	yahoo	1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Shopping application 1.4	[{"Yahoo! Japan Shopping application 1.4  product page":"http://commerceapp.yahoo.co.jp/shoppingappli/"}]	/a	*	cpe:/a:yahoo:japan_shopping:1.4	cpe:2.3:a:yahoo:japan_shopping:1.4:*:*:*:*:*:*:*	*	*	*	*
783	messenger	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger	[]	/a	*	cpe:/a:yahoo:messenger:-	cpe:2.3:a:yahoo:messenger:-:*:*:*:*:*:*:*	*	*	*	*
784	messenger	yahoo	0.99.17-1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 0.99.17-1	[]	/a	*	cpe:/a:yahoo:messenger:0.99.17-1	cpe:2.3:a:yahoo:messenger:0.99.17-1:*:*:*:*:*:*:*	*	*	*	*
785	messenger	yahoo	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 1.0	[]	/a	*	cpe:/a:yahoo:messenger:1.0	cpe:2.3:a:yahoo:messenger:1.0:*:*:*:*:*:*:*	*	*	*	*
786	messenger	yahoo	1.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 1.0.4	[]	/a	*	cpe:/a:yahoo:messenger:1.0.4	cpe:2.3:a:yahoo:messenger:1.0.4:*:*:*:*:*:*:*	*	*	*	*
787	messenger	yahoo	1.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 1.0.6	[]	/a	*	cpe:/a:yahoo:messenger:1.0.6	cpe:2.3:a:yahoo:messenger:1.0.6:*:*:*:*:*:*:*	*	*	*	*
788	messenger	yahoo	10.0.0.1102	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1102	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1102	cpe:2.3:a:yahoo:messenger:10.0.0.1102:*:*:*:*:*:*:*	*	*	*	*
789	messenger	yahoo	10.0.0.1241	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1241	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1241	cpe:2.3:a:yahoo:messenger:10.0.0.1241:*:*:*:*:*:*:*	*	*	*	*
790	messenger	yahoo	10.0.0.1258	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1258	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1258	cpe:2.3:a:yahoo:messenger:10.0.0.1258:*:*:*:*:*:*:*	*	*	*	*
791	messenger	yahoo	10.0.0.1264	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1264	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1264	cpe:2.3:a:yahoo:messenger:10.0.0.1264:*:*:*:*:*:*:*	*	*	*	*
792	messenger	yahoo	10.0.0.1267	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1267	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1267	cpe:2.3:a:yahoo:messenger:10.0.0.1267:*:*:*:*:*:*:*	*	*	*	*
793	messenger	yahoo	10.0.0.1270	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.1270	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.1270	cpe:2.3:a:yahoo:messenger:10.0.0.1270:*:*:*:*:*:*:*	*	*	*	*
794	messenger	yahoo	10.0.0.331	pre-alpha	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.331 Pre-Alpha	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.331:pre-alpha	cpe:2.3:a:yahoo:messenger:10.0.0.331:pre-alpha:*:*:*:*:*:*	*	*	*	*
795	messenger	yahoo	10.0.0.525	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.525 Beta	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.525:beta	cpe:2.3:a:yahoo:messenger:10.0.0.525:beta:*:*:*:*:*:*	*	*	*	*
796	messenger	yahoo	10.0.0.542	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 10.0.0.542 Beta	[]	/a	*	cpe:/a:yahoo:messenger:10.0.0.542:beta	cpe:2.3:a:yahoo:messenger:10.0.0.542:beta:*:*:*:*:*:*	*	*	*	*
797	messenger	yahoo	11.0.0.1751	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 11.0.0.1751	[]	/a	*	cpe:/a:yahoo:messenger:11.0.0.1751	cpe:2.3:a:yahoo:messenger:11.0.0.1751:*:*:*:*:*:*:*	*	*	*	*
798	messenger	yahoo	11.0.0.2009	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 11.0.0.2009	[]	/a	*	cpe:/a:yahoo:messenger:11.0.0.2009	cpe:2.3:a:yahoo:messenger:11.0.0.2009:*:*:*:*:*:*:*	*	*	*	*
799	messenger	yahoo	11.0.0.2014	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 11.0.0.2014	[]	/a	*	cpe:/a:yahoo:messenger:11.0.0.2014	cpe:2.3:a:yahoo:messenger:11.0.0.2014:*:*:*:*:*:*:*	*	*	*	*
800	messenger	yahoo	11.5.0.152	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 11.5.0.152	[]	/a	*	cpe:/a:yahoo:messenger:11.5.0.152	cpe:2.3:a:yahoo:messenger:11.5.0.152:*:*:*:*:*:*:*	*	*	*	*
801	messenger	yahoo	2.0.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Webcam ActiveX Control 2.0.1.4	[]	/a	*	cpe:/a:yahoo:messenger:2.0.1.4	cpe:2.3:a:yahoo:messenger:2.0.1.4:*:*:*:*:*:*:*	*	*	*	*
802	messenger	yahoo	3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 3.0	[]	/a	*	cpe:/a:yahoo:messenger:3.0	cpe:2.3:a:yahoo:messenger:3.0:*:*:*:*:*:*:*	*	*	*	*
803	messenger	yahoo	3.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 3.0.1	[]	/a	*	cpe:/a:yahoo:messenger:3.0.1	cpe:2.3:a:yahoo:messenger:3.0.1:*:*:*:*:*:*:*	*	*	*	*
804	messenger	yahoo	3.0.1	beta-35554	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 3.0.1 Beta build 35554	[]	/a	*	cpe:/a:yahoo:messenger:3.0.1:beta-35554	cpe:2.3:a:yahoo:messenger:3.0.1:beta-35554:*:*:*:*:*:*	*	*	*	*
805	messenger	yahoo	3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 3.5	[]	/a	*	cpe:/a:yahoo:messenger:3.5	cpe:2.3:a:yahoo:messenger:3.5:*:*:*:*:*:*:*	*	*	*	*
806	messenger	yahoo	4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 4.0	[]	/a	*	cpe:/a:yahoo:messenger:4.0	cpe:2.3:a:yahoo:messenger:4.0:*:*:*:*:*:*:*	*	*	*	*
807	messenger	yahoo	4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 4.1	[]	/a	*	cpe:/a:yahoo:messenger:4.1	cpe:2.3:a:yahoo:messenger:4.1:*:*:*:*:*:*:*	*	*	*	*
808	messenger	yahoo	5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.0	[]	/a	*	cpe:/a:yahoo:messenger:5.0	cpe:2.3:a:yahoo:messenger:5.0:*:*:*:*:*:*:*	*	*	*	*
809	messenger	yahoo	5.0.1046	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.0.1046	[]	/a	*	cpe:/a:yahoo:messenger:5.0.1046	cpe:2.3:a:yahoo:messenger:5.0.1046:*:*:*:*:*:*:*	*	*	*	*
2715	jre	oracle	1.6.0	update_22		\N	2018-05-31 16:59:57.07296	2018-05-31 16:59:57.07296	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_22	\N	\N	\N	\N	\N
810	messenger	yahoo	5.0.1065	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.0.1065	[]	/a	*	cpe:/a:yahoo:messenger:5.0.1065	cpe:2.3:a:yahoo:messenger:5.0.1065:*:*:*:*:*:*:*	*	*	*	*
811	messenger	yahoo	5.0.1232	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.0.1232	[]	/a	*	cpe:/a:yahoo:messenger:5.0.1232	cpe:2.3:a:yahoo:messenger:5.0.1232:*:*:*:*:*:*:*	*	*	*	*
812	messenger	yahoo	5.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 5.5	[]	/a	*	cpe:/a:yahoo:messenger:5.5	cpe:2.3:a:yahoo:messenger:5.5:*:*:*:*:*:*:*	*	*	*	*
813	messenger	yahoo	5.5.1249	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.5.1249	[]	/a	*	cpe:/a:yahoo:messenger:5.5.1249	cpe:2.3:a:yahoo:messenger:5.5.1249:*:*:*:*:*:*:*	*	*	*	*
814	messenger	yahoo	5.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 5.6	[]	/a	*	cpe:/a:yahoo:messenger:5.6	cpe:2.3:a:yahoo:messenger:5.6:*:*:*:*:*:*:*	*	*	*	*
815	messenger	yahoo	5.6.0.1347	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.6.0.1347	[]	/a	*	cpe:/a:yahoo:messenger:5.6.0.1347	cpe:2.3:a:yahoo:messenger:5.6.0.1347:*:*:*:*:*:*:*	*	*	*	*
816	messenger	yahoo	5.6.0.1351	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.6.0.1351	[]	/a	*	cpe:/a:yahoo:messenger:5.6.0.1351	cpe:2.3:a:yahoo:messenger:5.6.0.1351:*:*:*:*:*:*:*	*	*	*	*
817	messenger	yahoo	5.6.0.1355	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 5.6.0.1355	[]	/a	*	cpe:/a:yahoo:messenger:5.6.0.1355	cpe:2.3:a:yahoo:messenger:5.6.0.1355:*:*:*:*:*:*:*	*	*	*	*
818	messenger	yahoo	5.6.0.1356	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.6.0.1356	[]	/a	*	cpe:/a:yahoo:messenger:5.6.0.1356	cpe:2.3:a:yahoo:messenger:5.6.0.1356:*:*:*:*:*:*:*	*	*	*	*
819	messenger	yahoo	5.6.0.1358	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 5.6.0.1358	[]	/a	*	cpe:/a:yahoo:messenger:5.6.0.1358	cpe:2.3:a:yahoo:messenger:5.6.0.1358:*:*:*:*:*:*:*	*	*	*	*
820	messenger	yahoo	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 6.0	[]	/a	*	cpe:/a:yahoo:messenger:6.0	cpe:2.3:a:yahoo:messenger:6.0:*:*:*:*:*:*:*	*	*	*	*
821	messenger	yahoo	6.0.0.1643	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 6.0.0.1643	[]	/a	*	cpe:/a:yahoo:messenger:6.0.0.1643	cpe:2.3:a:yahoo:messenger:6.0.0.1643:*:*:*:*:*:*:*	*	*	*	*
822	messenger	yahoo	6.0.0.1750	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 6.0.0.1750	[]	/a	*	cpe:/a:yahoo:messenger:6.0.0.1750	cpe:2.3:a:yahoo:messenger:6.0.0.1750:*:*:*:*:*:*:*	*	*	*	*
823	messenger	yahoo	6.0.0.1921	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 6.0.0.1921	[]	/a	*	cpe:/a:yahoo:messenger:6.0.0.1921	cpe:2.3:a:yahoo:messenger:6.0.0.1921:*:*:*:*:*:*:*	*	*	*	*
824	messenger	yahoo	6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 6.1	[]	/a	*	cpe:/a:yahoo:messenger:6.1	cpe:2.3:a:yahoo:messenger:6.1:*:*:*:*:*:*:*	*	*	*	*
825	messenger	yahoo	7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 7.0	[]	/a	*	cpe:/a:yahoo:messenger:7.0	cpe:2.3:a:yahoo:messenger:7.0:*:*:*:*:*:*:*	*	*	*	*
826	messenger	yahoo	7.0.0.426	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 7.0.0.426	[]	/a	*	cpe:/a:yahoo:messenger:7.0.0.426	cpe:2.3:a:yahoo:messenger:7.0.0.426:*:*:*:*:*:*:*	*	*	*	*
827	messenger	yahoo	7.0.0.437	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 7.0.0.437	[]	/a	*	cpe:/a:yahoo:messenger:7.0.0.437	cpe:2.3:a:yahoo:messenger:7.0.0.437:*:*:*:*:*:*:*	*	*	*	*
828	messenger	yahoo	7.0.438	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 7.0.438	[]	/a	*	cpe:/a:yahoo:messenger:7.0.438	cpe:2.3:a:yahoo:messenger:7.0.438:*:*:*:*:*:*:*	*	*	*	*
829	messenger	yahoo	7.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 7.5	[]	/a	*	cpe:/a:yahoo:messenger:7.5	cpe:2.3:a:yahoo:messenger:7.5:*:*:*:*:*:*:*	*	*	*	*
830	messenger	yahoo	7.5.0.814	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 7.5.0.814	[]	/a	*	cpe:/a:yahoo:messenger:7.5.0.814	cpe:2.3:a:yahoo:messenger:7.5.0.814:*:*:*:*:*:*:*	*	*	*	*
831	messenger	yahoo	8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0	[]	/a	*	cpe:/a:yahoo:messenger:8.0	cpe:2.3:a:yahoo:messenger:8.0:*:*:*:*:*:*:*	*	*	*	*
832	messenger	yahoo	8.0.0.505	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0.0.505	[]	/a	*	cpe:/a:yahoo:messenger:8.0.0.505	cpe:2.3:a:yahoo:messenger:8.0.0.505:*:*:*:*:*:*:*	*	*	*	*
833	messenger	yahoo	8.0.0.508	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0.0.508	[]	/a	*	cpe:/a:yahoo:messenger:8.0.0.508	cpe:2.3:a:yahoo:messenger:8.0.0.508:*:*:*:*:*:*:*	*	*	*	*
834	messenger	yahoo	8.0.0.701	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0.0.701	[]	/a	*	cpe:/a:yahoo:messenger:8.0.0.701	cpe:2.3:a:yahoo:messenger:8.0.0.701:*:*:*:*:*:*:*	*	*	*	*
835	messenger	yahoo	8.0.0.716	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0.0.716	[]	/a	*	cpe:/a:yahoo:messenger:8.0.0.716	cpe:2.3:a:yahoo:messenger:8.0.0.716:*:*:*:*:*:*:*	*	*	*	*
836	messenger	yahoo	8.0.0.863	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 8.0.0.863	[]	/a	*	cpe:/a:yahoo:messenger:8.0.0.863	cpe:2.3:a:yahoo:messenger:8.0.0.863:*:*:*:*:*:*:*	*	*	*	*
837	messenger	yahoo	8.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 8.0.1	[]	/a	*	cpe:/a:yahoo:messenger:8.0.1	cpe:2.3:a:yahoo:messenger:8.0.1:*:*:*:*:*:*:*	*	*	*	*
838	messenger	yahoo	8.0_2005.1.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.0_2005.1.1.4	[]	/a	*	cpe:/a:yahoo:messenger:8.0_2005.1.1.4	cpe:2.3:a:yahoo:messenger:8.0_2005.1.1.4:*:*:*:*:*:*:*	*	*	*	*
839	messenger	yahoo	8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1	[]	/a	*	cpe:/a:yahoo:messenger:8.1	cpe:2.3:a:yahoo:messenger:8.1:*:*:*:*:*:*:*	*	*	*	*
840	messenger	yahoo	8.1.0.195	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.195	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.195	cpe:2.3:a:yahoo:messenger:8.1.0.195:*:*:*:*:*:*:*	*	*	*	*
841	messenger	yahoo	8.1.0.209	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.209	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.209	cpe:2.3:a:yahoo:messenger:8.1.0.209:*:*:*:*:*:*:*	*	*	*	*
842	messenger	yahoo	8.1.0.239	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.239	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.239	cpe:2.3:a:yahoo:messenger:8.1.0.239:*:*:*:*:*:*:*	*	*	*	*
843	messenger	yahoo	8.1.0.244	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.244	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.244	cpe:2.3:a:yahoo:messenger:8.1.0.244:*:*:*:*:*:*:*	*	*	*	*
844	messenger	yahoo	8.1.0.249	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 8.1.0.249	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.249	cpe:2.3:a:yahoo:messenger:8.1.0.249:*:*:*:*:*:*:*	*	*	*	*
845	messenger	yahoo	8.1.0.401	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.401	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.401	cpe:2.3:a:yahoo:messenger:8.1.0.401:*:*:*:*:*:*:*	*	*	*	*
846	messenger	yahoo	8.1.0.402	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.402	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.402	cpe:2.3:a:yahoo:messenger:8.1.0.402:*:*:*:*:*:*:*	*	*	*	*
847	messenger	yahoo	8.1.0.413	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo!メッセンジャー 8.1.0.413	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.413	cpe:2.3:a:yahoo:messenger:8.1.0.413:*:*:*:*:*:*:*	*	*	*	*
848	messenger	yahoo	8.1.0.416	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.416	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.416	cpe:2.3:a:yahoo:messenger:8.1.0.416:*:*:*:*:*:*:*	*	*	*	*
849	messenger	yahoo	8.1.0.419	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.419	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.419	cpe:2.3:a:yahoo:messenger:8.1.0.419:*:*:*:*:*:*:*	*	*	*	*
850	messenger	yahoo	8.1.0.421	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 8.1.0.421	[]	/a	*	cpe:/a:yahoo:messenger:8.1.0.421	cpe:2.3:a:yahoo:messenger:8.1.0.421:*:*:*:*:*:*:*	*	*	*	*
851	messenger	yahoo	9.0.0.1389	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.1389 Beta	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.1389:beta	cpe:2.3:a:yahoo:messenger:9.0.0.1389:beta:*:*:*:*:*:*	*	*	*	*
852	messenger	yahoo	9.0.0.1912	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.1912	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.1912	cpe:2.3:a:yahoo:messenger:9.0.0.1912:*:*:*:*:*:*:*	*	*	*	*
853	messenger	yahoo	9.0.0.2018	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2018	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2018	cpe:2.3:a:yahoo:messenger:9.0.0.2018:*:*:*:*:*:*:*	*	*	*	*
854	messenger	yahoo	9.0.0.2034	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2034	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2034	cpe:2.3:a:yahoo:messenger:9.0.0.2034:*:*:*:*:*:*:*	*	*	*	*
855	messenger	yahoo	9.0.0.2112	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2112	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2112	cpe:2.3:a:yahoo:messenger:9.0.0.2112:*:*:*:*:*:*:*	*	*	*	*
856	messenger	yahoo	9.0.0.2123	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2123	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2123	cpe:2.3:a:yahoo:messenger:9.0.0.2123:*:*:*:*:*:*:*	*	*	*	*
857	messenger	yahoo	9.0.0.2128	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2128	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2128	cpe:2.3:a:yahoo:messenger:9.0.0.2128:*:*:*:*:*:*:*	*	*	*	*
858	messenger	yahoo	9.0.0.2133	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2133	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2133	cpe:2.3:a:yahoo:messenger:9.0.0.2133:*:*:*:*:*:*:*	*	*	*	*
859	messenger	yahoo	9.0.0.2136	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2136	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2136	cpe:2.3:a:yahoo:messenger:9.0.0.2136:*:*:*:*:*:*:*	*	*	*	*
860	messenger	yahoo	9.0.0.2152	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2152	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2152	cpe:2.3:a:yahoo:messenger:9.0.0.2152:*:*:*:*:*:*:*	*	*	*	*
861	messenger	yahoo	9.0.0.2160	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2160	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2160	cpe:2.3:a:yahoo:messenger:9.0.0.2160:*:*:*:*:*:*:*	*	*	*	*
862	messenger	yahoo	9.0.0.2161	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2161	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2161	cpe:2.3:a:yahoo:messenger:9.0.0.2161:*:*:*:*:*:*:*	*	*	*	*
863	messenger	yahoo	9.0.0.2162	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.2162	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.2162	cpe:2.3:a:yahoo:messenger:9.0.0.2162:*:*:*:*:*:*:*	*	*	*	*
864	messenger	yahoo	9.0.0.797	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.797 Beta	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.797:beta	cpe:2.3:a:yahoo:messenger:9.0.0.797:beta:*:*:*:*:*:*	*	*	*	*
865	messenger	yahoo	9.0.0.907	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.907 Beta	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.907:beta	cpe:2.3:a:yahoo:messenger:9.0.0.907:beta:*:*:*:*:*:*	*	*	*	*
866	messenger	yahoo	9.0.0.922	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Messenger 9.0.0.922 Beta	[]	/a	*	cpe:/a:yahoo:messenger:9.0.0.922:beta	cpe:2.3:a:yahoo:messenger:9.0.0.922:beta:*:*:*:*:*:*	*	*	*	*
867	music_jukebox	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Music Jukebox	[]	/a	*	cpe:/a:yahoo:music_jukebox:-	cpe:2.3:a:yahoo:music_jukebox:-:*:*:*:*:*:*:*	*	*	*	*
868	music_jukebox	yahoo	2.2.2.056	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Music Jukebox 2.2.2.056	[]	/a	*	cpe:/a:yahoo:music_jukebox:2.2.2.056	cpe:2.3:a:yahoo:music_jukebox:2.2.2.056:*:*:*:*:*:*:*	*	*	*	*
869	pager	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Pager	[]	/a	*	cpe:/a:yahoo:pager:-	cpe:2.3:a:yahoo:pager:-:*:*:*:*:*:*:*	*	*	*	*
870	toolbar	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Toolbar	[]	/a	*	cpe:/a:yahoo:toolbar:-	cpe:2.3:a:yahoo:toolbar:-:*:*:*:*:*:*:*	*	*	*	*
871	toolbar	yahoo	1.0.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Toolbar 1.0.0.5	[]	/a	*	cpe:/a:yahoo:toolbar:1.0.0.5	cpe:2.3:a:yahoo:toolbar:1.0.0.5:*:*:*:*:*:*:*	*	*	*	*
872	toolbar	yahoo	1.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Toolbar 1.4.1	[]	/a	*	cpe:/a:yahoo:toolbar:1.4.1	cpe:2.3:a:yahoo:toolbar:1.4.1:*:*:*:*:*:*:*	*	*	*	*
873	tumblr	yahoo	3.4.0	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Tumblr 3.4.0 for iPhone OS (iOS)	[]	/a	*	cpe:/a:yahoo:tumblr:3.4.0:-:~~~iphone_os~~	cpe:2.3:a:yahoo:tumblr:3.4.0:-:*:*:*:iphone_os:*:*	*	*	*	*
874	tumblr	yahoo	3.4.1	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Tumblr 3.4.1 for iPhone OS (iOS)	[]	/a	*	cpe:/a:yahoo:tumblr:3.4.1:-:~~~iphone_os~~	cpe:2.3:a:yahoo:tumblr:3.4.1:-:*:*:*:iphone_os:*:*	*	*	*	*
875	ui_library	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo UI framework	[]	/a	*	cpe:/a:yahoo:ui_library:-	cpe:2.3:a:yahoo:ui_library:-:*:*:*:*:*:*:*	*	*	*	*
876	widgets	yahoo	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Widgets	[]	/a	*	cpe:/a:yahoo:widgets:-	cpe:2.3:a:yahoo:widgets:-:*:*:*:*:*:*:*	*	*	*	*
877	widgets	yahoo	4.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo Yahoo Widgets 4.0.5	[]	/a	*	cpe:/a:yahoo:widgets:4.0.5	cpe:2.3:a:yahoo:widgets:4.0.5:*:*:*:*:*:*:*	*	*	*	*
878	yafuoku!	yahoo	4.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yafuoku! application 4.3.0 for Android	[{"Yahoo Japan Yafuoku! application 4.3.0 product page":"http://special.auctions.yahoo.co.jp/html/application/"}]	/a	*	cpe:/a:yahoo:yafuoku%21:4.3.0::~~~android~~	cpe:2.3:a:yahoo:yafuoku\\!:4.3.0:*:*:*:*:android:*:*	*	*	*	*
880	yahoo!_browser	yahoo	1.2.0	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.2.0 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.2.0:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.2.0:-:*:*:*:android:*:*	*	*	*	*
881	yahoo!_browser	yahoo	1.4.2	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.4.2 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.4.2:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.4.2:-:*:*:*:android:*:*	*	*	*	*
882	yahoo!_browser	yahoo	1.4.3	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.4.3 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.4.3:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.4.3:-:*:*:*:android:*:*	*	*	*	*
883	yahoo!_browser	yahoo	1.4.4	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.4.4 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.4.4:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.4.4:-:*:*:*:android:*:*	*	*	*	*
884	yahoo!_browser	yahoo	1.4.5	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.4.5 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.4.5:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.4.5:-:*:*:*:android:*:*	*	*	*	*
885	yahoo!_browser	yahoo	1.4.6	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo! Japan Yahoo! Browser 1.4.6 for Android	[]	/a	*	cpe:/a:yahoo:yahoo%21_browser:1.4.6:-:~~~android~~	cpe:2.3:a:yahoo:yahoo\\!_browser:1.4.6:-:*:*:*:android:*:*	*	*	*	*
886	yui	yahoo	2.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.4.0	[]	/a	*	cpe:/a:yahoo:yui:2.4.0	cpe:2.3:a:yahoo:yui:2.4.0:*:*:*:*:*:*:*	*	*	*	*
887	yui	yahoo	2.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.4.1	[]	/a	*	cpe:/a:yahoo:yui:2.4.1	cpe:2.3:a:yahoo:yui:2.4.1:*:*:*:*:*:*:*	*	*	*	*
888	yui	yahoo	2.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.5.0	[]	/a	*	cpe:/a:yahoo:yui:2.5.0	cpe:2.3:a:yahoo:yui:2.5.0:*:*:*:*:*:*:*	*	*	*	*
889	yui	yahoo	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.5.1	[]	/a	*	cpe:/a:yahoo:yui:2.5.1	cpe:2.3:a:yahoo:yui:2.5.1:*:*:*:*:*:*:*	*	*	*	*
890	yui	yahoo	2.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.5.2	[]	/a	*	cpe:/a:yahoo:yui:2.5.2	cpe:2.3:a:yahoo:yui:2.5.2:*:*:*:*:*:*:*	*	*	*	*
891	yui	yahoo	2.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.6.0	[]	/a	*	cpe:/a:yahoo:yui:2.6.0	cpe:2.3:a:yahoo:yui:2.6.0:*:*:*:*:*:*:*	*	*	*	*
892	yui	yahoo	2.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.7.0	[]	/a	*	cpe:/a:yahoo:yui:2.7.0	cpe:2.3:a:yahoo:yui:2.7.0:*:*:*:*:*:*:*	*	*	*	*
893	yui	yahoo	2.8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.8.0	[]	/a	*	cpe:/a:yahoo:yui:2.8.0	cpe:2.3:a:yahoo:yui:2.8.0:*:*:*:*:*:*:*	*	*	*	*
894	yui	yahoo	2.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.8.1	[]	/a	*	cpe:/a:yahoo:yui:2.8.1	cpe:2.3:a:yahoo:yui:2.8.1:*:*:*:*:*:*:*	*	*	*	*
895	yui	yahoo	2.8.1	pr1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.8.1 Preview Release 1	[]	/a	*	cpe:/a:yahoo:yui:2.8.1:pr1	cpe:2.3:a:yahoo:yui:2.8.1:pr1:*:*:*:*:*:*	*	*	*	*
896	yui	yahoo	2.8.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.8.2	[]	/a	*	cpe:/a:yahoo:yui:2.8.2	cpe:2.3:a:yahoo:yui:2.8.2:*:*:*:*:*:*:*	*	*	*	*
897	yui	yahoo	2.9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.9.0	[]	/a	*	cpe:/a:yahoo:yui:2.9.0	cpe:2.3:a:yahoo:yui:2.9.0:*:*:*:*:*:*:*	*	*	*	*
898	yui	yahoo	2.9.0	pr2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.9.0 Preview Release 2	[]	/a	*	cpe:/a:yahoo:yui:2.9.0:pr2	cpe:2.3:a:yahoo:yui:2.9.0:pr2:*:*:*:*:*:*	*	*	*	*
899	yui	yahoo	2.9.0	pr4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 2.9.0 Preview Release 4	[]	/a	*	cpe:/a:yahoo:yui:2.9.0:pr4	cpe:2.3:a:yahoo:yui:2.9.0:pr4:*:*:*:*:*:*	*	*	*	*
900	yui	yahoo	3.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.0.0	[]	/a	*	cpe:/a:yahoo:yui:3.0.0	cpe:2.3:a:yahoo:yui:3.0.0:*:*:*:*:*:*:*	*	*	*	*
901	yui	yahoo	3.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.1.0	[]	/a	*	cpe:/a:yahoo:yui:3.1.0	cpe:2.3:a:yahoo:yui:3.1.0:*:*:*:*:*:*:*	*	*	*	*
902	yui	yahoo	3.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.1.1	[]	/a	*	cpe:/a:yahoo:yui:3.1.1	cpe:2.3:a:yahoo:yui:3.1.1:*:*:*:*:*:*:*	*	*	*	*
903	yui	yahoo	3.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.1.2	[]	/a	*	cpe:/a:yahoo:yui:3.1.2	cpe:2.3:a:yahoo:yui:3.1.2:*:*:*:*:*:*:*	*	*	*	*
904	yui	yahoo	3.10.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.10.0	[]	/a	*	cpe:/a:yahoo:yui:3.10.0	cpe:2.3:a:yahoo:yui:3.10.0:*:*:*:*:*:*:*	*	*	*	*
905	yui	yahoo	3.10.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.10.1	[]	/a	*	cpe:/a:yahoo:yui:3.10.1	cpe:2.3:a:yahoo:yui:3.10.1:*:*:*:*:*:*:*	*	*	*	*
906	yui	yahoo	3.10.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.10.2	[]	/a	*	cpe:/a:yahoo:yui:3.10.2	cpe:2.3:a:yahoo:yui:3.10.2:*:*:*:*:*:*:*	*	*	*	*
907	yui	yahoo	3.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.2.0	[]	/a	*	cpe:/a:yahoo:yui:3.2.0	cpe:2.3:a:yahoo:yui:3.2.0:*:*:*:*:*:*:*	*	*	*	*
908	yui	yahoo	3.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.3.0	[]	/a	*	cpe:/a:yahoo:yui:3.3.0	cpe:2.3:a:yahoo:yui:3.3.0:*:*:*:*:*:*:*	*	*	*	*
909	yui	yahoo	3.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.4.0	[]	/a	*	cpe:/a:yahoo:yui:3.4.0	cpe:2.3:a:yahoo:yui:3.4.0:*:*:*:*:*:*:*	*	*	*	*
910	yui	yahoo	3.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.4.1	[]	/a	*	cpe:/a:yahoo:yui:3.4.1	cpe:2.3:a:yahoo:yui:3.4.1:*:*:*:*:*:*:*	*	*	*	*
911	yui	yahoo	3.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.5.0	[]	/a	*	cpe:/a:yahoo:yui:3.5.0	cpe:2.3:a:yahoo:yui:3.5.0:*:*:*:*:*:*:*	*	*	*	*
912	yui	yahoo	3.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.5.1	[]	/a	*	cpe:/a:yahoo:yui:3.5.1	cpe:2.3:a:yahoo:yui:3.5.1:*:*:*:*:*:*:*	*	*	*	*
913	yui	yahoo	3.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.6.0	[]	/a	*	cpe:/a:yahoo:yui:3.6.0	cpe:2.3:a:yahoo:yui:3.6.0:*:*:*:*:*:*:*	*	*	*	*
914	yui	yahoo	3.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.7.0	[]	/a	*	cpe:/a:yahoo:yui:3.7.0	cpe:2.3:a:yahoo:yui:3.7.0:*:*:*:*:*:*:*	*	*	*	*
915	yui	yahoo	3.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.7.1	[]	/a	*	cpe:/a:yahoo:yui:3.7.1	cpe:2.3:a:yahoo:yui:3.7.1:*:*:*:*:*:*:*	*	*	*	*
916	yui	yahoo	3.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.7.2	[]	/a	*	cpe:/a:yahoo:yui:3.7.2	cpe:2.3:a:yahoo:yui:3.7.2:*:*:*:*:*:*:*	*	*	*	*
917	yui	yahoo	3.7.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.7.3	[]	/a	*	cpe:/a:yahoo:yui:3.7.3	cpe:2.3:a:yahoo:yui:3.7.3:*:*:*:*:*:*:*	*	*	*	*
918	yui	yahoo	3.8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.8.0	[]	/a	*	cpe:/a:yahoo:yui:3.8.0	cpe:2.3:a:yahoo:yui:3.8.0:*:*:*:*:*:*:*	*	*	*	*
919	yui	yahoo	3.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.8.1	[]	/a	*	cpe:/a:yahoo:yui:3.8.1	cpe:2.3:a:yahoo:yui:3.8.1:*:*:*:*:*:*:*	*	*	*	*
920	yui	yahoo	3.9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.9.0	[]	/a	*	cpe:/a:yahoo:yui:3.9.0	cpe:2.3:a:yahoo:yui:3.9.0:*:*:*:*:*:*:*	*	*	*	*
921	yui	yahoo	3.9.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yahoo YUI 3.9.1	[]	/a	*	cpe:/a:yahoo:yui:3.9.1	cpe:2.3:a:yahoo:yui:3.9.1:*:*:*:*:*:*:*	*	*	*	*
922	rt100i	yamaha	1.02.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.02.05	[]	/o	*	cpe:/o:yamaha:rt100i:1.02.05	cpe:2.3:o:yamaha:rt100i:1.02.05:*:*:*:*:*:*:*	*	*	*	*
923	rt100i	yamaha	1.02.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.02.08	[]	/o	*	cpe:/o:yamaha:rt100i:1.02.08	cpe:2.3:o:yamaha:rt100i:1.02.08:*:*:*:*:*:*:*	*	*	*	*
924	rt100i	yamaha	1.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.02.16	[]	/o	*	cpe:/o:yamaha:rt100i:1.02.16	cpe:2.3:o:yamaha:rt100i:1.02.16:*:*:*:*:*:*:*	*	*	*	*
925	rt100i	yamaha	1.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.03.08	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.08	cpe:2.3:o:yamaha:rt100i:1.03.08:*:*:*:*:*:*:*	*	*	*	*
926	rt100i	yamaha	1.03.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.03.12	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.12	cpe:2.3:o:yamaha:rt100i:1.03.12:*:*:*:*:*:*:*	*	*	*	*
927	rt100i	yamaha	1.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.03.15	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.15	cpe:2.3:o:yamaha:rt100i:1.03.15:*:*:*:*:*:*:*	*	*	*	*
928	rt100i	yamaha	1.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.03.24	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.24	cpe:2.3:o:yamaha:rt100i:1.03.24:*:*:*:*:*:*:*	*	*	*	*
929	rt100i	yamaha	1.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.03.25	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.25	cpe:2.3:o:yamaha:rt100i:1.03.25:*:*:*:*:*:*:*	*	*	*	*
930	rt100i	yamaha	1.03.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.03.30	[]	/o	*	cpe:/o:yamaha:rt100i:1.03.30	cpe:2.3:o:yamaha:rt100i:1.03.30:*:*:*:*:*:*:*	*	*	*	*
931	rt100i	yamaha	1.04.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.04.03	[]	/o	*	cpe:/o:yamaha:rt100i:1.04.03	cpe:2.3:o:yamaha:rt100i:1.04.03:*:*:*:*:*:*:*	*	*	*	*
932	rt100i	yamaha	1.04.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.04.06	[]	/o	*	cpe:/o:yamaha:rt100i:1.04.06	cpe:2.3:o:yamaha:rt100i:1.04.06:*:*:*:*:*:*:*	*	*	*	*
933	rt100i	yamaha	1.04.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.04.09	[]	/o	*	cpe:/o:yamaha:rt100i:1.04.09	cpe:2.3:o:yamaha:rt100i:1.04.09:*:*:*:*:*:*:*	*	*	*	*
934	rt100i	yamaha	1.05.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.05.05	[]	/o	*	cpe:/o:yamaha:rt100i:1.05.05	cpe:2.3:o:yamaha:rt100i:1.05.05:*:*:*:*:*:*:*	*	*	*	*
935	rt100i	yamaha	1.05.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.05.07	[]	/o	*	cpe:/o:yamaha:rt100i:1.05.07	cpe:2.3:o:yamaha:rt100i:1.05.07:*:*:*:*:*:*:*	*	*	*	*
936	rt100i	yamaha	1.05.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.05.09	[]	/o	*	cpe:/o:yamaha:rt100i:1.05.09	cpe:2.3:o:yamaha:rt100i:1.05.09:*:*:*:*:*:*:*	*	*	*	*
937	rt100i	yamaha	1.05.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.05.10	[]	/o	*	cpe:/o:yamaha:rt100i:1.05.10	cpe:2.3:o:yamaha:rt100i:1.05.10:*:*:*:*:*:*:*	*	*	*	*
938	rt100i	yamaha	1.05.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.05.13	[]	/o	*	cpe:/o:yamaha:rt100i:1.05.13	cpe:2.3:o:yamaha:rt100i:1.05.13:*:*:*:*:*:*:*	*	*	*	*
939	rt100i	yamaha	1.06.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.06.08	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.08	cpe:2.3:o:yamaha:rt100i:1.06.08:*:*:*:*:*:*:*	*	*	*	*
940	rt100i	yamaha	1.06.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.06.10	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.10	cpe:2.3:o:yamaha:rt100i:1.06.10:*:*:*:*:*:*:*	*	*	*	*
941	rt100i	yamaha	1.06.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.06.12	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.12	cpe:2.3:o:yamaha:rt100i:1.06.12:*:*:*:*:*:*:*	*	*	*	*
942	rt100i	yamaha	1.06.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.06.14	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.14	cpe:2.3:o:yamaha:rt100i:1.06.14:*:*:*:*:*:*:*	*	*	*	*
943	rt100i	yamaha	1.06.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.06.15	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.15	cpe:2.3:o:yamaha:rt100i:1.06.15:*:*:*:*:*:*:*	*	*	*	*
944	rt100i	yamaha	1.06.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.06.22	[]	/o	*	cpe:/o:yamaha:rt100i:1.06.22	cpe:2.3:o:yamaha:rt100i:1.06.22:*:*:*:*:*:*:*	*	*	*	*
945	rt100i	yamaha	1.07.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 1.07.01	[]	/o	*	cpe:/o:yamaha:rt100i:1.07.01	cpe:2.3:o:yamaha:rt100i:1.07.01:*:*:*:*:*:*:*	*	*	*	*
946	rt100i	yamaha	1.07.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.07.05	[]	/o	*	cpe:/o:yamaha:rt100i:1.07.05	cpe:2.3:o:yamaha:rt100i:1.07.05:*:*:*:*:*:*:*	*	*	*	*
947	rt100i	yamaha	1.07.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 1.07.07	[]	/o	*	cpe:/o:yamaha:rt100i:1.07.07	cpe:2.3:o:yamaha:rt100i:1.07.07:*:*:*:*:*:*:*	*	*	*	*
948	rt100i	yamaha	2.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.01.07	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.07	cpe:2.3:o:yamaha:rt100i:2.01.07:*:*:*:*:*:*:*	*	*	*	*
949	rt100i	yamaha	2.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.01.11	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.11	cpe:2.3:o:yamaha:rt100i:2.01.11:*:*:*:*:*:*:*	*	*	*	*
950	rt100i	yamaha	2.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.01.14	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.14	cpe:2.3:o:yamaha:rt100i:2.01.14:*:*:*:*:*:*:*	*	*	*	*
951	rt100i	yamaha	2.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.01.19	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.19	cpe:2.3:o:yamaha:rt100i:2.01.19:*:*:*:*:*:*:*	*	*	*	*
952	rt100i	yamaha	2.01.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.01.20	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.20	cpe:2.3:o:yamaha:rt100i:2.01.20:*:*:*:*:*:*:*	*	*	*	*
953	rt100i	yamaha	2.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.01.21	[]	/o	*	cpe:/o:yamaha:rt100i:2.01.21	cpe:2.3:o:yamaha:rt100i:2.01.21:*:*:*:*:*:*:*	*	*	*	*
954	rt100i	yamaha	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.15	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.15	cpe:2.3:o:yamaha:rt100i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
955	rt100i	yamaha	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.17	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.17	cpe:2.3:o:yamaha:rt100i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
956	rt100i	yamaha	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.02.19	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.19	cpe:2.3:o:yamaha:rt100i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
957	rt100i	yamaha	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.02.23	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.23	cpe:2.3:o:yamaha:rt100i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
958	rt100i	yamaha	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.02.27	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.27	cpe:2.3:o:yamaha:rt100i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
959	rt100i	yamaha	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.28	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.28	cpe:2.3:o:yamaha:rt100i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
960	rt100i	yamaha	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.29	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.29	cpe:2.3:o:yamaha:rt100i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
961	rt100i	yamaha	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.31	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.31	cpe:2.3:o:yamaha:rt100i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
962	rt100i	yamaha	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.33	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.33	cpe:2.3:o:yamaha:rt100i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
963	rt100i	yamaha	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.34	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.34	cpe:2.3:o:yamaha:rt100i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
964	rt100i	yamaha	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.35	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.35	cpe:2.3:o:yamaha:rt100i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
965	rt100i	yamaha	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.36	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.36	cpe:2.3:o:yamaha:rt100i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
966	rt100i	yamaha	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.38	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.38	cpe:2.3:o:yamaha:rt100i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
967	rt100i	yamaha	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.39	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.39	cpe:2.3:o:yamaha:rt100i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
968	rt100i	yamaha	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.40	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.40	cpe:2.3:o:yamaha:rt100i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
969	rt100i	yamaha	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.41	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.41	cpe:2.3:o:yamaha:rt100i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
970	rt100i	yamaha	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 2.02.44	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.44	cpe:2.3:o:yamaha:rt100i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
971	rt100i	yamaha	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.45	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.45	cpe:2.3:o:yamaha:rt100i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
972	rt100i	yamaha	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 2.02.46	[]	/o	*	cpe:/o:yamaha:rt100i:2.02.46	cpe:2.3:o:yamaha:rt100i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
973	rt100i	yamaha	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.09	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.09	cpe:2.3:o:yamaha:rt100i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
974	rt100i	yamaha	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.16	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.16	cpe:2.3:o:yamaha:rt100i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
975	rt100i	yamaha	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.18	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.18	cpe:2.3:o:yamaha:rt100i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
976	rt100i	yamaha	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.23	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.23	cpe:2.3:o:yamaha:rt100i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
977	rt100i	yamaha	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.28	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.28	cpe:2.3:o:yamaha:rt100i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
978	rt100i	yamaha	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.30	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.30	cpe:2.3:o:yamaha:rt100i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
979	rt100i	yamaha	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.31	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.31	cpe:2.3:o:yamaha:rt100i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
980	rt100i	yamaha	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.33	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.33	cpe:2.3:o:yamaha:rt100i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
981	rt100i	yamaha	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.35	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.35	cpe:2.3:o:yamaha:rt100i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
982	rt100i	yamaha	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.36	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.36	cpe:2.3:o:yamaha:rt100i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
983	rt100i	yamaha	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.37	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.37	cpe:2.3:o:yamaha:rt100i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
984	rt100i	yamaha	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.42	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.42	cpe:2.3:o:yamaha:rt100i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
985	rt100i	yamaha	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.44	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.44	cpe:2.3:o:yamaha:rt100i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
986	rt100i	yamaha	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.45	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.45	cpe:2.3:o:yamaha:rt100i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
987	rt100i	yamaha	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT100i 3.00.46	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.46	cpe:2.3:o:yamaha:rt100i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
988	rt100i	yamaha	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT100i 3.00.47	[]	/o	*	cpe:/o:yamaha:rt100i:3.00.47	cpe:2.3:o:yamaha:rt100i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
989	rt102i	yamaha	1.06.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 1.06.08	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.08	cpe:2.3:o:yamaha:rt102i:1.06.08:*:*:*:*:*:*:*	*	*	*	*
990	rt102i	yamaha	1.06.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 1.06.10	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.10	cpe:2.3:o:yamaha:rt102i:1.06.10:*:*:*:*:*:*:*	*	*	*	*
991	rt102i	yamaha	1.06.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 1.06.12	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.12	cpe:2.3:o:yamaha:rt102i:1.06.12:*:*:*:*:*:*:*	*	*	*	*
992	rt102i	yamaha	1.06.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 1.06.14	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.14	cpe:2.3:o:yamaha:rt102i:1.06.14:*:*:*:*:*:*:*	*	*	*	*
993	rt102i	yamaha	1.06.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 1.06.15	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.15	cpe:2.3:o:yamaha:rt102i:1.06.15:*:*:*:*:*:*:*	*	*	*	*
994	rt102i	yamaha	1.06.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 1.06.22	[]	/o	*	cpe:/o:yamaha:rt102i:1.06.22	cpe:2.3:o:yamaha:rt102i:1.06.22:*:*:*:*:*:*:*	*	*	*	*
995	rt102i	yamaha	1.07.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 1.07.01	[]	/o	*	cpe:/o:yamaha:rt102i:1.07.01	cpe:2.3:o:yamaha:rt102i:1.07.01:*:*:*:*:*:*:*	*	*	*	*
996	rt102i	yamaha	1.07.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 1.07.05	[]	/o	*	cpe:/o:yamaha:rt102i:1.07.05	cpe:2.3:o:yamaha:rt102i:1.07.05:*:*:*:*:*:*:*	*	*	*	*
997	rt102i	yamaha	1.07.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 1.07.07	[]	/o	*	cpe:/o:yamaha:rt102i:1.07.07	cpe:2.3:o:yamaha:rt102i:1.07.07:*:*:*:*:*:*:*	*	*	*	*
998	rt102i	yamaha	2.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.01.07	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.07	cpe:2.3:o:yamaha:rt102i:2.01.07:*:*:*:*:*:*:*	*	*	*	*
999	rt102i	yamaha	2.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.01.11	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.11	cpe:2.3:o:yamaha:rt102i:2.01.11:*:*:*:*:*:*:*	*	*	*	*
1000	rt102i	yamaha	2.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.01.14	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.14	cpe:2.3:o:yamaha:rt102i:2.01.14:*:*:*:*:*:*:*	*	*	*	*
1001	rt102i	yamaha	2.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.01.19	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.19	cpe:2.3:o:yamaha:rt102i:2.01.19:*:*:*:*:*:*:*	*	*	*	*
1002	rt102i	yamaha	2.01.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.01.20	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.20	cpe:2.3:o:yamaha:rt102i:2.01.20:*:*:*:*:*:*:*	*	*	*	*
1003	rt102i	yamaha	2.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.01.21	[]	/o	*	cpe:/o:yamaha:rt102i:2.01.21	cpe:2.3:o:yamaha:rt102i:2.01.21:*:*:*:*:*:*:*	*	*	*	*
1004	rt102i	yamaha	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.15	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.15	cpe:2.3:o:yamaha:rt102i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
1005	rt102i	yamaha	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.17	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.17	cpe:2.3:o:yamaha:rt102i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
1006	rt102i	yamaha	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.19	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.19	cpe:2.3:o:yamaha:rt102i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
1007	rt102i	yamaha	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.23	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.23	cpe:2.3:o:yamaha:rt102i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
1008	rt102i	yamaha	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.27	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.27	cpe:2.3:o:yamaha:rt102i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
1009	rt102i	yamaha	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.28	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.28	cpe:2.3:o:yamaha:rt102i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
1010	rt102i	yamaha	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.29	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.29	cpe:2.3:o:yamaha:rt102i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
1011	rt102i	yamaha	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.31	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.31	cpe:2.3:o:yamaha:rt102i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
1012	rt102i	yamaha	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.33	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.33	cpe:2.3:o:yamaha:rt102i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
1013	rt102i	yamaha	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.34	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.34	cpe:2.3:o:yamaha:rt102i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
1014	rt102i	yamaha	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.35	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.35	cpe:2.3:o:yamaha:rt102i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
1015	rt102i	yamaha	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.36	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.36	cpe:2.3:o:yamaha:rt102i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
1016	rt102i	yamaha	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.38	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.38	cpe:2.3:o:yamaha:rt102i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
1017	rt102i	yamaha	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.39	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.39	cpe:2.3:o:yamaha:rt102i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
1018	rt102i	yamaha	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.40	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.40	cpe:2.3:o:yamaha:rt102i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
1019	rt102i	yamaha	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.41	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.41	cpe:2.3:o:yamaha:rt102i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
1020	rt102i	yamaha	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.44	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.44	cpe:2.3:o:yamaha:rt102i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
1021	rt102i	yamaha	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 2.02.45	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.45	cpe:2.3:o:yamaha:rt102i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
1022	rt102i	yamaha	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 2.02.46	[]	/o	*	cpe:/o:yamaha:rt102i:2.02.46	cpe:2.3:o:yamaha:rt102i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
1023	rt102i	yamaha	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.09	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.09	cpe:2.3:o:yamaha:rt102i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
1024	rt102i	yamaha	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.16	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.16	cpe:2.3:o:yamaha:rt102i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
1025	rt102i	yamaha	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.18	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.18	cpe:2.3:o:yamaha:rt102i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
1026	rt102i	yamaha	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.23	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.23	cpe:2.3:o:yamaha:rt102i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
1027	rt102i	yamaha	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.28	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.28	cpe:2.3:o:yamaha:rt102i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
1028	rt102i	yamaha	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.30	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.30	cpe:2.3:o:yamaha:rt102i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
1029	rt102i	yamaha	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.31	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.31	cpe:2.3:o:yamaha:rt102i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
1030	rt102i	yamaha	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.33	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.33	cpe:2.3:o:yamaha:rt102i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
1031	rt102i	yamaha	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.35	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.35	cpe:2.3:o:yamaha:rt102i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
1032	rt102i	yamaha	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.36	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.36	cpe:2.3:o:yamaha:rt102i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
1033	rt102i	yamaha	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.37	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.37	cpe:2.3:o:yamaha:rt102i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
1034	rt102i	yamaha	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.42	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.42	cpe:2.3:o:yamaha:rt102i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
1035	rt102i	yamaha	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.44	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.44	cpe:2.3:o:yamaha:rt102i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
1036	rt102i	yamaha	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT102i 3.00.45	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.45	cpe:2.3:o:yamaha:rt102i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
1037	rt102i	yamaha	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.46	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.46	cpe:2.3:o:yamaha:rt102i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
1038	rt102i	yamaha	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT102i 3.00.47	[]	/o	*	cpe:/o:yamaha:rt102i:3.00.47	cpe:2.3:o:yamaha:rt102i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
1039	rt103i	yamaha	4.00.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.02	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.02	cpe:2.3:o:yamaha:rt103i:4.00.02:*:*:*:*:*:*:*	*	*	*	*
1040	rt103i	yamaha	4.00.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.05	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.05	cpe:2.3:o:yamaha:rt103i:4.00.05:*:*:*:*:*:*:*	*	*	*	*
1041	rt103i	yamaha	4.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.07	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.07	cpe:2.3:o:yamaha:rt103i:4.00.07:*:*:*:*:*:*:*	*	*	*	*
1042	rt103i	yamaha	4.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.09	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.09	cpe:2.3:o:yamaha:rt103i:4.00.09:*:*:*:*:*:*:*	*	*	*	*
1043	rt103i	yamaha	4.00.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.10	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.10	cpe:2.3:o:yamaha:rt103i:4.00.10:*:*:*:*:*:*:*	*	*	*	*
1044	rt103i	yamaha	4.00.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.11	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.11	cpe:2.3:o:yamaha:rt103i:4.00.11:*:*:*:*:*:*:*	*	*	*	*
1045	rt103i	yamaha	4.00.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.13	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.13	cpe:2.3:o:yamaha:rt103i:4.00.13:*:*:*:*:*:*:*	*	*	*	*
1046	rt103i	yamaha	4.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.14	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.14	cpe:2.3:o:yamaha:rt103i:4.00.14:*:*:*:*:*:*:*	*	*	*	*
1047	rt103i	yamaha	4.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.18	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.18	cpe:2.3:o:yamaha:rt103i:4.00.18:*:*:*:*:*:*:*	*	*	*	*
1048	rt103i	yamaha	4.00.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.21	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.21	cpe:2.3:o:yamaha:rt103i:4.00.21:*:*:*:*:*:*:*	*	*	*	*
1049	rt103i	yamaha	4.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.22	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.22	cpe:2.3:o:yamaha:rt103i:4.00.22:*:*:*:*:*:*:*	*	*	*	*
1050	rt103i	yamaha	4.00.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.24	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.24	cpe:2.3:o:yamaha:rt103i:4.00.24:*:*:*:*:*:*:*	*	*	*	*
1051	rt103i	yamaha	4.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.25	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.25	cpe:2.3:o:yamaha:rt103i:4.00.25:*:*:*:*:*:*:*	*	*	*	*
1052	rt103i	yamaha	4.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.33	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.33	cpe:2.3:o:yamaha:rt103i:4.00.33:*:*:*:*:*:*:*	*	*	*	*
1053	rt103i	yamaha	4.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.35	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.35	cpe:2.3:o:yamaha:rt103i:4.00.35:*:*:*:*:*:*:*	*	*	*	*
1054	rt103i	yamaha	4.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.36	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.36	cpe:2.3:o:yamaha:rt103i:4.00.36:*:*:*:*:*:*:*	*	*	*	*
1055	rt103i	yamaha	4.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.37	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.37	cpe:2.3:o:yamaha:rt103i:4.00.37:*:*:*:*:*:*:*	*	*	*	*
1056	rt103i	yamaha	4.00.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.38	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.38	cpe:2.3:o:yamaha:rt103i:4.00.38:*:*:*:*:*:*:*	*	*	*	*
1057	rt103i	yamaha	4.00.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.39	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.39	cpe:2.3:o:yamaha:rt103i:4.00.39:*:*:*:*:*:*:*	*	*	*	*
1058	rt103i	yamaha	4.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT103i 4.00.40	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.40	cpe:2.3:o:yamaha:rt103i:4.00.40:*:*:*:*:*:*:*	*	*	*	*
1059	rt103i	yamaha	4.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.44	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.44	cpe:2.3:o:yamaha:rt103i:4.00.44:*:*:*:*:*:*:*	*	*	*	*
1060	rt103i	yamaha	4.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.48	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.48	cpe:2.3:o:yamaha:rt103i:4.00.48:*:*:*:*:*:*:*	*	*	*	*
1061	rt103i	yamaha	4.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.53	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.53	cpe:2.3:o:yamaha:rt103i:4.00.53:*:*:*:*:*:*:*	*	*	*	*
1062	rt103i	yamaha	4.00.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT103i 4.00.54	[]	/o	*	cpe:/o:yamaha:rt103i:4.00.54	cpe:2.3:o:yamaha:rt103i:4.00.54:*:*:*:*:*:*:*	*	*	*	*
1063	rt105e	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.02.03	[]	/o	*	cpe:/o:yamaha:rt105e:6.02.03	cpe:2.3:o:yamaha:rt105e:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1064	rt105e	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.02.04	[]	/o	*	cpe:/o:yamaha:rt105e:6.02.04	cpe:2.3:o:yamaha:rt105e:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1065	rt105e	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.02.07	[]	/o	*	cpe:/o:yamaha:rt105e:6.02.07	cpe:2.3:o:yamaha:rt105e:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1066	rt105e	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.02.16	[]	/o	*	cpe:/o:yamaha:rt105e:6.02.16	cpe:2.3:o:yamaha:rt105e:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1067	rt105e	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.02.19	[]	/o	*	cpe:/o:yamaha:rt105e:6.02.19	cpe:2.3:o:yamaha:rt105e:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1068	rt105e	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.03.04	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.04	cpe:2.3:o:yamaha:rt105e:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1069	rt105e	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.03.08	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.08	cpe:2.3:o:yamaha:rt105e:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1070	rt105e	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.03.11	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.11	cpe:2.3:o:yamaha:rt105e:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1071	rt105e	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.03.15	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.15	cpe:2.3:o:yamaha:rt105e:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1072	rt105e	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.03.18	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.18	cpe:2.3:o:yamaha:rt105e:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1073	rt105e	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.03.25	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.25	cpe:2.3:o:yamaha:rt105e:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1074	rt105e	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.03.28	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.28	cpe:2.3:o:yamaha:rt105e:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1075	rt105e	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105e 6.03.33	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.33	cpe:2.3:o:yamaha:rt105e:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1076	rt105e	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105e 6.03.34	[]	/o	*	cpe:/o:yamaha:rt105e:6.03.34	cpe:2.3:o:yamaha:rt105e:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1077	rt105i	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.02.03	[]	/o	*	cpe:/o:yamaha:rt105i:6.02.03	cpe:2.3:o:yamaha:rt105i:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1078	rt105i	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.02.04	[]	/o	*	cpe:/o:yamaha:rt105i:6.02.04	cpe:2.3:o:yamaha:rt105i:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1079	rt105i	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.02.07	[]	/o	*	cpe:/o:yamaha:rt105i:6.02.07	cpe:2.3:o:yamaha:rt105i:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1080	rt105i	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.02.16	[]	/o	*	cpe:/o:yamaha:rt105i:6.02.16	cpe:2.3:o:yamaha:rt105i:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1081	rt105i	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.02.19	[]	/o	*	cpe:/o:yamaha:rt105i:6.02.19	cpe:2.3:o:yamaha:rt105i:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1082	rt105i	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.04	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.04	cpe:2.3:o:yamaha:rt105i:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1083	rt105i	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.08	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.08	cpe:2.3:o:yamaha:rt105i:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1084	rt105i	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.11	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.11	cpe:2.3:o:yamaha:rt105i:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1085	rt105i	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105i 6.03.15	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.15	cpe:2.3:o:yamaha:rt105i:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1086	rt105i	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.18	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.18	cpe:2.3:o:yamaha:rt105i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1087	rt105i	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.25	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.25	cpe:2.3:o:yamaha:rt105i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1088	rt105i	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.28	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.28	cpe:2.3:o:yamaha:rt105i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1089	rt105i	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105i 6.03.33	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.33	cpe:2.3:o:yamaha:rt105i:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1090	rt105i	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105i 6.03.34	[]	/o	*	cpe:/o:yamaha:rt105i:6.03.34	cpe:2.3:o:yamaha:rt105i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1091	rt105p	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.03	[]	/o	*	cpe:/o:yamaha:rt105p:6.02.03	cpe:2.3:o:yamaha:rt105p:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1092	rt105p	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.04	[]	/o	*	cpe:/o:yamaha:rt105p:6.02.04	cpe:2.3:o:yamaha:rt105p:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1093	rt105p	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.07	[]	/o	*	cpe:/o:yamaha:rt105p:6.02.07	cpe:2.3:o:yamaha:rt105p:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1094	rt105p	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.02.16	[]	/o	*	cpe:/o:yamaha:rt105p:6.02.16	cpe:2.3:o:yamaha:rt105p:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1095	rt105p	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.02.19	[]	/o	*	cpe:/o:yamaha:rt105p:6.02.19	cpe:2.3:o:yamaha:rt105p:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1096	rt105p	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.04	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.04	cpe:2.3:o:yamaha:rt105p:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1097	rt105p	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.08	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.08	cpe:2.3:o:yamaha:rt105p:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1098	rt105p	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.11	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.11	cpe:2.3:o:yamaha:rt105p:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1099	rt105p	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.15	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.15	cpe:2.3:o:yamaha:rt105p:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1100	rt105p	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.18	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.18	cpe:2.3:o:yamaha:rt105p:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1101	rt105p	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.25	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.25	cpe:2.3:o:yamaha:rt105p:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1102	rt105p	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.28	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.28	cpe:2.3:o:yamaha:rt105p:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1103	rt105p	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT105p 6.03.33	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.33	cpe:2.3:o:yamaha:rt105p:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1104	rt105p	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT105p 6.03.34	[]	/o	*	cpe:/o:yamaha:rt105p:6.03.34	cpe:2.3:o:yamaha:rt105p:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1105	rt107e	yamaha	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.06	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.06	cpe:2.3:o:yamaha:rt107e:8.03.06:*:*:*:*:*:*:*	*	*	*	*
1106	rt107e	yamaha	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.08	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.08	cpe:2.3:o:yamaha:rt107e:8.03.08:*:*:*:*:*:*:*	*	*	*	*
1107	rt107e	yamaha	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.24	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.24	cpe:2.3:o:yamaha:rt107e:8.03.24:*:*:*:*:*:*:*	*	*	*	*
1108	rt107e	yamaha	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.26	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.26	cpe:2.3:o:yamaha:rt107e:8.03.26:*:*:*:*:*:*:*	*	*	*	*
1109	rt107e	yamaha	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.37	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.37	cpe:2.3:o:yamaha:rt107e:8.03.37:*:*:*:*:*:*:*	*	*	*	*
1110	rt107e	yamaha	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.41	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.41	cpe:2.3:o:yamaha:rt107e:8.03.41:*:*:*:*:*:*:*	*	*	*	*
1111	rt107e	yamaha	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.42	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.42	cpe:2.3:o:yamaha:rt107e:8.03.42:*:*:*:*:*:*:*	*	*	*	*
1112	rt107e	yamaha	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.46	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.46	cpe:2.3:o:yamaha:rt107e:8.03.46:*:*:*:*:*:*:*	*	*	*	*
1113	rt107e	yamaha	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.60	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.60	cpe:2.3:o:yamaha:rt107e:8.03.60:*:*:*:*:*:*:*	*	*	*	*
1114	rt107e	yamaha	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.61	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.61	cpe:2.3:o:yamaha:rt107e:8.03.61:*:*:*:*:*:*:*	*	*	*	*
1115	rt107e	yamaha	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.68	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.68	cpe:2.3:o:yamaha:rt107e:8.03.68:*:*:*:*:*:*:*	*	*	*	*
1116	rt107e	yamaha	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.70	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.70	cpe:2.3:o:yamaha:rt107e:8.03.70:*:*:*:*:*:*:*	*	*	*	*
1117	rt107e	yamaha	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.75	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.75	cpe:2.3:o:yamaha:rt107e:8.03.75:*:*:*:*:*:*:*	*	*	*	*
1118	rt107e	yamaha	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.76	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.76	cpe:2.3:o:yamaha:rt107e:8.03.76:*:*:*:*:*:*:*	*	*	*	*
1119	rt107e	yamaha	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.77	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.77	cpe:2.3:o:yamaha:rt107e:8.03.77:*:*:*:*:*:*:*	*	*	*	*
1120	rt107e	yamaha	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.78	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.78	cpe:2.3:o:yamaha:rt107e:8.03.78:*:*:*:*:*:*:*	*	*	*	*
1121	rt107e	yamaha	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.80	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.80	cpe:2.3:o:yamaha:rt107e:8.03.80:*:*:*:*:*:*:*	*	*	*	*
1122	rt107e	yamaha	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.82	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.82	cpe:2.3:o:yamaha:rt107e:8.03.82:*:*:*:*:*:*:*	*	*	*	*
1123	rt107e	yamaha	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.83	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.83	cpe:2.3:o:yamaha:rt107e:8.03.83:*:*:*:*:*:*:*	*	*	*	*
1124	rt107e	yamaha	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.87	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.87	cpe:2.3:o:yamaha:rt107e:8.03.87:*:*:*:*:*:*:*	*	*	*	*
1125	rt107e	yamaha	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT107e 8.03.88	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.88	cpe:2.3:o:yamaha:rt107e:8.03.88:*:*:*:*:*:*:*	*	*	*	*
1126	rt107e	yamaha	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT107e 8.03.90	[]	/o	*	cpe:/o:yamaha:rt107e:8.03.90	cpe:2.3:o:yamaha:rt107e:8.03.90:*:*:*:*:*:*:*	*	*	*	*
1127	rt140e	yamaha	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.01.06	[]	/o	*	cpe:/o:yamaha:rt140e:6.01.06	cpe:2.3:o:yamaha:rt140e:6.01.06:*:*:*:*:*:*:*	*	*	*	*
1128	rt140e	yamaha	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.01.07	[]	/o	*	cpe:/o:yamaha:rt140e:6.01.07	cpe:2.3:o:yamaha:rt140e:6.01.07:*:*:*:*:*:*:*	*	*	*	*
1129	rt140e	yamaha	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.01.09	[]	/o	*	cpe:/o:yamaha:rt140e:6.01.09	cpe:2.3:o:yamaha:rt140e:6.01.09:*:*:*:*:*:*:*	*	*	*	*
1130	rt140e	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.03	[]	/o	*	cpe:/o:yamaha:rt140e:6.02.03	cpe:2.3:o:yamaha:rt140e:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1131	rt140e	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.04	[]	/o	*	cpe:/o:yamaha:rt140e:6.02.04	cpe:2.3:o:yamaha:rt140e:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1132	rt140e	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.02.07	[]	/o	*	cpe:/o:yamaha:rt140e:6.02.07	cpe:2.3:o:yamaha:rt140e:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1133	rt140e	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.16	[]	/o	*	cpe:/o:yamaha:rt140e:6.02.16	cpe:2.3:o:yamaha:rt140e:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1134	rt140e	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.02.19	[]	/o	*	cpe:/o:yamaha:rt140e:6.02.19	cpe:2.3:o:yamaha:rt140e:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1135	rt140e	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.04	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.04	cpe:2.3:o:yamaha:rt140e:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1136	rt140e	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.08	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.08	cpe:2.3:o:yamaha:rt140e:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1137	rt140e	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.11	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.11	cpe:2.3:o:yamaha:rt140e:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1138	rt140e	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.15	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.15	cpe:2.3:o:yamaha:rt140e:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1139	rt140e	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.18	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.18	cpe:2.3:o:yamaha:rt140e:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1140	rt140e	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.25	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.25	cpe:2.3:o:yamaha:rt140e:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1141	rt140e	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140e 6.03.28	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.28	cpe:2.3:o:yamaha:rt140e:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1142	rt140e	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.33	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.33	cpe:2.3:o:yamaha:rt140e:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1143	rt140e	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140e 6.03.34	[]	/o	*	cpe:/o:yamaha:rt140e:6.03.34	cpe:2.3:o:yamaha:rt140e:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1144	rt140f	yamaha	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.01.06	[]	/o	*	cpe:/o:yamaha:rt140f:6.01.06	cpe:2.3:o:yamaha:rt140f:6.01.06:*:*:*:*:*:*:*	*	*	*	*
1145	rt140f	yamaha	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.01.07	[]	/o	*	cpe:/o:yamaha:rt140f:6.01.07	cpe:2.3:o:yamaha:rt140f:6.01.07:*:*:*:*:*:*:*	*	*	*	*
1146	rt140f	yamaha	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.01.09	[]	/o	*	cpe:/o:yamaha:rt140f:6.01.09	cpe:2.3:o:yamaha:rt140f:6.01.09:*:*:*:*:*:*:*	*	*	*	*
1147	rt140f	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.03	[]	/o	*	cpe:/o:yamaha:rt140f:6.02.03	cpe:2.3:o:yamaha:rt140f:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1148	rt140f	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.02.04	[]	/o	*	cpe:/o:yamaha:rt140f:6.02.04	cpe:2.3:o:yamaha:rt140f:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1149	rt140f	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.02.07	[]	/o	*	cpe:/o:yamaha:rt140f:6.02.07	cpe:2.3:o:yamaha:rt140f:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1150	rt140f	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.02.16	[]	/o	*	cpe:/o:yamaha:rt140f:6.02.16	cpe:2.3:o:yamaha:rt140f:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1151	rt140f	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.02.19	[]	/o	*	cpe:/o:yamaha:rt140f:6.02.19	cpe:2.3:o:yamaha:rt140f:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1152	rt140f	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.04	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.04	cpe:2.3:o:yamaha:rt140f:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1153	rt140f	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.08	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.08	cpe:2.3:o:yamaha:rt140f:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1154	rt140f	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.11	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.11	cpe:2.3:o:yamaha:rt140f:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1155	rt140f	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.15	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.15	cpe:2.3:o:yamaha:rt140f:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1156	rt140f	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.18	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.18	cpe:2.3:o:yamaha:rt140f:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1157	rt140f	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.25	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.25	cpe:2.3:o:yamaha:rt140f:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1158	rt140f	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.28	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.28	cpe:2.3:o:yamaha:rt140f:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1159	rt140f	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140f 6.03.33	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.33	cpe:2.3:o:yamaha:rt140f:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1160	rt140f	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140f 6.03.34	[]	/o	*	cpe:/o:yamaha:rt140f:6.03.34	cpe:2.3:o:yamaha:rt140f:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1161	rt140i	yamaha	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.01.06	[]	/o	*	cpe:/o:yamaha:rt140i:6.01.06	cpe:2.3:o:yamaha:rt140i:6.01.06:*:*:*:*:*:*:*	*	*	*	*
1162	rt140i	yamaha	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.01.07	[]	/o	*	cpe:/o:yamaha:rt140i:6.01.07	cpe:2.3:o:yamaha:rt140i:6.01.07:*:*:*:*:*:*:*	*	*	*	*
1163	rt140i	yamaha	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.01.09	[]	/o	*	cpe:/o:yamaha:rt140i:6.01.09	cpe:2.3:o:yamaha:rt140i:6.01.09:*:*:*:*:*:*:*	*	*	*	*
1164	rt140i	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.03	[]	/o	*	cpe:/o:yamaha:rt140i:6.02.03	cpe:2.3:o:yamaha:rt140i:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1165	rt140i	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.04	[]	/o	*	cpe:/o:yamaha:rt140i:6.02.04	cpe:2.3:o:yamaha:rt140i:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1166	rt140i	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.07	[]	/o	*	cpe:/o:yamaha:rt140i:6.02.07	cpe:2.3:o:yamaha:rt140i:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1167	rt140i	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.02.16	[]	/o	*	cpe:/o:yamaha:rt140i:6.02.16	cpe:2.3:o:yamaha:rt140i:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1168	rt140i	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.02.19	[]	/o	*	cpe:/o:yamaha:rt140i:6.02.19	cpe:2.3:o:yamaha:rt140i:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1169	rt140i	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.04	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.04	cpe:2.3:o:yamaha:rt140i:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1170	rt140i	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.08	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.08	cpe:2.3:o:yamaha:rt140i:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1171	rt140i	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.11	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.11	cpe:2.3:o:yamaha:rt140i:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1172	rt140i	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.15	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.15	cpe:2.3:o:yamaha:rt140i:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1173	rt140i	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.18	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.18	cpe:2.3:o:yamaha:rt140i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1174	rt140i	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.25	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.25	cpe:2.3:o:yamaha:rt140i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1175	rt140i	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.28	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.28	cpe:2.3:o:yamaha:rt140i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1176	rt140i	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140i 6.03.33	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.33	cpe:2.3:o:yamaha:rt140i:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1177	rt140i	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140i 6.03.34	[]	/o	*	cpe:/o:yamaha:rt140i:6.03.34	cpe:2.3:o:yamaha:rt140i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1178	rt140p	yamaha	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.01.06	[]	/o	*	cpe:/o:yamaha:rt140p:6.01.06	cpe:2.3:o:yamaha:rt140p:6.01.06:*:*:*:*:*:*:*	*	*	*	*
1179	rt140p	yamaha	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.01.07	[]	/o	*	cpe:/o:yamaha:rt140p:6.01.07	cpe:2.3:o:yamaha:rt140p:6.01.07:*:*:*:*:*:*:*	*	*	*	*
1180	rt140p	yamaha	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.01.09	[]	/o	*	cpe:/o:yamaha:rt140p:6.01.09	cpe:2.3:o:yamaha:rt140p:6.01.09:*:*:*:*:*:*:*	*	*	*	*
1181	rt140p	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.02.03	[]	/o	*	cpe:/o:yamaha:rt140p:6.02.03	cpe:2.3:o:yamaha:rt140p:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1182	rt140p	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.02.04	[]	/o	*	cpe:/o:yamaha:rt140p:6.02.04	cpe:2.3:o:yamaha:rt140p:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1183	rt140p	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.02.07	[]	/o	*	cpe:/o:yamaha:rt140p:6.02.07	cpe:2.3:o:yamaha:rt140p:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1184	rt140p	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.02.16	[]	/o	*	cpe:/o:yamaha:rt140p:6.02.16	cpe:2.3:o:yamaha:rt140p:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1185	rt140p	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.02.19	[]	/o	*	cpe:/o:yamaha:rt140p:6.02.19	cpe:2.3:o:yamaha:rt140p:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1186	rt140p	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.04	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.04	cpe:2.3:o:yamaha:rt140p:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1187	rt140p	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.08	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.08	cpe:2.3:o:yamaha:rt140p:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1188	rt140p	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.11	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.11	cpe:2.3:o:yamaha:rt140p:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1189	rt140p	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.15	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.15	cpe:2.3:o:yamaha:rt140p:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1190	rt140p	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.18	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.18	cpe:2.3:o:yamaha:rt140p:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1191	rt140p	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.25	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.25	cpe:2.3:o:yamaha:rt140p:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1192	rt140p	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.28	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.28	cpe:2.3:o:yamaha:rt140p:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1193	rt140p	yamaha	6.03.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT140p 6.03.33	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.33	cpe:2.3:o:yamaha:rt140p:6.03.33:*:*:*:*:*:*:*	*	*	*	*
1194	rt140p	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT140p 6.03.34	[]	/o	*	cpe:/o:yamaha:rt140p:6.03.34	cpe:2.3:o:yamaha:rt140p:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1195	rt200i	yamaha	2.00.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.00.06	[]	/o	*	cpe:/o:yamaha:rt200i:2.00.06	cpe:2.3:o:yamaha:rt200i:2.00.06:*:*:*:*:*:*:*	*	*	*	*
1196	rt200i	yamaha	2.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.00.07	[]	/o	*	cpe:/o:yamaha:rt200i:2.00.07	cpe:2.3:o:yamaha:rt200i:2.00.07:*:*:*:*:*:*:*	*	*	*	*
1197	rt200i	yamaha	2.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.01.07	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.07	cpe:2.3:o:yamaha:rt200i:2.01.07:*:*:*:*:*:*:*	*	*	*	*
1198	rt200i	yamaha	2.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.01.11	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.11	cpe:2.3:o:yamaha:rt200i:2.01.11:*:*:*:*:*:*:*	*	*	*	*
1199	rt200i	yamaha	2.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.14	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.14	cpe:2.3:o:yamaha:rt200i:2.01.14:*:*:*:*:*:*:*	*	*	*	*
1200	rt200i	yamaha	2.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.19	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.19	cpe:2.3:o:yamaha:rt200i:2.01.19:*:*:*:*:*:*:*	*	*	*	*
1201	rt200i	yamaha	2.01.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.20	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.20	cpe:2.3:o:yamaha:rt200i:2.01.20:*:*:*:*:*:*:*	*	*	*	*
1202	rt200i	yamaha	2.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.01.21	[]	/o	*	cpe:/o:yamaha:rt200i:2.01.21	cpe:2.3:o:yamaha:rt200i:2.01.21:*:*:*:*:*:*:*	*	*	*	*
1203	rt200i	yamaha	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.15	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.15	cpe:2.3:o:yamaha:rt200i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
1204	rt200i	yamaha	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.17	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.17	cpe:2.3:o:yamaha:rt200i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
1205	rt200i	yamaha	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.19	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.19	cpe:2.3:o:yamaha:rt200i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
1206	rt200i	yamaha	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.23	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.23	cpe:2.3:o:yamaha:rt200i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
1207	rt200i	yamaha	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.27	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.27	cpe:2.3:o:yamaha:rt200i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
1208	rt200i	yamaha	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.28	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.28	cpe:2.3:o:yamaha:rt200i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
1209	rt200i	yamaha	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.29	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.29	cpe:2.3:o:yamaha:rt200i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
1210	rt200i	yamaha	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.31	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.31	cpe:2.3:o:yamaha:rt200i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
1211	rt200i	yamaha	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.33	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.33	cpe:2.3:o:yamaha:rt200i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
1212	rt200i	yamaha	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.34	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.34	cpe:2.3:o:yamaha:rt200i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
1213	rt200i	yamaha	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.35	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.35	cpe:2.3:o:yamaha:rt200i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
1214	rt200i	yamaha	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.36	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.36	cpe:2.3:o:yamaha:rt200i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
1215	rt200i	yamaha	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.38	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.38	cpe:2.3:o:yamaha:rt200i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
1216	rt200i	yamaha	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.39	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.39	cpe:2.3:o:yamaha:rt200i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
1217	rt200i	yamaha	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.40	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.40	cpe:2.3:o:yamaha:rt200i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
1218	rt200i	yamaha	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.41	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.41	cpe:2.3:o:yamaha:rt200i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
1219	rt200i	yamaha	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.44	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.44	cpe:2.3:o:yamaha:rt200i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
1220	rt200i	yamaha	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 2.02.45	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.45	cpe:2.3:o:yamaha:rt200i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
1221	rt200i	yamaha	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 2.02.46	[]	/o	*	cpe:/o:yamaha:rt200i:2.02.46	cpe:2.3:o:yamaha:rt200i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
1222	rt200i	yamaha	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.09	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.09	cpe:2.3:o:yamaha:rt200i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
1223	rt200i	yamaha	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.16	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.16	cpe:2.3:o:yamaha:rt200i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
1224	rt200i	yamaha	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.18	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.18	cpe:2.3:o:yamaha:rt200i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
1225	rt200i	yamaha	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.23	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.23	cpe:2.3:o:yamaha:rt200i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
1226	rt200i	yamaha	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.28	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.28	cpe:2.3:o:yamaha:rt200i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
1227	rt200i	yamaha	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.30	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.30	cpe:2.3:o:yamaha:rt200i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
1228	rt200i	yamaha	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.31	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.31	cpe:2.3:o:yamaha:rt200i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
1229	rt200i	yamaha	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.33	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.33	cpe:2.3:o:yamaha:rt200i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
1230	rt200i	yamaha	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.35	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.35	cpe:2.3:o:yamaha:rt200i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
1231	rt200i	yamaha	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.36	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.36	cpe:2.3:o:yamaha:rt200i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
1232	rt200i	yamaha	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.37	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.37	cpe:2.3:o:yamaha:rt200i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
1233	rt200i	yamaha	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.42	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.42	cpe:2.3:o:yamaha:rt200i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
1234	rt200i	yamaha	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.44	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.44	cpe:2.3:o:yamaha:rt200i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
1235	rt200i	yamaha	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 3.00.45	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.45	cpe:2.3:o:yamaha:rt200i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
1236	rt200i	yamaha	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.46	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.46	cpe:2.3:o:yamaha:rt200i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
1237	rt200i	yamaha	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 3.00.47	[]	/o	*	cpe:/o:yamaha:rt200i:3.00.47	cpe:2.3:o:yamaha:rt200i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
1238	rt200i	yamaha	4.00.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.02	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.02	cpe:2.3:o:yamaha:rt200i:4.00.02:*:*:*:*:*:*:*	*	*	*	*
1239	rt200i	yamaha	4.00.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.05	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.05	cpe:2.3:o:yamaha:rt200i:4.00.05:*:*:*:*:*:*:*	*	*	*	*
1240	rt200i	yamaha	4.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.07	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.07	cpe:2.3:o:yamaha:rt200i:4.00.07:*:*:*:*:*:*:*	*	*	*	*
1241	rt200i	yamaha	4.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.09	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.09	cpe:2.3:o:yamaha:rt200i:4.00.09:*:*:*:*:*:*:*	*	*	*	*
1242	rt200i	yamaha	4.00.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.11	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.11	cpe:2.3:o:yamaha:rt200i:4.00.11:*:*:*:*:*:*:*	*	*	*	*
1243	rt200i	yamaha	4.00.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.13	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.13	cpe:2.3:o:yamaha:rt200i:4.00.13:*:*:*:*:*:*:*	*	*	*	*
1244	rt200i	yamaha	4.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.14	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.14	cpe:2.3:o:yamaha:rt200i:4.00.14:*:*:*:*:*:*:*	*	*	*	*
1245	rt200i	yamaha	4.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.18	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.18	cpe:2.3:o:yamaha:rt200i:4.00.18:*:*:*:*:*:*:*	*	*	*	*
1246	rt200i	yamaha	4.00.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.21	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.21	cpe:2.3:o:yamaha:rt200i:4.00.21:*:*:*:*:*:*:*	*	*	*	*
1247	rt200i	yamaha	4.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.22	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.22	cpe:2.3:o:yamaha:rt200i:4.00.22:*:*:*:*:*:*:*	*	*	*	*
1248	rt200i	yamaha	4.00.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.24	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.24	cpe:2.3:o:yamaha:rt200i:4.00.24:*:*:*:*:*:*:*	*	*	*	*
1249	rt200i	yamaha	4.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.25	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.25	cpe:2.3:o:yamaha:rt200i:4.00.25:*:*:*:*:*:*:*	*	*	*	*
1250	rt200i	yamaha	4.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.33	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.33	cpe:2.3:o:yamaha:rt200i:4.00.33:*:*:*:*:*:*:*	*	*	*	*
1251	rt200i	yamaha	4.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.35	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.35	cpe:2.3:o:yamaha:rt200i:4.00.35:*:*:*:*:*:*:*	*	*	*	*
1252	rt200i	yamaha	4.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.36	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.36	cpe:2.3:o:yamaha:rt200i:4.00.36:*:*:*:*:*:*:*	*	*	*	*
1253	rt200i	yamaha	4.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.37	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.37	cpe:2.3:o:yamaha:rt200i:4.00.37:*:*:*:*:*:*:*	*	*	*	*
1254	rt200i	yamaha	4.00.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.38	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.38	cpe:2.3:o:yamaha:rt200i:4.00.38:*:*:*:*:*:*:*	*	*	*	*
1255	rt200i	yamaha	4.00.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT200i 4.00.39	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.39	cpe:2.3:o:yamaha:rt200i:4.00.39:*:*:*:*:*:*:*	*	*	*	*
1256	rt200i	yamaha	4.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.40	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.40	cpe:2.3:o:yamaha:rt200i:4.00.40:*:*:*:*:*:*:*	*	*	*	*
1257	rt200i	yamaha	4.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.44	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.44	cpe:2.3:o:yamaha:rt200i:4.00.44:*:*:*:*:*:*:*	*	*	*	*
1258	rt200i	yamaha	4.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.48	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.48	cpe:2.3:o:yamaha:rt200i:4.00.48:*:*:*:*:*:*:*	*	*	*	*
1259	rt200i	yamaha	4.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.53	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.53	cpe:2.3:o:yamaha:rt200i:4.00.53:*:*:*:*:*:*:*	*	*	*	*
1260	rt200i	yamaha	4.00.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT200i 4.00.54	[]	/o	*	cpe:/o:yamaha:rt200i:4.00.54	cpe:2.3:o:yamaha:rt200i:4.00.54:*:*:*:*:*:*:*	*	*	*	*
1261	rt250i	yamaha	8.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.19	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.19	cpe:2.3:o:yamaha:rt250i:8.02.19:*:*:*:*:*:*:*	*	*	*	*
1262	rt250i	yamaha	8.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.28	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.28	cpe:2.3:o:yamaha:rt250i:8.02.28:*:*:*:*:*:*:*	*	*	*	*
1263	rt250i	yamaha	8.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.31	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.31	cpe:2.3:o:yamaha:rt250i:8.02.31:*:*:*:*:*:*:*	*	*	*	*
1264	rt250i	yamaha	8.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.35	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.35	cpe:2.3:o:yamaha:rt250i:8.02.35:*:*:*:*:*:*:*	*	*	*	*
1265	rt250i	yamaha	8.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.36	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.36	cpe:2.3:o:yamaha:rt250i:8.02.36:*:*:*:*:*:*:*	*	*	*	*
1266	rt250i	yamaha	8.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.40	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.40	cpe:2.3:o:yamaha:rt250i:8.02.40:*:*:*:*:*:*:*	*	*	*	*
1267	rt250i	yamaha	8.02.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.42	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.42	cpe:2.3:o:yamaha:rt250i:8.02.42:*:*:*:*:*:*:*	*	*	*	*
1268	rt250i	yamaha	8.02.43	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.43	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.43	cpe:2.3:o:yamaha:rt250i:8.02.43:*:*:*:*:*:*:*	*	*	*	*
1269	rt250i	yamaha	8.02.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT250i 8.02.48	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.48	cpe:2.3:o:yamaha:rt250i:8.02.48:*:*:*:*:*:*:*	*	*	*	*
1270	rt250i	yamaha	8.02.50	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT250i 8.02.50	[]	/o	*	cpe:/o:yamaha:rt250i:8.02.50	cpe:2.3:o:yamaha:rt250i:8.02.50:*:*:*:*:*:*:*	*	*	*	*
1271	rt300i	yamaha	6.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.09	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.09	cpe:2.3:o:yamaha:rt300i:6.00.09:*:*:*:*:*:*:*	*	*	*	*
1272	rt300i	yamaha	6.00.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.11	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.11	cpe:2.3:o:yamaha:rt300i:6.00.11:*:*:*:*:*:*:*	*	*	*	*
1273	rt300i	yamaha	6.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.15	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.15	cpe:2.3:o:yamaha:rt300i:6.00.15:*:*:*:*:*:*:*	*	*	*	*
1274	rt300i	yamaha	6.00.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.17	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.17	cpe:2.3:o:yamaha:rt300i:6.00.17:*:*:*:*:*:*:*	*	*	*	*
1275	rt300i	yamaha	6.00.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.20	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.20	cpe:2.3:o:yamaha:rt300i:6.00.20:*:*:*:*:*:*:*	*	*	*	*
1276	rt300i	yamaha	6.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.22	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.22	cpe:2.3:o:yamaha:rt300i:6.00.22:*:*:*:*:*:*:*	*	*	*	*
1277	rt300i	yamaha	6.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.00.25	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.25	cpe:2.3:o:yamaha:rt300i:6.00.25:*:*:*:*:*:*:*	*	*	*	*
1278	rt300i	yamaha	6.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.00.27	[]	/o	*	cpe:/o:yamaha:rt300i:6.00.27	cpe:2.3:o:yamaha:rt300i:6.00.27:*:*:*:*:*:*:*	*	*	*	*
1279	rt300i	yamaha	6.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.01.06	[]	/o	*	cpe:/o:yamaha:rt300i:6.01.06	cpe:2.3:o:yamaha:rt300i:6.01.06:*:*:*:*:*:*:*	*	*	*	*
1280	rt300i	yamaha	6.01.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.01.07	[]	/o	*	cpe:/o:yamaha:rt300i:6.01.07	cpe:2.3:o:yamaha:rt300i:6.01.07:*:*:*:*:*:*:*	*	*	*	*
1281	rt300i	yamaha	6.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.01.09	[]	/o	*	cpe:/o:yamaha:rt300i:6.01.09	cpe:2.3:o:yamaha:rt300i:6.01.09:*:*:*:*:*:*:*	*	*	*	*
1282	rt300i	yamaha	6.02.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.03	[]	/o	*	cpe:/o:yamaha:rt300i:6.02.03	cpe:2.3:o:yamaha:rt300i:6.02.03:*:*:*:*:*:*:*	*	*	*	*
1283	rt300i	yamaha	6.02.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.02.04	[]	/o	*	cpe:/o:yamaha:rt300i:6.02.04	cpe:2.3:o:yamaha:rt300i:6.02.04:*:*:*:*:*:*:*	*	*	*	*
1284	rt300i	yamaha	6.02.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.02.07	[]	/o	*	cpe:/o:yamaha:rt300i:6.02.07	cpe:2.3:o:yamaha:rt300i:6.02.07:*:*:*:*:*:*:*	*	*	*	*
1285	rt300i	yamaha	6.02.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.16	[]	/o	*	cpe:/o:yamaha:rt300i:6.02.16	cpe:2.3:o:yamaha:rt300i:6.02.16:*:*:*:*:*:*:*	*	*	*	*
1286	rt300i	yamaha	6.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.02.19	[]	/o	*	cpe:/o:yamaha:rt300i:6.02.19	cpe:2.3:o:yamaha:rt300i:6.02.19:*:*:*:*:*:*:*	*	*	*	*
1287	rt300i	yamaha	6.03.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.03.04	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.04	cpe:2.3:o:yamaha:rt300i:6.03.04:*:*:*:*:*:*:*	*	*	*	*
1288	rt300i	yamaha	6.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.08	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.08	cpe:2.3:o:yamaha:rt300i:6.03.08:*:*:*:*:*:*:*	*	*	*	*
1289	rt300i	yamaha	6.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.03.11	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.11	cpe:2.3:o:yamaha:rt300i:6.03.11:*:*:*:*:*:*:*	*	*	*	*
1290	rt300i	yamaha	6.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.15	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.15	cpe:2.3:o:yamaha:rt300i:6.03.15:*:*:*:*:*:*:*	*	*	*	*
1291	rt300i	yamaha	6.03.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.18	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.18	cpe:2.3:o:yamaha:rt300i:6.03.18:*:*:*:*:*:*:*	*	*	*	*
1292	rt300i	yamaha	6.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.25	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.25	cpe:2.3:o:yamaha:rt300i:6.03.25:*:*:*:*:*:*:*	*	*	*	*
1293	rt300i	yamaha	6.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT300i 6.03.28	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.28	cpe:2.3:o:yamaha:rt300i:6.03.28:*:*:*:*:*:*:*	*	*	*	*
1294	rt300i	yamaha	6.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT300i 6.03.34	[]	/o	*	cpe:/o:yamaha:rt300i:6.03.34	cpe:2.3:o:yamaha:rt300i:6.03.34:*:*:*:*:*:*:*	*	*	*	*
1295	rt56v	yamaha	4.07.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.11	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.11	cpe:2.3:o:yamaha:rt56v:4.07.11:*:*:*:*:*:*:*	*	*	*	*
1296	rt56v	yamaha	4.07.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.19	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.19	cpe:2.3:o:yamaha:rt56v:4.07.19:*:*:*:*:*:*:*	*	*	*	*
1297	rt56v	yamaha	4.07.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.22	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.22	cpe:2.3:o:yamaha:rt56v:4.07.22:*:*:*:*:*:*:*	*	*	*	*
1298	rt56v	yamaha	4.07.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.30	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.30	cpe:2.3:o:yamaha:rt56v:4.07.30:*:*:*:*:*:*:*	*	*	*	*
1299	rt56v	yamaha	4.07.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.37	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.37	cpe:2.3:o:yamaha:rt56v:4.07.37:*:*:*:*:*:*:*	*	*	*	*
1300	rt56v	yamaha	4.07.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.45	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.45	cpe:2.3:o:yamaha:rt56v:4.07.45:*:*:*:*:*:*:*	*	*	*	*
1301	rt56v	yamaha	4.07.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT56v 4.07.49	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.49	cpe:2.3:o:yamaha:rt56v:4.07.49:*:*:*:*:*:*:*	*	*	*	*
1302	rt56v	yamaha	4.07.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT56v 4.07.54	[]	/o	*	cpe:/o:yamaha:rt56v:4.07.54	cpe:2.3:o:yamaha:rt56v:4.07.54:*:*:*:*:*:*:*	*	*	*	*
1303	rt57i	yamaha	8.00.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.13	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.13	cpe:2.3:o:yamaha:rt57i:8.00.13:*:*:*:*:*:*:*	*	*	*	*
1304	rt57i	yamaha	8.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.14	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.14	cpe:2.3:o:yamaha:rt57i:8.00.14:*:*:*:*:*:*:*	*	*	*	*
1305	rt57i	yamaha	8.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.19	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.19	cpe:2.3:o:yamaha:rt57i:8.00.19:*:*:*:*:*:*:*	*	*	*	*
1306	rt57i	yamaha	8.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.27	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.27	cpe:2.3:o:yamaha:rt57i:8.00.27:*:*:*:*:*:*:*	*	*	*	*
1307	rt57i	yamaha	8.00.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.41	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.41	cpe:2.3:o:yamaha:rt57i:8.00.41:*:*:*:*:*:*:*	*	*	*	*
1308	rt57i	yamaha	8.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.46	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.46	cpe:2.3:o:yamaha:rt57i:8.00.46:*:*:*:*:*:*:*	*	*	*	*
1309	rt57i	yamaha	8.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.48	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.48	cpe:2.3:o:yamaha:rt57i:8.00.48:*:*:*:*:*:*:*	*	*	*	*
1310	rt57i	yamaha	8.00.57	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.57	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.57	cpe:2.3:o:yamaha:rt57i:8.00.57:*:*:*:*:*:*:*	*	*	*	*
1311	rt57i	yamaha	8.00.66	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.66	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.66	cpe:2.3:o:yamaha:rt57i:8.00.66:*:*:*:*:*:*:*	*	*	*	*
1312	rt57i	yamaha	8.00.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.70	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.70	cpe:2.3:o:yamaha:rt57i:8.00.70:*:*:*:*:*:*:*	*	*	*	*
1313	rt57i	yamaha	8.00.71	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.71	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.71	cpe:2.3:o:yamaha:rt57i:8.00.71:*:*:*:*:*:*:*	*	*	*	*
1314	rt57i	yamaha	8.00.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.83	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.83	cpe:2.3:o:yamaha:rt57i:8.00.83:*:*:*:*:*:*:*	*	*	*	*
1315	rt57i	yamaha	8.00.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.87	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.87	cpe:2.3:o:yamaha:rt57i:8.00.87:*:*:*:*:*:*:*	*	*	*	*
1316	rt57i	yamaha	8.00.89	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT57i 8.00.89	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.89	cpe:2.3:o:yamaha:rt57i:8.00.89:*:*:*:*:*:*:*	*	*	*	*
1317	rt57i	yamaha	8.00.91	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT57i 8.00.91	[]	/o	*	cpe:/o:yamaha:rt57i:8.00.91	cpe:2.3:o:yamaha:rt57i:8.00.91:*:*:*:*:*:*:*	*	*	*	*
1318	rt58i	yamaha	9.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.11	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.11	cpe:2.3:o:yamaha:rt58i:9.01.11:*:*:*:*:*:*:*	*	*	*	*
1319	rt58i	yamaha	9.01.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.13	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.13	cpe:2.3:o:yamaha:rt58i:9.01.13:*:*:*:*:*:*:*	*	*	*	*
1320	rt58i	yamaha	9.01.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.18	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.18	cpe:2.3:o:yamaha:rt58i:9.01.18:*:*:*:*:*:*:*	*	*	*	*
1321	rt58i	yamaha	9.01.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.19	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.19	cpe:2.3:o:yamaha:rt58i:9.01.19:*:*:*:*:*:*:*	*	*	*	*
1322	rt58i	yamaha	9.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.21	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.21	cpe:2.3:o:yamaha:rt58i:9.01.21:*:*:*:*:*:*:*	*	*	*	*
1323	rt58i	yamaha	9.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.29	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.29	cpe:2.3:o:yamaha:rt58i:9.01.29:*:*:*:*:*:*:*	*	*	*	*
1324	rt58i	yamaha	9.01.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.33	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.33	cpe:2.3:o:yamaha:rt58i:9.01.33:*:*:*:*:*:*:*	*	*	*	*
1325	rt58i	yamaha	9.01.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.36	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.36	cpe:2.3:o:yamaha:rt58i:9.01.36:*:*:*:*:*:*:*	*	*	*	*
1326	rt58i	yamaha	9.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.41	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.41	cpe:2.3:o:yamaha:rt58i:9.01.41:*:*:*:*:*:*:*	*	*	*	*
1327	rt58i	yamaha	9.01.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.44	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.44	cpe:2.3:o:yamaha:rt58i:9.01.44:*:*:*:*:*:*:*	*	*	*	*
1328	rt58i	yamaha	9.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT58i 9.01.48	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.48	cpe:2.3:o:yamaha:rt58i:9.01.48:*:*:*:*:*:*:*	*	*	*	*
1329	rt58i	yamaha	9.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT58i 9.01.49	[]	/o	*	cpe:/o:yamaha:rt58i:9.01.49	cpe:2.3:o:yamaha:rt58i:9.01.49:*:*:*:*:*:*:*	*	*	*	*
1330	rt60w	yamaha	5.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT60w 5.01.14	[]	/o	*	cpe:/o:yamaha:rt60w:5.01.14	cpe:2.3:o:yamaha:rt60w:5.01.14:*:*:*:*:*:*:*	*	*	*	*
1331	rt60w	yamaha	5.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT60w 5.01.16	[]	/o	*	cpe:/o:yamaha:rt60w:5.01.16	cpe:2.3:o:yamaha:rt60w:5.01.16:*:*:*:*:*:*:*	*	*	*	*
1332	rt60w	yamaha	5.01.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT60w 5.01.21	[]	/o	*	cpe:/o:yamaha:rt60w:5.01.21	cpe:2.3:o:yamaha:rt60w:5.01.21:*:*:*:*:*:*:*	*	*	*	*
1333	rt80i	yamaha	2.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.15	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.15	cpe:2.3:o:yamaha:rt80i:2.02.15:*:*:*:*:*:*:*	*	*	*	*
1334	rt80i	yamaha	2.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.17	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.17	cpe:2.3:o:yamaha:rt80i:2.02.17:*:*:*:*:*:*:*	*	*	*	*
1335	rt80i	yamaha	2.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.19	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.19	cpe:2.3:o:yamaha:rt80i:2.02.19:*:*:*:*:*:*:*	*	*	*	*
1336	rt80i	yamaha	2.02.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.23	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.23	cpe:2.3:o:yamaha:rt80i:2.02.23:*:*:*:*:*:*:*	*	*	*	*
1337	rt80i	yamaha	2.02.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.27	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.27	cpe:2.3:o:yamaha:rt80i:2.02.27:*:*:*:*:*:*:*	*	*	*	*
1338	rt80i	yamaha	2.02.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.28	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.28	cpe:2.3:o:yamaha:rt80i:2.02.28:*:*:*:*:*:*:*	*	*	*	*
1339	rt80i	yamaha	2.02.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.29	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.29	cpe:2.3:o:yamaha:rt80i:2.02.29:*:*:*:*:*:*:*	*	*	*	*
1340	rt80i	yamaha	2.02.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.31	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.31	cpe:2.3:o:yamaha:rt80i:2.02.31:*:*:*:*:*:*:*	*	*	*	*
1341	rt80i	yamaha	2.02.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.33	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.33	cpe:2.3:o:yamaha:rt80i:2.02.33:*:*:*:*:*:*:*	*	*	*	*
1342	rt80i	yamaha	2.02.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.34	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.34	cpe:2.3:o:yamaha:rt80i:2.02.34:*:*:*:*:*:*:*	*	*	*	*
1343	rt80i	yamaha	2.02.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.35	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.35	cpe:2.3:o:yamaha:rt80i:2.02.35:*:*:*:*:*:*:*	*	*	*	*
1344	rt80i	yamaha	2.02.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.36	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.36	cpe:2.3:o:yamaha:rt80i:2.02.36:*:*:*:*:*:*:*	*	*	*	*
1345	rt80i	yamaha	2.02.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.38	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.38	cpe:2.3:o:yamaha:rt80i:2.02.38:*:*:*:*:*:*:*	*	*	*	*
1346	rt80i	yamaha	2.02.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.39	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.39	cpe:2.3:o:yamaha:rt80i:2.02.39:*:*:*:*:*:*:*	*	*	*	*
1347	rt80i	yamaha	2.02.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.40	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.40	cpe:2.3:o:yamaha:rt80i:2.02.40:*:*:*:*:*:*:*	*	*	*	*
1348	rt80i	yamaha	2.02.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.41	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.41	cpe:2.3:o:yamaha:rt80i:2.02.41:*:*:*:*:*:*:*	*	*	*	*
1349	rt80i	yamaha	2.02.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 2.02.44	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.44	cpe:2.3:o:yamaha:rt80i:2.02.44:*:*:*:*:*:*:*	*	*	*	*
1350	rt80i	yamaha	2.02.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.45	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.45	cpe:2.3:o:yamaha:rt80i:2.02.45:*:*:*:*:*:*:*	*	*	*	*
1351	rt80i	yamaha	2.02.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 2.02.46	[]	/o	*	cpe:/o:yamaha:rt80i:2.02.46	cpe:2.3:o:yamaha:rt80i:2.02.46:*:*:*:*:*:*:*	*	*	*	*
1352	rt80i	yamaha	3.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.09	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.09	cpe:2.3:o:yamaha:rt80i:3.00.09:*:*:*:*:*:*:*	*	*	*	*
1353	rt80i	yamaha	3.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.16	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.16	cpe:2.3:o:yamaha:rt80i:3.00.16:*:*:*:*:*:*:*	*	*	*	*
1354	rt80i	yamaha	3.00.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.18	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.18	cpe:2.3:o:yamaha:rt80i:3.00.18:*:*:*:*:*:*:*	*	*	*	*
1355	rt80i	yamaha	3.00.23	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.23	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.23	cpe:2.3:o:yamaha:rt80i:3.00.23:*:*:*:*:*:*:*	*	*	*	*
1356	rt80i	yamaha	3.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.28	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.28	cpe:2.3:o:yamaha:rt80i:3.00.28:*:*:*:*:*:*:*	*	*	*	*
1357	rt80i	yamaha	3.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.30	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.30	cpe:2.3:o:yamaha:rt80i:3.00.30:*:*:*:*:*:*:*	*	*	*	*
1358	rt80i	yamaha	3.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.31	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.31	cpe:2.3:o:yamaha:rt80i:3.00.31:*:*:*:*:*:*:*	*	*	*	*
1359	rt80i	yamaha	3.00.33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.33	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.33	cpe:2.3:o:yamaha:rt80i:3.00.33:*:*:*:*:*:*:*	*	*	*	*
1360	rt80i	yamaha	3.00.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.35	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.35	cpe:2.3:o:yamaha:rt80i:3.00.35:*:*:*:*:*:*:*	*	*	*	*
1361	rt80i	yamaha	3.00.36	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RT80i 3.00.36	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.36	cpe:2.3:o:yamaha:rt80i:3.00.36:*:*:*:*:*:*:*	*	*	*	*
1362	rt80i	yamaha	3.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.37	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.37	cpe:2.3:o:yamaha:rt80i:3.00.37:*:*:*:*:*:*:*	*	*	*	*
1363	rt80i	yamaha	3.00.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.42	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.42	cpe:2.3:o:yamaha:rt80i:3.00.42:*:*:*:*:*:*:*	*	*	*	*
1364	rt80i	yamaha	3.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.44	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.44	cpe:2.3:o:yamaha:rt80i:3.00.44:*:*:*:*:*:*:*	*	*	*	*
1365	rt80i	yamaha	3.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.45	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.45	cpe:2.3:o:yamaha:rt80i:3.00.45:*:*:*:*:*:*:*	*	*	*	*
1366	rt80i	yamaha	3.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.46	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.46	cpe:2.3:o:yamaha:rt80i:3.00.46:*:*:*:*:*:*:*	*	*	*	*
1367	rt80i	yamaha	3.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RT80i 3.00.47	[]	/o	*	cpe:/o:yamaha:rt80i:3.00.47	cpe:2.3:o:yamaha:rt80i:3.00.47:*:*:*:*:*:*:*	*	*	*	*
1368	rta50i	yamaha	3.02.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.02.15	[]	/o	*	cpe:/o:yamaha:rta50i:3.02.15	cpe:2.3:o:yamaha:rta50i:3.02.15:*:*:*:*:*:*:*	*	*	*	*
1369	rta50i	yamaha	3.02.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.02.17	[]	/o	*	cpe:/o:yamaha:rta50i:3.02.17	cpe:2.3:o:yamaha:rta50i:3.02.17:*:*:*:*:*:*:*	*	*	*	*
1370	rta50i	yamaha	3.02.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.02.19	[]	/o	*	cpe:/o:yamaha:rta50i:3.02.19	cpe:2.3:o:yamaha:rta50i:3.02.19:*:*:*:*:*:*:*	*	*	*	*
1371	rta50i	yamaha	3.02.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.02.21	[]	/o	*	cpe:/o:yamaha:rta50i:3.02.21	cpe:2.3:o:yamaha:rta50i:3.02.21:*:*:*:*:*:*:*	*	*	*	*
1372	rta50i	yamaha	3.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.25	[]	/o	*	cpe:/o:yamaha:rta50i:3.03.25	cpe:2.3:o:yamaha:rta50i:3.03.25:*:*:*:*:*:*:*	*	*	*	*
1373	rta50i	yamaha	3.03.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.28	[]	/o	*	cpe:/o:yamaha:rta50i:3.03.28	cpe:2.3:o:yamaha:rta50i:3.03.28:*:*:*:*:*:*:*	*	*	*	*
1374	rta50i	yamaha	3.03.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.29	[]	/o	*	cpe:/o:yamaha:rta50i:3.03.29	cpe:2.3:o:yamaha:rta50i:3.03.29:*:*:*:*:*:*:*	*	*	*	*
1375	rta50i	yamaha	3.03.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.03.34	[]	/o	*	cpe:/o:yamaha:rta50i:3.03.34	cpe:2.3:o:yamaha:rta50i:3.03.34:*:*:*:*:*:*:*	*	*	*	*
1376	rta50i	yamaha	3.03.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.03.35	[]	/o	*	cpe:/o:yamaha:rta50i:3.03.35	cpe:2.3:o:yamaha:rta50i:3.03.35:*:*:*:*:*:*:*	*	*	*	*
1377	rta50i	yamaha	3.04.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.04.39	[]	/o	*	cpe:/o:yamaha:rta50i:3.04.39	cpe:2.3:o:yamaha:rta50i:3.04.39:*:*:*:*:*:*:*	*	*	*	*
1378	rta50i	yamaha	3.04.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.04.44	[]	/o	*	cpe:/o:yamaha:rta50i:3.04.44	cpe:2.3:o:yamaha:rta50i:3.04.44:*:*:*:*:*:*:*	*	*	*	*
1379	rta50i	yamaha	3.04.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.04.47	[]	/o	*	cpe:/o:yamaha:rta50i:3.04.47	cpe:2.3:o:yamaha:rta50i:3.04.47:*:*:*:*:*:*:*	*	*	*	*
1380	rta50i	yamaha	3.05.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.05.28	[]	/o	*	cpe:/o:yamaha:rta50i:3.05.28	cpe:2.3:o:yamaha:rta50i:3.05.28:*:*:*:*:*:*:*	*	*	*	*
1381	rta50i	yamaha	3.05.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA50i 3.05.30	[]	/o	*	cpe:/o:yamaha:rta50i:3.05.30	cpe:2.3:o:yamaha:rta50i:3.05.30:*:*:*:*:*:*:*	*	*	*	*
1382	rta50i	yamaha	3.05.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.05.35	[]	/o	*	cpe:/o:yamaha:rta50i:3.05.35	cpe:2.3:o:yamaha:rta50i:3.05.35:*:*:*:*:*:*:*	*	*	*	*
1383	rta50i	yamaha	3.05.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.05.38	[]	/o	*	cpe:/o:yamaha:rta50i:3.05.38	cpe:2.3:o:yamaha:rta50i:3.05.38:*:*:*:*:*:*:*	*	*	*	*
1384	rta50i	yamaha	3.05.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA50i 3.05.42	[]	/o	*	cpe:/o:yamaha:rta50i:3.05.42	cpe:2.3:o:yamaha:rta50i:3.05.42:*:*:*:*:*:*:*	*	*	*	*
1385	rta52i	yamaha	3.06.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 3.06.20	[]	/o	*	cpe:/o:yamaha:rta52i:3.06.20	cpe:2.3:o:yamaha:rta52i:3.06.20:*:*:*:*:*:*:*	*	*	*	*
1386	rta52i	yamaha	3.06.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 3.06.25	[]	/o	*	cpe:/o:yamaha:rta52i:3.06.25	cpe:2.3:o:yamaha:rta52i:3.06.25:*:*:*:*:*:*:*	*	*	*	*
1387	rta52i	yamaha	4.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.06	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.06	cpe:2.3:o:yamaha:rta52i:4.01.06:*:*:*:*:*:*:*	*	*	*	*
1388	rta52i	yamaha	4.01.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.09	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.09	cpe:2.3:o:yamaha:rta52i:4.01.09:*:*:*:*:*:*:*	*	*	*	*
1389	rta52i	yamaha	4.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.11	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.11	cpe:2.3:o:yamaha:rta52i:4.01.11:*:*:*:*:*:*:*	*	*	*	*
1390	rta52i	yamaha	4.01.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA52i 4.01.14	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.14	cpe:2.3:o:yamaha:rta52i:4.01.14:*:*:*:*:*:*:*	*	*	*	*
1391	rta52i	yamaha	4.01.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.15	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.15	cpe:2.3:o:yamaha:rta52i:4.01.15:*:*:*:*:*:*:*	*	*	*	*
1392	rta52i	yamaha	4.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA52i 4.01.17	[]	/o	*	cpe:/o:yamaha:rta52i:4.01.17	cpe:2.3:o:yamaha:rta52i:4.01.17:*:*:*:*:*:*:*	*	*	*	*
1393	rta54i	yamaha	4.03.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.03.12	[]	/o	*	cpe:/o:yamaha:rta54i:4.03.12	cpe:2.3:o:yamaha:rta54i:4.03.12:*:*:*:*:*:*:*	*	*	*	*
1394	rta54i	yamaha	4.04.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA54i 4.04.03	[]	/o	*	cpe:/o:yamaha:rta54i:4.04.03	cpe:2.3:o:yamaha:rta54i:4.04.03:*:*:*:*:*:*:*	*	*	*	*
1395	rta54i	yamaha	4.04.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.04.05	[]	/o	*	cpe:/o:yamaha:rta54i:4.04.05	cpe:2.3:o:yamaha:rta54i:4.04.05:*:*:*:*:*:*:*	*	*	*	*
1396	rta54i	yamaha	4.04.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.04.08	[]	/o	*	cpe:/o:yamaha:rta54i:4.04.08	cpe:2.3:o:yamaha:rta54i:4.04.08:*:*:*:*:*:*:*	*	*	*	*
1397	rta54i	yamaha	4.05.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA54i 4.05.14	[]	/o	*	cpe:/o:yamaha:rta54i:4.05.14	cpe:2.3:o:yamaha:rta54i:4.05.14:*:*:*:*:*:*:*	*	*	*	*
1398	rta55i	yamaha	4.06.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.28	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.28	cpe:2.3:o:yamaha:rta55i:4.06.28:*:*:*:*:*:*:*	*	*	*	*
1399	rta55i	yamaha	4.06.35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA55i 4.06.35	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.35	cpe:2.3:o:yamaha:rta55i:4.06.35:*:*:*:*:*:*:*	*	*	*	*
1400	rta55i	yamaha	4.06.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTA55i 4.06.47	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.47	cpe:2.3:o:yamaha:rta55i:4.06.47:*:*:*:*:*:*:*	*	*	*	*
1401	rta55i	yamaha	4.06.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA55i 4.06.54	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.54	cpe:2.3:o:yamaha:rta55i:4.06.54:*:*:*:*:*:*:*	*	*	*	*
1402	rta55i	yamaha	4.06.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA55i 4.06.60	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.60	cpe:2.3:o:yamaha:rta55i:4.06.60:*:*:*:*:*:*:*	*	*	*	*
1403	rta55i	yamaha	4.06.67	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTA55i 4.06.67	[]	/o	*	cpe:/o:yamaha:rta55i:4.06.67	cpe:2.3:o:yamaha:rta55i:4.06.67:*:*:*:*:*:*:*	*	*	*	*
1404	rtv700	yamaha	8.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.31	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.31	cpe:2.3:o:yamaha:rtv700:8.00.31:*:*:*:*:*:*:*	*	*	*	*
1405	rtv700	yamaha	8.00.39	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.39	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.39	cpe:2.3:o:yamaha:rtv700:8.00.39:*:*:*:*:*:*:*	*	*	*	*
1406	rtv700	yamaha	8.00.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.45	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.45	cpe:2.3:o:yamaha:rtv700:8.00.45:*:*:*:*:*:*:*	*	*	*	*
1407	rtv700	yamaha	8.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.53	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.53	cpe:2.3:o:yamaha:rtv700:8.00.53:*:*:*:*:*:*:*	*	*	*	*
1408	rtv700	yamaha	8.00.56	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.56	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.56	cpe:2.3:o:yamaha:rtv700:8.00.56:*:*:*:*:*:*:*	*	*	*	*
1409	rtv700	yamaha	8.00.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.60	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.60	cpe:2.3:o:yamaha:rtv700:8.00.60:*:*:*:*:*:*:*	*	*	*	*
1410	rtv700	yamaha	8.00.62	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.62	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.62	cpe:2.3:o:yamaha:rtv700:8.00.62:*:*:*:*:*:*:*	*	*	*	*
1411	rtv700	yamaha	8.00.69	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.69	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.69	cpe:2.3:o:yamaha:rtv700:8.00.69:*:*:*:*:*:*:*	*	*	*	*
1412	rtv700	yamaha	8.00.72	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.72	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.72	cpe:2.3:o:yamaha:rtv700:8.00.72:*:*:*:*:*:*:*	*	*	*	*
1413	rtv700	yamaha	8.00.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.77	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.77	cpe:2.3:o:yamaha:rtv700:8.00.77:*:*:*:*:*:*:*	*	*	*	*
1414	rtv700	yamaha	8.00.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.80	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.80	cpe:2.3:o:yamaha:rtv700:8.00.80:*:*:*:*:*:*:*	*	*	*	*
1415	rtv700	yamaha	8.00.81	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.81	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.81	cpe:2.3:o:yamaha:rtv700:8.00.81:*:*:*:*:*:*:*	*	*	*	*
1416	rtv700	yamaha	8.00.84	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.84	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.84	cpe:2.3:o:yamaha:rtv700:8.00.84:*:*:*:*:*:*:*	*	*	*	*
1417	rtv700	yamaha	8.00.86	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTV700 8.00.86	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.86	cpe:2.3:o:yamaha:rtv700:8.00.86:*:*:*:*:*:*:*	*	*	*	*
1418	rtv700	yamaha	8.00.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTV700 8.00.88	[]	/o	*	cpe:/o:yamaha:rtv700:8.00.88	cpe:2.3:o:yamaha:rtv700:8.00.88:*:*:*:*:*:*:*	*	*	*	*
1419	rtw65b	yamaha	5.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65b 5.03.11	[]	/o	*	cpe:/o:yamaha:rtw65b:5.03.11	cpe:2.3:o:yamaha:rtw65b:5.03.11:*:*:*:*:*:*:*	*	*	*	*
1420	rtw65b	yamaha	5.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65b 5.03.15	[]	/o	*	cpe:/o:yamaha:rtw65b:5.03.15	cpe:2.3:o:yamaha:rtw65b:5.03.15:*:*:*:*:*:*:*	*	*	*	*
1421	rtw65b	yamaha	5.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65b 5.03.25	[]	/o	*	cpe:/o:yamaha:rtw65b:5.03.25	cpe:2.3:o:yamaha:rtw65b:5.03.25:*:*:*:*:*:*:*	*	*	*	*
1422	rtw65i	yamaha	5.03.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65i 5.03.11	[]	/o	*	cpe:/o:yamaha:rtw65i:5.03.11	cpe:2.3:o:yamaha:rtw65i:5.03.11:*:*:*:*:*:*:*	*	*	*	*
1423	rtw65i	yamaha	5.03.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTW65i 5.03.15	[]	/o	*	cpe:/o:yamaha:rtw65i:5.03.15	cpe:2.3:o:yamaha:rtw65i:5.03.15:*:*:*:*:*:*:*	*	*	*	*
1424	rtw65i	yamaha	5.03.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTW65i 5.03.25	[]	/o	*	cpe:/o:yamaha:rtw65i:5.03.25	cpe:2.3:o:yamaha:rtw65i:5.03.25:*:*:*:*:*:*:*	*	*	*	*
1425	rtx1000	yamaha	7.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.14	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.14	cpe:2.3:o:yamaha:rtx1000:7.00.14:*:*:*:*:*:*:*	*	*	*	*
1426	rtx1000	yamaha	7.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.15	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.15	cpe:2.3:o:yamaha:rtx1000:7.00.15:*:*:*:*:*:*:*	*	*	*	*
1427	rtx1000	yamaha	7.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.16	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.16	cpe:2.3:o:yamaha:rtx1000:7.00.16:*:*:*:*:*:*:*	*	*	*	*
1428	rtx1000	yamaha	7.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.00.19	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.19	cpe:2.3:o:yamaha:rtx1000:7.00.19:*:*:*:*:*:*:*	*	*	*	*
1429	rtx1000	yamaha	7.00.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.26	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.26	cpe:2.3:o:yamaha:rtx1000:7.00.26:*:*:*:*:*:*:*	*	*	*	*
1430	rtx1000	yamaha	7.00.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.29	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.29	cpe:2.3:o:yamaha:rtx1000:7.00.29:*:*:*:*:*:*:*	*	*	*	*
1431	rtx1000	yamaha	7.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.00.30	[]	/o	*	cpe:/o:yamaha:rtx1000:7.00.30	cpe:2.3:o:yamaha:rtx1000:7.00.30:*:*:*:*:*:*:*	*	*	*	*
1432	rtx1000	yamaha	7.01.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.04	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.04	cpe:2.3:o:yamaha:rtx1000:7.01.04:*:*:*:*:*:*:*	*	*	*	*
1433	rtx1000	yamaha	7.01.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.05	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.05	cpe:2.3:o:yamaha:rtx1000:7.01.05:*:*:*:*:*:*:*	*	*	*	*
1434	rtx1000	yamaha	7.01.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.08	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.08	cpe:2.3:o:yamaha:rtx1000:7.01.08:*:*:*:*:*:*:*	*	*	*	*
1435	rtx1000	yamaha	7.01.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.15	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.15	cpe:2.3:o:yamaha:rtx1000:7.01.15:*:*:*:*:*:*:*	*	*	*	*
1436	rtx1000	yamaha	7.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.16	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.16	cpe:2.3:o:yamaha:rtx1000:7.01.16:*:*:*:*:*:*:*	*	*	*	*
1437	rtx1000	yamaha	7.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.17	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.17	cpe:2.3:o:yamaha:rtx1000:7.01.17:*:*:*:*:*:*:*	*	*	*	*
1438	rtx1000	yamaha	7.01.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.26	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.26	cpe:2.3:o:yamaha:rtx1000:7.01.26:*:*:*:*:*:*:*	*	*	*	*
1439	rtx1000	yamaha	7.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.29	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.29	cpe:2.3:o:yamaha:rtx1000:7.01.29:*:*:*:*:*:*:*	*	*	*	*
1440	rtx1000	yamaha	7.01.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.34	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.34	cpe:2.3:o:yamaha:rtx1000:7.01.34:*:*:*:*:*:*:*	*	*	*	*
1441	rtx1000	yamaha	7.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.41	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.41	cpe:2.3:o:yamaha:rtx1000:7.01.41:*:*:*:*:*:*:*	*	*	*	*
1442	rtx1000	yamaha	7.01.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.47	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.47	cpe:2.3:o:yamaha:rtx1000:7.01.47:*:*:*:*:*:*:*	*	*	*	*
1443	rtx1000	yamaha	7.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.48	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.48	cpe:2.3:o:yamaha:rtx1000:7.01.48:*:*:*:*:*:*:*	*	*	*	*
1444	rtx1000	yamaha	7.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.49	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.49	cpe:2.3:o:yamaha:rtx1000:7.01.49:*:*:*:*:*:*:*	*	*	*	*
1445	rtx1000	yamaha	7.01.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1000 7.01.53	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.53	cpe:2.3:o:yamaha:rtx1000:7.01.53:*:*:*:*:*:*:*	*	*	*	*
1446	rtx1000	yamaha	7.01.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1000 7.01.54	[]	/o	*	cpe:/o:yamaha:rtx1000:7.01.54	cpe:2.3:o:yamaha:rtx1000:7.01.54:*:*:*:*:*:*:*	*	*	*	*
1447	rtx1100	yamaha	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.06	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.06	cpe:2.3:o:yamaha:rtx1100:8.03.06:*:*:*:*:*:*:*	*	*	*	*
1448	rtx1100	yamaha	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.08	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.08	cpe:2.3:o:yamaha:rtx1100:8.03.08:*:*:*:*:*:*:*	*	*	*	*
1449	rtx1100	yamaha	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.24	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.24	cpe:2.3:o:yamaha:rtx1100:8.03.24:*:*:*:*:*:*:*	*	*	*	*
1450	rtx1100	yamaha	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.26	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.26	cpe:2.3:o:yamaha:rtx1100:8.03.26:*:*:*:*:*:*:*	*	*	*	*
1451	rtx1100	yamaha	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.37	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.37	cpe:2.3:o:yamaha:rtx1100:8.03.37:*:*:*:*:*:*:*	*	*	*	*
1452	rtx1100	yamaha	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.41	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.41	cpe:2.3:o:yamaha:rtx1100:8.03.41:*:*:*:*:*:*:*	*	*	*	*
1453	rtx1100	yamaha	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.42	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.42	cpe:2.3:o:yamaha:rtx1100:8.03.42:*:*:*:*:*:*:*	*	*	*	*
1454	rtx1100	yamaha	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.46	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.46	cpe:2.3:o:yamaha:rtx1100:8.03.46:*:*:*:*:*:*:*	*	*	*	*
1455	rtx1100	yamaha	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.60	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.60	cpe:2.3:o:yamaha:rtx1100:8.03.60:*:*:*:*:*:*:*	*	*	*	*
1456	rtx1100	yamaha	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.61	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.61	cpe:2.3:o:yamaha:rtx1100:8.03.61:*:*:*:*:*:*:*	*	*	*	*
1457	rtx1100	yamaha	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.68	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.68	cpe:2.3:o:yamaha:rtx1100:8.03.68:*:*:*:*:*:*:*	*	*	*	*
1458	rtx1100	yamaha	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.70	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.70	cpe:2.3:o:yamaha:rtx1100:8.03.70:*:*:*:*:*:*:*	*	*	*	*
1459	rtx1100	yamaha	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.75	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.75	cpe:2.3:o:yamaha:rtx1100:8.03.75:*:*:*:*:*:*:*	*	*	*	*
1460	rtx1100	yamaha	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.76	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.76	cpe:2.3:o:yamaha:rtx1100:8.03.76:*:*:*:*:*:*:*	*	*	*	*
1461	rtx1100	yamaha	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.77	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.77	cpe:2.3:o:yamaha:rtx1100:8.03.77:*:*:*:*:*:*:*	*	*	*	*
1462	rtx1100	yamaha	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.78	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.78	cpe:2.3:o:yamaha:rtx1100:8.03.78:*:*:*:*:*:*:*	*	*	*	*
1463	rtx1100	yamaha	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.80	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.80	cpe:2.3:o:yamaha:rtx1100:8.03.80:*:*:*:*:*:*:*	*	*	*	*
1464	rtx1100	yamaha	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.82	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.82	cpe:2.3:o:yamaha:rtx1100:8.03.82:*:*:*:*:*:*:*	*	*	*	*
1465	rtx1100	yamaha	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1100 8.03.83	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.83	cpe:2.3:o:yamaha:rtx1100:8.03.83:*:*:*:*:*:*:*	*	*	*	*
1466	rtx1100	yamaha	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.87	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.87	cpe:2.3:o:yamaha:rtx1100:8.03.87:*:*:*:*:*:*:*	*	*	*	*
1467	rtx1100	yamaha	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.88	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.88	cpe:2.3:o:yamaha:rtx1100:8.03.88:*:*:*:*:*:*:*	*	*	*	*
1468	rtx1100	yamaha	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1100 8.03.90	[]	/o	*	cpe:/o:yamaha:rtx1100:8.03.90	cpe:2.3:o:yamaha:rtx1100:8.03.90:*:*:*:*:*:*:*	*	*	*	*
1469	rtx1200	yamaha	10.01.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1200 10.01.08	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.08	cpe:2.3:o:yamaha:rtx1200:10.01.08:*:*:*:*:*:*:*	*	*	*	*
1470	rtx1200	yamaha	10.01.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1200 10.01.11	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.11	cpe:2.3:o:yamaha:rtx1200:10.01.11:*:*:*:*:*:*:*	*	*	*	*
1471	rtx1200	yamaha	10.01.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1200 10.01.16	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.16	cpe:2.3:o:yamaha:rtx1200:10.01.16:*:*:*:*:*:*:*	*	*	*	*
1472	rtx1200	yamaha	10.01.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.22	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.22	cpe:2.3:o:yamaha:rtx1200:10.01.22:*:*:*:*:*:*:*	*	*	*	*
1473	rtx1200	yamaha	10.01.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1200 10.01.24	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.24	cpe:2.3:o:yamaha:rtx1200:10.01.24:*:*:*:*:*:*:*	*	*	*	*
1474	rtx1200	yamaha	10.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1200 10.01.29	[]	/o	*	cpe:/o:yamaha:rtx1200:10.01.29	cpe:2.3:o:yamaha:rtx1200:10.01.29:*:*:*:*:*:*:*	*	*	*	*
1475	rtx1500	yamaha	8.03.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.06	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.06	cpe:2.3:o:yamaha:rtx1500:8.03.06:*:*:*:*:*:*:*	*	*	*	*
1476	rtx1500	yamaha	8.03.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.08	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.08	cpe:2.3:o:yamaha:rtx1500:8.03.08:*:*:*:*:*:*:*	*	*	*	*
1477	rtx1500	yamaha	8.03.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.24	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.24	cpe:2.3:o:yamaha:rtx1500:8.03.24:*:*:*:*:*:*:*	*	*	*	*
1478	rtx1500	yamaha	8.03.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.26	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.26	cpe:2.3:o:yamaha:rtx1500:8.03.26:*:*:*:*:*:*:*	*	*	*	*
1479	rtx1500	yamaha	8.03.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.37	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.37	cpe:2.3:o:yamaha:rtx1500:8.03.37:*:*:*:*:*:*:*	*	*	*	*
1480	rtx1500	yamaha	8.03.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.41	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.41	cpe:2.3:o:yamaha:rtx1500:8.03.41:*:*:*:*:*:*:*	*	*	*	*
1481	rtx1500	yamaha	8.03.42	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.42	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.42	cpe:2.3:o:yamaha:rtx1500:8.03.42:*:*:*:*:*:*:*	*	*	*	*
1482	rtx1500	yamaha	8.03.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.46	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.46	cpe:2.3:o:yamaha:rtx1500:8.03.46:*:*:*:*:*:*:*	*	*	*	*
1483	rtx1500	yamaha	8.03.60	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.60	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.60	cpe:2.3:o:yamaha:rtx1500:8.03.60:*:*:*:*:*:*:*	*	*	*	*
1484	rtx1500	yamaha	8.03.61	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.61	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.61	cpe:2.3:o:yamaha:rtx1500:8.03.61:*:*:*:*:*:*:*	*	*	*	*
1485	rtx1500	yamaha	8.03.68	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.68	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.68	cpe:2.3:o:yamaha:rtx1500:8.03.68:*:*:*:*:*:*:*	*	*	*	*
1486	rtx1500	yamaha	8.03.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.70	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.70	cpe:2.3:o:yamaha:rtx1500:8.03.70:*:*:*:*:*:*:*	*	*	*	*
1487	rtx1500	yamaha	8.03.75	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.75	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.75	cpe:2.3:o:yamaha:rtx1500:8.03.75:*:*:*:*:*:*:*	*	*	*	*
1704	zabbix	zabbix	1.1	beta2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta2	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta2	cpe:2.3:a:zabbix:zabbix:1.1:beta2:*:*:*:*:*:*	*	*	*	*
1488	rtx1500	yamaha	8.03.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.76	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.76	cpe:2.3:o:yamaha:rtx1500:8.03.76:*:*:*:*:*:*:*	*	*	*	*
1489	rtx1500	yamaha	8.03.77	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.77	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.77	cpe:2.3:o:yamaha:rtx1500:8.03.77:*:*:*:*:*:*:*	*	*	*	*
1490	rtx1500	yamaha	8.03.78	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.78	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.78	cpe:2.3:o:yamaha:rtx1500:8.03.78:*:*:*:*:*:*:*	*	*	*	*
1491	rtx1500	yamaha	8.03.80	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.80	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.80	cpe:2.3:o:yamaha:rtx1500:8.03.80:*:*:*:*:*:*:*	*	*	*	*
1492	rtx1500	yamaha	8.03.82	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.82	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.82	cpe:2.3:o:yamaha:rtx1500:8.03.82:*:*:*:*:*:*:*	*	*	*	*
1493	rtx1500	yamaha	8.03.83	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.83	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.83	cpe:2.3:o:yamaha:rtx1500:8.03.83:*:*:*:*:*:*:*	*	*	*	*
1494	rtx1500	yamaha	8.03.87	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.87	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.87	cpe:2.3:o:yamaha:rtx1500:8.03.87:*:*:*:*:*:*:*	*	*	*	*
1495	rtx1500	yamaha	8.03.88	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX1500 8.03.88	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.88	cpe:2.3:o:yamaha:rtx1500:8.03.88:*:*:*:*:*:*:*	*	*	*	*
1496	rtx1500	yamaha	8.03.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX1500 8.03.90	[]	/o	*	cpe:/o:yamaha:rtx1500:8.03.90	cpe:2.3:o:yamaha:rtx1500:8.03.90:*:*:*:*:*:*:*	*	*	*	*
1497	rtx2000	yamaha	7.00.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.00.14	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.14	cpe:2.3:o:yamaha:rtx2000:7.00.14:*:*:*:*:*:*:*	*	*	*	*
1498	rtx2000	yamaha	7.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.00.15	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.15	cpe:2.3:o:yamaha:rtx2000:7.00.15:*:*:*:*:*:*:*	*	*	*	*
1499	rtx2000	yamaha	7.00.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.16	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.16	cpe:2.3:o:yamaha:rtx2000:7.00.16:*:*:*:*:*:*:*	*	*	*	*
1500	rtx2000	yamaha	7.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.19	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.19	cpe:2.3:o:yamaha:rtx2000:7.00.19:*:*:*:*:*:*:*	*	*	*	*
1501	rtx2000	yamaha	7.00.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.26	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.26	cpe:2.3:o:yamaha:rtx2000:7.00.26:*:*:*:*:*:*:*	*	*	*	*
1502	rtx2000	yamaha	7.00.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.00.29	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.29	cpe:2.3:o:yamaha:rtx2000:7.00.29:*:*:*:*:*:*:*	*	*	*	*
1503	rtx2000	yamaha	7.00.30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.00.30	[]	/o	*	cpe:/o:yamaha:rtx2000:7.00.30	cpe:2.3:o:yamaha:rtx2000:7.00.30:*:*:*:*:*:*:*	*	*	*	*
1504	rtx2000	yamaha	7.01.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.17	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.17	cpe:2.3:o:yamaha:rtx2000:7.01.17:*:*:*:*:*:*:*	*	*	*	*
1505	rtx2000	yamaha	7.01.26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.26	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.26	cpe:2.3:o:yamaha:rtx2000:7.01.26:*:*:*:*:*:*:*	*	*	*	*
1506	rtx2000	yamaha	7.01.29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.29	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.29	cpe:2.3:o:yamaha:rtx2000:7.01.29:*:*:*:*:*:*:*	*	*	*	*
1507	rtx2000	yamaha	7.01.34	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.34	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.34	cpe:2.3:o:yamaha:rtx2000:7.01.34:*:*:*:*:*:*:*	*	*	*	*
1508	rtx2000	yamaha	7.01.41	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.41	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.41	cpe:2.3:o:yamaha:rtx2000:7.01.41:*:*:*:*:*:*:*	*	*	*	*
1509	rtx2000	yamaha	7.01.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.47	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.47	cpe:2.3:o:yamaha:rtx2000:7.01.47:*:*:*:*:*:*:*	*	*	*	*
1510	rtx2000	yamaha	7.01.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.48	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.48	cpe:2.3:o:yamaha:rtx2000:7.01.48:*:*:*:*:*:*:*	*	*	*	*
1511	rtx2000	yamaha	7.01.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.49	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.49	cpe:2.3:o:yamaha:rtx2000:7.01.49:*:*:*:*:*:*:*	*	*	*	*
1512	rtx2000	yamaha	7.01.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX2000 7.01.53	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.53	cpe:2.3:o:yamaha:rtx2000:7.01.53:*:*:*:*:*:*:*	*	*	*	*
1513	rtx2000	yamaha	7.01.54	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX2000 7.01.54	[]	/o	*	cpe:/o:yamaha:rtx2000:7.01.54	cpe:2.3:o:yamaha:rtx2000:7.01.54:*:*:*:*:*:*:*	*	*	*	*
1514	rtx3000	yamaha	9.00.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.15	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.15	cpe:2.3:o:yamaha:rtx3000:9.00.15:*:*:*:*:*:*:*	*	*	*	*
1515	rtx3000	yamaha	9.00.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.20	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.20	cpe:2.3:o:yamaha:rtx3000:9.00.20:*:*:*:*:*:*:*	*	*	*	*
1516	rtx3000	yamaha	9.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.22	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.22	cpe:2.3:o:yamaha:rtx3000:9.00.22:*:*:*:*:*:*:*	*	*	*	*
1517	rtx3000	yamaha	9.00.24	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.24	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.24	cpe:2.3:o:yamaha:rtx3000:9.00.24:*:*:*:*:*:*:*	*	*	*	*
1518	rtx3000	yamaha	9.00.25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.25	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.25	cpe:2.3:o:yamaha:rtx3000:9.00.25:*:*:*:*:*:*:*	*	*	*	*
1519	rtx3000	yamaha	9.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.31	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.31	cpe:2.3:o:yamaha:rtx3000:9.00.31:*:*:*:*:*:*:*	*	*	*	*
1520	rtx3000	yamaha	9.00.37	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.37	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.37	cpe:2.3:o:yamaha:rtx3000:9.00.37:*:*:*:*:*:*:*	*	*	*	*
1521	rtx3000	yamaha	9.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.40	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.40	cpe:2.3:o:yamaha:rtx3000:9.00.40:*:*:*:*:*:*:*	*	*	*	*
1522	rtx3000	yamaha	9.00.43	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha RTX3000 9.00.43	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.43	cpe:2.3:o:yamaha:rtx3000:9.00.43:*:*:*:*:*:*:*	*	*	*	*
1523	rtx3000	yamaha	9.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.44	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.44	cpe:2.3:o:yamaha:rtx3000:9.00.44:*:*:*:*:*:*:*	*	*	*	*
1524	rtx3000	yamaha	9.00.47	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.47	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.47	cpe:2.3:o:yamaha:rtx3000:9.00.47:*:*:*:*:*:*:*	*	*	*	*
1525	rtx3000	yamaha	9.00.48	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ RTX3000 9.00.48	[]	/o	*	cpe:/o:yamaha:rtx3000:9.00.48	cpe:2.3:o:yamaha:rtx3000:9.00.48:*:*:*:*:*:*:*	*	*	*	*
1526	srt100	yamaha	10.00.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.09	[]	/o	*	cpe:/o:yamaha:srt100:10.00.09	cpe:2.3:o:yamaha:srt100:10.00.09:*:*:*:*:*:*:*	*	*	*	*
1527	srt100	yamaha	10.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.19	[]	/o	*	cpe:/o:yamaha:srt100:10.00.19	cpe:2.3:o:yamaha:srt100:10.00.19:*:*:*:*:*:*:*	*	*	*	*
1528	srt100	yamaha	10.00.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.21	[]	/o	*	cpe:/o:yamaha:srt100:10.00.21	cpe:2.3:o:yamaha:srt100:10.00.21:*:*:*:*:*:*:*	*	*	*	*
1529	srt100	yamaha	10.00.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.22	[]	/o	*	cpe:/o:yamaha:srt100:10.00.22	cpe:2.3:o:yamaha:srt100:10.00.22:*:*:*:*:*:*:*	*	*	*	*
1530	srt100	yamaha	10.00.27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.27	[]	/o	*	cpe:/o:yamaha:srt100:10.00.27	cpe:2.3:o:yamaha:srt100:10.00.27:*:*:*:*:*:*:*	*	*	*	*
1531	srt100	yamaha	10.00.28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.28	[]	/o	*	cpe:/o:yamaha:srt100:10.00.28	cpe:2.3:o:yamaha:srt100:10.00.28:*:*:*:*:*:*:*	*	*	*	*
1532	srt100	yamaha	10.00.31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.31	[]	/o	*	cpe:/o:yamaha:srt100:10.00.31	cpe:2.3:o:yamaha:srt100:10.00.31:*:*:*:*:*:*:*	*	*	*	*
1533	srt100	yamaha	10.00.38	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.38	[]	/o	*	cpe:/o:yamaha:srt100:10.00.38	cpe:2.3:o:yamaha:srt100:10.00.38:*:*:*:*:*:*:*	*	*	*	*
1534	srt100	yamaha	10.00.40	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.40	[]	/o	*	cpe:/o:yamaha:srt100:10.00.40	cpe:2.3:o:yamaha:srt100:10.00.40:*:*:*:*:*:*:*	*	*	*	*
1535	srt100	yamaha	10.00.44	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.44	[]	/o	*	cpe:/o:yamaha:srt100:10.00.44	cpe:2.3:o:yamaha:srt100:10.00.44:*:*:*:*:*:*:*	*	*	*	*
1536	srt100	yamaha	10.00.46	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yamaha SRT100 10.00.46	[]	/o	*	cpe:/o:yamaha:srt100:10.00.46	cpe:2.3:o:yamaha:srt100:10.00.46:*:*:*:*:*:*:*	*	*	*	*
1537	srt100	yamaha	10.00.49	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.49	[]	/o	*	cpe:/o:yamaha:srt100:10.00.49	cpe:2.3:o:yamaha:srt100:10.00.49:*:*:*:*:*:*:*	*	*	*	*
1538	srt100	yamaha	10.00.52	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.52	[]	/o	*	cpe:/o:yamaha:srt100:10.00.52	cpe:2.3:o:yamaha:srt100:10.00.52:*:*:*:*:*:*:*	*	*	*	*
1539	srt100	yamaha	10.00.53	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.53	[]	/o	*	cpe:/o:yamaha:srt100:10.00.53	cpe:2.3:o:yamaha:srt100:10.00.53:*:*:*:*:*:*:*	*	*	*	*
1540	srt100	yamaha	10.00.56	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヤマハ SRT100 10.00.56	[]	/o	*	cpe:/o:yamaha:srt100:10.00.56	cpe:2.3:o:yamaha:srt100:10.00.56:*:*:*:*:*:*:*	*	*	*	*
1541	linkchecker	yaml-fuer-drupal	6.x-2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.0	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.0	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.0:*:*:*:*:*:*:*	*	*	*	*
1542	linkchecker	yaml-fuer-drupal	6.x-2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.1	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.1	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.1:*:*:*:*:*:*:*	*	*	*	*
1543	linkchecker	yaml-fuer-drupal	6.x-2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.2	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.2	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.2:*:*:*:*:*:*:*	*	*	*	*
1544	linkchecker	yaml-fuer-drupal	6.x-2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.3	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.3	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.3:*:*:*:*:*:*:*	*	*	*	*
1545	linkchecker	yaml-fuer-drupal	6.x-2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.4	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.4	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.4:*:*:*:*:*:*:*	*	*	*	*
1546	linkchecker	yaml-fuer-drupal	6.x-2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.5	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.5	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.5:*:*:*:*:*:*:*	*	*	*	*
1547	linkchecker	yaml-fuer-drupal	6.x-2.x	dev	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaml-fuer-drupal linkchecker 6.x-2.x dev	[]	/a	*	cpe:/a:yaml-fuer-drupal:linkchecker:6.x-2.x:dev	cpe:2.3:a:yaml-fuer-drupal:linkchecker:6.x-2.x:dev:*:*:*:*:*:*	*	*	*	*
1548	yandex_metrics	yandex.metrics_project	6.x-1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.0	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.0	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.0:*:*:*:*:*:*:*	*	*	*	*
1549	yandex_metrics	yandex.metrics_project	6.x-1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.1	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.1	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.1:*:*:*:*:*:*:*	*	*	*	*
1550	yandex_metrics	yandex.metrics_project	6.x-1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.2	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.2	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.2:*:*:*:*:*:*:*	*	*	*	*
1551	yandex_metrics	yandex.metrics_project	6.x-1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.3	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.3	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.3:*:*:*:*:*:*:*	*	*	*	*
1552	yandex_metrics	yandex.metrics_project	6.x-1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.4	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.4	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.4:*:*:*:*:*:*:*	*	*	*	*
1553	yandex_metrics	yandex.metrics_project	6.x-1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.5	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.5	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.5:*:*:*:*:*:*:*	*	*	*	*
1554	yandex_metrics	yandex.metrics_project	6.x-1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.6	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.6	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.6:*:*:*:*:*:*:*	*	*	*	*
1555	yandex_metrics	yandex.metrics_project	6.x-1.x	dev	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 6.x-1.x-dev	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:6.x-1.x:dev	cpe:2.3:a:yandex.metrics_project:yandex_metrics:6.x-1.x:dev:*:*:*:*:*:*	*	*	*	*
1556	yandex_metrics	yandex.metrics_project	7.x-1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.0	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.0	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.0:*:*:*:*:*:*:*	*	*	*	*
1557	yandex_metrics	yandex.metrics_project	7.x-1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.1	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.1	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.1:*:*:*:*:*:*:*	*	*	*	*
1558	yandex_metrics	yandex.metrics_project	7.x-1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.2	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.2	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.2:*:*:*:*:*:*:*	*	*	*	*
1559	yandex_metrics	yandex.metrics_project	7.x-1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.3	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.3	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.3:*:*:*:*:*:*:*	*	*	*	*
1560	yandex_metrics	yandex.metrics_project	7.x-1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.4	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.4	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.4:*:*:*:*:*:*:*	*	*	*	*
1561	yandex_metrics	yandex.metrics_project	7.x-1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.5	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.5	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.5:*:*:*:*:*:*:*	*	*	*	*
1562	yandex_metrics	yandex.metrics_project	7.x-1.x	dev	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yandex.Metrics Project Yandex.Metrics (yandex_metrics) module 7.x-1.x-dev	[]	/a	*	cpe:/a:yandex.metrics_project:yandex_metrics:7.x-1.x:dev	cpe:2.3:a:yandex.metrics_project:yandex_metrics:7.x-1.x:dev:*:*:*:*:*:*	*	*	*	*
1563	yard_radius	yard_radius	1.0.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yard RADIUS Yard RADIUS 1.0.16	[]	/a	*	cpe:/a:yard_radius:yard_radius:1.0.16	cpe:2.3:a:yard_radius:yard_radius:1.0.16:*:*:*:*:*:*:*	*	*	*	*
1564	yard_radius	yard_radius_project	1.0.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yard RADIUS Project Yard RADIUS 1.0.16	[{"The YardRadius Project ":"http://yardradius.sourceforge.net/"}]	/a	*	cpe:/a:yard_radius_project:yard_radius:1.0.16	cpe:2.3:a:yard_radius_project:yard_radius:1.0.16:*:*:*:*:*:*:*	*	*	*	*
1565	yard_radius	yard_radius_project	1.1.2-4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yard RADIUS Project Yard RADIUS 1.1.2-4	[{"The YardRadius Project ":"http://yardradius.sourceforge.net/"}]	/a	*	cpe:/a:yard_radius_project:yard_radius:1.1.2-4	cpe:2.3:a:yard_radius_project:yard_radius:1.1.2-4:*:*:*:*:*:*:*	*	*	*	*
1566	cyassl	yassl	2.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 2.5.0	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.5.0	cpe:2.3:a:yassl:cyassl:2.5.0:*:*:*:*:*:*:*	*	*	*	*
1567	cyassl	yassl	2.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 2.6.0	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.6.0	cpe:2.3:a:yassl:cyassl:2.6.0:*:*:*:*:*:*:*	*	*	*	*
1568	cyassl	yassl	2.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 0.7.0	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.7.0	cpe:2.3:a:yassl:cyassl:2.7.0:*:*:*:*:*:*:*	*	*	*	*
1569	cyassl	yassl	2.8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 2.8.0	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.8.0	cpe:2.3:a:yassl:cyassl:2.8.0:*:*:*:*:*:*:*	*	*	*	*
1570	cyassl	yassl	2.9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 2.9.0	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.9.0	cpe:2.3:a:yassl:cyassl:2.9.0:*:*:*:*:*:*:*	*	*	*	*
1571	cyassl	yassl	2.9.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yaSSL CyaSSL 2.9.4	[{"changelog":"http://www.wolfssl.com/yaSSL/Docs-cyassl-changelog.html"}]	/a	*	cpe:/a:yassl:cyassl:2.9.4	cpe:2.3:a:yassl:cyassl:2.9.4:*:*:*:*:*:*:*	*	*	*	*
1572	sip-t38g	yealink	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yealink IP Phone SIP-T38G	[{"Yealink IP Phone SIP-T38G":"http://www.yealink.com/product_info.aspx?ProductsCateID=182"}]	/h	*	cpe:/h:yealink:sip-t38g:-	cpe:2.3:h:yealink:sip-t38g:-:*:*:*:*:*:*:*	*	*	*	*
1573	voip_phone	yealink	28.2.0.128.0.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yealink VOIP phone 28.2.0.128.0.0.0	[{"vendor product information":"http://www.yealink.com/Companyprofile.aspx"}]	/h	*	cpe:/h:yealink:voip_phone:28.2.0.128.0.0.0	cpe:2.3:h:yealink:voip_phone:28.2.0.128.0.0.0:*:*:*:*:*:*:*	*	*	*	*
1574	voip_phone_firmware	yealink	28.72.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yealink VOIP phone firmware 28.72.0.2	[{"vendor product information":"http://www.yealink.com/Companyprofile.aspx"}]	/o	*	cpe:/o:yealink:voip_phone_firmware:28.72.0.2	cpe:2.3:o:yealink:voip_phone_firmware:28.72.0.2:*:*:*:*:*:*:*	*	*	*	*
1575	yeast_infection	yeast_infection_project	0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yeast Infection project Yeast Infection (aka com.wyeastinfectionapp) for android 0.1	[{"Product information":"https://play.google.com/store/apps/details?id=com.wyeastinfectionapp"},{"Government Advisory":"https://docs.google.com/spreadsheets/d/1t5GXwjw82SyunALVJb2w0zi3FoLRIkfGPc7AMjRF0r4/edit?pli=1#gid=1053404143"}]	/a	*	cpe:/a:yeast_infection_project:yeast_infection:0.1::~~~android~~	cpe:2.3:a:yeast_infection_project:yeast_infection:0.1:*:*:*:*:android:*:*	*	*	*	*
1576	yellow_pages_local_search	yellowbook	11.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yellowbook Yellow Pages Local Search (aka com.yellowbook.android2) for Android 11.0.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.yellowbook.android2"},{"Vendor website":"http://www.yellowbook.com/"}]	/a	*	cpe:/a:yellowbook:yellow_pages_local_search:11.0.0	cpe:2.3:a:yellowbook:yellow_pages_local_search:11.0.0:*:*:*:*:*:*:*	*	*	*	*
1577	yiiframework	yiiframework	1.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.0	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.0	cpe:2.3:a:yiiframework:yiiframework:1.1.0:*:*:*:*:*:*:*	*	*	*	*
1578	yiiframework	yiiframework	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.1	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.1	cpe:2.3:a:yiiframework:yiiframework:1.1.1:*:*:*:*:*:*:*	*	*	*	*
1579	yiiframework	yiiframework	1.1.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.10	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.10	cpe:2.3:a:yiiframework:yiiframework:1.1.10:*:*:*:*:*:*:*	*	*	*	*
1580	yiiframework	yiiframework	1.1.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.11	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.11	cpe:2.3:a:yiiframework:yiiframework:1.1.11:*:*:*:*:*:*:*	*	*	*	*
1581	yiiframework	yiiframework	1.1.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.13	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.13	cpe:2.3:a:yiiframework:yiiframework:1.1.13:*:*:*:*:*:*:*	*	*	*	*
1582	yiiframework	yiiframework	1.1.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.14	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.14	cpe:2.3:a:yiiframework:yiiframework:1.1.14:*:*:*:*:*:*:*	*	*	*	*
1583	yiiframework	yiiframework	1.1.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.15	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.15	cpe:2.3:a:yiiframework:yiiframework:1.1.15:*:*:*:*:*:*:*	*	*	*	*
1705	zabbix	zabbix	1.1	beta3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta3	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta3	cpe:2.3:a:zabbix:zabbix:1.1:beta3:*:*:*:*:*:*	*	*	*	*
1584	yiiframework	yiiframework	1.1.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.16	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.16	cpe:2.3:a:yiiframework:yiiframework:1.1.16:*:*:*:*:*:*:*	*	*	*	*
1585	yiiframework	yiiframework	1.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.2	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.2	cpe:2.3:a:yiiframework:yiiframework:1.1.2:*:*:*:*:*:*:*	*	*	*	*
1586	yiiframework	yiiframework	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.3	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.3	cpe:2.3:a:yiiframework:yiiframework:1.1.3:*:*:*:*:*:*:*	*	*	*	*
1587	yiiframework	yiiframework	1.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.4	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.4	cpe:2.3:a:yiiframework:yiiframework:1.1.4:*:*:*:*:*:*:*	*	*	*	*
1588	yiiframework	yiiframework	1.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.5	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.5	cpe:2.3:a:yiiframework:yiiframework:1.1.5:*:*:*:*:*:*:*	*	*	*	*
1589	yiiframework	yiiframework	1.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.6	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.6	cpe:2.3:a:yiiframework:yiiframework:1.1.6:*:*:*:*:*:*:*	*	*	*	*
1590	yiiframework	yiiframework	1.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.7	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.7	cpe:2.3:a:yiiframework:yiiframework:1.1.7:*:*:*:*:*:*:*	*	*	*	*
1591	yiiframework	yiiframework	1.1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.8	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.8	cpe:2.3:a:yiiframework:yiiframework:1.1.8:*:*:*:*:*:*:*	*	*	*	*
1592	yiiframework	yiiframework	1.1.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 1.1.9	[{"changelog":"https://github.com/yiisoft/yii/blob/master/CHANGELOG"}]	/a	*	cpe:/a:yiiframework:yiiframework:1.1.9	cpe:2.3:a:yiiframework:yiiframework:1.1.9:*:*:*:*:*:*:*	*	*	*	*
1593	yiiframework	yiiframework	2.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yii Framework 2.0.3	[{"Product Version Information":"https://github.com/yiisoft/yii2/releases"},{"Vendor Website":"http://www.yiiframework.com/"}]	/a	*	cpe:/a:yiiframework:yiiframework:2.0.3	cpe:2.3:a:yiiframework:yiiframework:2.0.3:*:*:*:*:*:*:*	*	*	*	*
1594	yik_yak	yikyakapp	2.0.002	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yikyakapp Yik Yak (aka com.yik.yak) for android 2.0.002	[{"Product information":"https://play.google.com/store/apps/details?id=com.yik.yak"},{"Vendor website":"http://yikyakapp.com"}]	/a	*	cpe:/a:yikyakapp:yik_yak:2.0.002::~~~android~~	cpe:2.3:a:yikyakapp:yik_yak:2.0.002:*:*:*:*:android:*:*	*	*	*	*
1595	wordpress_seo	yoast	1.5.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.5.6	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.5.6::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.5.6:*:*:*:*:wordpress:*:*	*	*	*	*
1596	wordpress_seo	yoast	1.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.6.0	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.6.0::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.6.0:*:*:*:*:wordpress:*:*	*	*	*	*
1597	wordpress_seo	yoast	1.6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.6.1	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.6.1::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.6.1:*:*:*:*:wordpress:*:*	*	*	*	*
1598	wordpress_seo	yoast	1.6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.6.2	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.6.2::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.6.2:*:*:*:*:wordpress:*:*	*	*	*	*
1599	wordpress_seo	yoast	1.6.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.6.3	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.6.3::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.6.3:*:*:*:*:wordpress:*:*	*	*	*	*
1600	wordpress_seo	yoast	1.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.1	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.1::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.1:*:*:*:*:wordpress:*:*	*	*	*	*
1601	wordpress_seo	yoast	1.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.2	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.2::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.2:*:*:*:*:wordpress:*:*	*	*	*	*
1602	wordpress_seo	yoast	1.7.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.3	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.3::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.3:*:*:*:*:wordpress:*:*	*	*	*	*
1603	wordpress_seo	yoast	1.7.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.3.1	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.3.1::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.3.1:*:*:*:*:wordpress:*:*	*	*	*	*
1604	wordpress_seo	yoast	1.7.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.3.2	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.3.2::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.3.2:*:*:*:*:wordpress:*:*	*	*	*	*
1605	wordpress_seo	yoast	1.7.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 1.7.3.3	[{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"},{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"}]	/a	*	cpe:/a:yoast:wordpress_seo:1.7.3.3::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:1.7.3.3:*:*:*:*:wordpress:*:*	*	*	*	*
1706	zabbix	zabbix	1.1	beta4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta4	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta4	cpe:2.3:a:zabbix:zabbix:1.1:beta4:*:*:*:*:*:*	*	*	*	*
1606	wordpress_seo	yoast	2.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yoast WordPress SEO for WordPress 2.1.1	[{"Vendor website":"https://yoast.com/wordpress/plugins/seo/"},{"Product changelog":"https://wordpress.org/plugins/wordpress-seo/changelog/"}]	/a	*	cpe:/a:yoast:wordpress_seo:2.1.1::~~~wordpress~~	cpe:2.3:a:yoast:wordpress_seo:2.1.1:*:*:*:*:wordpress:*:*	*	*	*	*
1607	yodobashi	yodobashi	1.2.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ヨドバシカメラ ヨドバシ for Android 1.2.1.0	[{"Product Information":"https://play.google.com/store/apps/details?id=com.yodobashi.iShop"},{"Vendor Website":"http://www.yodobashi.com/"}]	/a	*	cpe:/a:yodobashi:yodobashi:1.2.1.0::~~~android~~	cpe:2.3:a:yodobashi:yodobashi:1.2.1.0:*:*:*:*:android:*:*	*	*	*	*
1608	yodobashi	yodobashi	1.4.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yodobashi Camera Yodobashi for Android 1.4.4	[{"Product Information":"https://play.google.com/store/apps/details?id=com.yodobashi.iShop"},{"Vendor Website":"http://www.yodobashi.com/"}]	/a	*	cpe:/a:yodobashi:yodobashi:1.4.4::~~~android~~	cpe:2.3:a:yodobashi:yodobashi:1.4.4:*:*:*:*:android:*:*	*	*	*	*
1609	aaasuite	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa AAAsuite	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:aaasuite:-	cpe:2.3:h:yokogawa:aaasuite:-:*:*:*:*:*:*:*	*	*	*	*
1610	b/m9000_vp	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa B/FM9000 VP	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:b%2fm9000_vp:-	cpe:2.3:h:yokogawa:b\\/m9000_vp:-:*:*:*:*:*:*:*	*	*	*	*
1611	b/m9000_vp_software	yokogawa	7.03.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa B/FM9000 VP software 7.03.01	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:b%2fm9000_vp_software:7.03.01	cpe:2.3:a:yokogawa:b\\/m9000_vp_software:7.03.01:*:*:*:*:*:*:*	*	*	*	*
1612	b/m9000cs	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa B/FM9000CS	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:b%2fm9000cs:-	cpe:2.3:h:yokogawa:b\\/m9000cs:-:*:*:*:*:*:*:*	*	*	*	*
1613	b/m9000cs_software	yokogawa	5.05.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa B/FM9000CS software 5.05.01	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:b%2fm9000cs_software:5.05.01	cpe:2.3:a:yokogawa:b\\/m9000cs_software:5.05.01:*:*:*:*:*:*:*	*	*	*	*
1614	centum_cs_1000	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 1000	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_cs_1000:-	cpe:2.3:h:yokogawa:centum_cs_1000:-:*:*:*:*:*:*:*	*	*	*	*
1615	centum_cs_1000_software	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 1000 software	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_cs_1000_software:-	cpe:2.3:a:yokogawa:centum_cs_1000_software:-:*:*:*:*:*:*:*	*	*	*	*
1616	centum_cs_3000	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 3000	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_cs_3000:-	cpe:2.3:h:yokogawa:centum_cs_3000:-:*:*:*:*:*:*:*	*	*	*	*
1617	centum_cs_3000	yokogawa	r3.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.01	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.01	cpe:2.3:a:yokogawa:centum_cs_3000:r3.01:*:*:*:*:*:*:*	*	*	*	*
1618	centum_cs_3000	yokogawa	r3.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.02	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.02	cpe:2.3:a:yokogawa:centum_cs_3000:r3.02:*:*:*:*:*:*:*	*	*	*	*
1619	centum_cs_3000	yokogawa	r3.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.03	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.03	cpe:2.3:a:yokogawa:centum_cs_3000:r3.03:*:*:*:*:*:*:*	*	*	*	*
1620	centum_cs_3000	yokogawa	r3.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.04	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.04	cpe:2.3:a:yokogawa:centum_cs_3000:r3.04:*:*:*:*:*:*:*	*	*	*	*
1621	centum_cs_3000	yokogawa	r3.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.05	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.05	cpe:2.3:a:yokogawa:centum_cs_3000:r3.05:*:*:*:*:*:*:*	*	*	*	*
1622	centum_cs_3000	yokogawa	r3.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.06	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.06	cpe:2.3:a:yokogawa:centum_cs_3000:r3.06:*:*:*:*:*:*:*	*	*	*	*
1623	centum_cs_3000	yokogawa	r3.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.07	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.07	cpe:2.3:a:yokogawa:centum_cs_3000:r3.07:*:*:*:*:*:*:*	*	*	*	*
1624	centum_cs_3000	yokogawa	r3.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.08	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.08	cpe:2.3:a:yokogawa:centum_cs_3000:r3.08:*:*:*:*:*:*:*	*	*	*	*
1625	centum_cs_3000	yokogawa	r3.08.50	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.08.50	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.08.50	cpe:2.3:a:yokogawa:centum_cs_3000:r3.08.50:*:*:*:*:*:*:*	*	*	*	*
1626	centum_cs_3000	yokogawa	r3.08.70	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.08.70	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.08.70	cpe:2.3:a:yokogawa:centum_cs_3000:r3.08.70:*:*:*:*:*:*:*	*	*	*	*
1627	centum_cs_3000	yokogawa	r3.09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.09	[{"Vendor releases":"http://www.yokogawa.com/dcs/release/cs3000/dcs-rl-3k-list-en.htm"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.09	cpe:2.3:a:yokogawa:centum_cs_3000:r3.09:*:*:*:*:*:*:*	*	*	*	*
1628	centum_cs_3000	yokogawa	r3.09.50	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.09.50	[{"Vendor advisory":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.09.50	cpe:2.3:a:yokogawa:centum_cs_3000:r3.09.50:*:*:*:*:*:*:*	*	*	*	*
1629	centum_cs_3000	yokogawa	r3.09.76	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa CENTUM CS 3000 R3.09.76	[{"Vendor advisory":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000:r3.09.76	cpe:2.3:a:yokogawa:centum_cs_3000:r3.09.76:*:*:*:*:*:*:*	*	*	*	*
1630	centum_cs_3000_entry_class	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 3000 Entry Class	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_cs_3000_entry_class:-	cpe:2.3:h:yokogawa:centum_cs_3000_entry_class:-:*:*:*:*:*:*:*	*	*	*	*
1631	centum_cs_3000_entry_class_software	yokogawa	3.09.50	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 3000 entry class software 3.09.50	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000_entry_class_software:3.09.50	cpe:2.3:a:yokogawa:centum_cs_3000_entry_class_software:3.09.50:*:*:*:*:*:*:*	*	*	*	*
1632	centum_cs_3000_software	yokogawa	2.23.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum CS 3000 software 2.23.00	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_cs_3000_software:2.23.00	cpe:2.3:a:yokogawa:centum_cs_3000_software:2.23.00:*:*:*:*:*:*:*	*	*	*	*
1633	centum_event_viewer_package	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum Event Viewer Package	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_event_viewer_package:-	cpe:2.3:h:yokogawa:centum_event_viewer_package:-:*:*:*:*:*:*:*	*	*	*	*
1634	centum_long-term_trend_historian	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum Long-Term Trend Historian	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_long-term_trend_historian:-	cpe:2.3:h:yokogawa:centum_long-term_trend_historian:-:*:*:*:*:*:*:*	*	*	*	*
1635	centum_vp	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_vp:-	cpe:2.3:h:yokogawa:centum_vp:-:*:*:*:*:*:*:*	*	*	*	*
1636	centum_vp	yokogawa	r4.03.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP R4.03.00	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:centum_vp:r4.03.00	cpe:2.3:a:yokogawa:centum_vp:r4.03.00:*:*:*:*:*:*:*	*	*	*	*
1637	centum_vp	yokogawa	r5.01.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP R5.01.00	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:centum_vp:r5.01.00	cpe:2.3:a:yokogawa:centum_vp:r5.01.00:*:*:*:*:*:*:*	*	*	*	*
1638	centum_vp	yokogawa	r5.01.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP R5.01.20	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:centum_vp:r5.01.20	cpe:2.3:a:yokogawa:centum_vp:r5.01.20:*:*:*:*:*:*:*	*	*	*	*
1639	centum_vp	yokogawa	r5.02.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP R5.02.00	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:centum_vp:r5.02.00	cpe:2.3:a:yokogawa:centum_vp:r5.02.00:*:*:*:*:*:*:*	*	*	*	*
1640	centum_vp	yokogawa	r5.03.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP R5.03.00	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:centum_vp:r5.03.00	cpe:2.3:a:yokogawa:centum_vp:r5.03.00:*:*:*:*:*:*:*	*	*	*	*
1641	centum_vp_entry_class	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP Entry Class	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:centum_vp_entry_class:-	cpe:2.3:h:yokogawa:centum_vp_entry_class:-:*:*:*:*:*:*:*	*	*	*	*
1642	centum_vp_entry_class_software	yokogawa	5.03.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP Entry class software 5.03.00	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_vp_entry_class_software:5.03.00	cpe:2.3:a:yokogawa:centum_vp_entry_class_software:5.03.00:*:*:*:*:*:*:*	*	*	*	*
1643	centum_vp_software	yokogawa	4.03.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP software 4.03.00	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_vp_software:4.03.00	cpe:2.3:a:yokogawa:centum_vp_software:4.03.00:*:*:*:*:*:*:*	*	*	*	*
1644	centum_vp_software	yokogawa	5.03.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Centum VP software 5.03.20	[{"vendor security advisory YSAR-14-0002E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0002E.pdf"}]	/a	*	cpe:/a:yokogawa:centum_vp_software:5.03.20	cpe:2.3:a:yokogawa:centum_vp_software:5.03.20:*:*:*:*:*:*:*	*	*	*	*
1645	daqopc	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa DAQOPC	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:daqopc:-	cpe:2.3:h:yokogawa:daqopc:-:*:*:*:*:*:*:*	*	*	*	*
1646	daqopc_for_darwin	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa DAQOPC for DARWIN	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:daqopc_for_darwin:-	cpe:2.3:h:yokogawa:daqopc_for_darwin:-:*:*:*:*:*:*:*	*	*	*	*
1647	ejxmvtool	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa EJXMVTool	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:ejxmvtool:-	cpe:2.3:h:yokogawa:ejxmvtool:-:*:*:*:*:*:*:*	*	*	*	*
1648	exaopc	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaopc 	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/h	*	cpe:/h:yokogawa:exaopc:-	cpe:2.3:h:yokogawa:exaopc:-:*:*:*:*:*:*:*	*	*	*	*
1649	exaopc	yokogawa	3.71.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaopc 3.71.02	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/a	*	cpe:/a:yokogawa:exaopc:3.71.02	cpe:2.3:a:yokogawa:exaopc:3.71.02:*:*:*:*:*:*:*	*	*	*	*
1650	exaopc	yokogawa	3.71.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaopc 3.71.10	[{"Vendor website":"http://www.yokogawa.com/dcs/products/dcs-product-index-en.htm?nid=left"}]	/a	*	cpe:/a:yokogawa:exaopc:3.71.10	cpe:2.3:a:yokogawa:exaopc:3.71.10:*:*:*:*:*:*:*	*	*	*	*
1651	exaopc	yokogawa	3.72.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaopc 3.72.00	[{"vendor security advisory YSAR-14-0002E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0002E.pdf"}]	/a	*	cpe:/a:yokogawa:exaopc:3.72.00	cpe:2.3:a:yokogawa:exaopc:3.72.00:*:*:*:*:*:*:*	*	*	*	*
1652	exaplog	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaplog	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:exaplog:-	cpe:2.3:h:yokogawa:exaplog:-:*:*:*:*:*:*:*	*	*	*	*
1653	exaquantum	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaquantum	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:exaquantum:-	cpe:2.3:h:yokogawa:exaquantum:-:*:*:*:*:*:*:*	*	*	*	*
2785	jdk	sun	1.5.0	update24		\N	2018-05-31 16:59:57.507328	2018-05-31 16:59:57.507328	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update24	\N	\N	\N	\N	\N
1654	exaquantum/batch	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exaquantum/Batch	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:exaquantum%2fbatch:-	cpe:2.3:h:yokogawa:exaquantum\\/batch:-:*:*:*:*:*:*:*	*	*	*	*
1655	exarqe	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exarqe	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:exarqe:-	cpe:2.3:h:yokogawa:exarqe:-:*:*:*:*:*:*:*	*	*	*	*
1656	exasmoc	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Exasmoc	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:exasmoc:-	cpe:2.3:h:yokogawa:exasmoc:-:*:*:*:*:*:*:*	*	*	*	*
1657	fast/tools	yokogawa	r9.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fast/Tools R9.01	[{"Vendor website":"http://www.yokogawa.co.jp/index.htm"}]	/a	*	cpe:/a:yokogawa:fast%2ftools:r9.01	cpe:2.3:a:yokogawa:fast\\/tools:r9.01:*:*:*:*:*:*:*	*	*	*	*
1658	fast/tools	yokogawa	r9.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fast/Tools R9.02	[{"Vendor website":"http://www.yokogawa.co.jp/index.htm"}]	/a	*	cpe:/a:yokogawa:fast%2ftools:r9.02	cpe:2.3:a:yokogawa:fast\\/tools:r9.02:*:*:*:*:*:*:*	*	*	*	*
1659	fast/tools	yokogawa	r9.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fast/Tools R9.03	[{"Vendor website":"http://www.yokogawa.co.jp/index.htm"}]	/a	*	cpe:/a:yokogawa:fast%2ftools:r9.03	cpe:2.3:a:yokogawa:fast\\/tools:r9.03:*:*:*:*:*:*:*	*	*	*	*
1660	fast/tools	yokogawa	r9.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fast/Tools R9.04	[{"Vendor website":"http://www.yokogawa.co.jp/index.htm"}]	/a	*	cpe:/a:yokogawa:fast%2ftools:r9.04	cpe:2.3:a:yokogawa:fast\\/tools:r9.04:*:*:*:*:*:*:*	*	*	*	*
1661	fast/tools	yokogawa	r9.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fast/Tools R9.05	[{"Vendor website":"http://www.yokogawa.co.jp/index.htm"}]	/a	*	cpe:/a:yokogawa:fast%2ftools:r9.05	cpe:2.3:a:yokogawa:fast\\/tools:r9.05:*:*:*:*:*:*:*	*	*	*	*
1662	field_wireless_device_opc_server	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Field Wireless Device OPC Server	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:field_wireless_device_opc_server:-	cpe:2.3:h:yokogawa:field_wireless_device_opc_server:-:*:*:*:*:*:*:*	*	*	*	*
1663	fieldmate	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Fieldmate	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:fieldmate:-	cpe:2.3:h:yokogawa:fieldmate:-:*:*:*:*:*:*:*	*	*	*	*
1664	omegaland/opc_server_interface_module	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa OmegaLand/OPC server interface module	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:omegaland%2fopc_server_interface_module:-	cpe:2.3:h:yokogawa:omegaland\\/opc_server_interface_module:-:*:*:*:*:*:*:*	*	*	*	*
1665	prm	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa PRM	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:prm:-	cpe:2.3:h:yokogawa:prm:-:*:*:*:*:*:*:*	*	*	*	*
1666	prosafe-rs	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa Prosafe-RS	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:prosafe-rs:-	cpe:2.3:h:yokogawa:prosafe-rs:-:*:*:*:*:*:*:*	*	*	*	*
1667	prosafe-rs_(chs2200:_soe_opc_interface_package)	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa ProSafe-RS (CHS2200: SOE OPC interface package) 	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:prosafe-rs_%28chs2200%3a_soe_opc_interface_package%29:-	cpe:2.3:h:yokogawa:prosafe-rs_\\(chs2200\\:_soe_opc_interface_package\\):-:*:*:*:*:*:*:*	*	*	*	*
1668	rpo_production_supervisor_vp	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa RPO Production Supervisor VP	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:rpo_production_supervisor_vp:-	cpe:2.3:h:yokogawa:rpo_production_supervisor_vp:-:*:*:*:*:*:*:*	*	*	*	*
1669	stardom_fcn/fcj_opc_server	yokogawa	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yokogawa STARDOM FCN/FCJ OPC Server for Windows	[{"vendor security advisory YSAR-14-0001E":"http://www.yokogawa.com/dcs/security/ysar/YSAR-14-0001E.pdf"}]	/h	*	cpe:/h:yokogawa:stardom_fcn%2ffcj_opc_server:-::~~~windows~~	cpe:2.3:h:yokogawa:stardom_fcn\\/fcj_opc_server:-:*:*:*:*:windows:*:*	*	*	*	*
1670	mycaljp	yoshinori_tahara	2.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.0	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.0	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.0:*:*:*:*:*:*:*	*	*	*	*
1671	mycaljp	yoshinori_tahara	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	サイトカレンダ mycaljp プラグイン Ver 2.0.1	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.1	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.1:*:*:*:*:*:*:*	*	*	*	*
1672	mycaljp	yoshinori_tahara	2.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.2	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.2	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.2:*:*:*:*:*:*:*	*	*	*	*
1673	mycaljp	yoshinori_tahara	2.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	サイトカレンダ mycaljp プラグイン Ver 2.0.3	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.3	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.3:*:*:*:*:*:*:*	*	*	*	*
1674	mycaljp	yoshinori_tahara	2.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.4	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.4	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.4:*:*:*:*:*:*:*	*	*	*	*
1675	mycaljp	yoshinori_tahara	2.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.5	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.5	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.5:*:*:*:*:*:*:*	*	*	*	*
1676	mycaljp	yoshinori_tahara	2.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.6	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.6	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.6:*:*:*:*:*:*:*	*	*	*	*
1677	mycaljp	yoshinori_tahara	2.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Site Calender mycaljp plugin Ver 2.0.7	[]	/a	*	cpe:/a:yoshinori_tahara:mycaljp:2.0.7	cpe:2.3:a:yoshinori_tahara:mycaljp:2.0.7:*:*:*:*:*:*:*	*	*	*	*
1678	youmail_visual_voicemail_plus	youmail	2.0.45	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YouMail Visual Voicemail Plus (com.youmail.android.vvm) application 2.0.45	[]	/a	*	cpe:/a:youmail:youmail_visual_voicemail_plus:2.0.45	cpe:2.3:a:youmail:youmail_visual_voicemail_plus:2.0.45:*:*:*:*:*:*:*	*	*	*	*
1679	youmail_visual_voicemail_plus	youmail	2.1.43	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YouMail Visual Voicemail Plus (com.youmail.android.vvm) application 2.1.43	[]	/a	*	cpe:/a:youmail:youmail_visual_voicemail_plus:2.1.43	cpe:2.3:a:youmail:youmail_visual_voicemail_plus:2.1.43:*:*:*:*:*:*:*	*	*	*	*
1707	zabbix	zabbix	1.1	beta5	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta5	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta5	cpe:2.3:a:zabbix:zabbix:1.1:beta5:*:*:*:*:*:*	*	*	*	*
1680	your-text-manager	your-text-manager_project	0.3.0	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Your Text Manager plugin for WordPress 0.3.0	[{"Software Website":"http://wordpress.org/support/view/plugin-reviews/your-text-manager"}]	/a	*	cpe:/a:your-text-manager_project:your-text-manager:0.3.0:-:~-~-~wordpress~~	cpe:2.3:a:your-text-manager_project:your-text-manager:0.3.0:-:-:*:-:wordpress:*:*	*	*	-	*
1681	banner_management	yourfreeworld	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YourFreeWorld Banner Management	[]	/a	*	cpe:/a:yourfreeworld:banner_management:-	cpe:2.3:a:yourfreeworld:banner_management:-:*:*:*:*:*:*:*	*	*	*	*
1682	java_profiler	yourkit	7.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yourkit Java Profiler 7.0.9	[]	/a	*	cpe:/a:yourkit:java_profiler:7.0.9	cpe:2.3:a:yourkit:java_profiler:7.0.9:*:*:*:*:*:*:*	*	*	*	*
1683	yourls	yourls	1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Your Own URL Shortener (YOURLS) 1.7	[{"Product changelog":"https://github.com/YOURLS/YOURLS/releases"},{"Vendor website":"http://yourls.org/"}]	/a	*	cpe:/a:yourls:yourls:1.7	cpe:2.3:a:yourls:yourls:1.7:*:*:*:*:*:*:*	*	*	*	*
1684	yourmembers	yourmembers_project	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YourMembers Project YourMembers for WordPress	[{"Version Information":"https://github.com/YourMembers/yourmembers"},{"Product Information":"http://wptavern.com/your-members-plugin-closes-its-doors-releases-assets-under-gpl"}]	/a	*	cpe:/a:yourmembers_project:yourmembers:-::~~~wordpress~~	cpe:2.3:a:yourmembers_project:yourmembers:-:*:*:*:*:wordpress:*:*	*	*	*	*
1685	your_tango	yourtango	1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YourTango Your Tango (aka com.your.tango) for android 1.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.your.tango"},{"Vendor website":"http://YourTango.com"}]	/a	*	cpe:/a:yourtango:your_tango:1::~~~android~~	cpe:2.3:a:yourtango:your_tango:1:*:*:*:*:android:*:*	*	*	*	*
1686	youtube_embed	youtube_embed_project	3.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	YouTube Embed project YouTube Embed 3.3.2 for WordPress	[{"Project Website":"https://wordpress.org/plugins/youtube-embed/"}]	/a	*	cpe:/a:youtube_embed_project:youtube_embed:3.3.2::~~~wordpress~~	cpe:2.3:a:youtube_embed_project:youtube_embed:3.3.2:*:*:*:*:wordpress:*:*	*	*	*	*
1687	u5cms	yuba	3.9.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuba U5CMS 3.9.3	[{"Vendor / Product Information":"http://www.yuba.ch/index.php?c=u5cms\\u0026l=en"},{"Version Information / PacketStorm Security Advisory":"http://packetstormsecurity.com/files/130292/u5CMS-3.9.3-Cross-Site-Scripting.html"}]	/a	*	cpe:/a:yuba:u5cms:3.9.3	cpe:2.3:a:yuba:u5cms:3.9.3:*:*:*:*:*:*:*	*	*	*	*
1688	tetra_filer	yuichiro_okuyama	1.5.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuichiro Okuyama tetra filer 1.5.1 for Android	[{"product information":"https://play.google.com/store/apps/details?id=jp.main.brits.android.filer.app"}]	/a	*	cpe:/a:yuichiro_okuyama:tetra_filer:1.5.1:-:~-~-~android~~	cpe:2.3:a:yuichiro_okuyama:tetra_filer:1.5.1:-:-:*:-:android:*:*	*	*	-	*
1689	tetra_filer	yuichiro_okuyama	2.3.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuichiro Okuyama tetra filer 2.3.1 for Android	[{"product information":"https://play.google.com/store/apps/details?id=jp.main.brits.android.filer.app"}]	/a	*	cpe:/a:yuichiro_okuyama:tetra_filer:2.3.1:-:~-~-~android~~	cpe:2.3:a:yuichiro_okuyama:tetra_filer:2.3.1:-:-:*:-:android:*:*	*	*	-	*
1690	tetra_filer_free	yuichiro_okuyama	1.5.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuichiro Okuyama tetra filer free 1.5.1 for Android	[]	/a	*	cpe:/a:yuichiro_okuyama:tetra_filer_free:1.5.1:-:~-~-~android~~	cpe:2.3:a:yuichiro_okuyama:tetra_filer_free:1.5.1:-:-:*:-:android:*:*	*	*	-	*
1691	tetra_filer_free	yuichiro_okuyama	2.3.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuichiro Okuyama tetra filer free 2.3.1 for Android	[{"product information":"https://play.google.com/store/apps/details?id=jp.main.brits.android.filer.free"}]	/a	*	cpe:/a:yuichiro_okuyama:tetra_filer_free:2.3.1:-:~-~-~android~~	cpe:2.3:a:yuichiro_okuyama:tetra_filer_free:2.3.1:-:-:*:-:android:*:*	*	*	-	*
1692	demaecan	yumenomachi	2.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yume no Machi Souzou Iinkai Co., Ltd Demaecan for Android 2.0.0	[{"version information":"https://play.google.com/store/apps/details?id=com.demaecan.androidapp"},{"vendor website":"http://www.yumenomachi.co.jp/"}]	/a	*	cpe:/a:yumenomachi:demaecan:2.0.0::~~~android~~	cpe:2.3:a:yumenomachi:demaecan:2.0.0:*:*:*:*:android:*:*	*	*	*	*
1693	demaecan	yumenomachi	2.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yume no Machi Souzou Iinkai Co., Ltd Demaecan for Android 2.1.0	[{"version information":"https://play.google.com/store/apps/details?id=com.demaecan.androidapp"},{"vendor website":"http://www.yumenomachi.co.jp/"}]	/a	*	cpe:/a:yumenomachi:demaecan:2.1.0::~~~android~~	cpe:2.3:a:yumenomachi:demaecan:2.1.0:*:*:*:*:android:*:*	*	*	*	*
1694	demaecan	yumenomachi	2.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yume no Machi Souzou Iinkai Co., Ltd Demaecan for Android 2.2.0	[{"version information":"https://play.google.com/store/apps/details?id=com.demaecan.androidapp"},{"vendor website":"http://www.yumenomachi.co.jp/"}]	/a	*	cpe:/a:yumenomachi:demaecan:2.2.0::~~~android~~	cpe:2.3:a:yumenomachi:demaecan:2.2.0:*:*:*:*:android:*:*	*	*	*	*
1695	demaecan	yumenomachi	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yume no Machi Souzou Iinkai Co., Ltd Demaecan for Android 2.2.1	[{"version information":"https://play.google.com/store/apps/details?id=com.demaecan.androidapp"},{"vendor website":"http://www.yumenomachi.co.jp/"}]	/a	*	cpe:/a:yumenomachi:demaecan:2.2.1::~~~android~~	cpe:2.3:a:yumenomachi:demaecan:2.2.1:*:*:*:*:android:*:*	*	*	*	*
1696	a+	yunlai	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	yunlai A+ (aka cn.xrzcm) for android 1.0.1	[{"Product information":"https://play.google.com/store/apps/details?id=cn.xrzcm"},{"Vendor website":"http://www.yunlai.cn"}]	/a	*	cpe:/a:yunlai:a%2b:1.0.1::~~~android~~	cpe:2.3:a:yunlai:a\\+:1.0.1:*:*:*:*:android:*:*	*	*	*	*
1697	yvs_image_gallery	yuriy_v_semenikhin	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yuriy V Semenikhin YVS Image Gallery	[]	/a	*	cpe:/a:yuriy_v_semenikhin:yvs_image_gallery:-	cpe:2.3:a:yuriy_v_semenikhin:yvs_image_gallery:-:*:*:*:*:*:*:*	*	*	*	*
1698	yurl_retwitt	yurl_retwitt_project	1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yurl Retwitt Project Yurl Retwitt for WordPress 1.4	[{"Product Information":"https://github.com/wp-plugins/yurl-retwitt/blob/master/yurl.php"}]	/a	*	cpe:/a:yurl_retwitt_project:yurl_retwitt:1.4::~~~wordpress~~	cpe:2.3:a:yurl_retwitt_project:yurl_retwitt:1.4:*:*:*:*:wordpress:*:*	*	*	*	*
1699	git_source_control_provider	yysun	0.6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Yysun Git Source Control Provider 0.6.2	[]	/a	*	cpe:/a:yysun:git_source_control_provider:0.6.2	cpe:2.3:a:yysun:git_source_control_provider:0.6.2:*:*:*:*:*:*:*	*	*	*	*
1700	zabbix	zabbix	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1	[]	/a	*	cpe:/a:zabbix:zabbix:1.1	cpe:2.3:a:zabbix:zabbix:1.1:*:*:*:*:*:*:*	*	*	*	*
1701	zabbix	zabbix	1.1	beta10	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta10	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta10	cpe:2.3:a:zabbix:zabbix:1.1:beta10:*:*:*:*:*:*	*	*	*	*
1702	zabbix	zabbix	1.1	beta11	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta11	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta11	cpe:2.3:a:zabbix:zabbix:1.1:beta11:*:*:*:*:*:*	*	*	*	*
1703	zabbix	zabbix	1.1	beta12	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta12	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta12	cpe:2.3:a:zabbix:zabbix:1.1:beta12:*:*:*:*:*:*	*	*	*	*
1708	zabbix	zabbix	1.1	beta6	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta6	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta6	cpe:2.3:a:zabbix:zabbix:1.1:beta6:*:*:*:*:*:*	*	*	*	*
1709	zabbix	zabbix	1.1	beta7	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta7	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta7	cpe:2.3:a:zabbix:zabbix:1.1:beta7:*:*:*:*:*:*	*	*	*	*
1710	zabbix	zabbix	1.1	beta8	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta8	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta8	cpe:2.3:a:zabbix:zabbix:1.1:beta8:*:*:*:*:*:*	*	*	*	*
1711	zabbix	zabbix	1.1	beta9	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1 beta9	[]	/a	*	cpe:/a:zabbix:zabbix:1.1:beta9	cpe:2.3:a:zabbix:zabbix:1.1:beta9:*:*:*:*:*:*	*	*	*	*
1712	zabbix	zabbix	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.1	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.1	cpe:2.3:a:zabbix:zabbix:1.1.1:*:*:*:*:*:*:*	*	*	*	*
1713	zabbix	zabbix	1.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.2	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.2	cpe:2.3:a:zabbix:zabbix:1.1.2:*:*:*:*:*:*:*	*	*	*	*
1714	zabbix	zabbix	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.3	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.3	cpe:2.3:a:zabbix:zabbix:1.1.3:*:*:*:*:*:*:*	*	*	*	*
1715	zabbix	zabbix	1.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.4	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.4	cpe:2.3:a:zabbix:zabbix:1.1.4:*:*:*:*:*:*:*	*	*	*	*
1716	zabbix	zabbix	1.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.5	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.5	cpe:2.3:a:zabbix:zabbix:1.1.5:*:*:*:*:*:*:*	*	*	*	*
1717	zabbix	zabbix	1.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.6	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.6	cpe:2.3:a:zabbix:zabbix:1.1.6:*:*:*:*:*:*:*	*	*	*	*
1718	zabbix	zabbix	1.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.1.7	[]	/a	*	cpe:/a:zabbix:zabbix:1.1.7	cpe:2.3:a:zabbix:zabbix:1.1.7:*:*:*:*:*:*:*	*	*	*	*
1719	zabbix	zabbix	1.3	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3:beta	cpe:2.3:a:zabbix:zabbix:1.3:beta:*:*:*:*:*:*	*	*	*	*
1720	zabbix	zabbix	1.3.1	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.1 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.1:beta	cpe:2.3:a:zabbix:zabbix:1.3.1:beta:*:*:*:*:*:*	*	*	*	*
1721	zabbix	zabbix	1.3.2	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.2 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.2:beta	cpe:2.3:a:zabbix:zabbix:1.3.2:beta:*:*:*:*:*:*	*	*	*	*
1722	zabbix	zabbix	1.3.3	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.3 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.3:beta	cpe:2.3:a:zabbix:zabbix:1.3.3:beta:*:*:*:*:*:*	*	*	*	*
1723	zabbix	zabbix	1.3.4	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.4 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.4:beta	cpe:2.3:a:zabbix:zabbix:1.3.4:beta:*:*:*:*:*:*	*	*	*	*
1724	zabbix	zabbix	1.3.5	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.5 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.5:beta	cpe:2.3:a:zabbix:zabbix:1.3.5:beta:*:*:*:*:*:*	*	*	*	*
1725	zabbix	zabbix	1.3.6	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.6 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.6:beta	cpe:2.3:a:zabbix:zabbix:1.3.6:beta:*:*:*:*:*:*	*	*	*	*
1726	zabbix	zabbix	1.3.7	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.7 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.7:beta	cpe:2.3:a:zabbix:zabbix:1.3.7:beta:*:*:*:*:*:*	*	*	*	*
1727	zabbix	zabbix	1.3.8	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.3.8 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.3.8:beta	cpe:2.3:a:zabbix:zabbix:1.3.8:beta:*:*:*:*:*:*	*	*	*	*
1728	zabbix	zabbix	1.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.4.2	[]	/a	*	cpe:/a:zabbix:zabbix:1.4.2	cpe:2.3:a:zabbix:zabbix:1.4.2:*:*:*:*:*:*:*	*	*	*	*
1729	zabbix	zabbix	1.4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.4.3	[]	/a	*	cpe:/a:zabbix:zabbix:1.4.3	cpe:2.3:a:zabbix:zabbix:1.4.3:*:*:*:*:*:*:*	*	*	*	*
1730	zabbix	zabbix	1.4.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.4.4	[]	/a	*	cpe:/a:zabbix:zabbix:1.4.4	cpe:2.3:a:zabbix:zabbix:1.4.4:*:*:*:*:*:*:*	*	*	*	*
1731	zabbix	zabbix	1.4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.4.5	[]	/a	*	cpe:/a:zabbix:zabbix:1.4.5	cpe:2.3:a:zabbix:zabbix:1.4.5:*:*:*:*:*:*:*	*	*	*	*
1732	zabbix	zabbix	1.4.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.4.6	[]	/a	*	cpe:/a:zabbix:zabbix:1.4.6	cpe:2.3:a:zabbix:zabbix:1.4.6:*:*:*:*:*:*:*	*	*	*	*
1733	zabbix	zabbix	1.5	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.5 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.5:beta	cpe:2.3:a:zabbix:zabbix:1.5:beta:*:*:*:*:*:*	*	*	*	*
1734	zabbix	zabbix	1.5.1	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.5.1 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.5.1:beta	cpe:2.3:a:zabbix:zabbix:1.5.1:beta:*:*:*:*:*:*	*	*	*	*
1735	zabbix	zabbix	1.5.2	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.5.2 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.5.2:beta	cpe:2.3:a:zabbix:zabbix:1.5.2:beta:*:*:*:*:*:*	*	*	*	*
1736	zabbix	zabbix	1.5.3	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.5.3 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.5.3:beta	cpe:2.3:a:zabbix:zabbix:1.5.3:beta:*:*:*:*:*:*	*	*	*	*
1737	zabbix	zabbix	1.5.4	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.5.4 beta	[]	/a	*	cpe:/a:zabbix:zabbix:1.5.4:beta	cpe:2.3:a:zabbix:zabbix:1.5.4:beta:*:*:*:*:*:*	*	*	*	*
1738	zabbix	zabbix	1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6	[]	/a	*	cpe:/a:zabbix:zabbix:1.6	cpe:2.3:a:zabbix:zabbix:1.6:*:*:*:*:*:*:*	*	*	*	*
1739	zabbix	zabbix	1.6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.1	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.1	cpe:2.3:a:zabbix:zabbix:1.6.1:*:*:*:*:*:*:*	*	*	*	*
1740	zabbix	zabbix	1.6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.2	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.2	cpe:2.3:a:zabbix:zabbix:1.6.2:*:*:*:*:*:*:*	*	*	*	*
1741	zabbix	zabbix	1.6.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.3	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.3	cpe:2.3:a:zabbix:zabbix:1.6.3:*:*:*:*:*:*:*	*	*	*	*
1742	zabbix	zabbix	1.6.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.4	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.4	cpe:2.3:a:zabbix:zabbix:1.6.4:*:*:*:*:*:*:*	*	*	*	*
1743	zabbix	zabbix	1.6.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.5	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.5	cpe:2.3:a:zabbix:zabbix:1.6.5:*:*:*:*:*:*:*	*	*	*	*
1744	zabbix	zabbix	1.6.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.6	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.6	cpe:2.3:a:zabbix:zabbix:1.6.6:*:*:*:*:*:*:*	*	*	*	*
1745	zabbix	zabbix	1.6.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.7	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.7	cpe:2.3:a:zabbix:zabbix:1.6.7:*:*:*:*:*:*:*	*	*	*	*
1746	zabbix	zabbix	1.6.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.8	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.8	cpe:2.3:a:zabbix:zabbix:1.6.8:*:*:*:*:*:*:*	*	*	*	*
1747	zabbix	zabbix	1.6.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.6.9	[]	/a	*	cpe:/a:zabbix:zabbix:1.6.9	cpe:2.3:a:zabbix:zabbix:1.6.9:*:*:*:*:*:*:*	*	*	*	*
1748	zabbix	zabbix	1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.7	[]	/a	*	cpe:/a:zabbix:zabbix:1.7	cpe:2.3:a:zabbix:zabbix:1.7:*:*:*:*:*:*:*	*	*	*	*
1749	zabbix	zabbix	1.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.7.1	[]	/a	*	cpe:/a:zabbix:zabbix:1.7.1	cpe:2.3:a:zabbix:zabbix:1.7.1:*:*:*:*:*:*:*	*	*	*	*
1750	zabbix	zabbix	1.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.7.2	[]	/a	*	cpe:/a:zabbix:zabbix:1.7.2	cpe:2.3:a:zabbix:zabbix:1.7.2:*:*:*:*:*:*:*	*	*	*	*
1751	zabbix	zabbix	1.7.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.7.3	[]	/a	*	cpe:/a:zabbix:zabbix:1.7.3	cpe:2.3:a:zabbix:zabbix:1.7.3:*:*:*:*:*:*:*	*	*	*	*
1752	zabbix	zabbix	1.7.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.7.4	[]	/a	*	cpe:/a:zabbix:zabbix:1.7.4	cpe:2.3:a:zabbix:zabbix:1.7.4:*:*:*:*:*:*:*	*	*	*	*
1753	zabbix	zabbix	1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8	[]	/a	*	cpe:/a:zabbix:zabbix:1.8	cpe:2.3:a:zabbix:zabbix:1.8:*:*:*:*:*:*:*	*	*	*	*
1754	zabbix	zabbix	1.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.1	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.1	cpe:2.3:a:zabbix:zabbix:1.8.1:*:*:*:*:*:*:*	*	*	*	*
1755	zabbix	zabbix	1.8.15	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.15 release candidate 1	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.15:rc1	cpe:2.3:a:zabbix:zabbix:1.8.15:rc1:*:*:*:*:*:*	*	*	*	*
1756	zabbix	zabbix	1.8.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.16	[{"Version information":"http://www.zabbix.com/rn1.8.16.php"}]	/a	*	cpe:/a:zabbix:zabbix:1.8.16	cpe:2.3:a:zabbix:zabbix:1.8.16:*:*:*:*:*:*:*	*	*	*	*
1757	zabbix	zabbix	1.8.18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.18	[{"Version information":"http://www.zabbix.com/rn1.8.18.php"}]	/a	*	cpe:/a:zabbix:zabbix:1.8.18	cpe:2.3:a:zabbix:zabbix:1.8.18:*:*:*:*:*:*:*	*	*	*	*
1758	zabbix	zabbix	1.8.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.19	[{"Version information":"http://www.zabbix.com/rn1.8.19.php"}]	/a	*	cpe:/a:zabbix:zabbix:1.8.19	cpe:2.3:a:zabbix:zabbix:1.8.19:*:*:*:*:*:*:*	*	*	*	*
1759	zabbix	zabbix	1.8.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.2	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.2	cpe:2.3:a:zabbix:zabbix:1.8.2:*:*:*:*:*:*:*	*	*	*	*
1760	zabbix	zabbix	1.8.21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.21	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:1.8.21	cpe:2.3:a:zabbix:zabbix:1.8.21:*:*:*:*:*:*:*	*	*	*	*
1761	zabbix	zabbix	1.8.3	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.3 release candidate 1	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.3:rc1	cpe:2.3:a:zabbix:zabbix:1.8.3:rc1:*:*:*:*:*:*	*	*	*	*
1762	zabbix	zabbix	1.8.3	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.3 release candidate 2	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.3:rc2	cpe:2.3:a:zabbix:zabbix:1.8.3:rc2:*:*:*:*:*:*	*	*	*	*
1763	zabbix	zabbix	1.8.3	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 1.8.3 release candidate 3	[]	/a	*	cpe:/a:zabbix:zabbix:1.8.3:rc3	cpe:2.3:a:zabbix:zabbix:1.8.3:rc3:*:*:*:*:*:*	*	*	*	*
1764	zabbix	zabbix	2.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0	[]	/a	*	cpe:/a:zabbix:zabbix:2.0.0	cpe:2.3:a:zabbix:zabbix:2.0.0:*:*:*:*:*:*:*	*	*	*	*
1765	zabbix	zabbix	2.0.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc1	cpe:2.3:a:zabbix:zabbix:2.0.0:rc1:*:*:*:*:*:*	*	*	*	*
1766	zabbix	zabbix	2.0.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc2	cpe:2.3:a:zabbix:zabbix:2.0.0:rc2:*:*:*:*:*:*	*	*	*	*
1767	zabbix	zabbix	2.0.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 3	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc3	cpe:2.3:a:zabbix:zabbix:2.0.0:rc3:*:*:*:*:*:*	*	*	*	*
1768	zabbix	zabbix	2.0.0	rc4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 4	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc4	cpe:2.3:a:zabbix:zabbix:2.0.0:rc4:*:*:*:*:*:*	*	*	*	*
1769	zabbix	zabbix	2.0.0	rc5	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 5	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc5	cpe:2.3:a:zabbix:zabbix:2.0.0:rc5:*:*:*:*:*:*	*	*	*	*
1770	zabbix	zabbix	2.0.0	rc6	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.0 Release Candidate 6	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.0:rc6	cpe:2.3:a:zabbix:zabbix:2.0.0:rc6:*:*:*:*:*:*	*	*	*	*
1771	zabbix	zabbix	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.1	[]	/a	*	cpe:/a:zabbix:zabbix:2.0.1	cpe:2.3:a:zabbix:zabbix:2.0.1:*:*:*:*:*:*:*	*	*	*	*
1772	zabbix	zabbix	2.0.1	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.1 Release Candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.1:rc1	cpe:2.3:a:zabbix:zabbix:2.0.1:rc1:*:*:*:*:*:*	*	*	*	*
1773	zabbix	zabbix	2.0.1	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.1 Release Candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.1:rc2	cpe:2.3:a:zabbix:zabbix:2.0.1:rc2:*:*:*:*:*:*	*	*	*	*
1774	zabbix	zabbix	2.0.10	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.10 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.10:rc1	cpe:2.3:a:zabbix:zabbix:2.0.10:rc1:*:*:*:*:*:*	*	*	*	*
1775	zabbix	zabbix	2.0.11	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.11 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.11:rc1	cpe:2.3:a:zabbix:zabbix:2.0.11:rc1:*:*:*:*:*:*	*	*	*	*
1776	zabbix	zabbix	2.0.11	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.11 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.11:rc2	cpe:2.3:a:zabbix:zabbix:2.0.11:rc2:*:*:*:*:*:*	*	*	*	*
1777	zabbix	zabbix	2.0.12	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.12 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.12:rc1	cpe:2.3:a:zabbix:zabbix:2.0.12:rc1:*:*:*:*:*:*	*	*	*	*
1778	zabbix	zabbix	2.0.12	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.12 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.12:rc2	cpe:2.3:a:zabbix:zabbix:2.0.12:rc2:*:*:*:*:*:*	*	*	*	*
1779	zabbix	zabbix	2.0.12	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.0.12 release candidate 3	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.12:rc3	cpe:2.3:a:zabbix:zabbix:2.0.12:rc3:*:*:*:*:*:*	*	*	*	*
1780	zabbix	zabbix	2.0.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.0.13	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.13	cpe:2.3:a:zabbix:zabbix:2.0.13:*:*:*:*:*:*:*	*	*	*	*
1781	zabbix	zabbix	2.0.13	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.0.13 release candidate 1	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.13:rc1	cpe:2.3:a:zabbix:zabbix:2.0.13:rc1:*:*:*:*:*:*	*	*	*	*
1782	zabbix	zabbix	2.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.2	[{"Version information":"http://www.zabbix.com/rn2.0.5.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.2	cpe:2.3:a:zabbix:zabbix:2.0.2:*:*:*:*:*:*:*	*	*	*	*
1783	zabbix	zabbix	2.0.2	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.2 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.2:rc1	cpe:2.3:a:zabbix:zabbix:2.0.2:rc1:*:*:*:*:*:*	*	*	*	*
1784	zabbix	zabbix	2.0.2	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.2 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.2:rc2	cpe:2.3:a:zabbix:zabbix:2.0.2:rc2:*:*:*:*:*:*	*	*	*	*
1785	zabbix	zabbix	2.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.3	[{"Version information":"http://www.zabbix.com/rn2.0.5.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.3	cpe:2.3:a:zabbix:zabbix:2.0.3:*:*:*:*:*:*:*	*	*	*	*
1786	zabbix	zabbix	2.0.3	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.3 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.3:rc1	cpe:2.3:a:zabbix:zabbix:2.0.3:rc1:*:*:*:*:*:*	*	*	*	*
1787	zabbix	zabbix	2.0.3	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.3 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.3:rc2	cpe:2.3:a:zabbix:zabbix:2.0.3:rc2:*:*:*:*:*:*	*	*	*	*
1788	zabbix	zabbix	2.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.4	[{"Version information":"http://www.zabbix.com/rn2.0.5.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.4	cpe:2.3:a:zabbix:zabbix:2.0.4:*:*:*:*:*:*:*	*	*	*	*
1789	zabbix	zabbix	2.0.4	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.4 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.4:rc1	cpe:2.3:a:zabbix:zabbix:2.0.4:rc1:*:*:*:*:*:*	*	*	*	*
1790	zabbix	zabbix	2.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.5	[{"Version information":"http://www.zabbix.com/rn2.0.5.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.5	cpe:2.3:a:zabbix:zabbix:2.0.5:*:*:*:*:*:*:*	*	*	*	*
1791	zabbix	zabbix	2.0.5	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.5 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.5:rc1	cpe:2.3:a:zabbix:zabbix:2.0.5:rc1:*:*:*:*:*:*	*	*	*	*
1792	zabbix	zabbix	2.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.6	[{"version":"http://www.zabbix.com/rn2.0.6.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.6	cpe:2.3:a:zabbix:zabbix:2.0.6:*:*:*:*:*:*:*	*	*	*	*
1793	zabbix	zabbix	2.0.6	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.6 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.6:rc1	cpe:2.3:a:zabbix:zabbix:2.0.6:rc1:*:*:*:*:*:*	*	*	*	*
1794	zabbix	zabbix	2.0.7	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.7 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.7:rc1	cpe:2.3:a:zabbix:zabbix:2.0.7:rc1:*:*:*:*:*:*	*	*	*	*
1795	zabbix	zabbix	2.0.8	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.8 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.8:rc1	cpe:2.3:a:zabbix:zabbix:2.0.8:rc1:*:*:*:*:*:*	*	*	*	*
1796	zabbix	zabbix	2.0.8	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.8 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.8:rc2	cpe:2.3:a:zabbix:zabbix:2.0.8:rc2:*:*:*:*:*:*	*	*	*	*
1797	zabbix	zabbix	2.0.9	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.9 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.9:rc1	cpe:2.3:a:zabbix:zabbix:2.0.9:rc1:*:*:*:*:*:*	*	*	*	*
1798	zabbix	zabbix	2.0.9	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.0.9 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.0.9:rc2	cpe:2.3:a:zabbix:zabbix:2.0.9:rc2:*:*:*:*:*:*	*	*	*	*
1799	zabbix	zabbix	2.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.1.0	[{"version":"http://www.zabbix.com/rn2.1.0.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.1.0	cpe:2.3:a:zabbix:zabbix:2.1.0:*:*:*:*:*:*:*	*	*	*	*
1800	zabbix	zabbix	2.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.1.1	[{"version":"http://www.zabbix.com/rn2.1.1.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.1.1	cpe:2.3:a:zabbix:zabbix:2.1.1:*:*:*:*:*:*:*	*	*	*	*
1801	zabbix	zabbix	2.2.0	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.0	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.0:-	cpe:2.3:a:zabbix:zabbix:2.2.0:-:*:*:*:*:*:*	*	*	*	*
1802	zabbix	zabbix	2.2.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.0 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.0:rc1	cpe:2.3:a:zabbix:zabbix:2.2.0:rc1:*:*:*:*:*:*	*	*	*	*
1803	zabbix	zabbix	2.2.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.0 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.0:rc2	cpe:2.3:a:zabbix:zabbix:2.2.0:rc2:*:*:*:*:*:*	*	*	*	*
1804	zabbix	zabbix	2.2.1	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.1:-	cpe:2.3:a:zabbix:zabbix:2.2.1:-:*:*:*:*:*:*	*	*	*	*
1805	zabbix	zabbix	2.2.1	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.1 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.1:rc1	cpe:2.3:a:zabbix:zabbix:2.2.1:rc1:*:*:*:*:*:*	*	*	*	*
1806	zabbix	zabbix	2.2.2	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.2:-	cpe:2.3:a:zabbix:zabbix:2.2.2:-:*:*:*:*:*:*	*	*	*	*
1807	zabbix	zabbix	2.2.2	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.2 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.2:rc1	cpe:2.3:a:zabbix:zabbix:2.2.2:rc1:*:*:*:*:*:*	*	*	*	*
1808	zabbix	zabbix	2.2.2	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.2 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.2:rc2	cpe:2.3:a:zabbix:zabbix:2.2.2:rc2:*:*:*:*:*:*	*	*	*	*
1809	zabbix	zabbix	2.2.2	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.2 release candidate 3	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.2:rc3	cpe:2.3:a:zabbix:zabbix:2.2.2:rc3:*:*:*:*:*:*	*	*	*	*
1810	zabbix	zabbix	2.2.3	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.3	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.3:-	cpe:2.3:a:zabbix:zabbix:2.2.3:-:*:*:*:*:*:*	*	*	*	*
2786	jdk	sun	1.5.0	update25		\N	2018-05-31 16:59:57.512936	2018-05-31 16:59:57.512936	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update25	\N	\N	\N	\N	\N
1811	zabbix	zabbix	2.2.3	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.3 release candidate 1	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.3:rc1	cpe:2.3:a:zabbix:zabbix:2.2.3:rc1:*:*:*:*:*:*	*	*	*	*
1812	zabbix	zabbix	2.2.3	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZABBIX 2.2.3 release candidate 2	[{"product release information":"http://sourceforge.net/projects/zabbix/files/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.3:rc2	cpe:2.3:a:zabbix:zabbix:2.2.3:rc2:*:*:*:*:*:*	*	*	*	*
1813	zabbix	zabbix	2.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.4	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.4	cpe:2.3:a:zabbix:zabbix:2.2.4:*:*:*:*:*:*:*	*	*	*	*
1814	zabbix	zabbix	2.2.4	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.4 release candidate 1	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.4:rc1	cpe:2.3:a:zabbix:zabbix:2.2.4:rc1:*:*:*:*:*:*	*	*	*	*
1815	zabbix	zabbix	2.2.4	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.4 release candidate 	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.4:rc2	cpe:2.3:a:zabbix:zabbix:2.2.4:rc2:*:*:*:*:*:*	*	*	*	*
1816	zabbix	zabbix	2.2.4	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.4 release candidate 3	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.4:rc3	cpe:2.3:a:zabbix:zabbix:2.2.4:rc3:*:*:*:*:*:*	*	*	*	*
1817	zabbix	zabbix	2.2.4	rc4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.4 release candidate 4	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.4:rc4	cpe:2.3:a:zabbix:zabbix:2.2.4:rc4:*:*:*:*:*:*	*	*	*	*
1818	zabbix	zabbix	2.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.5	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.5	cpe:2.3:a:zabbix:zabbix:2.2.5:*:*:*:*:*:*:*	*	*	*	*
1819	zabbix	zabbix	2.2.5	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.5 release candidate 1	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.5:rc1	cpe:2.3:a:zabbix:zabbix:2.2.5:rc1:*:*:*:*:*:*	*	*	*	*
1820	zabbix	zabbix	2.2.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.6	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.6	cpe:2.3:a:zabbix:zabbix:2.2.6:*:*:*:*:*:*:*	*	*	*	*
1821	zabbix	zabbix	2.2.6	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.6 release candidate 1	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.6:rc1	cpe:2.3:a:zabbix:zabbix:2.2.6:rc1:*:*:*:*:*:*	*	*	*	*
1822	zabbix	zabbix	2.2.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.7	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.7	cpe:2.3:a:zabbix:zabbix:2.2.7:*:*:*:*:*:*:*	*	*	*	*
1823	zabbix	zabbix	2.2.7	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.7 release candidate 1	[{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"},{"Vendor website":"http://www.zabbix.com/"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.7:rc1	cpe:2.3:a:zabbix:zabbix:2.2.7:rc1:*:*:*:*:*:*	*	*	*	*
1824	zabbix	zabbix	2.2.7	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zabbix 2.2.7 release candidate 2	[{"Vendor website":"http://www.zabbix.com/"},{"Product changelog":"http://www.zabbix.com/rn2.4.3.php"}]	/a	*	cpe:/a:zabbix:zabbix:2.2.7:rc2	cpe:2.3:a:zabbix:zabbix:2.2.7:rc2:*:*:*:*:*:*	*	*	*	*
1825	zm_ajax_login_&_register	zanematthew	1.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZaneMatthew ZM Ajax Login & Register for WordPress 1.0.9	[{"Product Information":"https://wordpress.org/plugins/zm-ajax-login-register/"},{"Vendor Website":"http://zanematthew.com/"}]	/a	*	cpe:/a:zanematthew:zm_ajax_login_%26_register:1.0.9::~~~wordpress~~	cpe:2.3:a:zanematthew:zm_ajax_login_\\&_register:1.0.9:*:*:*:*:wordpress:*:*	*	*	*	*
1826	webapp	zarafa	1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa WebApp 1.5	[{"vendor product information":"http://www.zarafa.com/content/webapp"}]	/a	*	cpe:/a:zarafa:webapp:1.5	cpe:2.3:a:zarafa:webapp:1.5:*:*:*:*:*:*:*	*	*	*	*
1827	webapp	zarafa	1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa WebApp 1.6	[{"vendor product information":"http://www.zarafa.com/content/webapp"}]	/a	*	cpe:/a:zarafa:webapp:1.6	cpe:2.3:a:zarafa:webapp:1.6:*:*:*:*:*:*:*	*	*	*	*
1828	webapp	zarafa	2.0	beta2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa WebApp 2.0 Beta 2	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:webapp:2.0:beta2	cpe:2.3:a:zarafa:webapp:2.0:beta2:*:*:*:*:*:*	*	*	*	*
1829	zarafa	zarafa	5.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.00	[{"product information":"http://freecode.com/projects/zarafa/releases?page=1"},{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.00	cpe:2.3:a:zarafa:zarafa:5.00:*:*:*:*:*:*:*	*	*	*	*
1830	zarafa	zarafa	5.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.01	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.01	cpe:2.3:a:zarafa:zarafa:5.01:*:*:*:*:*:*:*	*	*	*	*
1831	zarafa	zarafa	5.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.02	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.02	cpe:2.3:a:zarafa:zarafa:5.02:*:*:*:*:*:*:*	*	*	*	*
1832	zarafa	zarafa	5.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.10	[{"project information":"http://freecode.com/projects/zarafa"},{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:5.10	cpe:2.3:a:zarafa:zarafa:5.10:*:*:*:*:*:*:*	*	*	*	*
1833	zarafa	zarafa	5.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.11	cpe:2.3:a:zarafa:zarafa:5.11:*:*:*:*:*:*:*	*	*	*	*
1834	zarafa	zarafa	5.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.20	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.20	cpe:2.3:a:zarafa:zarafa:5.20:*:*:*:*:*:*:*	*	*	*	*
1835	zarafa	zarafa	5.22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 5.22	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:5.22	cpe:2.3:a:zarafa:zarafa:5.22:*:*:*:*:*:*:*	*	*	*	*
1836	zarafa	zarafa	6.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.00	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.00	cpe:2.3:a:zarafa:zarafa:6.00:*:*:*:*:*:*:*	*	*	*	*
1837	zarafa	zarafa	6.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.01	[{"project information":"http://freecode.com/projects/zarafa"},{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:6.01	cpe:2.3:a:zarafa:zarafa:6.01:*:*:*:*:*:*:*	*	*	*	*
2633	zope	zope	2.9.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.5	[]	/a	*	cpe:/a:zope:zope:2.9.5	cpe:2.3:a:zope:zope:2.9.5:*:*:*:*:*:*:*	*	*	*	*
1838	zarafa	zarafa	6.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.02	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.02	cpe:2.3:a:zarafa:zarafa:6.02:*:*:*:*:*:*:*	*	*	*	*
1839	zarafa	zarafa	6.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.03	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.03	cpe:2.3:a:zarafa:zarafa:6.03:*:*:*:*:*:*:*	*	*	*	*
1840	zarafa	zarafa	6.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.10	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.10	cpe:2.3:a:zarafa:zarafa:6.10:*:*:*:*:*:*:*	*	*	*	*
1841	zarafa	zarafa	6.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.11	cpe:2.3:a:zarafa:zarafa:6.11:*:*:*:*:*:*:*	*	*	*	*
1842	zarafa	zarafa	6.20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20	cpe:2.3:a:zarafa:zarafa:6.20:*:*:*:*:*:*:*	*	*	*	*
1843	zarafa	zarafa	6.20.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.10	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.10	cpe:2.3:a:zarafa:zarafa:6.20.10:*:*:*:*:*:*:*	*	*	*	*
1844	zarafa	zarafa	6.20.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.11	cpe:2.3:a:zarafa:zarafa:6.20.11:*:*:*:*:*:*:*	*	*	*	*
1845	zarafa	zarafa	6.20.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.12	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.12	cpe:2.3:a:zarafa:zarafa:6.20.12:*:*:*:*:*:*:*	*	*	*	*
1846	zarafa	zarafa	6.20.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.2	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.2	cpe:2.3:a:zarafa:zarafa:6.20.2:*:*:*:*:*:*:*	*	*	*	*
1847	zarafa	zarafa	6.20.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.3	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.3	cpe:2.3:a:zarafa:zarafa:6.20.3:*:*:*:*:*:*:*	*	*	*	*
1848	zarafa	zarafa	6.20.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.5	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.5	cpe:2.3:a:zarafa:zarafa:6.20.5:*:*:*:*:*:*:*	*	*	*	*
1849	zarafa	zarafa	6.20.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.6	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.6	cpe:2.3:a:zarafa:zarafa:6.20.6:*:*:*:*:*:*:*	*	*	*	*
1850	zarafa	zarafa	6.20.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.20.7	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.20.7	cpe:2.3:a:zarafa:zarafa:6.20.7:*:*:*:*:*:*:*	*	*	*	*
1851	zarafa	zarafa	6.30.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.0	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.0	cpe:2.3:a:zarafa:zarafa:6.30.0:*:*:*:*:*:*:*	*	*	*	*
1852	zarafa	zarafa	6.30.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.10	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.10	cpe:2.3:a:zarafa:zarafa:6.30.10:*:*:*:*:*:*:*	*	*	*	*
1853	zarafa	zarafa	6.30.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.11	cpe:2.3:a:zarafa:zarafa:6.30.11:*:*:*:*:*:*:*	*	*	*	*
1854	zarafa	zarafa	6.30.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.13	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.13	cpe:2.3:a:zarafa:zarafa:6.30.13:*:*:*:*:*:*:*	*	*	*	*
1855	zarafa	zarafa	6.30.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.16	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.16	cpe:2.3:a:zarafa:zarafa:6.30.16:*:*:*:*:*:*:*	*	*	*	*
1856	zarafa	zarafa	6.30.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.17	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.17	cpe:2.3:a:zarafa:zarafa:6.30.17:*:*:*:*:*:*:*	*	*	*	*
1857	zarafa	zarafa	6.30.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.3	[{"project information":"http://freecode.com/projects/zarafa"},{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.3	cpe:2.3:a:zarafa:zarafa:6.30.3:*:*:*:*:*:*:*	*	*	*	*
1858	zarafa	zarafa	6.30.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.4	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.4	cpe:2.3:a:zarafa:zarafa:6.30.4:*:*:*:*:*:*:*	*	*	*	*
1859	zarafa	zarafa	6.30.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.5	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.5	cpe:2.3:a:zarafa:zarafa:6.30.5:*:*:*:*:*:*:*	*	*	*	*
1860	zarafa	zarafa	6.30.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.6	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.6	cpe:2.3:a:zarafa:zarafa:6.30.6:*:*:*:*:*:*:*	*	*	*	*
1861	zarafa	zarafa	6.30.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.7	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.7	cpe:2.3:a:zarafa:zarafa:6.30.7:*:*:*:*:*:*:*	*	*	*	*
1862	zarafa	zarafa	6.30.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.8	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.8	cpe:2.3:a:zarafa:zarafa:6.30.8:*:*:*:*:*:*:*	*	*	*	*
1863	zarafa	zarafa	6.30.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.30.9	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.30.9	cpe:2.3:a:zarafa:zarafa:6.30.9:*:*:*:*:*:*:*	*	*	*	*
1864	zarafa	zarafa	6.40.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.0	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.0	cpe:2.3:a:zarafa:zarafa:6.40.0:*:*:*:*:*:*:*	*	*	*	*
1865	zarafa	zarafa	6.40.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.10	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.10	cpe:2.3:a:zarafa:zarafa:6.40.10:*:*:*:*:*:*:*	*	*	*	*
1866	zarafa	zarafa	6.40.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.11	cpe:2.3:a:zarafa:zarafa:6.40.11:*:*:*:*:*:*:*	*	*	*	*
1867	zarafa	zarafa	6.40.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.12	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.12	cpe:2.3:a:zarafa:zarafa:6.40.12:*:*:*:*:*:*:*	*	*	*	*
1868	zarafa	zarafa	6.40.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.13	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.13	cpe:2.3:a:zarafa:zarafa:6.40.13:*:*:*:*:*:*:*	*	*	*	*
1869	zarafa	zarafa	6.40.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.14	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.14	cpe:2.3:a:zarafa:zarafa:6.40.14:*:*:*:*:*:*:*	*	*	*	*
1870	zarafa	zarafa	6.40.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.15	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.15	cpe:2.3:a:zarafa:zarafa:6.40.15:*:*:*:*:*:*:*	*	*	*	*
1871	zarafa	zarafa	6.40.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.16	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.16	cpe:2.3:a:zarafa:zarafa:6.40.16:*:*:*:*:*:*:*	*	*	*	*
1872	zarafa	zarafa	6.40.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.17	[{"project information":"http://freecode.com/projects/zarafa"},{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.17	cpe:2.3:a:zarafa:zarafa:6.40.17:*:*:*:*:*:*:*	*	*	*	*
1873	zarafa	zarafa	6.40.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.2	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.2	cpe:2.3:a:zarafa:zarafa:6.40.2:*:*:*:*:*:*:*	*	*	*	*
1874	zarafa	zarafa	6.40.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.3	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.3	cpe:2.3:a:zarafa:zarafa:6.40.3:*:*:*:*:*:*:*	*	*	*	*
1875	zarafa	zarafa	6.40.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.4	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.4	cpe:2.3:a:zarafa:zarafa:6.40.4:*:*:*:*:*:*:*	*	*	*	*
1876	zarafa	zarafa	6.40.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.5	[{"project information":"http://freecode.com/projects/zarafa"},{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.5	cpe:2.3:a:zarafa:zarafa:6.40.5:*:*:*:*:*:*:*	*	*	*	*
1877	zarafa	zarafa	6.40.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.6	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.6	cpe:2.3:a:zarafa:zarafa:6.40.6:*:*:*:*:*:*:*	*	*	*	*
1878	zarafa	zarafa	6.40.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.7	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.7	cpe:2.3:a:zarafa:zarafa:6.40.7:*:*:*:*:*:*:*	*	*	*	*
1879	zarafa	zarafa	6.40.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.8	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.8	cpe:2.3:a:zarafa:zarafa:6.40.8:*:*:*:*:*:*:*	*	*	*	*
1880	zarafa	zarafa	6.40.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 6.40.9	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:6.40.9	cpe:2.3:a:zarafa:zarafa:6.40.9:*:*:*:*:*:*:*	*	*	*	*
1881	zarafa	zarafa	7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0	cpe:2.3:a:zarafa:zarafa:7.0:*:*:*:*:*:*:*	*	*	*	*
1882	zarafa	zarafa	7.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.1	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.1	cpe:2.3:a:zarafa:zarafa:7.0.1:*:*:*:*:*:*:*	*	*	*	*
1883	zarafa	zarafa	7.0.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.10	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.10	cpe:2.3:a:zarafa:zarafa:7.0.10:*:*:*:*:*:*:*	*	*	*	*
1884	zarafa	zarafa	7.0.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.11	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.11	cpe:2.3:a:zarafa:zarafa:7.0.11:*:*:*:*:*:*:*	*	*	*	*
1885	zarafa	zarafa	7.0.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.12	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.12	cpe:2.3:a:zarafa:zarafa:7.0.12:*:*:*:*:*:*:*	*	*	*	*
1886	zarafa	zarafa	7.0.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.13	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.13	cpe:2.3:a:zarafa:zarafa:7.0.13:*:*:*:*:*:*:*	*	*	*	*
1887	zarafa	zarafa	7.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.2	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.2	cpe:2.3:a:zarafa:zarafa:7.0.2:*:*:*:*:*:*:*	*	*	*	*
1888	zarafa	zarafa	7.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.3	[{"product information":"http://freecode.com/projects/zarafa/releases?page=1"},{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.3	cpe:2.3:a:zarafa:zarafa:7.0.3:*:*:*:*:*:*:*	*	*	*	*
1889	zarafa	zarafa	7.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.4	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.4	cpe:2.3:a:zarafa:zarafa:7.0.4:*:*:*:*:*:*:*	*	*	*	*
1890	zarafa	zarafa	7.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.5	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.5	cpe:2.3:a:zarafa:zarafa:7.0.5:*:*:*:*:*:*:*	*	*	*	*
1891	zarafa	zarafa	7.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.6	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.6	cpe:2.3:a:zarafa:zarafa:7.0.6:*:*:*:*:*:*:*	*	*	*	*
1892	zarafa	zarafa	7.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.7	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.7	cpe:2.3:a:zarafa:zarafa:7.0.7:*:*:*:*:*:*:*	*	*	*	*
1893	zarafa	zarafa	7.0.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.8	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.8	cpe:2.3:a:zarafa:zarafa:7.0.8:*:*:*:*:*:*:*	*	*	*	*
1894	zarafa	zarafa	7.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.0.9	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.0.9	cpe:2.3:a:zarafa:zarafa:7.0.9:*:*:*:*:*:*:*	*	*	*	*
1895	zarafa	zarafa	7.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.0	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.0	cpe:2.3:a:zarafa:zarafa:7.1.0:*:*:*:*:*:*:*	*	*	*	*
1896	zarafa	zarafa	7.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.1	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.1	cpe:2.3:a:zarafa:zarafa:7.1.1:*:*:*:*:*:*:*	*	*	*	*
1897	zarafa	zarafa	7.1.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.10	[{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.10	cpe:2.3:a:zarafa:zarafa:7.1.10:*:*:*:*:*:*:*	*	*	*	*
1898	zarafa	zarafa	7.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.2	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.2	cpe:2.3:a:zarafa:zarafa:7.1.2:*:*:*:*:*:*:*	*	*	*	*
1899	zarafa	zarafa	7.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.3	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.3	cpe:2.3:a:zarafa:zarafa:7.1.3:*:*:*:*:*:*:*	*	*	*	*
1900	zarafa	zarafa	7.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.4	[{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.4	cpe:2.3:a:zarafa:zarafa:7.1.4:*:*:*:*:*:*:*	*	*	*	*
1901	zarafa	zarafa	7.1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.8	[{"product information":"http://freecode.com/projects/zarafa/releases?page=1"},{"project information":"http://freecode.com/projects/zarafa"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.8	cpe:2.3:a:zarafa:zarafa:7.1.8:*:*:*:*:*:*:*	*	*	*	*
1902	zarafa	zarafa	7.1.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa 7.1.9	[{"product information":"http://freecode.com/projects/zarafa/releases?page=1"}]	/a	*	cpe:/a:zarafa:zarafa:7.1.9	cpe:2.3:a:zarafa:zarafa:7.1.9:*:*:*:*:*:*:*	*	*	*	*
1903	zarafa_collaboration_platform	zarafa	7.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.0	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.0	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.0:*:*:*:*:*:*:*	*	*	*	*
1904	zarafa_collaboration_platform	zarafa	7.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.1	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.1	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.1:*:*:*:*:*:*:*	*	*	*	*
1905	zarafa_collaboration_platform	zarafa	7.0.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.10	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.10	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.10:*:*:*:*:*:*:*	*	*	*	*
1906	zarafa_collaboration_platform	zarafa	7.0.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.11	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.11	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.11:*:*:*:*:*:*:*	*	*	*	*
1907	zarafa_collaboration_platform	zarafa	7.0.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.12	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.12	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.12:*:*:*:*:*:*:*	*	*	*	*
1908	zarafa_collaboration_platform	zarafa	7.0.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.13	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.13	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.13:*:*:*:*:*:*:*	*	*	*	*
1909	zarafa_collaboration_platform	zarafa	7.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.2	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.2	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.2:*:*:*:*:*:*:*	*	*	*	*
1910	zarafa_collaboration_platform	zarafa	7.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.3	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.3	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.3:*:*:*:*:*:*:*	*	*	*	*
1911	zarafa_collaboration_platform	zarafa	7.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.4	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.4	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.4:*:*:*:*:*:*:*	*	*	*	*
1912	zarafa_collaboration_platform	zarafa	7.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.5	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.5	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.5:*:*:*:*:*:*:*	*	*	*	*
1913	zarafa_collaboration_platform	zarafa	7.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.6	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.6	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.6:*:*:*:*:*:*:*	*	*	*	*
1914	zarafa_collaboration_platform	zarafa	7.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.7	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.7	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.7:*:*:*:*:*:*:*	*	*	*	*
1915	zarafa_collaboration_platform	zarafa	7.0.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.8	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.8	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.8:*:*:*:*:*:*:*	*	*	*	*
1916	zarafa_collaboration_platform	zarafa	7.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.0.9	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.0.9	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.0.9:*:*:*:*:*:*:*	*	*	*	*
1917	zarafa_collaboration_platform	zarafa	7.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.0	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.0	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.0:*:*:*:*:*:*:*	*	*	*	*
1918	zarafa_collaboration_platform	zarafa	7.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.1	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.1	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.1:*:*:*:*:*:*:*	*	*	*	*
1919	zarafa_collaboration_platform	zarafa	7.1.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.10	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.10	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.10:*:*:*:*:*:*:*	*	*	*	*
1920	zarafa_collaboration_platform	zarafa	7.1.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.11	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.11	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.11:*:*:*:*:*:*:*	*	*	*	*
1921	zarafa_collaboration_platform	zarafa	7.1.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.12	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.12	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.12:*:*:*:*:*:*:*	*	*	*	*
1922	zarafa_collaboration_platform	zarafa	7.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.2	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.2	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.2:*:*:*:*:*:*:*	*	*	*	*
1923	zarafa_collaboration_platform	zarafa	7.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.3	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.3	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.3:*:*:*:*:*:*:*	*	*	*	*
1924	zarafa_collaboration_platform	zarafa	7.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.4	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.4	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.4:*:*:*:*:*:*:*	*	*	*	*
1925	zarafa_collaboration_platform	zarafa	7.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.5	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.5	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.5:*:*:*:*:*:*:*	*	*	*	*
1926	zarafa_collaboration_platform	zarafa	7.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.6	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.6	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.6:*:*:*:*:*:*:*	*	*	*	*
1927	zarafa_collaboration_platform	zarafa	7.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.7	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.7	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.7:*:*:*:*:*:*:*	*	*	*	*
1928	zarafa_collaboration_platform	zarafa	7.1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.8	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.8	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.8:*:*:*:*:*:*:*	*	*	*	*
1929	zarafa_collaboration_platform	zarafa	7.1.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.1.9	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.1.9	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.1.9:*:*:*:*:*:*:*	*	*	*	*
1930	zarafa_collaboration_platform	zarafa	7.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zarafa Zarafa Collaboration Platform 7.2.0	[{"Vendor website":"http://www.zarafa.com/products/"}]	/a	*	cpe:/a:zarafa:zarafa_collaboration_platform:7.2.0	cpe:2.3:a:zarafa:zarafa_collaboration_platform:7.2.0:*:*:*:*:*:*:*	*	*	*	*
1931	zpaint	zcubes	1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zcubes Zpaint 1.4	[]	/a	*	cpe:/a:zcubes:zpaint:1.4	cpe:2.3:a:zcubes:zpaint:1.4:*:*:*:*:*:*:*	*	*	*	*
1932	zdstatistics	zdstatistics_project	2.0.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	 ZdStatistics plugin for WordPress 2.0.1	[{"Advisory":"http://codevigilant.com/disclosure/wp-plugin-zdstats-a3-cross-site-scripting-xss/"}]	/a	*	cpe:/a:zdstatistics_project:zdstatistics:2.0.1:-:~-~-~wordpress~~	cpe:2.3:a:zdstatistics_project:zdstatistics:2.0.1:-:-:*:-:wordpress:*:*	*	*	-	*
1933	zp_450	zebra	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zebra ZP 450 	[{"https://www.zebra.com/us/en/support-downloads/desktop/zp450.html":"https://www.zebra.com/us/en/support-downloads/desktop/zp450.html"}]	/h	*	cpe:/h:zebra:zp_450:-	cpe:2.3:h:zebra:zp_450:-:*:*:*:*:*:*:*	*	*	*	*
1934	setup_utilities	zebra_technologies	1.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zebra Technologies Setup Utilities 1.0.0	[]	/a	*	cpe:/a:zebra_technologies:setup_utilities:1.0.0	cpe:2.3:a:zebra_technologies:setup_utilities:1.0.0:*:*:*:*:*:*:*	*	*	*	*
1935	setup_utilities	zebra_technologies	1.1.4.838	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zebra Technologies Setup Utilities 1.1.4.838	[]	/a	*	cpe:/a:zebra_technologies:setup_utilities:1.1.4.838	cpe:2.3:a:zebra_technologies:setup_utilities:1.1.4.838:*:*:*:*:*:*:*	*	*	*	*
1936	mongrel	zed_shaw	0.3.13.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Mongrel 0.3.13.3	[]	/a	*	cpe:/a:zed_shaw:mongrel:0.3.13.3	cpe:2.3:a:zed_shaw:mongrel:0.3.13.3:*:*:*:*:*:*:*	*	*	*	*
1937	mongrel	zed_shaw	0.3.13.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Mongrel 0.3.13.4	[]	/a	*	cpe:/a:zed_shaw:mongrel:0.3.13.4	cpe:2.3:a:zed_shaw:mongrel:0.3.13.4:*:*:*:*:*:*:*	*	*	*	*
1938	mongrel	zed_shaw	0.3.13.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Mongrel 0.3.13.5	[]	/a	*	cpe:/a:zed_shaw:mongrel:0.3.13.5	cpe:2.3:a:zed_shaw:mongrel:0.3.13.5:*:*:*:*:*:*:*	*	*	*	*
1939	mongrel	zed_shaw	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Mongrel 1.0.1	[]	/a	*	cpe:/a:zed_shaw:mongrel:1.0.1	cpe:2.3:a:zed_shaw:mongrel:1.0.1:*:*:*:*:*:*:*	*	*	*	*
1940	zeenshare	zeenshare_project	1.0.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeenShare plugin for WordPress 1.0.1	[{"Software Website":"http://wordpress.org/support/view/plugin-reviews/zeenshare"}]	/a	*	cpe:/a:zeenshare_project:zeenshare:1.0.1:-:~-~-~wordpress~~	cpe:2.3:a:zeenshare_project:zeenshare:1.0.1:-:-:*:-:wordpress:*:*	*	*	-	*
1941	related_posts	zemanta	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.0	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.0::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.0:*:*:*:*:wordpress:*:*	*	*	*	*
1942	related_posts	zemanta	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.1:*:*:*:*:wordpress:*:*	*	*	*	*
1943	related_posts	zemanta	1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.2	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.2::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.2:*:*:*:*:wordpress:*:*	*	*	*	*
1944	related_posts	zemanta	1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.3	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.3::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.3:*:*:*:*:wordpress:*:*	*	*	*	*
1945	related_posts	zemanta	1.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.3.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.3.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.3.1:*:*:*:*:wordpress:*:*	*	*	*	*
1946	related_posts	zemanta	1.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.3.2	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.3.2::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.3.2:*:*:*:*:wordpress:*:*	*	*	*	*
1947	related_posts	zemanta	1.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.3.3	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.3.3::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.3.3:*:*:*:*:wordpress:*:*	*	*	*	*
1948	related_posts	zemanta	1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.4	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.4::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.4:*:*:*:*:wordpress:*:*	*	*	*	*
2634	zope	zope	2.9.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.6	[]	/a	*	cpe:/a:zope:zope:2.9.6	cpe:2.3:a:zope:zope:2.9.6:*:*:*:*:*:*:*	*	*	*	*
1949	related_posts	zemanta	1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.5	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.5::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.5:*:*:*:*:wordpress:*:*	*	*	*	*
1950	related_posts	zemanta	1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.6	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.6::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.6:*:*:*:*:wordpress:*:*	*	*	*	*
1951	related_posts	zemanta	1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.7	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.7::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.7:*:*:*:*:wordpress:*:*	*	*	*	*
1952	related_posts	zemanta	1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.8	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.8::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.8:*:*:*:*:wordpress:*:*	*	*	*	*
1953	related_posts	zemanta	1.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 1.8.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:1.8.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:1.8.1:*:*:*:*:wordpress:*:*	*	*	*	*
1954	related_posts	zemanta	2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.3	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.3::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.3:*:*:*:*:wordpress:*:*	*	*	*	*
1955	related_posts	zemanta	2.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.4.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.4.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.4.1:*:*:*:*:wordpress:*:*	*	*	*	*
1956	related_posts	zemanta	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.5.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.5.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.5.1:*:*:*:*:wordpress:*:*	*	*	*	*
1957	related_posts	zemanta	2.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.6	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.6::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.6:*:*:*:*:wordpress:*:*	*	*	*	*
1958	related_posts	zemanta	2.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.7	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.7::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.7:*:*:*:*:wordpress:*:*	*	*	*	*
1959	related_posts	zemanta	2.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.7.1	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.7.1::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.7.1:*:*:*:*:wordpress:*:*	*	*	*	*
1960	related_posts	zemanta	2.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Related Posts plugin for WordPress 2.7.2	[{"vendor website":"http://www.zemanta.com/"},{"version information":"http://wordpress.org/plugins/related-posts-by-zemanta/changelog/"}]	/a	*	cpe:/a:zemanta:related_posts:2.7.2::~~~wordpress~~	cpe:2.3:a:zemanta:related_posts:2.7.2:*:*:*:*:wordpress:*:*	*	*	*	*
1961	search_everything	zemanta	7.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Search Everything plugin for WordPress 7.0.2	[{"vendor website":"http://www.zemanta.com/"},{"product changelog":"http://wordpress.org/plugins/search-everything/changelog/"}]	/a	*	cpe:/a:zemanta:search_everything:7.0.2::~~~wordpress~~	cpe:2.3:a:zemanta:search_everything:7.0.2:*:*:*:*:wordpress:*:*	*	*	*	*
1962	search_everything	zemanta	7.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Search Everything plugin for WordPress 7.0.3	[{"vendor website":"http://www.zemanta.com/"},{"product changelog":"http://wordpress.org/plugins/search-everything/changelog/"}]	/a	*	cpe:/a:zemanta:search_everything:7.0.3::~~~wordpress~~	cpe:2.3:a:zemanta:search_everything:7.0.3:*:*:*:*:wordpress:*:*	*	*	*	*
1963	search_everything	zemanta	8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zemanta Search Everything plugin for WordPress 8.0	[{"vendor website":"http://www.zemanta.com/"},{"product changelog":"http://wordpress.org/plugins/search-everything/changelog/"}]	/a	*	cpe:/a:zemanta:search_everything:8.0::~~~wordpress~~	cpe:2.3:a:zemanta:search_everything:8.0:*:*:*:*:wordpress:*:*	*	*	*	*
1964	zen_cart	zen-cart	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart	[]	/a	*	cpe:/a:zen-cart:zen_cart:-	cpe:2.3:a:zen-cart:zen_cart:-:*:*:*:*:*:*:*	*	*	*	*
1965	zen_cart	zen-cart	1.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.1.0	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.1.0	cpe:2.3:a:zen-cart:zen_cart:1.1.0:*:*:*:*:*:*:*	*	*	*	*
1966	zen_cart	zen-cart	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.1.3	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.1.3	cpe:2.3:a:zen-cart:zen_cart:1.1.3:*:*:*:*:*:*:*	*	*	*	*
1967	zen_cart	zen-cart	1.2.0d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.2.0d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.0d	cpe:2.3:a:zen-cart:zen_cart:1.2.0d:*:*:*:*:*:*:*	*	*	*	*
1968	zen_cart	zen-cart	1.2.1	patch1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.2.1 Patch1	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.1:patch1	cpe:2.3:a:zen-cart:zen_cart:1.2.1:patch1:*:*:*:*:*:*	*	*	*	*
1969	zen_cart	zen-cart	1.2.1d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.2.1d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.1d	cpe:2.3:a:zen-cart:zen_cart:1.2.1d:*:*:*:*:*:*:*	*	*	*	*
1970	zen_cart	zen-cart	1.2.2d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.2.2d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.2d	cpe:2.3:a:zen-cart:zen_cart:1.2.2d:*:*:*:*:*:*:*	*	*	*	*
1971	zen_cart	zen-cart	1.2.3d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.2.3d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.3d	cpe:2.3:a:zen-cart:zen_cart:1.2.3d:*:*:*:*:*:*:*	*	*	*	*
1972	zen_cart	zen-cart	1.2.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.2.4.1	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.4.1	cpe:2.3:a:zen-cart:zen_cart:1.2.4.1:*:*:*:*:*:*:*	*	*	*	*
2716	jre	oracle	1.6.0	update_23		\N	2018-05-31 16:59:57.079077	2018-05-31 16:59:57.079077	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_23	\N	\N	\N	\N	\N
1973	zen_cart	zen-cart	1.2.4d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.2.4d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.4d	cpe:2.3:a:zen-cart:zen_cart:1.2.4d:*:*:*:*:*:*:*	*	*	*	*
1974	zen_cart	zen-cart	1.2.5d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.2.5d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.5d	cpe:2.3:a:zen-cart:zen_cart:1.2.5d:*:*:*:*:*:*:*	*	*	*	*
1975	zen_cart	zen-cart	1.2.6d	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.2.6d	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.2.6d	cpe:2.3:a:zen-cart:zen_cart:1.2.6d:*:*:*:*:*:*:*	*	*	*	*
1976	zen_cart	zen-cart	1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.3	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3	cpe:2.3:a:zen-cart:zen_cart:1.3:*:*:*:*:*:*:*	*	*	*	*
1977	zen_cart	zen-cart	1.3.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.0.2	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.0.2	cpe:2.3:a:zen-cart:zen_cart:1.3.0.2:*:*:*:*:*:*:*	*	*	*	*
1978	zen_cart	zen-cart	1.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.3.2	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.2	cpe:2.3:a:zen-cart:zen_cart:1.3.2:*:*:*:*:*:*:*	*	*	*	*
1979	zen_cart	zen-cart	1.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart Zen Cart 1.3.5	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.5	cpe:2.3:a:zen-cart:zen_cart:1.3.5:*:*:*:*:*:*:*	*	*	*	*
1980	zen_cart	zen-cart	1.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.6	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.6	cpe:2.3:a:zen-cart:zen_cart:1.3.6:*:*:*:*:*:*:*	*	*	*	*
1981	zen_cart	zen-cart	1.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.7	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.7	cpe:2.3:a:zen-cart:zen_cart:1.3.7:*:*:*:*:*:*:*	*	*	*	*
1982	zen_cart	zen-cart	1.3.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.8	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.8	cpe:2.3:a:zen-cart:zen_cart:1.3.8:*:*:*:*:*:*:*	*	*	*	*
1983	zen_cart	zen-cart	1.3.8a	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.8a	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.8a	cpe:2.3:a:zen-cart:zen_cart:1.3.8a:*:*:*:*:*:*:*	*	*	*	*
1984	zen_cart	zen-cart	1.3.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.9	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.9	cpe:2.3:a:zen-cart:zen_cart:1.3.9:*:*:*:*:*:*:*	*	*	*	*
1985	zen_cart	zen-cart	1.3.9h	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.3.9h	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.3.9h	cpe:2.3:a:zen-cart:zen_cart:1.3.9h:*:*:*:*:*:*:*	*	*	*	*
1986	zen_cart	zen-cart	1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart 1.5	[]	/a	*	cpe:/a:zen-cart:zen_cart:1.5	cpe:2.3:a:zen-cart:zen_cart:1.5:*:*:*:*:*:*:*	*	*	*	*
1987	zen_cart	zen-cart	2008	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen Cart	[]	/a	*	cpe:/a:zen-cart:zen_cart:2008	cpe:2.3:a:zen-cart:zen_cart:2008:*:*:*:*:*:*:*	*	*	*	*
1988	zen_cart	zen-cart.jp	1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen-Cart.jp Zen Cart 1.3 ja-jp	[{"Vendor website":"http://zen-cart.jp/"}]	/a	ja-jp	cpe:/a:zen-cart.jp:zen_cart:1.3:::ja-jp	cpe:2.3:a:zen-cart.jp:zen_cart:1.3:*:*:ja-jp:*:*:*:*	*	*	*	*
1989	zen_cart	zen-cart.jp	1.3.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen-Cart.jp Zen Cart 1.3.0.1 ja-jp	[{"Vendor website":"http://zen-cart.jp/"}]	/a	ja-jp	cpe:/a:zen-cart.jp:zen_cart:1.3.0.1:::ja-jp	cpe:2.3:a:zen-cart.jp:zen_cart:1.3.0.1:*:*:ja-jp:*:*:*:*	*	*	*	*
1990	zen_cart	zen-cart.jp	1.3.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen-Cart.jp Zen Cart 1.3.0.2 ja-jp	[{"Vendor website":"http://zen-cart.jp/"}]	/a	ja-jp	cpe:/a:zen-cart.jp:zen_cart:1.3.0.2:::ja-jp	cpe:2.3:a:zen-cart.jp:zen_cart:1.3.0.2:*:*:ja-jp:*:*:*:*	*	*	*	*
1991	zen_cart	zen-cart.jp	1.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zen-Cart.jp Zen Cart 1.5.0 ja-jp	[{"Vendor website":"http://zen-cart.jp/"}]	/a	ja-jp	cpe:/a:zen-cart.jp:zen_cart:1.5.0:::ja-jp	cpe:2.3:a:zen-cart.jp:zen_cart:1.5.0:*:*:ja-jp:*:*:*:*	*	*	*	*
1992	zencast	zencast	1.00.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.00.12	[]	/a	*	cpe:/a:zencast:zencast:1.00.12	cpe:2.3:a:zencast:zencast:1.00.12:*:*:*:*:*:*:*	*	*	*	*
1993	zencast	zencast	1.00.19	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.00.19	[]	/a	*	cpe:/a:zencast:zencast:1.00.19	cpe:2.3:a:zencast:zencast:1.00.19:*:*:*:*:*:*:*	*	*	*	*
1994	zencast	zencast	1.01.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.01.06	[]	/a	*	cpe:/a:zencast:zencast:1.01.06	cpe:2.3:a:zencast:zencast:1.01.06:*:*:*:*:*:*:*	*	*	*	*
1995	zencast	zencast	1.02.08	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.02.08	[]	/a	*	cpe:/a:zencast:zencast:1.02.08	cpe:2.3:a:zencast:zencast:1.02.08:*:*:*:*:*:*:*	*	*	*	*
1996	zencast	zencast	1.02.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.02.10	[]	/a	*	cpe:/a:zencast:zencast:1.02.10	cpe:2.3:a:zencast:zencast:1.02.10:*:*:*:*:*:*:*	*	*	*	*
1997	zencast	zencast	1.02.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.02.11	[]	/a	*	cpe:/a:zencast:zencast:1.02.11	cpe:2.3:a:zencast:zencast:1.02.11:*:*:*:*:*:*:*	*	*	*	*
1998	zencast	zencast	1.02.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.02.12	[]	/a	*	cpe:/a:zencast:zencast:1.02.12	cpe:2.3:a:zencast:zencast:1.02.12:*:*:*:*:*:*:*	*	*	*	*
1999	zencast	zencast	1.03.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.03.13	[]	/a	*	cpe:/a:zencast:zencast:1.03.13	cpe:2.3:a:zencast:zencast:1.03.13:*:*:*:*:*:*:*	*	*	*	*
2000	zencast	zencast	1.04.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 1.04.06	[]	/a	*	cpe:/a:zencast:zencast:1.04.06	cpe:2.3:a:zencast:zencast:1.04.06:*:*:*:*:*:*:*	*	*	*	*
2001	zencast	zencast	2.00.07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zencast Zencast 2.00.07	[]	/a	*	cpe:/a:zencast:zencast:2.00.07	cpe:2.3:a:zencast:zencast:2.00.07:*:*:*:*:*:*:*	*	*	*	*
2002	zend_framework	zend	1.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.0	[]	/a	*	cpe:/a:zend:zend_framework:1.0.0	cpe:2.3:a:zend:zend_framework:1.0.0:*:*:*:*:*:*:*	*	*	*	*
2003	zend_framework	zend	1.0.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.0.0:rc1	cpe:2.3:a:zend:zend_framework:1.0.0:rc1:*:*:*:*:*:*	*	*	*	*
2004	zend_framework	zend	1.0.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.0 Release Candidate	[]	/a	*	cpe:/a:zend:zend_framework:1.0.0:rc2	cpe:2.3:a:zend:zend_framework:1.0.0:rc2:*:*:*:*:*:*	*	*	*	*
2005	zend_framework	zend	1.0.0	rc2a	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.0 Release Candidate 2a	[]	/a	*	cpe:/a:zend:zend_framework:1.0.0:rc2a	cpe:2.3:a:zend:zend_framework:1.0.0:rc2a:*:*:*:*:*:*	*	*	*	*
2006	zend_framework	zend	1.0.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.0 Release Candidate 3	[]	/a	*	cpe:/a:zend:zend_framework:1.0.0:rc3	cpe:2.3:a:zend:zend_framework:1.0.0:rc3:*:*:*:*:*:*	*	*	*	*
2007	zend_framework	zend	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.1	[]	/a	*	cpe:/a:zend:zend_framework:1.0.1	cpe:2.3:a:zend:zend_framework:1.0.1:*:*:*:*:*:*:*	*	*	*	*
2008	zend_framework	zend	1.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.2	[]	/a	*	cpe:/a:zend:zend_framework:1.0.2	cpe:2.3:a:zend:zend_framework:1.0.2:*:*:*:*:*:*:*	*	*	*	*
2009	zend_framework	zend	1.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.3	[]	/a	*	cpe:/a:zend:zend_framework:1.0.3	cpe:2.3:a:zend:zend_framework:1.0.3:*:*:*:*:*:*:*	*	*	*	*
2010	zend_framework	zend	1.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.0.4	[]	/a	*	cpe:/a:zend:zend_framework:1.0.4	cpe:2.3:a:zend:zend_framework:1.0.4:*:*:*:*:*:*:*	*	*	*	*
2011	zend_framework	zend	1.10.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.0	[]	/a	*	cpe:/a:zend:zend_framework:1.10.0	cpe:2.3:a:zend:zend_framework:1.10.0:*:*:*:*:*:*:*	*	*	*	*
2012	zend_framework	zend	1.10.0	alpha1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.0alpha1	[]	/a	*	cpe:/a:zend:zend_framework:1.10.0:alpha1	cpe:2.3:a:zend:zend_framework:1.10.0:alpha1:*:*:*:*:*:*	*	*	*	*
2013	zend_framework	zend	1.10.0	beta1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.0beta1	[]	/a	*	cpe:/a:zend:zend_framework:1.10.0:beta1	cpe:2.3:a:zend:zend_framework:1.10.0:beta1:*:*:*:*:*:*	*	*	*	*
2014	zend_framework	zend	1.10.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.10.0:rc1	cpe:2.3:a:zend:zend_framework:1.10.0:rc1:*:*:*:*:*:*	*	*	*	*
2015	zend_framework	zend	1.10.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.1	[]	/a	*	cpe:/a:zend:zend_framework:1.10.1	cpe:2.3:a:zend:zend_framework:1.10.1:*:*:*:*:*:*:*	*	*	*	*
2016	zend_framework	zend	1.10.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.2	[]	/a	*	cpe:/a:zend:zend_framework:1.10.2	cpe:2.3:a:zend:zend_framework:1.10.2:*:*:*:*:*:*:*	*	*	*	*
2017	zend_framework	zend	1.10.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.3	[]	/a	*	cpe:/a:zend:zend_framework:1.10.3	cpe:2.3:a:zend:zend_framework:1.10.3:*:*:*:*:*:*:*	*	*	*	*
2018	zend_framework	zend	1.10.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.4	[]	/a	*	cpe:/a:zend:zend_framework:1.10.4	cpe:2.3:a:zend:zend_framework:1.10.4:*:*:*:*:*:*:*	*	*	*	*
2019	zend_framework	zend	1.10.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.5	[]	/a	*	cpe:/a:zend:zend_framework:1.10.5	cpe:2.3:a:zend:zend_framework:1.10.5:*:*:*:*:*:*:*	*	*	*	*
2020	zend_framework	zend	1.10.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.6	[]	/a	*	cpe:/a:zend:zend_framework:1.10.6	cpe:2.3:a:zend:zend_framework:1.10.6:*:*:*:*:*:*:*	*	*	*	*
2021	zend_framework	zend	1.10.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.7	[]	/a	*	cpe:/a:zend:zend_framework:1.10.7	cpe:2.3:a:zend:zend_framework:1.10.7:*:*:*:*:*:*:*	*	*	*	*
2022	zend_framework	zend	1.10.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.8	[]	/a	*	cpe:/a:zend:zend_framework:1.10.8	cpe:2.3:a:zend:zend_framework:1.10.8:*:*:*:*:*:*:*	*	*	*	*
2023	zend_framework	zend	1.10.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.10.9	[]	/a	*	cpe:/a:zend:zend_framework:1.10.9	cpe:2.3:a:zend:zend_framework:1.10.9:*:*:*:*:*:*:*	*	*	*	*
2024	zend_framework	zend	1.11.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.0	[]	/a	*	cpe:/a:zend:zend_framework:1.11.0	cpe:2.3:a:zend:zend_framework:1.11.0:*:*:*:*:*:*:*	*	*	*	*
2025	zend_framework	zend	1.11.0	b1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.0b1	[]	/a	*	cpe:/a:zend:zend_framework:1.11.0:b1	cpe:2.3:a:zend:zend_framework:1.11.0:b1:*:*:*:*:*:*	*	*	*	*
2026	zend_framework	zend	1.11.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.11.0:rc1	cpe:2.3:a:zend:zend_framework:1.11.0:rc1:*:*:*:*:*:*	*	*	*	*
2027	zend_framework	zend	1.11.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.1	[]	/a	*	cpe:/a:zend:zend_framework:1.11.1	cpe:2.3:a:zend:zend_framework:1.11.1:*:*:*:*:*:*:*	*	*	*	*
2028	zend_framework	zend	1.11.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.10	[]	/a	*	cpe:/a:zend:zend_framework:1.11.10	cpe:2.3:a:zend:zend_framework:1.11.10:*:*:*:*:*:*:*	*	*	*	*
2029	zend_framework	zend	1.11.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.11	[]	/a	*	cpe:/a:zend:zend_framework:1.11.11	cpe:2.3:a:zend:zend_framework:1.11.11:*:*:*:*:*:*:*	*	*	*	*
2030	zend_framework	zend	1.11.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.12	[]	/a	*	cpe:/a:zend:zend_framework:1.11.12	cpe:2.3:a:zend:zend_framework:1.11.12:*:*:*:*:*:*:*	*	*	*	*
2031	zend_framework	zend	1.11.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.13	[]	/a	*	cpe:/a:zend:zend_framework:1.11.13	cpe:2.3:a:zend:zend_framework:1.11.13:*:*:*:*:*:*:*	*	*	*	*
2032	zend_framework	zend	1.11.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.2	[]	/a	*	cpe:/a:zend:zend_framework:1.11.2	cpe:2.3:a:zend:zend_framework:1.11.2:*:*:*:*:*:*:*	*	*	*	*
2033	zend_framework	zend	1.11.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.3	[]	/a	*	cpe:/a:zend:zend_framework:1.11.3	cpe:2.3:a:zend:zend_framework:1.11.3:*:*:*:*:*:*:*	*	*	*	*
2034	zend_framework	zend	1.11.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.4	[]	/a	*	cpe:/a:zend:zend_framework:1.11.4	cpe:2.3:a:zend:zend_framework:1.11.4:*:*:*:*:*:*:*	*	*	*	*
2035	zend_framework	zend	1.11.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.5	[]	/a	*	cpe:/a:zend:zend_framework:1.11.5	cpe:2.3:a:zend:zend_framework:1.11.5:*:*:*:*:*:*:*	*	*	*	*
2036	zend_framework	zend	1.11.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.6	[]	/a	*	cpe:/a:zend:zend_framework:1.11.6	cpe:2.3:a:zend:zend_framework:1.11.6:*:*:*:*:*:*:*	*	*	*	*
2037	zend_framework	zend	1.11.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.7	[]	/a	*	cpe:/a:zend:zend_framework:1.11.7	cpe:2.3:a:zend:zend_framework:1.11.7:*:*:*:*:*:*:*	*	*	*	*
2038	zend_framework	zend	1.11.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.8	[]	/a	*	cpe:/a:zend:zend_framework:1.11.8	cpe:2.3:a:zend:zend_framework:1.11.8:*:*:*:*:*:*:*	*	*	*	*
2039	zend_framework	zend	1.11.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.11.9	[]	/a	*	cpe:/a:zend:zend_framework:1.11.9	cpe:2.3:a:zend:zend_framework:1.11.9:*:*:*:*:*:*:*	*	*	*	*
2040	zend_framework	zend	1.12.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.0	[]	/a	*	cpe:/a:zend:zend_framework:1.12.0	cpe:2.3:a:zend:zend_framework:1.12.0:*:*:*:*:*:*:*	*	*	*	*
2041	zend_framework	zend	1.12.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.12.0:rc1	cpe:2.3:a:zend:zend_framework:1.12.0:rc1:*:*:*:*:*:*	*	*	*	*
2042	zend_framework	zend	1.12.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.0 Release Candidate 2	[]	/a	*	cpe:/a:zend:zend_framework:1.12.0:rc2	cpe:2.3:a:zend:zend_framework:1.12.0:rc2:*:*:*:*:*:*	*	*	*	*
2043	zend_framework	zend	1.12.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.0 Release Candidate 3	[]	/a	*	cpe:/a:zend:zend_framework:1.12.0:rc3	cpe:2.3:a:zend:zend_framework:1.12.0:rc3:*:*:*:*:*:*	*	*	*	*
2044	zend_framework	zend	1.12.0	rc4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.0 Release Candidate 4	[]	/a	*	cpe:/a:zend:zend_framework:1.12.0:rc4	cpe:2.3:a:zend:zend_framework:1.12.0:rc4:*:*:*:*:*:*	*	*	*	*
2078	zend_framework	zend	1.7.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.6	[]	/a	*	cpe:/a:zend:zend_framework:1.7.6	cpe:2.3:a:zend:zend_framework:1.7.6:*:*:*:*:*:*:*	*	*	*	*
2045	zend_framework	zend	1.12.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.10	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.10	cpe:2.3:a:zend:zend_framework:1.12.10:*:*:*:*:*:*:*	*	*	*	*
2046	zend_framework	zend	1.12.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.11	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.11	cpe:2.3:a:zend:zend_framework:1.12.11:*:*:*:*:*:*:*	*	*	*	*
2047	zend_framework	zend	1.12.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.12	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.12	cpe:2.3:a:zend:zend_framework:1.12.12:*:*:*:*:*:*:*	*	*	*	*
2048	zend_framework	zend	1.12.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.13	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.13	cpe:2.3:a:zend:zend_framework:1.12.13:*:*:*:*:*:*:*	*	*	*	*
2049	zend_framework	zend	1.12.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.15	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.15	cpe:2.3:a:zend:zend_framework:1.12.15:*:*:*:*:*:*:*	*	*	*	*
2050	zend_framework	zend	1.12.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.4	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.4	cpe:2.3:a:zend:zend_framework:1.12.4:*:*:*:*:*:*:*	*	*	*	*
2051	zend_framework	zend	1.12.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.6	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.6	cpe:2.3:a:zend:zend_framework:1.12.6:*:*:*:*:*:*:*	*	*	*	*
2052	zend_framework	zend	1.12.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.8	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.8	cpe:2.3:a:zend:zend_framework:1.12.8:*:*:*:*:*:*:*	*	*	*	*
2053	zend_framework	zend	1.12.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.12.9	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:1.12.9	cpe:2.3:a:zend:zend_framework:1.12.9:*:*:*:*:*:*:*	*	*	*	*
2054	zend_framework	zend	1.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0	cpe:2.3:a:zend:zend_framework:1.5.0:*:*:*:*:*:*:*	*	*	*	*
2055	zend_framework	zend	1.5.0	pl	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0pl	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0:pl	cpe:2.3:a:zend:zend_framework:1.5.0:pl:*:*:*:*:*:*	*	*	*	*
2056	zend_framework	zend	1.5.0	pr	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0PR	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0:pr	cpe:2.3:a:zend:zend_framework:1.5.0:pr:*:*:*:*:*:*	*	*	*	*
2057	zend_framework	zend	1.5.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0:rc1	cpe:2.3:a:zend:zend_framework:1.5.0:rc1:*:*:*:*:*:*	*	*	*	*
2058	zend_framework	zend	1.5.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0 Release Candidate 2	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0:rc2	cpe:2.3:a:zend:zend_framework:1.5.0:rc2:*:*:*:*:*:*	*	*	*	*
2059	zend_framework	zend	1.5.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.0 Release Candidate 3	[]	/a	*	cpe:/a:zend:zend_framework:1.5.0:rc3	cpe:2.3:a:zend:zend_framework:1.5.0:rc3:*:*:*:*:*:*	*	*	*	*
2060	zend_framework	zend	1.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.1	[]	/a	*	cpe:/a:zend:zend_framework:1.5.1	cpe:2.3:a:zend:zend_framework:1.5.1:*:*:*:*:*:*:*	*	*	*	*
2061	zend_framework	zend	1.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.2	[]	/a	*	cpe:/a:zend:zend_framework:1.5.2	cpe:2.3:a:zend:zend_framework:1.5.2:*:*:*:*:*:*:*	*	*	*	*
2062	zend_framework	zend	1.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.5.3	[]	/a	*	cpe:/a:zend:zend_framework:1.5.3	cpe:2.3:a:zend:zend_framework:1.5.3:*:*:*:*:*:*:*	*	*	*	*
2063	zend_framework	zend	1.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.0	[]	/a	*	cpe:/a:zend:zend_framework:1.6.0	cpe:2.3:a:zend:zend_framework:1.6.0:*:*:*:*:*:*:*	*	*	*	*
2064	zend_framework	zend	1.6.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.0 Release Candidate 1	[]	/a	*	cpe:/a:zend:zend_framework:1.6.0:rc1	cpe:2.3:a:zend:zend_framework:1.6.0:rc1:*:*:*:*:*:*	*	*	*	*
2065	zend_framework	zend	1.6.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.0 Release Candidate 2	[]	/a	*	cpe:/a:zend:zend_framework:1.6.0:rc2	cpe:2.3:a:zend:zend_framework:1.6.0:rc2:*:*:*:*:*:*	*	*	*	*
2066	zend_framework	zend	1.6.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.0 Release Candidate 3	[]	/a	*	cpe:/a:zend:zend_framework:1.6.0:rc3	cpe:2.3:a:zend:zend_framework:1.6.0:rc3:*:*:*:*:*:*	*	*	*	*
2067	zend_framework	zend	1.6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.1	[]	/a	*	cpe:/a:zend:zend_framework:1.6.1	cpe:2.3:a:zend:zend_framework:1.6.1:*:*:*:*:*:*:*	*	*	*	*
2068	zend_framework	zend	1.6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.6.2	[]	/a	*	cpe:/a:zend:zend_framework:1.6.2	cpe:2.3:a:zend:zend_framework:1.6.2:*:*:*:*:*:*:*	*	*	*	*
2069	zend_framework	zend	1.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.0	[]	/a	*	cpe:/a:zend:zend_framework:1.7.0	cpe:2.3:a:zend:zend_framework:1.7.0:*:*:*:*:*:*:*	*	*	*	*
2070	zend_framework	zend	1.7.0	pl1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.0pl1	[]	/a	*	cpe:/a:zend:zend_framework:1.7.0:pl1	cpe:2.3:a:zend:zend_framework:1.7.0:pl1:*:*:*:*:*:*	*	*	*	*
2071	zend_framework	zend	1.7.0	pr	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.0pr	[]	/a	*	cpe:/a:zend:zend_framework:1.7.0:pr	cpe:2.3:a:zend:zend_framework:1.7.0:pr:*:*:*:*:*:*	*	*	*	*
2072	zend_framework	zend	1.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.1	[]	/a	*	cpe:/a:zend:zend_framework:1.7.1	cpe:2.3:a:zend:zend_framework:1.7.1:*:*:*:*:*:*:*	*	*	*	*
2073	zend_framework	zend	1.7.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.2	[]	/a	*	cpe:/a:zend:zend_framework:1.7.2	cpe:2.3:a:zend:zend_framework:1.7.2:*:*:*:*:*:*:*	*	*	*	*
2074	zend_framework	zend	1.7.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.3	[]	/a	*	cpe:/a:zend:zend_framework:1.7.3	cpe:2.3:a:zend:zend_framework:1.7.3:*:*:*:*:*:*:*	*	*	*	*
2075	zend_framework	zend	1.7.3	pl1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.3pl1	[]	/a	*	cpe:/a:zend:zend_framework:1.7.3:pl1	cpe:2.3:a:zend:zend_framework:1.7.3:pl1:*:*:*:*:*:*	*	*	*	*
2076	zend_framework	zend	1.7.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.4	[]	/a	*	cpe:/a:zend:zend_framework:1.7.4	cpe:2.3:a:zend:zend_framework:1.7.4:*:*:*:*:*:*:*	*	*	*	*
2077	zend_framework	zend	1.7.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.5	[]	/a	*	cpe:/a:zend:zend_framework:1.7.5	cpe:2.3:a:zend:zend_framework:1.7.5:*:*:*:*:*:*:*	*	*	*	*
2079	zend_framework	zend	1.7.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.7	[]	/a	*	cpe:/a:zend:zend_framework:1.7.7	cpe:2.3:a:zend:zend_framework:1.7.7:*:*:*:*:*:*:*	*	*	*	*
2080	zend_framework	zend	1.7.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.8	[]	/a	*	cpe:/a:zend:zend_framework:1.7.8	cpe:2.3:a:zend:zend_framework:1.7.8:*:*:*:*:*:*:*	*	*	*	*
2081	zend_framework	zend	1.7.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.7.9	[]	/a	*	cpe:/a:zend:zend_framework:1.7.9	cpe:2.3:a:zend:zend_framework:1.7.9:*:*:*:*:*:*:*	*	*	*	*
2082	zend_framework	zend	1.8.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.0	[]	/a	*	cpe:/a:zend:zend_framework:1.8.0	cpe:2.3:a:zend:zend_framework:1.8.0:*:*:*:*:*:*:*	*	*	*	*
2083	zend_framework	zend	1.8.0	a1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.0a1	[]	/a	*	cpe:/a:zend:zend_framework:1.8.0:a1	cpe:2.3:a:zend:zend_framework:1.8.0:a1:*:*:*:*:*:*	*	*	*	*
2084	zend_framework	zend	1.8.0	b1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.0b1	[]	/a	*	cpe:/a:zend:zend_framework:1.8.0:b1	cpe:2.3:a:zend:zend_framework:1.8.0:b1:*:*:*:*:*:*	*	*	*	*
2085	zend_framework	zend	1.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.1	[]	/a	*	cpe:/a:zend:zend_framework:1.8.1	cpe:2.3:a:zend:zend_framework:1.8.1:*:*:*:*:*:*:*	*	*	*	*
2086	zend_framework	zend	1.8.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.2	[]	/a	*	cpe:/a:zend:zend_framework:1.8.2	cpe:2.3:a:zend:zend_framework:1.8.2:*:*:*:*:*:*:*	*	*	*	*
2087	zend_framework	zend	1.8.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.3	[]	/a	*	cpe:/a:zend:zend_framework:1.8.3	cpe:2.3:a:zend:zend_framework:1.8.3:*:*:*:*:*:*:*	*	*	*	*
2088	zend_framework	zend	1.8.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.4	[]	/a	*	cpe:/a:zend:zend_framework:1.8.4	cpe:2.3:a:zend:zend_framework:1.8.4:*:*:*:*:*:*:*	*	*	*	*
2089	zend_framework	zend	1.8.4	pl1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.4pl1	[]	/a	*	cpe:/a:zend:zend_framework:1.8.4:pl1	cpe:2.3:a:zend:zend_framework:1.8.4:pl1:*:*:*:*:*:*	*	*	*	*
2090	zend_framework	zend	1.8.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.8.5	[]	/a	*	cpe:/a:zend:zend_framework:1.8.5	cpe:2.3:a:zend:zend_framework:1.8.5:*:*:*:*:*:*:*	*	*	*	*
2091	zend_framework	zend	1.9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.0	[]	/a	*	cpe:/a:zend:zend_framework:1.9.0	cpe:2.3:a:zend:zend_framework:1.9.0:*:*:*:*:*:*:*	*	*	*	*
2092	zend_framework	zend	1.9.0	a1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.0a1	[]	/a	*	cpe:/a:zend:zend_framework:1.9.0:a1	cpe:2.3:a:zend:zend_framework:1.9.0:a1:*:*:*:*:*:*	*	*	*	*
2093	zend_framework	zend	1.9.0	b1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.0b1	[]	/a	*	cpe:/a:zend:zend_framework:1.9.0:b1	cpe:2.3:a:zend:zend_framework:1.9.0:b1:*:*:*:*:*:*	*	*	*	*
2094	zend_framework	zend	1.9.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.0rc1	[]	/a	*	cpe:/a:zend:zend_framework:1.9.0:rc1	cpe:2.3:a:zend:zend_framework:1.9.0:rc1:*:*:*:*:*:*	*	*	*	*
2095	zend_framework	zend	1.9.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.1	[]	/a	*	cpe:/a:zend:zend_framework:1.9.1	cpe:2.3:a:zend:zend_framework:1.9.1:*:*:*:*:*:*:*	*	*	*	*
2096	zend_framework	zend	1.9.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.2	[]	/a	*	cpe:/a:zend:zend_framework:1.9.2	cpe:2.3:a:zend:zend_framework:1.9.2:*:*:*:*:*:*:*	*	*	*	*
2097	zend_framework	zend	1.9.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.3	[]	/a	*	cpe:/a:zend:zend_framework:1.9.3	cpe:2.3:a:zend:zend_framework:1.9.3:*:*:*:*:*:*:*	*	*	*	*
2098	zend_framework	zend	1.9.3	pl1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.3pl1	[]	/a	*	cpe:/a:zend:zend_framework:1.9.3:pl1	cpe:2.3:a:zend:zend_framework:1.9.3:pl1:*:*:*:*:*:*	*	*	*	*
2099	zend_framework	zend	1.9.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.4	[]	/a	*	cpe:/a:zend:zend_framework:1.9.4	cpe:2.3:a:zend:zend_framework:1.9.4:*:*:*:*:*:*:*	*	*	*	*
2100	zend_framework	zend	1.9.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.5	[]	/a	*	cpe:/a:zend:zend_framework:1.9.5	cpe:2.3:a:zend:zend_framework:1.9.5:*:*:*:*:*:*:*	*	*	*	*
2101	zend_framework	zend	1.9.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.6	[]	/a	*	cpe:/a:zend:zend_framework:1.9.6	cpe:2.3:a:zend:zend_framework:1.9.6:*:*:*:*:*:*:*	*	*	*	*
2102	zend_framework	zend	1.9.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.7	[]	/a	*	cpe:/a:zend:zend_framework:1.9.7	cpe:2.3:a:zend:zend_framework:1.9.7:*:*:*:*:*:*:*	*	*	*	*
2103	zend_framework	zend	1.9.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 1.9.8	[]	/a	*	cpe:/a:zend:zend_framework:1.9.8	cpe:2.3:a:zend:zend_framework:1.9.8:*:*:*:*:*:*:*	*	*	*	*
2104	zend_framework	zend	2.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0	cpe:2.3:a:zend:zend_framework:2.0.0:*:*:*:*:*:*:*	*	*	*	*
2105	zend_framework	zend	2.0.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 1	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc1	cpe:2.3:a:zend:zend_framework:2.0.0:rc1:*:*:*:*:*:*	*	*	*	*
2106	zend_framework	zend	2.0.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 2	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc2	cpe:2.3:a:zend:zend_framework:2.0.0:rc2:*:*:*:*:*:*	*	*	*	*
2107	zend_framework	zend	2.0.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 3	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc3	cpe:2.3:a:zend:zend_framework:2.0.0:rc3:*:*:*:*:*:*	*	*	*	*
2108	zend_framework	zend	2.0.0	rc4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 4	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc4	cpe:2.3:a:zend:zend_framework:2.0.0:rc4:*:*:*:*:*:*	*	*	*	*
2109	zend_framework	zend	2.0.0	rc5	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 5	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc5	cpe:2.3:a:zend:zend_framework:2.0.0:rc5:*:*:*:*:*:*	*	*	*	*
2110	zend_framework	zend	2.0.0	rc6	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 6	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc6	cpe:2.3:a:zend:zend_framework:2.0.0:rc6:*:*:*:*:*:*	*	*	*	*
2111	zend_framework	zend	2.0.0	rc7	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.0 Release Candidate 7	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.0:rc7	cpe:2.3:a:zend:zend_framework:2.0.0:rc7:*:*:*:*:*:*	*	*	*	*
2776	jdk	sun	1.5.0	update16		\N	2018-05-31 16:59:57.454382	2018-05-31 16:59:57.454382	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update16	\N	\N	\N	\N	\N
2112	zend_framework	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.1	cpe:2.3:a:zend:zend_framework:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2113	zend_framework	zend	2.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.2	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.2	cpe:2.3:a:zend:zend_framework:2.0.2:*:*:*:*:*:*:*	*	*	*	*
2114	zend_framework	zend	2.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.3	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.3	cpe:2.3:a:zend:zend_framework:2.0.3:*:*:*:*:*:*:*	*	*	*	*
2115	zend_framework	zend	2.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.4	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.4	cpe:2.3:a:zend:zend_framework:2.0.4:*:*:*:*:*:*:*	*	*	*	*
2116	zend_framework	zend	2.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.5	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.5	cpe:2.3:a:zend:zend_framework:2.0.5:*:*:*:*:*:*:*	*	*	*	*
2117	zend_framework	zend	2.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.6	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.6	cpe:2.3:a:zend:zend_framework:2.0.6:*:*:*:*:*:*:*	*	*	*	*
2118	zend_framework	zend	2.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.0.7	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.0.7	cpe:2.3:a:zend:zend_framework:2.0.7:*:*:*:*:*:*:*	*	*	*	*
2119	zend_framework	zend	2.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.0	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.0	cpe:2.3:a:zend:zend_framework:2.1.0:*:*:*:*:*:*:*	*	*	*	*
2120	zend_framework	zend	2.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.1	cpe:2.3:a:zend:zend_framework:2.1.1:*:*:*:*:*:*:*	*	*	*	*
2121	zend_framework	zend	2.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.2	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.2	cpe:2.3:a:zend:zend_framework:2.1.2:*:*:*:*:*:*:*	*	*	*	*
2122	zend_framework	zend	2.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.3	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.3	cpe:2.3:a:zend:zend_framework:2.1.3:*:*:*:*:*:*:*	*	*	*	*
2123	zend_framework	zend	2.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.4	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.4	cpe:2.3:a:zend:zend_framework:2.1.4:*:*:*:*:*:*:*	*	*	*	*
2124	zend_framework	zend	2.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Zend Framework 2.1.5	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.5	cpe:2.3:a:zend:zend_framework:2.1.5:*:*:*:*:*:*:*	*	*	*	*
2125	zend_framework	zend	2.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.1.6	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.1.6	cpe:2.3:a:zend:zend_framework:2.1.6:*:*:*:*:*:*:*	*	*	*	*
2126	zend_framework	zend	2.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.2.0	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.2.0	cpe:2.3:a:zend:zend_framework:2.2.0:*:*:*:*:*:*:*	*	*	*	*
2127	zend_framework	zend	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.2.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.2.1	cpe:2.3:a:zend:zend_framework:2.2.1:*:*:*:*:*:*:*	*	*	*	*
2128	zend_framework	zend	2.2.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.2.10	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.2.10	cpe:2.3:a:zend:zend_framework:2.2.10:*:*:*:*:*:*:*	*	*	*	*
2129	zend_framework	zend	2.2.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.2.8	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.2.8	cpe:2.3:a:zend:zend_framework:2.2.8:*:*:*:*:*:*:*	*	*	*	*
2130	zend_framework	zend	2.2.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.2.9	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.2.9	cpe:2.3:a:zend:zend_framework:2.2.9:*:*:*:*:*:*:*	*	*	*	*
2131	zend_framework	zend	2.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.3	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.3	cpe:2.3:a:zend:zend_framework:2.3.3:*:*:*:*:*:*:*	*	*	*	*
2132	zend_framework	zend	2.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.4	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.4	cpe:2.3:a:zend:zend_framework:2.3.4:*:*:*:*:*:*:*	*	*	*	*
2133	zend_framework	zend	2.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.5	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.5	cpe:2.3:a:zend:zend_framework:2.3.5:*:*:*:*:*:*:*	*	*	*	*
2134	zend_framework	zend	2.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.6	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.6	cpe:2.3:a:zend:zend_framework:2.3.6:*:*:*:*:*:*:*	*	*	*	*
2135	zend_framework	zend	2.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.7	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.7	cpe:2.3:a:zend:zend_framework:2.3.7:*:*:*:*:*:*:*	*	*	*	*
2136	zend_framework	zend	2.3.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.8	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.8	cpe:2.3:a:zend:zend_framework:2.3.8:*:*:*:*:*:*:*	*	*	*	*
2137	zend_framework	zend	2.3.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.3.9	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.3.9	cpe:2.3:a:zend:zend_framework:2.3.9:*:*:*:*:*:*:*	*	*	*	*
2777	jdk	sun	1.5.0	update17		\N	2018-05-31 16:59:57.460627	2018-05-31 16:59:57.460627	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update17	\N	\N	\N	\N	\N
2138	zend_framework	zend	2.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.0	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.0	cpe:2.3:a:zend:zend_framework:2.4.0:*:*:*:*:*:*:*	*	*	*	*
2139	zend_framework	zend	2.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.1	cpe:2.3:a:zend:zend_framework:2.4.1:*:*:*:*:*:*:*	*	*	*	*
2140	zend_framework	zend	2.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.2	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.2	cpe:2.3:a:zend:zend_framework:2.4.2:*:*:*:*:*:*:*	*	*	*	*
2141	zend_framework	zend	2.4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.3	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.3	cpe:2.3:a:zend:zend_framework:2.4.3:*:*:*:*:*:*:*	*	*	*	*
2142	zend_framework	zend	2.4.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.4	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.4	cpe:2.3:a:zend:zend_framework:2.4.4:*:*:*:*:*:*:*	*	*	*	*
2143	zend_framework	zend	2.4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.4.5	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.4.5	cpe:2.3:a:zend:zend_framework:2.4.5:*:*:*:*:*:*:*	*	*	*	*
2144	zend_framework	zend	2.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.5.0	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zend_framework:2.5.0	cpe:2.3:a:zend:zend_framework:2.5.0:*:*:*:*:*:*:*	*	*	*	*
2145	zend_framework	zend	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Framework 2.5.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zend_framework:2.5.1	cpe:2.3:a:zend:zend_framework:2.5.1:*:*:*:*:*:*:*	*	*	*	*
2146	zend_server	zend	5.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend Server 5.1.0	[]	/a	*	cpe:/a:zend:zend_server:5.1.0	cpe:2.3:a:zend:zend_server:5.1.0:*:*:*:*:*:*:*	*	*	*	*
2147	zendopenid	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendOpenID 2.0.1	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zendopenid:2.0.1	cpe:2.3:a:zend:zendopenid:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2148	zendrest	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendRest 2.0.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zendrest:2.0.1	cpe:2.3:a:zend:zendrest:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2149	zendservice_amazon	zend	2.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_Amazon 2.0.2	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zendservice_amazon:2.0.2	cpe:2.3:a:zend:zendservice_amazon:2.0.2:*:*:*:*:*:*:*	*	*	*	*
2150	zendservice_api	zend	1.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_API 1.0.0	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zendservice_api:1.0.0	cpe:2.3:a:zend:zendservice_api:1.0.0:*:*:*:*:*:*:*	*	*	*	*
2151	zendservice_audioscrobbler	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_AudioScrobbler 2.0.1	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zendservice_audioscrobbler:2.0.1	cpe:2.3:a:zend:zendservice_audioscrobbler:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2152	zendservice_nirvanix	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_Nirvanix 2.0.1	[{"Vendor":"http://framework.zend.com/"},{"Version":"http://framework.zend.com/changelog/"}]	/a	*	cpe:/a:zend:zendservice_nirvanix:2.0.1	cpe:2.3:a:zend:zendservice_nirvanix:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2153	zendservice_slideshare	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_SlideShare 2.0.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zendservice_slideshare:2.0.1	cpe:2.3:a:zend:zendservice_slideshare:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2154	zendservice_technorati	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_Technorati 2.0.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zendservice_technorati:2.0.1	cpe:2.3:a:zend:zendservice_technorati:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2155	zendservice_windowsazure	zend	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zend ZendService_WindowsAzure 2.0.1	[{"Version":"http://framework.zend.com/changelog/"},{"Vendor":"http://framework.zend.com/"}]	/a	*	cpe:/a:zend:zendservice_windowsazure:2.0.1	cpe:2.3:a:zend:zendservice_windowsazure:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2156	zendto	zend	4.00	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.00	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.00	cpe:2.3:a:zend:zendto:4.00:*:*:*:*:*:*:*	*	*	*	*
2157	zendto	zend	4.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.01	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.01	cpe:2.3:a:zend:zendto:4.01:*:*:*:*:*:*:*	*	*	*	*
2158	zendto	zend	4.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.02	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.02	cpe:2.3:a:zend:zendto:4.02:*:*:*:*:*:*:*	*	*	*	*
2159	zendto	zend	4.03-3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.03-3	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.03-3	cpe:2.3:a:zend:zendto:4.03-3:*:*:*:*:*:*:*	*	*	*	*
2160	zendto	zend	4.05-2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.05-2	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.05-2	cpe:2.3:a:zend:zendto:4.05-2:*:*:*:*:*:*:*	*	*	*	*
2161	zendto	zend	4.06-2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.06-2	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.06-2	cpe:2.3:a:zend:zendto:4.06-2:*:*:*:*:*:*:*	*	*	*	*
2162	zendto	zend	4.07-1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.07-1	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.07-1	cpe:2.3:a:zend:zendto:4.07-1:*:*:*:*:*:*:*	*	*	*	*
2163	zendto	zend	4.08-4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.08-4	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.08-4	cpe:2.3:a:zend:zendto:4.08-4:*:*:*:*:*:*:*	*	*	*	*
2164	zendto	zend	4.09-1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.09-1	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.09-1	cpe:2.3:a:zend:zendto:4.09-1:*:*:*:*:*:*:*	*	*	*	*
2165	zendto	zend	4.10-4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.10-4	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.10-4	cpe:2.3:a:zend:zendto:4.10-4:*:*:*:*:*:*:*	*	*	*	*
2778	jdk	sun	1.5.0	update18		\N	2018-05-31 16:59:57.466463	2018-05-31 16:59:57.466463	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update18	\N	\N	\N	\N	\N
2166	zendto	zend	4.10-5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.10-5	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.10-5	cpe:2.3:a:zend:zendto:4.10-5:*:*:*:*:*:*:*	*	*	*	*
2167	zendto	zend	4.11-1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-1	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-1	cpe:2.3:a:zend:zendto:4.11-1:*:*:*:*:*:*:*	*	*	*	*
2168	zendto	zend	4.11-10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-10	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-10	cpe:2.3:a:zend:zendto:4.11-10:*:*:*:*:*:*:*	*	*	*	*
2169	zendto	zend	4.11-11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-11	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-11	cpe:2.3:a:zend:zendto:4.11-11:*:*:*:*:*:*:*	*	*	*	*
2170	zendto	zend	4.11-12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-12	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-12	cpe:2.3:a:zend:zendto:4.11-12:*:*:*:*:*:*:*	*	*	*	*
2171	zendto	zend	4.11-13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-13	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-13	cpe:2.3:a:zend:zendto:4.11-13:*:*:*:*:*:*:*	*	*	*	*
2172	zendto	zend	4.11-14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-14	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-14	cpe:2.3:a:zend:zendto:4.11-14:*:*:*:*:*:*:*	*	*	*	*
2173	zendto	zend	4.11-2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-2	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-2	cpe:2.3:a:zend:zendto:4.11-2:*:*:*:*:*:*:*	*	*	*	*
2174	zendto	zend	4.11-3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-3	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-3	cpe:2.3:a:zend:zendto:4.11-3:*:*:*:*:*:*:*	*	*	*	*
2175	zendto	zend	4.11-4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-4	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-4	cpe:2.3:a:zend:zendto:4.11-4:*:*:*:*:*:*:*	*	*	*	*
2176	zendto	zend	4.11-5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-5	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-5	cpe:2.3:a:zend:zendto:4.11-5:*:*:*:*:*:*:*	*	*	*	*
2177	zendto	zend	4.11-7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-7	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-7	cpe:2.3:a:zend:zendto:4.11-7:*:*:*:*:*:*:*	*	*	*	*
2178	zendto	zend	4.11-8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-8	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-8	cpe:2.3:a:zend:zendto:4.11-8:*:*:*:*:*:*:*	*	*	*	*
2179	zendto	zend	4.11-9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZendTo 4.11-9	[{"product changelog":"http://www.zend.to/changelog.php"}]	/a	*	cpe:/a:zend:zendto:4.11-9	cpe:2.3:a:zend:zendto:4.11-9:*:*:*:*:*:*:*	*	*	*	*
2180	zenoss	zenoss	4.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenoss Zenoss 4.2.5	[{"vendor product website":"http://www.zenoss.com/"}]	/a	*	cpe:/a:zenoss:zenoss:4.2.5	cpe:2.3:a:zenoss:zenoss:4.2.5:*:*:*:*:*:*:*	*	*	*	*
2181	zenphoto	zenphoto	0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 0.9	[]	/a	*	cpe:/a:zenphoto:zenphoto:0.9	cpe:2.3:a:zenphoto:zenphoto:0.9:*:*:*:*:*:*:*	*	*	*	*
2182	zenphoto	zenphoto	1.0	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.0 Beta	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.0:beta	cpe:2.3:a:zenphoto:zenphoto:1.0:beta:*:*:*:*:*:*	*	*	*	*
2183	zenphoto	zenphoto	1.0.1	beta	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.0.1 Beta	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.0.1:beta	cpe:2.3:a:zenphoto:zenphoto:1.0.1:beta:*:*:*:*:*:*	*	*	*	*
2184	zenphoto	zenphoto	1.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.0.4	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.0.4	cpe:2.3:a:zenphoto:zenphoto:1.0.4:*:*:*:*:*:*:*	*	*	*	*
2185	zenphoto	zenphoto	1.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.0.5	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.0.5	cpe:2.3:a:zenphoto:zenphoto:1.0.5:*:*:*:*:*:*:*	*	*	*	*
2186	zenphoto	zenphoto	1.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.0.6	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.0.6	cpe:2.3:a:zenphoto:zenphoto:1.0.6:*:*:*:*:*:*:*	*	*	*	*
2187	zenphoto	zenphoto	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.1	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.1	cpe:2.3:a:zenphoto:zenphoto:1.1:*:*:*:*:*:*:*	*	*	*	*
2188	zenphoto	zenphoto	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.1.1	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.1.1	cpe:2.3:a:zenphoto:zenphoto:1.1.1:*:*:*:*:*:*:*	*	*	*	*
2189	zenphoto	zenphoto	1.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.1.2	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.1.2	cpe:2.3:a:zenphoto:zenphoto:1.1.2:*:*:*:*:*:*:*	*	*	*	*
2190	zenphoto	zenphoto	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.1.3	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.1.3	cpe:2.3:a:zenphoto:zenphoto:1.1.3:*:*:*:*:*:*:*	*	*	*	*
2191	zenphoto	zenphoto	1.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.1.7	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.1.7	cpe:2.3:a:zenphoto:zenphoto:1.1.7:*:*:*:*:*:*:*	*	*	*	*
2192	zenphoto	zenphoto	1.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.2.5	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.2.5	cpe:2.3:a:zenphoto:zenphoto:1.2.5:*:*:*:*:*:*:*	*	*	*	*
2193	zenphoto	zenphoto	1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.3	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.3	cpe:2.3:a:zenphoto:zenphoto:1.3:*:*:*:*:*:*:*	*	*	*	*
2194	zenphoto	zenphoto	1.3.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.3.1.2	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.3.1.2	cpe:2.3:a:zenphoto:zenphoto:1.3.1.2:*:*:*:*:*:*:*	*	*	*	*
2195	zenphoto	zenphoto	1.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.4.2	[]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.2	cpe:2.3:a:zenphoto:zenphoto:1.4.2:*:*:*:*:*:*:*	*	*	*	*
2196	zenphoto	zenphoto	1.4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5	cpe:2.3:a:zenphoto:zenphoto:1.4.5:*:*:*:*:*:*:*	*	*	*	*
2197	zenphoto	zenphoto	1.4.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.1	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.1	cpe:2.3:a:zenphoto:zenphoto:1.4.5.1:*:*:*:*:*:*:*	*	*	*	*
2198	zenphoto	zenphoto	1.4.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.2	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.2	cpe:2.3:a:zenphoto:zenphoto:1.4.5.2:*:*:*:*:*:*:*	*	*	*	*
2199	zenphoto	zenphoto	1.4.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.3	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.3	cpe:2.3:a:zenphoto:zenphoto:1.4.5.3:*:*:*:*:*:*:*	*	*	*	*
2200	zenphoto	zenphoto	1.4.5.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.4	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.4	cpe:2.3:a:zenphoto:zenphoto:1.4.5.4:*:*:*:*:*:*:*	*	*	*	*
2201	zenphoto	zenphoto	1.4.5.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.5	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.5	cpe:2.3:a:zenphoto:zenphoto:1.4.5.5:*:*:*:*:*:*:*	*	*	*	*
2202	zenphoto	zenphoto	1.4.5.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.6	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.6	cpe:2.3:a:zenphoto:zenphoto:1.4.5.6:*:*:*:*:*:*:*	*	*	*	*
2203	zenphoto	zenphoto	1.4.5.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.7	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.7	cpe:2.3:a:zenphoto:zenphoto:1.4.5.7:*:*:*:*:*:*:*	*	*	*	*
2204	zenphoto	zenphoto	1.4.5.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto 1.4.5.8	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.5.8	cpe:2.3:a:zenphoto:zenphoto:1.4.5.8:*:*:*:*:*:*:*	*	*	*	*
2205	zenphoto	zenphoto	1.4.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenphoto zenphoto 1.4.7	[{"product changelog":"http://www.zenphoto.org/news/category/changelog/2"}]	/a	*	cpe:/a:zenphoto:zenphoto:1.4.7	cpe:2.3:a:zenphoto:zenphoto:1.4.7:*:*:*:*:*:*:*	*	*	*	*
2206	zenprise_device_manager	zenprise	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenprise Device Manager 6.0	[]	/a	*	cpe:/a:zenprise:zenprise_device_manager:6.0	cpe:2.3:a:zenprise:zenprise_device_manager:6.0:*:*:*:*:*:*:*	*	*	*	*
2207	zenprise_device_manager	zenprise	6.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenprise Device Manager 6.1.0	[]	/a	*	cpe:/a:zenprise:zenprise_device_manager:6.1.0	cpe:2.3:a:zenprise:zenprise_device_manager:6.1.0:*:*:*:*:*:*:*	*	*	*	*
2208	zenprise_device_manager	zenprise	6.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenprise Device Manager 6.1.5 	[]	/a	*	cpe:/a:zenprise:zenprise_device_manager:6.1.5	cpe:2.3:a:zenprise:zenprise_device_manager:6.1.5:*:*:*:*:*:*:*	*	*	*	*
2209	zenprise_device_manager	zenprise	6.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenprise Device Manager 6.1.6	[]	/a	*	cpe:/a:zenprise:zenprise_device_manager:6.1.6	cpe:2.3:a:zenprise:zenprise_device_manager:6.1.6:*:*:*:*:*:*:*	*	*	*	*
2210	zenprise_device_manager	zenprise	6.1.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zenprise Device Manager 6.1.8	[]	/a	*	cpe:/a:zenprise:zenprise_device_manager:6.1.8	cpe:2.3:a:zenprise:zenprise_device_manager:6.1.8:*:*:*:*:*:*:*	*	*	*	*
2211	cut_the_rope:_time_travel	zeptolab	1.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeptoLab Cut the Rope: Time Travel (aka com.zeptolab.timetravel.free.google) application for Android 1.3.4	[{"Product Information":"https://play.google.com/store/apps/details?id=com.zeptolab.timetravel.free.google"},{"Vendor Website":"http://www.zeptolab.com/"}]	/a	*	cpe:/a:zeptolab:cut_the_rope%3a_time_travel:1.3.4::~~~android~~	cpe:2.3:a:zeptolab:cut_the_rope\\:_time_travel:1.3.4:*:*:*:*:android:*:*	*	*	*	*
2212	zeroclipboard	zeroclipboard_project	1.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.0.5	[]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.0.5	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.0.5:*:*:*:*:*:*:*	*	*	*	*
2213	zeroclipboard	zeroclipboard_project	1.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.0.7	[]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.0.7	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.0.7:*:*:*:*:*:*:*	*	*	*	*
2214	zeroclipboard	zeroclipboard_project	1.0.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.0.8	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.0.8	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.0.8:*:*:*:*:*:*:*	*	*	*	*
2215	zeroclipboard	zeroclipboard_project	1.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.0	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.0	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.0:*:*:*:*:*:*:*	*	*	*	*
2216	zeroclipboard	zeroclipboard_project	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.1	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.1	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.1:*:*:*:*:*:*:*	*	*	*	*
2217	zeroclipboard	zeroclipboard_project	1.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.2	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.2	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.2:*:*:*:*:*:*:*	*	*	*	*
2218	zeroclipboard	zeroclipboard_project	1.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.3	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.3	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.3:*:*:*:*:*:*:*	*	*	*	*
2219	zeroclipboard	zeroclipboard_project	1.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.4	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.4	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.4:*:*:*:*:*:*:*	*	*	*	*
2220	zeroclipboard	zeroclipboard_project	1.1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.5	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.5	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.5:*:*:*:*:*:*:*	*	*	*	*
2221	zeroclipboard	zeroclipboard_project	1.1.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.6	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.6	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.6:*:*:*:*:*:*:*	*	*	*	*
2222	zeroclipboard	zeroclipboard_project	1.1.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.1.7	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.1.7	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.1.7:*:*:*:*:*:*:*	*	*	*	*
2223	zeroclipboard	zeroclipboard_project	1.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.2.0	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.2.0	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.2.0:*:*:*:*:*:*:*	*	*	*	*
2224	zeroclipboard	zeroclipboard_project	1.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.2.1	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.2.1	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.2.1:*:*:*:*:*:*:*	*	*	*	*
2225	zeroclipboard	zeroclipboard_project	1.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.2.2	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.2.2	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.2.2:*:*:*:*:*:*:*	*	*	*	*
2226	zeroclipboard	zeroclipboard_project	1.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.2.3	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.2.3	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.2.3:*:*:*:*:*:*:*	*	*	*	*
2227	zeroclipboard	zeroclipboard_project	1.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.3.0	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.3.0	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.3.0:*:*:*:*:*:*:*	*	*	*	*
2228	zeroclipboard	zeroclipboard_project	1.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroClipboard Project ZeroClipboard 1.3.1	[{"versions":"https://github.com/zeroclipboard/zeroclipboard/releases"}]	/a	*	cpe:/a:zeroclipboard_project:zeroclipboard:1.3.1	cpe:2.3:a:zeroclipboard_project:zeroclipboard:1.3.1:*:*:*:*:*:*:*	*	*	*	*
2229	zeromq	zeromq	4.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroMQ ZeroMQ 4.0.5	[{"Vendor Website":"http://zeromq.org/"},{"Changelog":"http://download.zeromq.org/"}]	/a	*	cpe:/a:zeromq:zeromq:4.0.5	cpe:2.3:a:zeromq:zeromq:4.0.5:*:*:*:*:*:*:*	*	*	*	*
2230	zeromq	zeromq	4.1.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeroMQ ZeroMQ 4.1.0 RC1	[{"Vendor Website":"http://zeromq.org/"},{"Changelog":"http://download.zeromq.org/"}]	/a	*	cpe:/a:zeromq:zeromq:4.1.0:rc1	cpe:2.3:a:zeromq:zeromq:4.1.0:rc1:*:*:*:*:*:*	*	*	*	*
2231	zeus_web_server	zeus	3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3	cpe:2.3:a:zeus:zeus_web_server:3.3:*:*:*:*:*:*:*	*	*	*	*
2232	zeus_web_server	zeus	3.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.1	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.1	cpe:2.3:a:zeus:zeus_web_server:3.3.1:*:*:*:*:*:*:*	*	*	*	*
2233	zeus_web_server	zeus	3.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.2	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.2	cpe:2.3:a:zeus:zeus_web_server:3.3.2:*:*:*:*:*:*:*	*	*	*	*
2234	zeus_web_server	zeus	3.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.3	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.3	cpe:2.3:a:zeus:zeus_web_server:3.3.3:*:*:*:*:*:*:*	*	*	*	*
2235	zeus_web_server	zeus	3.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.4	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.4	cpe:2.3:a:zeus:zeus_web_server:3.3.4:*:*:*:*:*:*:*	*	*	*	*
2236	zeus_web_server	zeus	3.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.5	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.5	cpe:2.3:a:zeus:zeus_web_server:3.3.5:*:*:*:*:*:*:*	*	*	*	*
2237	zeus_web_server	zeus	3.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.6	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.6	cpe:2.3:a:zeus:zeus_web_server:3.3.6:*:*:*:*:*:*:*	*	*	*	*
2238	zeus_web_server	zeus	3.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.7	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.7	cpe:2.3:a:zeus:zeus_web_server:3.3.7:*:*:*:*:*:*:*	*	*	*	*
2239	zeus_web_server	zeus	3.3.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.3.8	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.3.8	cpe:2.3:a:zeus:zeus_web_server:3.3.8:*:*:*:*:*:*:*	*	*	*	*
2240	zeus_web_server	zeus	3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 3.4	[]	/a	*	cpe:/a:zeus:zeus_web_server:3.4	cpe:2.3:a:zeus:zeus_web_server:3.4:*:*:*:*:*:*:*	*	*	*	*
2241	zeus_web_server	zeus	4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.1	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.1	cpe:2.3:a:zeus:zeus_web_server:4.1:*:*:*:*:*:*:*	*	*	*	*
2242	zeus_web_server	zeus	4.1	r1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.1r1	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.1:r1	cpe:2.3:a:zeus:zeus_web_server:4.1:r1:*:*:*:*:*:*	*	*	*	*
2243	zeus_web_server	zeus	4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.2	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.2	cpe:2.3:a:zeus:zeus_web_server:4.2:*:*:*:*:*:*:*	*	*	*	*
2244	zeus_web_server	zeus	4.2	r2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.2r2	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.2:r2	cpe:2.3:a:zeus:zeus_web_server:4.2:r2:*:*:*:*:*:*	*	*	*	*
2245	zeus_web_server	zeus	4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.3	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.3	cpe:2.3:a:zeus:zeus_web_server:4.3:*:*:*:*:*:*:*	*	*	*	*
2246	zeus_web_server	zeus	4.3	r3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.3r3	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.3:r3	cpe:2.3:a:zeus:zeus_web_server:4.3:r3:*:*:*:*:*:*	*	*	*	*
2247	zeus_web_server	zeus	4.3	r4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.3r4	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.3:r4	cpe:2.3:a:zeus:zeus_web_server:4.3:r4:*:*:*:*:*:*	*	*	*	*
2248	zeus_web_server	zeus	4.3r5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zeus Web Server 4.3r5	[]	/a	*	cpe:/a:zeus:zeus_web_server:4.3r5	cpe:2.3:a:zeus:zeus_web_server:4.3r5:*:*:*:*:*:*:*	*	*	*	*
2249	mn_fit	zeus.physik.uni-bonn	4.05/21	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/21	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f21	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/21:*:*:*:*:*:*:*	*	*	*	*
2250	mn_fit	zeus.physik.uni-bonn	4.05/22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/22	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f22	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/22:*:*:*:*:*:*:*	*	*	*	*
2251	mn_fit	zeus.physik.uni-bonn	4.05/29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/29	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f29	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/29:*:*:*:*:*:*:*	*	*	*	*
2252	mn_fit	zeus.physik.uni-bonn	4.05/31	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/31	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f31	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/31:*:*:*:*:*:*:*	*	*	*	*
2253	mn_fit	zeus.physik.uni-bonn	4.05/32	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/32	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f32	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/32:*:*:*:*:*:*:*	*	*	*	*
2254	mn_fit	zeus.physik.uni-bonn	4.05/33	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.05/33	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.05%2f33	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.05\\/33:*:*:*:*:*:*:*	*	*	*	*
2255	mn_fit	zeus.physik.uni-bonn	4.06/02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.06/02	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.06%2f02	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.06\\/02:*:*:*:*:*:*:*	*	*	*	*
2256	mn_fit	zeus.physik.uni-bonn	4.06/07	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.06/07	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.06%2f07	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.06\\/07:*:*:*:*:*:*:*	*	*	*	*
2257	mn_fit	zeus.physik.uni-bonn	4.07/02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/02	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f02	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/02:*:*:*:*:*:*:*	*	*	*	*
2258	mn_fit	zeus.physik.uni-bonn	4.07/03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/03	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f03	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/03:*:*:*:*:*:*:*	*	*	*	*
2259	mn_fit	zeus.physik.uni-bonn	4.07/09	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/09	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f09	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/09:*:*:*:*:*:*:*	*	*	*	*
2260	mn_fit	zeus.physik.uni-bonn	4.07/14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/14	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f14	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/14:*:*:*:*:*:*:*	*	*	*	*
2261	mn_fit	zeus.physik.uni-bonn	4.07/18	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/18	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f18	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/18:*:*:*:*:*:*:*	*	*	*	*
2262	mn_fit	zeus.physik.uni-bonn	4.07/20	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/20	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f20	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/20:*:*:*:*:*:*:*	*	*	*	*
2263	mn_fit	zeus.physik.uni-bonn	4.07/22	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/22	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f22	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/22:*:*:*:*:*:*:*	*	*	*	*
2264	mn_fit	zeus.physik.uni-bonn	4.07/25	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/25	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f25	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/25:*:*:*:*:*:*:*	*	*	*	*
2265	mn_fit	zeus.physik.uni-bonn	4.07/26	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/26	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f26	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/26:*:*:*:*:*:*:*	*	*	*	*
2266	mn_fit	zeus.physik.uni-bonn	4.07/27	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/27	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f27	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/27:*:*:*:*:*:*:*	*	*	*	*
2267	mn_fit	zeus.physik.uni-bonn	4.07/28	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/28	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f28	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/28:*:*:*:*:*:*:*	*	*	*	*
2268	mn_fit	zeus.physik.uni-bonn	4.07/29	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/29	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f29	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/29:*:*:*:*:*:*:*	*	*	*	*
2269	mn_fit	zeus.physik.uni-bonn	4.07/30	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/30	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f30	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/30:*:*:*:*:*:*:*	*	*	*	*
2270	mn_fit	zeus.physik.uni-bonn	4.07/32	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/32	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f32	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/32:*:*:*:*:*:*:*	*	*	*	*
2271	mn_fit	zeus.physik.uni-bonn	4.07/35	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 4.07/35	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:4.07%2f35	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:4.07\\/35:*:*:*:*:*:*:*	*	*	*	*
2272	mn_fit	zeus.physik.uni-bonn	5.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.03	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.03	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.03:*:*:*:*:*:*:*	*	*	*	*
2273	mn_fit	zeus.physik.uni-bonn	5.05	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.05	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.05	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.05:*:*:*:*:*:*:*	*	*	*	*
2274	mn_fit	zeus.physik.uni-bonn	5.06	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.06	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.06	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.06:*:*:*:*:*:*:*	*	*	*	*
2275	mn_fit	zeus.physik.uni-bonn	5.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.10	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.10	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.10:*:*:*:*:*:*:*	*	*	*	*
2276	mn_fit	zeus.physik.uni-bonn	5.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.11	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.11	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.11:*:*:*:*:*:*:*	*	*	*	*
2277	mn_fit	zeus.physik.uni-bonn	5.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.12	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.12	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.12:*:*:*:*:*:*:*	*	*	*	*
2278	mn_fit	zeus.physik.uni-bonn	5.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.13	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.13	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.13:*:*:*:*:*:*:*	*	*	*	*
2279	mn_fit	zeus.physik.uni-bonn	5.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zeus.physik.uni-bonn Mn_Fit 5.14	[]	/a	*	cpe:/a:zeus.physik.uni-bonn:mn_fit:5.14	cpe:2.3:a:zeus.physik.uni-bonn:mn_fit:5.14:*:*:*:*:*:*:*	*	*	*	*
2280	zeuscart	zeuscart	4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZeusCart 4.0	[{"Vendor website":"http://zeuscart.com/"}]	/a	*	cpe:/a:zeuscart:zeuscart:4.0	cpe:2.3:a:zeuscart:zeuscart:4.0:*:*:*:*:*:*:*	*	*	*	*
2281	zfcuser	zfcuser_project	1.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZfcUser project ZfcUser 1.2.1	[{"Product version information":"https://github.com/ZF-Commons/ZfcUser/releases"}]	/a	*	cpe:/a:zfcuser_project:zfcuser:1.2.1	cpe:2.3:a:zfcuser_project:zfcuser:1.2.1:*:*:*:*:*:*:*	*	*	*	*
2282	zhang_zhijun_taiwan_visit_2014-06-25	zhang_zhijun_taiwan_visit_2014-06-25_project	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zhang Zhijun Taiwan Visit 2014-06-25 project Zhang Zhijun Taiwan Visit 2014-06-25 (aka com.zizizzi) for android 1.0	[{"Product information":"https://play.google.com/store/apps/details?id=com.zizizzi"},{"Vendor website":"https://www.facebook.com/APPYET?ref%3Dhl"}]	/a	*	cpe:/a:zhang_zhijun_taiwan_visit_2014-06-25_project:zhang_zhijun_taiwan_visit_2014-06-25:1.0::~~~android~~	cpe:2.3:a:zhang_zhijun_taiwan_visit_2014-06-25_project:zhang_zhijun_taiwan_visit_2014-06-25:1.0:*:*:*:*:android:*:*	*	*	*	*
2283	gpon_2520	zhone_technologies	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zhone Technologies GPON 2520	[{"Vendor Website":"http://www.zhone.com/"},{"Websec Advisory":"http://websec.ca/advisories/view/Zhone-GPON-2520-remote-root-shell-backdoor"}]	/h	*	cpe:/h:zhone_technologies:gpon_2520:-	cpe:2.3:h:zhone_technologies:gpon_2520:-:*:*:*:*:*:*:*	*	*	*	*
2284	gpon_2520_firmware	zhone_technologies	r4.0.2.566b	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zhone Technologies GPON 2520 Firmware R4.0.2.566b	[{"Vendor Website":"http://www.zhone.com/"},{"Websec Advisory":"http://websec.ca/advisories/view/Zhone-GPON-2520-remote-root-shell-backdoor"}]	/o	*	cpe:/o:zhone_technologies:gpon_2520_firmware:r4.0.2.566b	cpe:2.3:o:zhone_technologies:gpon_2520_firmware:r4.0.2.566b:*:*:*:*:*:*:*	*	*	*	*
2285	kuailecaidengmi	zhtiantian	1.7.12.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zhtiantian kuailecaidengmi (aka com.licai.kuailecaidengmi) for android 1.7.12.15	[{"Product information":"https://play.google.com/store/apps/details?id=com.licai.kuailecaidengmi"},{"Vendor website":"http://zhtiantian.com/"}]	/a	*	cpe:/a:zhtiantian:kuailecaidengmi:1.7.12.15::~~~android~~	cpe:2.3:a:zhtiantian:kuailecaidengmi:1.7.12.15:*:*:*:*:android:*:*	*	*	*	*
2635	zope	zope	2.9.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.7	[]	/a	*	cpe:/a:zope:zope:2.9.7	cpe:2.3:a:zope:zope:2.9.7:*:*:*:*:*:*:*	*	*	*	*
2286	ecalendar2	zhwnl	4.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zhwnl ecalendar2 (aka cn.etouch.ecalendar2) for Android 4.5.3	[{"Product Information":"https://play.google.com/store/apps/details?id=cn.etouch.ecalendar2"},{"Vendor Website":"http://www.zhwnl.cn/"}]	/a	*	cpe:/a:zhwnl:ecalendar2:4.5.3::~~~android~~	cpe:2.3:a:zhwnl:ecalendar2:4.5.3:*:*:*:*:android:*:*	*	*	*	*
2287	zikula_application_framework	zikula	1.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.0	[{"Version information via github":"https://github.com/zikula/core/releases"},{"Vendor website":"http://zikula.org/"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.0	cpe:2.3:a:zikula:zikula_application_framework:1.3.0:*:*:*:*:*:*:*	*	*	*	*
2288	zikula_application_framework	zikula	1.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.1	[{"Version information via github":"https://github.com/zikula/core/releases"},{"Vendor website":"http://zikula.org/"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.1	cpe:2.3:a:zikula:zikula_application_framework:1.3.1:*:*:*:*:*:*:*	*	*	*	*
2289	zikula_application_framework	zikula	1.3.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.10	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.10	cpe:2.3:a:zikula:zikula_application_framework:1.3.10:*:*:*:*:*:*:*	*	*	*	*
2290	zikula_application_framework	zikula	1.3.10	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.10 Release Candidate 1	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.10:rc1	cpe:2.3:a:zikula:zikula_application_framework:1.3.10:rc1:*:*:*:*:*:*	*	*	*	*
2291	zikula_application_framework	zikula	1.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.2	[{"Vendor website":"http://zikula.org/"},{"Version information via github":"https://github.com/zikula/core/releases"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.2	cpe:2.3:a:zikula:zikula_application_framework:1.3.2:*:*:*:*:*:*:*	*	*	*	*
2292	zikula_application_framework	zikula	1.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.3	[{"Version information via github":"https://github.com/zikula/core/releases"},{"Vendor website":"http://zikula.org/"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.3	cpe:2.3:a:zikula:zikula_application_framework:1.3.3:*:*:*:*:*:*:*	*	*	*	*
2293	zikula_application_framework	zikula	1.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.4	[{"Vendor website":"http://zikula.org/"},{"Version information via github":"https://github.com/zikula/core/releases"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.4	cpe:2.3:a:zikula:zikula_application_framework:1.3.4:*:*:*:*:*:*:*	*	*	*	*
2294	zikula_application_framework	zikula	1.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.5	[{"Version information via github":"https://github.com/zikula/core/releases"},{"Vendor website":"http://zikula.org/"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.5	cpe:2.3:a:zikula:zikula_application_framework:1.3.5:*:*:*:*:*:*:*	*	*	*	*
2295	zikula_application_framework	zikula	1.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.6	[{"Vendor website":"http://zikula.org/"},{"Version information":"http://community.zikula.org/index.php?module=Wiki\\u0026tag=TryZikula13"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.6	cpe:2.3:a:zikula:zikula_application_framework:1.3.6:*:*:*:*:*:*:*	*	*	*	*
2296	zikula_application_framework	zikula	1.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.7	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.7	cpe:2.3:a:zikula:zikula_application_framework:1.3.7:*:*:*:*:*:*:*	*	*	*	*
2297	zikula_application_framework	zikula	1.3.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.8	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.8	cpe:2.3:a:zikula:zikula_application_framework:1.3.8:*:*:*:*:*:*:*	*	*	*	*
2298	zikula_application_framework	zikula	1.3.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.3.9	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.3.9	cpe:2.3:a:zikula:zikula_application_framework:1.3.9:*:*:*:*:*:*:*	*	*	*	*
2299	zikula_application_framework	zikula	1.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.0	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.0	cpe:2.3:a:zikula:zikula_application_framework:1.4.0:*:*:*:*:*:*:*	*	*	*	*
2300	zikula_application_framework	zikula	1.4.0	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.0 Release Candidate 1	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.0:rc1	cpe:2.3:a:zikula:zikula_application_framework:1.4.0:rc1:*:*:*:*:*:*	*	*	*	*
2301	zikula_application_framework	zikula	1.4.0	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.0 Release Candidate 2	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.0:rc2	cpe:2.3:a:zikula:zikula_application_framework:1.4.0:rc2:*:*:*:*:*:*	*	*	*	*
2302	zikula_application_framework	zikula	1.4.0	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.0 Release Candidate 3	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.0:rc3	cpe:2.3:a:zikula:zikula_application_framework:1.4.0:rc3:*:*:*:*:*:*	*	*	*	*
2303	zikula_application_framework	zikula	1.4.0	rc4	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.0 Release Candidate 4	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.0:rc4	cpe:2.3:a:zikula:zikula_application_framework:1.4.0:rc4:*:*:*:*:*:*	*	*	*	*
2304	zikula_application_framework	zikula	1.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.1	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.1	cpe:2.3:a:zikula:zikula_application_framework:1.4.1:*:*:*:*:*:*:*	*	*	*	*
2305	zikula_application_framework	zikula	1.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.2	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.2	cpe:2.3:a:zikula:zikula_application_framework:1.4.2:*:*:*:*:*:*:*	*	*	*	*
2306	zikula_application_framework	zikula	1.4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.3	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.3	cpe:2.3:a:zikula:zikula_application_framework:1.4.3:*:*:*:*:*:*:*	*	*	*	*
2307	zikula_application_framework	zikula	1.4.3	rc1	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.3 Release Candidate 1	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.3:rc1	cpe:2.3:a:zikula:zikula_application_framework:1.4.3:rc1:*:*:*:*:*:*	*	*	*	*
2355	zingiri_web_shop	zingiri	1.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.1:*:*:*:*:*:*:*	*	*	*	*
2308	zikula_application_framework	zikula	1.4.3	rc2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.3 Release Candidate 2	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.3:rc2	cpe:2.3:a:zikula:zikula_application_framework:1.4.3:rc2:*:*:*:*:*:*	*	*	*	*
2309	zikula_application_framework	zikula	1.4.3	rc3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zikula Application Framework 1.4.3 Release Candidate 3	[{"Version":"https://github.com/zikula/core"}]	/a	*	cpe:/a:zikula:zikula_application_framework:1.4.3:rc3	cpe:2.3:a:zikula:zikula_application_framework:1.4.3:rc3:*:*:*:*:*:*	*	*	*	*
2310	zillion_muslims	zillionmuslims	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZillionMuslims Zillion Muslims (aka com.zillionmuslims.src) for android 1.1	[{"Product information":"https://play.google.com/store/apps/details?id=com.zillionmuslims.src"},{"Vendor website":"http://www.ZillionMuslims.com"}]	/a	*	cpe:/a:zillionmuslims:zillion_muslims:1.1::~~~android~~	cpe:2.3:a:zillionmuslims:zillion_muslims:1.1:*:*:*:*:android:*:*	*	*	*	*
2311	collaboration_server	zimbra	7.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.0.0	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.0.0	cpe:2.3:a:zimbra:collaboration_server:7.0.0:*:*:*:*:*:*:*	*	*	*	*
2312	collaboration_server	zimbra	7.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.0.1	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.0.1	cpe:2.3:a:zimbra:collaboration_server:7.0.1:*:*:*:*:*:*:*	*	*	*	*
2313	collaboration_server	zimbra	7.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.1.0	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.1.0	cpe:2.3:a:zimbra:collaboration_server:7.1.0:*:*:*:*:*:*:*	*	*	*	*
2314	collaboration_server	zimbra	7.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.1.1	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.1.1	cpe:2.3:a:zimbra:collaboration_server:7.1.1:*:*:*:*:*:*:*	*	*	*	*
2315	collaboration_server	zimbra	7.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.1.2	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.1.2	cpe:2.3:a:zimbra:collaboration_server:7.1.2:*:*:*:*:*:*:*	*	*	*	*
2316	collaboration_server	zimbra	7.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.1.3	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.1.3	cpe:2.3:a:zimbra:collaboration_server:7.1.3:*:*:*:*:*:*:*	*	*	*	*
2317	collaboration_server	zimbra	7.1.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.1.4	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.1.4	cpe:2.3:a:zimbra:collaboration_server:7.1.4:*:*:*:*:*:*:*	*	*	*	*
2318	collaboration_server	zimbra	7.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.0	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.0	cpe:2.3:a:zimbra:collaboration_server:7.2.0:*:*:*:*:*:*:*	*	*	*	*
2319	collaboration_server	zimbra	7.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.1	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.1	cpe:2.3:a:zimbra:collaboration_server:7.2.1:*:*:*:*:*:*:*	*	*	*	*
2320	collaboration_server	zimbra	7.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.2	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.2	cpe:2.3:a:zimbra:collaboration_server:7.2.2:*:*:*:*:*:*:*	*	*	*	*
2321	collaboration_server	zimbra	7.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.3	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.3	cpe:2.3:a:zimbra:collaboration_server:7.2.3:*:*:*:*:*:*:*	*	*	*	*
2322	collaboration_server	zimbra	7.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.4	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.4	cpe:2.3:a:zimbra:collaboration_server:7.2.4:*:*:*:*:*:*:*	*	*	*	*
2323	collaboration_server	zimbra	7.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.5	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.5	cpe:2.3:a:zimbra:collaboration_server:7.2.5:*:*:*:*:*:*:*	*	*	*	*
2324	collaboration_server	zimbra	7.2.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 7.2.6	[{"product release notes":"http://files.zimbra.com/website/docs/7.2/Zimbra_OS_Release_Notes_7.2.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:7.2.6	cpe:2.3:a:zimbra:collaboration_server:7.2.6:*:*:*:*:*:*:*	*	*	*	*
2325	collaboration_server	zimbra	8.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.0	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.0	cpe:2.3:a:zimbra:collaboration_server:8.0.0:*:*:*:*:*:*:*	*	*	*	*
2326	collaboration_server	zimbra	8.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.1	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.1	cpe:2.3:a:zimbra:collaboration_server:8.0.1:*:*:*:*:*:*:*	*	*	*	*
2327	collaboration_server	zimbra	8.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.2	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.2	cpe:2.3:a:zimbra:collaboration_server:8.0.2:*:*:*:*:*:*:*	*	*	*	*
2328	collaboration_server	zimbra	8.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.3	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.3	cpe:2.3:a:zimbra:collaboration_server:8.0.3:*:*:*:*:*:*:*	*	*	*	*
2329	collaboration_server	zimbra	8.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.4	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.4	cpe:2.3:a:zimbra:collaboration_server:8.0.4:*:*:*:*:*:*:*	*	*	*	*
2630	zope	zope	2.9.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.2	[]	/a	*	cpe:/a:zope:zope:2.9.2	cpe:2.3:a:zope:zope:2.9.2:*:*:*:*:*:*:*	*	*	*	*
2330	collaboration_server	zimbra	8.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Server 8.0.5	[{"product release notes":"http://files.zimbra.com/website/docs/8.0/Zimbra_OS_Release_Notes_8.0.6.pdf"}]	/a	*	cpe:/a:zimbra:collaboration_server:8.0.5	cpe:2.3:a:zimbra:collaboration_server:8.0.5:*:*:*:*:*:*:*	*	*	*	*
2331	zimbra_collaboration_suite	zimbra	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0:*:*:*:*:*:*:*	*	*	*	*
2332	zimbra_collaboration_suite	zimbra	6.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.1	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.1	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.1:*:*:*:*:*:*:*	*	*	*	*
2333	zimbra_collaboration_suite	zimbra	6.0.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.10	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.10	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.10:*:*:*:*:*:*:*	*	*	*	*
2334	zimbra_collaboration_suite	zimbra	6.0.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.12	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.12	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.12:*:*:*:*:*:*:*	*	*	*	*
2335	zimbra_collaboration_suite	zimbra	6.0.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.13	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.13	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.13:*:*:*:*:*:*:*	*	*	*	*
2336	zimbra_collaboration_suite	zimbra	6.0.14	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.14	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.14	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.14:*:*:*:*:*:*:*	*	*	*	*
2337	zimbra_collaboration_suite	zimbra	6.0.15	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.15	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.15	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.15:*:*:*:*:*:*:*	*	*	*	*
2338	zimbra_collaboration_suite	zimbra	6.0.16	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.16	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.16	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.16:*:*:*:*:*:*:*	*	*	*	*
2339	zimbra_collaboration_suite	zimbra	6.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.2	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.2	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.2:*:*:*:*:*:*:*	*	*	*	*
2340	zimbra_collaboration_suite	zimbra	6.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.3	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.3	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.3:*:*:*:*:*:*:*	*	*	*	*
2341	zimbra_collaboration_suite	zimbra	6.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.4	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.4	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.4:*:*:*:*:*:*:*	*	*	*	*
2342	zimbra_collaboration_suite	zimbra	6.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.5	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.5	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.5:*:*:*:*:*:*:*	*	*	*	*
2343	zimbra_collaboration_suite	zimbra	6.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.6	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.6	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.6:*:*:*:*:*:*:*	*	*	*	*
2344	zimbra_collaboration_suite	zimbra	6.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.7	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.7	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.7:*:*:*:*:*:*:*	*	*	*	*
2345	zimbra_collaboration_suite	zimbra	6.0.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.8	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.8	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.8:*:*:*:*:*:*:*	*	*	*	*
2346	zimbra_collaboration_suite	zimbra	6.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zimbra Collaboration Suite 6.0.9	[{"vendor download page":"http://www.zimbra.com/downloads/ne-archives-downloads.html"}]	/a	*	cpe:/a:zimbra:zimbra_collaboration_suite:6.0.9	cpe:2.3:a:zimbra:zimbra_collaboration_suite:6.0.9:*:*:*:*:*:*:*	*	*	*	*
2347	zingiri_web_shop	zingiri	1.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.0.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.0.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.0.0:*:*:*:*:*:*:*	*	*	*	*
2348	zingiri_web_shop	zingiri	1.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.0.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.0.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.0.1:*:*:*:*:*:*:*	*	*	*	*
2349	zingiri_web_shop	zingiri	1.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.0.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.0.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.0.2:*:*:*:*:*:*:*	*	*	*	*
2350	zingiri_web_shop	zingiri	1.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.0.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.0.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.0.3:*:*:*:*:*:*:*	*	*	*	*
2351	zingiri_web_shop	zingiri	1.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.0.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.0.4	cpe:2.3:a:zingiri:zingiri_web_shop:1.0.4:*:*:*:*:*:*:*	*	*	*	*
2352	zingiri_web_shop	zingiri	1.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.1.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.1.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.1.0:*:*:*:*:*:*:*	*	*	*	*
2353	zingiri_web_shop	zingiri	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.1.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.1.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.1.1:*:*:*:*:*:*:*	*	*	*	*
2354	zingiri_web_shop	zingiri	1.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.0:*:*:*:*:*:*:*	*	*	*	*
2356	zingiri_web_shop	zingiri	1.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.2:*:*:*:*:*:*:*	*	*	*	*
2357	zingiri_web_shop	zingiri	1.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.3:*:*:*:*:*:*:*	*	*	*	*
2358	zingiri_web_shop	zingiri	1.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.4	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.4:*:*:*:*:*:*:*	*	*	*	*
2359	zingiri_web_shop	zingiri	1.2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.5	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.5:*:*:*:*:*:*:*	*	*	*	*
2360	zingiri_web_shop	zingiri	1.2.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.6	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.6:*:*:*:*:*:*:*	*	*	*	*
2361	zingiri_web_shop	zingiri	1.2.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.7	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.7:*:*:*:*:*:*:*	*	*	*	*
2362	zingiri_web_shop	zingiri	1.2.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.8	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.8:*:*:*:*:*:*:*	*	*	*	*
2363	zingiri_web_shop	zingiri	1.2.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.2.9	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.2.9	cpe:2.3:a:zingiri:zingiri_web_shop:1.2.9:*:*:*:*:*:*:*	*	*	*	*
2364	zingiri_web_shop	zingiri	1.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.0:*:*:*:*:*:*:*	*	*	*	*
2365	zingiri_web_shop	zingiri	1.3.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.0.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.0.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.0.1:*:*:*:*:*:*:*	*	*	*	*
2366	zingiri_web_shop	zingiri	1.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.1:*:*:*:*:*:*:*	*	*	*	*
2367	zingiri_web_shop	zingiri	1.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.2:*:*:*:*:*:*:*	*	*	*	*
2368	zingiri_web_shop	zingiri	1.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.3:*:*:*:*:*:*:*	*	*	*	*
2369	zingiri_web_shop	zingiri	1.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.4	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.4:*:*:*:*:*:*:*	*	*	*	*
2370	zingiri_web_shop	zingiri	1.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.5	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.5:*:*:*:*:*:*:*	*	*	*	*
2371	zingiri_web_shop	zingiri	1.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.6	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.6:*:*:*:*:*:*:*	*	*	*	*
2372	zingiri_web_shop	zingiri	1.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.3.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.3.7	cpe:2.3:a:zingiri:zingiri_web_shop:1.3.7:*:*:*:*:*:*:*	*	*	*	*
2373	zingiri_web_shop	zingiri	1.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.0:*:*:*:*:*:*:*	*	*	*	*
2374	zingiri_web_shop	zingiri	1.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.1:*:*:*:*:*:*:*	*	*	*	*
2375	zingiri_web_shop	zingiri	1.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.2:*:*:*:*:*:*:*	*	*	*	*
2376	zingiri_web_shop	zingiri	1.4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.3:*:*:*:*:*:*:*	*	*	*	*
2377	zingiri_web_shop	zingiri	1.4.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.4	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.4:*:*:*:*:*:*:*	*	*	*	*
2378	zingiri_web_shop	zingiri	1.4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.5	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.5:*:*:*:*:*:*:*	*	*	*	*
2379	zingiri_web_shop	zingiri	1.4.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.6	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.6:*:*:*:*:*:*:*	*	*	*	*
2380	zingiri_web_shop	zingiri	1.4.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.7	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.7:*:*:*:*:*:*:*	*	*	*	*
2381	zingiri_web_shop	zingiri	1.4.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.4.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.4.8	cpe:2.3:a:zingiri:zingiri_web_shop:1.4.8:*:*:*:*:*:*:*	*	*	*	*
2382	zingiri_web_shop	zingiri	1.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.0:*:*:*:*:*:*:*	*	*	*	*
2383	zingiri_web_shop	zingiri	1.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.1:*:*:*:*:*:*:*	*	*	*	*
2384	zingiri_web_shop	zingiri	1.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.2:*:*:*:*:*:*:*	*	*	*	*
2385	zingiri_web_shop	zingiri	1.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.3:*:*:*:*:*:*:*	*	*	*	*
2386	zingiri_web_shop	zingiri	1.5.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.4	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.4:*:*:*:*:*:*:*	*	*	*	*
2387	zingiri_web_shop	zingiri	1.5.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.5	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.5:*:*:*:*:*:*:*	*	*	*	*
2388	zingiri_web_shop	zingiri	1.5.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.6	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.6:*:*:*:*:*:*:*	*	*	*	*
2389	zingiri_web_shop	zingiri	1.5.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.7	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.7:*:*:*:*:*:*:*	*	*	*	*
2390	zingiri_web_shop	zingiri	1.5.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.8	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.8:*:*:*:*:*:*:*	*	*	*	*
2391	zingiri_web_shop	zingiri	1.5.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.5.9	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.5.9	cpe:2.3:a:zingiri:zingiri_web_shop:1.5.9:*:*:*:*:*:*:*	*	*	*	*
2392	zingiri_web_shop	zingiri	1.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.6.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.6.0	cpe:2.3:a:zingiri:zingiri_web_shop:1.6.0:*:*:*:*:*:*:*	*	*	*	*
2393	zingiri_web_shop	zingiri	1.6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.6.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.6.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.6.1:*:*:*:*:*:*:*	*	*	*	*
2394	zingiri_web_shop	zingiri	1.6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.6.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.6.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.6.2:*:*:*:*:*:*:*	*	*	*	*
2395	zingiri_web_shop	zingiri	1.6.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.6.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.6.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.6.3:*:*:*:*:*:*:*	*	*	*	*
2396	zingiri_web_shop	zingiri	1.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.8.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.8.1	cpe:2.3:a:zingiri:zingiri_web_shop:1.8.1:*:*:*:*:*:*:*	*	*	*	*
2397	zingiri_web_shop	zingiri	1.8.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.8.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.8.2	cpe:2.3:a:zingiri:zingiri_web_shop:1.8.2:*:*:*:*:*:*:*	*	*	*	*
2398	zingiri_web_shop	zingiri	1.8.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 1.8.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:1.8.3	cpe:2.3:a:zingiri:zingiri_web_shop:1.8.3:*:*:*:*:*:*:*	*	*	*	*
2399	zingiri_web_shop	zingiri	2.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.0:*:*:*:*:*:*:*	*	*	*	*
2400	zingiri_web_shop	zingiri	2.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.1:*:*:*:*:*:*:*	*	*	*	*
2401	zingiri_web_shop	zingiri	2.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.2:*:*:*:*:*:*:*	*	*	*	*
2402	zingiri_web_shop	zingiri	2.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.3:*:*:*:*:*:*:*	*	*	*	*
2403	zingiri_web_shop	zingiri	2.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.4	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.4:*:*:*:*:*:*:*	*	*	*	*
2404	zingiri_web_shop	zingiri	2.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.0.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.0.5	cpe:2.3:a:zingiri:zingiri_web_shop:2.0.5:*:*:*:*:*:*:*	*	*	*	*
2405	zingiri_web_shop	zingiri	2.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.1.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.1.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.1.0:*:*:*:*:*:*:*	*	*	*	*
2406	zingiri_web_shop	zingiri	2.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.1.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.1.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.1.1:*:*:*:*:*:*:*	*	*	*	*
2407	zingiri_web_shop	zingiri	2.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.1.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.1.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.1.2:*:*:*:*:*:*:*	*	*	*	*
2408	zingiri_web_shop	zingiri	2.1.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.1.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.1.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.1.3:*:*:*:*:*:*:*	*	*	*	*
2409	zingiri_web_shop	zingiri	2.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.2.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.2.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.2.0:*:*:*:*:*:*:*	*	*	*	*
2410	zingiri_web_shop	zingiri	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.2.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.2.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.2.1:*:*:*:*:*:*:*	*	*	*	*
2411	zingiri_web_shop	zingiri	2.2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.2.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.2.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.2.2:*:*:*:*:*:*:*	*	*	*	*
2412	zingiri_web_shop	zingiri	2.2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.2.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.2.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.2.3:*:*:*:*:*:*:*	*	*	*	*
2413	zingiri_web_shop	zingiri	2.2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.2.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.2.4	cpe:2.3:a:zingiri:zingiri_web_shop:2.2.4:*:*:*:*:*:*:*	*	*	*	*
2414	zingiri_web_shop	zingiri	2.3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.0:*:*:*:*:*:*:*	*	*	*	*
2415	zingiri_web_shop	zingiri	2.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.1:*:*:*:*:*:*:*	*	*	*	*
2416	zingiri_web_shop	zingiri	2.3.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.2:*:*:*:*:*:*:*	*	*	*	*
2417	zingiri_web_shop	zingiri	2.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.3:*:*:*:*:*:*:*	*	*	*	*
2418	zingiri_web_shop	zingiri	2.3.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.4	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.4:*:*:*:*:*:*:*	*	*	*	*
2419	zingiri_web_shop	zingiri	2.3.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.5	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.5:*:*:*:*:*:*:*	*	*	*	*
2420	zingiri_web_shop	zingiri	2.3.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.6	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.6:*:*:*:*:*:*:*	*	*	*	*
2421	zingiri_web_shop	zingiri	2.3.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.7	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.7:*:*:*:*:*:*:*	*	*	*	*
2422	zingiri_web_shop	zingiri	2.3.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.3.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.3.8	cpe:2.3:a:zingiri:zingiri_web_shop:2.3.8:*:*:*:*:*:*:*	*	*	*	*
2423	zingiri_web_shop	zingiri	2.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.0:*:*:*:*:*:*:*	*	*	*	*
2424	zingiri_web_shop	zingiri	2.4.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.1:*:*:*:*:*:*:*	*	*	*	*
2425	zingiri_web_shop	zingiri	2.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.2:*:*:*:*:*:*:*	*	*	*	*
2426	zingiri_web_shop	zingiri	2.4.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.3:*:*:*:*:*:*:*	*	*	*	*
2427	zingiri_web_shop	zingiri	2.4.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.4	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.4:*:*:*:*:*:*:*	*	*	*	*
2428	zingiri_web_shop	zingiri	2.4.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.5	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.5:*:*:*:*:*:*:*	*	*	*	*
2429	zingiri_web_shop	zingiri	2.4.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.6	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.6:*:*:*:*:*:*:*	*	*	*	*
2430	zingiri_web_shop	zingiri	2.4.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.7	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.7:*:*:*:*:*:*:*	*	*	*	*
2431	zingiri_web_shop	zingiri	2.4.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.8	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.8:*:*:*:*:*:*:*	*	*	*	*
2432	zingiri_web_shop	zingiri	2.4.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.4.9	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.4.9	cpe:2.3:a:zingiri:zingiri_web_shop:2.4.9:*:*:*:*:*:*:*	*	*	*	*
2433	zingiri_web_shop	zingiri	2.5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.0:*:*:*:*:*:*:*	*	*	*	*
2434	zingiri_web_shop	zingiri	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.1	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.1	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.1:*:*:*:*:*:*:*	*	*	*	*
2435	zingiri_web_shop	zingiri	2.5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.2	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.2	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.2:*:*:*:*:*:*:*	*	*	*	*
2436	zingiri_web_shop	zingiri	2.5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.3	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.3	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.3:*:*:*:*:*:*:*	*	*	*	*
2437	zingiri_web_shop	zingiri	2.5.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.4	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.4	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.4:*:*:*:*:*:*:*	*	*	*	*
2438	zingiri_web_shop	zingiri	2.5.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.5	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.5	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.5:*:*:*:*:*:*:*	*	*	*	*
2439	zingiri_web_shop	zingiri	2.5.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.6	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.6	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.6:*:*:*:*:*:*:*	*	*	*	*
2440	zingiri_web_shop	zingiri	2.5.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.7	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.7	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.7:*:*:*:*:*:*:*	*	*	*	*
2441	zingiri_web_shop	zingiri	2.5.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.8	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.8	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.8:*:*:*:*:*:*:*	*	*	*	*
2442	zingiri_web_shop	zingiri	2.5.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.5.9	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.5.9	cpe:2.3:a:zingiri:zingiri_web_shop:2.5.9:*:*:*:*:*:*:*	*	*	*	*
2443	zingiri_web_shop	zingiri	2.6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zingiri Zingiri Web Shop plugin for Wordpress 2.6.0	[]	/a	*	cpe:/a:zingiri:zingiri_web_shop:2.6.0	cpe:2.3:a:zingiri:zingiri_web_shop:2.6.0:*:*:*:*:*:*:*	*	*	*	*
2444	zip_attachments	zip_attachments_project	1.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zip Attachments Project Zip Attachments 1.5 for WordPress	[{"Change Log":"https://wordpress.org/plugins/zip-attachments/changelog/"},{"Project":"https://wordpress.org/plugins/zip-attachments/"}]	/a	*	cpe:/a:zip_attachments_project:zip_attachments:1.5::~~~wordpress~~	cpe:2.3:a:zip_attachments_project:zip_attachments:1.5:*:*:*:*:wordpress:*:*	*	*	*	*
2445	zipcar	zipcar	3.4.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zipcar Zipcar (aka com.zc.android) application for Android 3.4.2	[{"Product Information":"https://play.google.com/store/apps/details?id=com.zc.android"},{"Vendor Website":"http://www.zipcar.fr/"}]	/a	*	cpe:/a:zipcar:zipcar:3.4.2::~~~android~~	cpe:2.3:a:zipcar:zipcar:3.4.2:*:*:*:*:android:*:*	*	*	*	*
2446	subway_ordering_for_california	zippyyum	3.4	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zippyyum Subway Ordering for California for iPhone OS (iOS) 3.4	[{"vendor website":"https://www.zippyyum.com/"},{"product page on Apple iTunes":"https://itunes.apple.com/us/app/subwayoc/id510770549?mt=8"}]	/a	*	cpe:/a:zippyyum:subway_ordering_for_california:3.4:-:~-~-~iphone_os~~	cpe:2.3:a:zippyyum:subway_ordering_for_california:3.4:-:-:*:-:iphone_os:*:*	*	*	-	*
2447	subway_ordering_for_california	zippyyum	3.7.1	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zippyyum Subway Ordering for California for iPhone OS (iOS) 3.7.1	[{"vendor website":"https://www.zippyyum.com/"},{"product page on Apple iTunes":"https://itunes.apple.com/us/app/subwayoc/id510770549?mt=8"}]	/a	*	cpe:/a:zippyyum:subway_ordering_for_california:3.7.1:-:~-~-~iphone_os~~	cpe:2.3:a:zippyyum:subway_ordering_for_california:3.7.1:-:-:*:-:iphone_os:*:*	*	*	-	*
2448	zk_framework	zkoss	5.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.0	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.0	cpe:2.3:a:zkoss:zk_framework:5.0.0:*:*:*:*:*:*:*	*	*	*	*
2449	zk_framework	zkoss	5.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.1	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.1	cpe:2.3:a:zkoss:zk_framework:5.0.1:*:*:*:*:*:*:*	*	*	*	*
2450	zk_framework	zkoss	5.0.10	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.10	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.10	cpe:2.3:a:zkoss:zk_framework:5.0.10:*:*:*:*:*:*:*	*	*	*	*
2451	zk_framework	zkoss	5.0.11	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.11	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.11	cpe:2.3:a:zkoss:zk_framework:5.0.11:*:*:*:*:*:*:*	*	*	*	*
2452	zk_framework	zkoss	5.0.12	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.12	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.12	cpe:2.3:a:zkoss:zk_framework:5.0.12:*:*:*:*:*:*:*	*	*	*	*
2453	zk_framework	zkoss	5.0.13	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.13	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.13	cpe:2.3:a:zkoss:zk_framework:5.0.13:*:*:*:*:*:*:*	*	*	*	*
2454	zk_framework	zkoss	5.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.2	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.2	cpe:2.3:a:zkoss:zk_framework:5.0.2:*:*:*:*:*:*:*	*	*	*	*
2455	zk_framework	zkoss	5.0.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.3	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.3	cpe:2.3:a:zkoss:zk_framework:5.0.3:*:*:*:*:*:*:*	*	*	*	*
2456	zk_framework	zkoss	5.0.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.4	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.4	cpe:2.3:a:zkoss:zk_framework:5.0.4:*:*:*:*:*:*:*	*	*	*	*
2457	zk_framework	zkoss	5.0.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.5	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.5	cpe:2.3:a:zkoss:zk_framework:5.0.5:*:*:*:*:*:*:*	*	*	*	*
2458	zk_framework	zkoss	5.0.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.6	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.6	cpe:2.3:a:zkoss:zk_framework:5.0.6:*:*:*:*:*:*:*	*	*	*	*
2459	zk_framework	zkoss	5.0.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.7	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.7	cpe:2.3:a:zkoss:zk_framework:5.0.7:*:*:*:*:*:*:*	*	*	*	*
2460	zk_framework	zkoss	5.0.7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.7.1	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.7.1	cpe:2.3:a:zkoss:zk_framework:5.0.7.1:*:*:*:*:*:*:*	*	*	*	*
2461	zk_framework	zkoss	5.0.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.8	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.8	cpe:2.3:a:zkoss:zk_framework:5.0.8:*:*:*:*:*:*:*	*	*	*	*
2462	zk_framework	zkoss	5.0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zkoss ZK Framework 5.0.9	[{"version information":"https://github.com/zkoss/zk/blob/v5.0.13/zkdoc/release-note"},{"vendor website":"http://www.zkoss.org"}]	/a	*	cpe:/a:zkoss:zk_framework:5.0.9	cpe:2.3:a:zkoss:zk_framework:5.0.9:*:*:*:*:*:*:*	*	*	*	*
2463	pigz	zlib	2.3.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zlib pigz 2.3.1	[{"Vendor website":"http://zlib.net/pigz/"}]	/a	*	cpe:/a:zlib:pigz:2.3.1	cpe:2.3:a:zlib:pigz:2.3.1:*:*:*:*:*:*:*	*	*	*	*
2464	znc	znc	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC 1.0	[{"vendor product information":"http://wiki.znc.in/ZNC"}]	/a	*	cpe:/a:znc:znc:1.0	cpe:2.3:a:znc:znc:1.0:*:*:*:*:*:*:*	*	*	*	*
2465	znc	znc	1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC 1.2	[{"Vendor website":"http://wiki.znc.in/ZNC"}]	/a	*	cpe:/a:znc:znc:1.2	cpe:2.3:a:znc:znc:1.2:*:*:*:*:*:*:*	*	*	*	*
2466	znc-msvc	znc	0.076	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.076	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.076:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.076:-:-:*:-:windows:*:*	*	*	-	*
2467	znc-msvc	znc	0.077	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.077	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.077:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.077:-:-:*:-:windows:*:*	*	*	-	*
2468	znc-msvc	znc	0.078	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.078	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.078:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.078:-:-:*:-:windows:*:*	*	*	-	*
2469	znc-msvc	znc	0.079	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.079	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.079:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.079:-:-:*:-:windows:*:*	*	*	-	*
2470	znc-msvc	znc	0.080	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.080	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.080:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.080:-:-:*:-:windows:*:*	*	*	-	*
2631	zope	zope	2.9.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.3	[]	/a	*	cpe:/a:zope:zope:2.9.3	cpe:2.3:a:zope:zope:2.9.3:*:*:*:*:*:*:*	*	*	*	*
2471	znc-msvc	znc	0.089	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.089	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.089:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.089:-:-:*:-:windows:*:*	*	*	-	*
2472	znc-msvc	znc	0.090	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.090	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.090:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.090:-:-:*:-:windows:*:*	*	*	-	*
2473	znc-msvc	znc	0.093	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.093	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.093:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.093:-:-:*:-:windows:*:*	*	*	-	*
2474	znc-msvc	znc	0.094	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.094	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.094:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.094:-:-:*:-:windows:*:*	*	*	-	*
2475	znc-msvc	znc	0.095	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.095	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.095:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.095:-:-:*:-:windows:*:*	*	*	-	*
2476	znc-msvc	znc	0.097	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.097	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.097:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.097:-:-:*:-:windows:*:*	*	*	-	*
2477	znc-msvc	znc	0.098	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.098	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.098:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.098:-:-:*:-:windows:*:*	*	*	-	*
2478	znc-msvc	znc	0.202	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.202	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.202:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.202:-:-:*:-:windows:*:*	*	*	-	*
2479	znc-msvc	znc	0.206	-	-	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZNC for Windows (znc-msv) 0.206	[{"product changelog":"https://code.google.com/p/znc-msvc/wiki/Changelog"}]	/a	*	cpe:/a:znc:znc-msvc:0.206:-:~-~-~windows~~	cpe:2.3:a:znc:znc-msvc:0.206:-:-:*:-:windows:*:*	*	*	-	*
2480	aboutme-plugin	zodiacdm	0.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zodiacdm AboutMe Plugin (aboutme-plugin) 0.9	[]	/a	*	cpe:/a:zodiacdm:aboutme-plugin:0.9	cpe:2.3:a:zodiacdm:aboutme-plugin:0.9:*:*:*:*:*:*:*	*	*	*	*
2481	aboutme-plugin	zodiacdm	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zodiacdm AboutMe Plugin (aboutme-plugin) 1.0	[]	/a	*	cpe:/a:zodiacdm:aboutme-plugin:1.0	cpe:2.3:a:zodiacdm:aboutme-plugin:1.0:*:*:*:*:*:*:*	*	*	*	*
2482	aboutme-plugin	zodiacdm	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zodiacdm AboutMe Plugin (aboutme-plugin) 1.1	[]	/a	*	cpe:/a:zodiacdm:aboutme-plugin:1.1	cpe:2.3:a:zodiacdm:aboutme-plugin:1.1:*:*:*:*:*:*:*	*	*	*	*
2483	aboutme-plugin	zodiacdm	1.1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zodiacdm AboutMe Plugin (aboutme-plugin) 1.1.1	[]	/a	*	cpe:/a:zodiacdm:aboutme-plugin:1.1.1	cpe:2.3:a:zodiacdm:aboutme-plugin:1.1.1:*:*:*:*:*:*:*	*	*	*	*
2484	manageengine_admanager_plus	zohocorp	6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOHO Corp ManageEngine  ADManager Plus 6.2	[{"Vendor website":"https://www.manageengine.com/products/ad-manager/"}]	/a	*	cpe:/a:zohocorp:manageengine_admanager_plus:6.2	cpe:2.3:a:zohocorp:manageengine_admanager_plus:6.2:*:*:*:*:*:*:*	*	*	*	*
2485	manageengine_assetexplorer	zohocorp	4.0	4001	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Build 4001	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4001	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4001:*:*:*:*:*:*	*	*	*	*
2486	manageengine_assetexplorer	zohocorp	4.0	4002	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Build 4002	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4002	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4002:*:*:*:*:*:*	*	*	*	*
2487	manageengine_assetexplorer	zohocorp	4.0	4004	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4004	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4004	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4004:*:*:*:*:*:*	*	*	*	*
2488	manageengine_assetexplorer	zohocorp	4.0	4005	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4005	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4005	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4005:*:*:*:*:*:*	*	*	*	*
2489	manageengine_assetexplorer	zohocorp	4.0	4008	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4008	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4008	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4008:*:*:*:*:*:*	*	*	*	*
2490	manageengine_assetexplorer	zohocorp	4.0	4009	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4009	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4009	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4009:*:*:*:*:*:*	*	*	*	*
2491	manageengine_assetexplorer	zohocorp	4.0	4010	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4010	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4010	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4010:*:*:*:*:*:*	*	*	*	*
2492	manageengine_assetexplorer	zohocorp	4.0	4011	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4011	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4011	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4011:*:*:*:*:*:*	*	*	*	*
2493	manageengine_assetexplorer	zohocorp	4.0	4012	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4012	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4012	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4012:*:*:*:*:*:*	*	*	*	*
2494	manageengine_assetexplorer	zohocorp	4.0	4013	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4013	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4013	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4013:*:*:*:*:*:*	*	*	*	*
2495	manageengine_assetexplorer	zohocorp	4.0	4014	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4014	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4014	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4014:*:*:*:*:*:*	*	*	*	*
2496	manageengine_assetexplorer	zohocorp	4.0	4015	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4015	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4015	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4015:*:*:*:*:*:*	*	*	*	*
2497	manageengine_assetexplorer	zohocorp	4.0	4016	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4016	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4016	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4016:*:*:*:*:*:*	*	*	*	*
2779	jdk	sun	1.5.0	update19		\N	2018-05-31 16:59:57.472402	2018-05-31 16:59:57.472402	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update19	\N	\N	\N	\N	\N
2498	manageengine_assetexplorer	zohocorp	4.0	4017	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 4.0 Service Pack 4017	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:4.0:4017	cpe:2.3:a:zohocorp:manageengine_assetexplorer:4.0:4017:*:*:*:*:*:*	*	*	*	*
2499	manageengine_assetexplorer	zohocorp	5.6	5000	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5000	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5000	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5000:*:*:*:*:*:*	*	*	*	*
2500	manageengine_assetexplorer	zohocorp	5.6	5001	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5001	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5001	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5001:*:*:*:*:*:*	*	*	*	*
2501	manageengine_assetexplorer	zohocorp	5.6	5002	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5002	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5002	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5002:*:*:*:*:*:*	*	*	*	*
2502	manageengine_assetexplorer	zohocorp	5.6	5003	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5003	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5003	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5003:*:*:*:*:*:*	*	*	*	*
2503	manageengine_assetexplorer	zohocorp	5.6	5004	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5004	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5004	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5004:*:*:*:*:*:*	*	*	*	*
2504	manageengine_assetexplorer	zohocorp	5.6	5005	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5005	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5005	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5005:*:*:*:*:*:*	*	*	*	*
2505	manageengine_assetexplorer	zohocorp	5.6	5100	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5100	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5100	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5100:*:*:*:*:*:*	*	*	*	*
2506	manageengine_assetexplorer	zohocorp	5.6	5101	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5101	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5101	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5101:*:*:*:*:*:*	*	*	*	*
2507	manageengine_assetexplorer	zohocorp	5.6	5102	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5102	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5102	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5102:*:*:*:*:*:*	*	*	*	*
2508	manageengine_assetexplorer	zohocorp	5.6	5103	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5103	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5103	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5103:*:*:*:*:*:*	*	*	*	*
2509	manageengine_assetexplorer	zohocorp	5.6	5500	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5500	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5500	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5500:*:*:*:*:*:*	*	*	*	*
2510	manageengine_assetexplorer	zohocorp	5.6	5501	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5501	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5501	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5501:*:*:*:*:*:*	*	*	*	*
2511	manageengine_assetexplorer	zohocorp	5.6	5502	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5502	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5502	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5502:*:*:*:*:*:*	*	*	*	*
2512	manageengine_assetexplorer	zohocorp	5.6	5503	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5503	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5503	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5503:*:*:*:*:*:*	*	*	*	*
2513	manageengine_assetexplorer	zohocorp	5.6	5504	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5504	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5504	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5504:*:*:*:*:*:*	*	*	*	*
2514	manageengine_assetexplorer	zohocorp	5.6	5600	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5600	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5600	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5600:*:*:*:*:*:*	*	*	*	*
2515	manageengine_assetexplorer	zohocorp	5.6	5601	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5601	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5601	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5601:*:*:*:*:*:*	*	*	*	*
2516	manageengine_assetexplorer	zohocorp	5.6	5602	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5602	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5602	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5602:*:*:*:*:*:*	*	*	*	*
2517	manageengine_assetexplorer	zohocorp	5.6	5603	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5603	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5603	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5603:*:*:*:*:*:*	*	*	*	*
2518	manageengine_assetexplorer	zohocorp	5.6	5604	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5604	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5604	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5604:*:*:*:*:*:*	*	*	*	*
2519	manageengine_assetexplorer	zohocorp	5.6	5605	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5605	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5605	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5605:*:*:*:*:*:*	*	*	*	*
2520	manageengine_assetexplorer	zohocorp	5.6	5606	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5606	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5606	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5606:*:*:*:*:*:*	*	*	*	*
2521	manageengine_assetexplorer	zohocorp	5.6	5607	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5607	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5607	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5607:*:*:*:*:*:*	*	*	*	*
2522	manageengine_assetexplorer	zohocorp	5.6	5608	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5608	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5608	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5608:*:*:*:*:*:*	*	*	*	*
2523	manageengine_assetexplorer	zohocorp	5.6	5609	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5609	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5609	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5609:*:*:*:*:*:*	*	*	*	*
2780	jdk	sun	1.5.0	update2		\N	2018-05-31 16:59:57.478216	2018-05-31 16:59:57.478216	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update2	\N	\N	\N	\N	\N
2524	manageengine_assetexplorer	zohocorp	5.6	5610	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5610	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5610	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5610:*:*:*:*:*:*	*	*	*	*
2525	manageengine_assetexplorer	zohocorp	5.6	5611	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5611	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5611	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5611:*:*:*:*:*:*	*	*	*	*
2526	manageengine_assetexplorer	zohocorp	5.6	5612	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5612	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5612	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5612:*:*:*:*:*:*	*	*	*	*
2527	manageengine_assetexplorer	zohocorp	5.6	5613	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5613	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5613	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5613:*:*:*:*:*:*	*	*	*	*
2528	manageengine_assetexplorer	zohocorp	5.6	5614	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine Asset Explorer 5.6 Service Pack 5614	[]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:5.6:5614	cpe:2.3:a:zohocorp:manageengine_assetexplorer:5.6:5614:*:*:*:*:*:*	*	*	*	*
2529	manageengine_assetexplorer	zohocorp	6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Asset Explorer 6.1	[{"Vendor Website":"https://www.manageengine.com/products/asset-explorer/"}]	/a	*	cpe:/a:zohocorp:manageengine_assetexplorer:6.1	cpe:2.3:a:zohocorp:manageengine_assetexplorer:6.1:*:*:*:*:*:*:*	*	*	*	*
2530	manageengine_desktop_central	zohocorp	9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Desktop Central 9.0	[{"Product information":"http://www.manageengine.com/products/desktop-central/"}]	/a	*	cpe:/a:zohocorp:manageengine_desktop_central:9.0	cpe:2.3:a:zohocorp:manageengine_desktop_central:9.0:*:*:*:*:*:*:*	*	*	*	*
2531	manageengine_desktop_central	zohocorp	9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Desktop Central Managed Service Providers 9.0	[{"Vendor website":"http://www.manageengine.com/products/desktop-central/"}]	/a	*	cpe:/a:zohocorp:manageengine_desktop_central:9.0::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_desktop_central:9.0:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2532	manageengine_eventlog_analyzer	zohocorp	7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOHO ManageEngine EventLog Analyzer 7.0	[{"Vendor Website":"http://www.zohocorp.com/index.html"},{"vendor product information":"http://www.manageengine.com/products/eventlog/"}]	/a	*	cpe:/a:zohocorp:manageengine_eventlog_analyzer:7.0	cpe:2.3:a:zohocorp:manageengine_eventlog_analyzer:7.0:*:*:*:*:*:*:*	*	*	*	*
2533	manageengine_eventlog_analyzer	zohocorp	9.0	9000	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOHO ManageEngine EventLog Analyzer 9.0 build 9000	[{"vendor product information":"http://www.manageengine.com/products/eventlog/"},{"Vendor Website":"http://www.zohocorp.com/index.html"}]	/a	*	cpe:/a:zohocorp:manageengine_eventlog_analyzer:9.0:9000	cpe:2.3:a:zohocorp:manageengine_eventlog_analyzer:9.0:9000:*:*:*:*:*:*	*	*	*	*
2534	manageengine_eventlog_analyzer	zohocorp	9.0	9002	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOHO ManageEngine EventLog Analyzer 9.0 build 9002	[{"vendor product information":"http://www.manageengine.com/products/eventlog/"},{"Vendor Website":"http://www.zohocorp.com/index.html"}]	/a	*	cpe:/a:zohocorp:manageengine_eventlog_analyzer:9.0:9002	cpe:2.3:a:zohocorp:manageengine_eventlog_analyzer:9.0:9002:*:*:*:*:*:*	*	*	*	*
2535	manageengine_it360	zohocorp	10.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine IT360 10.3.3	[{"Vendor website":"http://www.manageengine.com/it360/"}]	/a	*	cpe:/a:zohocorp:manageengine_it360:10.3.3	cpe:2.3:a:zohocorp:manageengine_it360:10.3.3:*:*:*:*:*:*:*	*	*	*	*
2536	manageengine_it360	zohocorp	10.3.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine IT360 Managed Service Providers 10.3.3	[{"Vendor website":"http://www.manageengine.com/it360/"}]	/a	*	cpe:/a:zohocorp:manageengine_it360:10.3.3::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_it360:10.3.3:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2537	manageengine_opmanager	zohocorp	11.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp Manageengine OpManager 11.4	[{"Vendor Website":"http://www.manageengine.com/"},{"Version History":"http://help.opmanager.com/read-me"}]	/a	*	cpe:/a:zohocorp:manageengine_opmanager:11.4	cpe:2.3:a:zohocorp:manageengine_opmanager:11.4:*:*:*:*:*:*:*	*	*	*	*
2538	manageengine_opmanager	zohocorp	11.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp Manageengine OpManager 11.5	[{"Vendor Website":"http://www.manageengine.com/"},{"Version History":"http://help.opmanager.com/read-me"}]	/a	*	cpe:/a:zohocorp:manageengine_opmanager:11.5	cpe:2.3:a:zohocorp:manageengine_opmanager:11.5:*:*:*:*:*:*:*	*	*	*	*
2539	manageengine_opstor	zohocorp	8.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine OpStor 8.3 (build 8300)	[{"zohocorp ManageEngine OpStor software version information":"http://www.manageengine.com/products/opstor/download.html"},{"zohocorp ManageEngine OpStor product information":"http://www.manageengine.com/products/opstor/"}]	/a	*	cpe:/a:zohocorp:manageengine_opstor:8.3	cpe:2.3:a:zohocorp:manageengine_opstor:8.3:*:*:*:*:*:*:*	*	*	*	*
2540	manageengine_opstor	zohocorp	8.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zohocorp ManageEngine OpStor 8.5(build 8500)	[{"zohocorp ManageEngine OpStor software version information":"http://www.manageengine.com/products/opstor/download.html"},{"zohocorp ManageEngine OpStor product information":"http://www.manageengine.com/products/opstor/"}]	/a	*	cpe:/a:zohocorp:manageengine_opstor:8.5	cpe:2.3:a:zohocorp:manageengine_opstor:8.5:*:*:*:*:*:*:*	*	*	*	*
2541	manageengine_password_manager_pro	zohocorp	5.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 5.0	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:5.0::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:5.0:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2542	manageengine_password_manager_pro	zohocorp	5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 5.1	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:5.1::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:5.1:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2543	manageengine_password_manager_pro	zohocorp	5.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 5.2	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:5.2::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:5.2:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2632	zope	zope	2.9.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.9.4	[]	/a	*	cpe:/a:zope:zope:2.9.4	cpe:2.3:a:zope:zope:2.9.4:*:*:*:*:*:*:*	*	*	*	*
2544	manageengine_password_manager_pro	zohocorp	5.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 5.3	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:5.3::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:5.3:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2545	manageengine_password_manager_pro	zohocorp	5.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 5.4	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:5.4::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:5.4:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2546	manageengine_password_manager_pro	zohocorp	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.0	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.0::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.0:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2547	manageengine_password_manager_pro	zohocorp	6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.1	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.1::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.1:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2548	manageengine_password_manager_pro	zohocorp	6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 6.2	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.2	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.2:*:*:*:*:*:*:*	*	*	*	*
2549	manageengine_password_manager_pro	zohocorp	6.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.2	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.2::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.2:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2550	manageengine_password_manager_pro	zohocorp	6.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 6.3	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.3	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.3:*:*:*:*:*:*:*	*	*	*	*
2551	manageengine_password_manager_pro	zohocorp	6.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.3	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.3::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.3:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2552	manageengine_password_manager_pro	zohocorp	6.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 6.4	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.4	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.4:*:*:*:*:*:*:*	*	*	*	*
2553	manageengine_password_manager_pro	zohocorp	6.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.4	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.4::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.4:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2554	manageengine_password_manager_pro	zohocorp	6.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 6.5	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.5	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.5:*:*:*:*:*:*:*	*	*	*	*
2555	manageengine_password_manager_pro	zohocorp	6.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.5	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.5::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.5:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2556	manageengine_password_manager_pro	zohocorp	6.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 6.9	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.9	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.9:*:*:*:*:*:*:*	*	*	*	*
2557	manageengine_password_manager_pro	zohocorp	6.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 6.9	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:6.9::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:6.9:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2558	manageengine_password_manager_pro	zohocorp	7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 7.0	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:7.0	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:7.0:*:*:*:*:*:*:*	*	*	*	*
2559	manageengine_password_manager_pro	zohocorp	7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 7.0	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:7.0::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:7.0:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2560	manageengine_password_manager_pro	zohocorp	7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro 7.1	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:7.1	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:7.1:*:*:*:*:*:*:*	*	*	*	*
2561	manageengine_password_manager_pro	zohocorp	7.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine Password Manager Pro Managed Service Providers 7.1	[{"Vendor website":"http://www.manageengine.com/products/passwordmanagerpro/"}]	/a	*	cpe:/a:zohocorp:manageengine_password_manager_pro:7.1::~~managed_service_providers~~~	cpe:2.3:a:zohocorp:manageengine_password_manager_pro:7.1:*:*:*:managed_service_providers:*:*:*	*	*	managed_service_providers	*
2709	jdk	oracle	1.6.0	update_29		\N	2018-05-31 16:59:57.035755	2018-05-31 16:59:57.035755	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_29	\N	\N	\N	\N	\N
2562	manageengine_social_it_plus	zohocorp	11.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOHOcorp ManageEngine Social IT Plus 11.0	[{"Vendor website":"https://store.manageengine.com/social-it/"}]	/a	*	cpe:/a:zohocorp:manageengine_social_it_plus:11.0	cpe:2.3:a:zohocorp:manageengine_social_it_plus:11.0:*:*:*:*:*:*:*	*	*	*	*
2563	manageengine_supportcenter_plus	zohocorp	7.9	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ManageEngine SupportCenter Plus 7.9	[{"Vendor website":"http://www.manageengine.com/products/support-center/"}]	/a	*	cpe:/a:zohocorp:manageengine_supportcenter_plus:7.9	cpe:2.3:a:zohocorp:manageengine_supportcenter_plus:7.9:*:*:*:*:*:*:*	*	*	*	*
2564	manageengine_supportcenter_plus	zohocorp	7.90	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ManageEngine SupportCenter Plus 7.90	[{"Vendor website":"http://www.manageengine.com/products/support-center/"}]	/a	*	cpe:/a:zohocorp:manageengine_supportcenter_plus:7.90	cpe:2.3:a:zohocorp:manageengine_supportcenter_plus:7.90:*:*:*:*:*:*:*	*	*	*	*
2565	servicedesk_plus	zohocorp	9.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZohoCorp ManageEngine ServiceDesk Plus 9.0	[{"Product changelog":"http://www.manageengine.com/products/service-desk/readme-9.0.html"},{"Vendor website":"http://www.manageengine.com/products/service-desk/?index"}]	/a	*	cpe:/a:zohocorp:servicedesk_plus:9.0	cpe:2.3:a:zohocorp:servicedesk_plus:9.0:*:*:*:*:*:*:*	*	*	*	*
2566	zombie_detector	zombie_detector_project	1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zombie Detector Project Zombie Detector (aka com.jimmybolstad.zombiedetector) for Android 1.2	[{"Product Information":"https://play.google.com/store/apps/details?id=com.jimmybolstad.zombiedetector"}]	/a	*	cpe:/a:zombie_detector_project:zombie_detector:1.2::~~~android~~	cpe:2.3:a:zombie_detector_project:zombie_detector:1.2:*:*:*:*:android:*:*	*	*	*	*
2567	imsecure	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs IMsecure	[]	/a	*	cpe:/a:zonelabs:imsecure:-	cpe:2.3:a:zonelabs:imsecure:-:*:*:*:*:*:*:*	*	*	*	*
2568	imsecure	zonelabs	1.0.0.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs IMsecure 1.0.0.0	[]	/a	*	cpe:/a:zonelabs:imsecure:1.0.0.0	cpe:2.3:a:zonelabs:imsecure:1.0.0.0:*:*:*:*:*:*:*	*	*	*	*
2569	imsecure	zonelabs	1.0.1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs IMsecure 1.0.1.0	[]	/a	*	cpe:/a:zonelabs:imsecure:1.0.1.0	cpe:2.3:a:zonelabs:imsecure:1.0.1.0:*:*:*:*:*:*:*	*	*	*	*
2570	imsecure	zonelabs	1.0.2.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs IMsecure 1.0.2.0	[]	/a	*	cpe:/a:zonelabs:imsecure:1.0.2.0	cpe:2.3:a:zonelabs:imsecure:1.0.2.0:*:*:*:*:*:*:*	*	*	*	*
2571	integrity	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs Zone Integrity	[]	/a	*	cpe:/a:zonelabs:integrity:-	cpe:2.3:a:zonelabs:integrity:-:*:*:*:*:*:*:*	*	*	*	*
2572	integrity	zonelabs	4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs Zone Integrity 4.0	[]	/a	*	cpe:/a:zonelabs:integrity:4.0	cpe:2.3:a:zonelabs:integrity:4.0:*:*:*:*:*:*:*	*	*	*	*
2573	zonealarm	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm	[]	/a	*	cpe:/a:zonelabs:zonealarm:-	cpe:2.3:a:zonelabs:zonealarm:-:*:*:*:*:*:*:*	*	*	*	*
2574	zonealarm	zonelabs	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs Zone Alarm 1.0	[]	/a	*	cpe:/a:zonelabs:zonealarm:1.0	cpe:2.3:a:zonelabs:zonealarm:1.0:*:*:*:*:*:*:*	*	*	*	*
2575	zonealarm	zonelabs	2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.1	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.1	cpe:2.3:a:zonelabs:zonealarm:2.1:*:*:*:*:*:*:*	*	*	*	*
2576	zonealarm	zonelabs	2.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.2	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.2	cpe:2.3:a:zonelabs:zonealarm:2.2:*:*:*:*:*:*:*	*	*	*	*
2577	zonealarm	zonelabs	2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.3	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.3	cpe:2.3:a:zonelabs:zonealarm:2.3:*:*:*:*:*:*:*	*	*	*	*
2578	zonealarm	zonelabs	2.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.4	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.4	cpe:2.3:a:zonelabs:zonealarm:2.4:*:*:*:*:*:*:*	*	*	*	*
2579	zonealarm	zonelabs	2.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.5	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.5	cpe:2.3:a:zonelabs:zonealarm:2.5:*:*:*:*:*:*:*	*	*	*	*
2580	zonealarm	zonelabs	2.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 2.6	[]	/a	*	cpe:/a:zonelabs:zonealarm:2.6	cpe:2.3:a:zonelabs:zonealarm:2.6:*:*:*:*:*:*:*	*	*	*	*
2581	zonealarm	zonelabs	3.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 3.0	[]	/a	*	cpe:/a:zonelabs:zonealarm:3.0	cpe:2.3:a:zonelabs:zonealarm:3.0:*:*:*:*:*:*:*	*	*	*	*
2582	zonealarm	zonelabs	4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 4.0	[]	/a	*	cpe:/a:zonelabs:zonealarm:4.0	cpe:2.3:a:zonelabs:zonealarm:4.0:*:*:*:*:*:*:*	*	*	*	*
2583	zonealarm	zonelabs	5.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 5.5	[]	/a	*	cpe:/a:zonelabs:zonealarm:5.5	cpe:2.3:a:zonelabs:zonealarm:5.5:*:*:*:*:*:*:*	*	*	*	*
2584	zonealarm	zonelabs	5.5.062.011	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 5.5.062.011	[]	/a	*	cpe:/a:zonelabs:zonealarm:5.5.062.011	cpe:2.3:a:zonelabs:zonealarm:5.5.062.011:*:*:*:*:*:*:*	*	*	*	*
2585	zonealarm	zonelabs	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm 6.0	[]	/a	*	cpe:/a:zonelabs:zonealarm:6.0	cpe:2.3:a:zonelabs:zonealarm:6.0:*:*:*:*:*:*:*	*	*	*	*
2586	zonealarm_anti-spyware	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Anti-Spyware	[]	/a	*	cpe:/a:zonelabs:zonealarm_anti-spyware:-	cpe:2.3:a:zonelabs:zonealarm_anti-spyware:-:*:*:*:*:*:*:*	*	*	*	*
2587	zonealarm_anti-spyware	zonelabs	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Anti-Spyware 6.0	[]	/a	*	cpe:/a:zonelabs:zonealarm_anti-spyware:6.0	cpe:2.3:a:zonelabs:zonealarm_anti-spyware:6.0:*:*:*:*:*:*:*	*	*	*	*
2588	zonealarm_anti-spyware	zonelabs	6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Anti-Spyware 6.1	[]	/a	*	cpe:/a:zonelabs:zonealarm_anti-spyware:6.1	cpe:2.3:a:zonelabs:zonealarm_anti-spyware:6.1:*:*:*:*:*:*:*	*	*	*	*
2589	zonealarm_antivirus	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Antivirus	[]	/a	*	cpe:/a:zonelabs:zonealarm_antivirus:-	cpe:2.3:a:zonelabs:zonealarm_antivirus:-:*:*:*:*:*:*:*	*	*	*	*
2590	zonealarm_antivirus	zonelabs	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Anti-Virus 6.0	[]	/a	*	cpe:/a:zonelabs:zonealarm_antivirus:6.0	cpe:2.3:a:zonelabs:zonealarm_antivirus:6.0:*:*:*:*:*:*:*	*	*	*	*
2591	zonealarm_internet_security_suite	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Internet Security Suite	[]	/a	*	cpe:/a:zonelabs:zonealarm_internet_security_suite:-	cpe:2.3:a:zonelabs:zonealarm_internet_security_suite:-:*:*:*:*:*:*:*	*	*	*	*
2592	zonealarm_security_suite	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Security Suite	[]	/a	*	cpe:/a:zonelabs:zonealarm_security_suite:-	cpe:2.3:a:zonelabs:zonealarm_security_suite:-:*:*:*:*:*:*:*	*	*	*	*
2593	zonealarm_security_suite	zonelabs	6.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Internet Security Suite 6.0	[]	/a	*	cpe:/a:zonelabs:zonealarm_security_suite:6.0	cpe:2.3:a:zonelabs:zonealarm_security_suite:6.0:*:*:*:*:*:*:*	*	*	*	*
2710	jdk	oracle	1.6.0	update_30		\N	2018-05-31 16:59:57.041787	2018-05-31 16:59:57.041787	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_30	\N	\N	\N	\N	\N
2594	zonealarm_security_suite	zonelabs	6.1.737.000	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Internet Security Suite 6.1.737.000	[]	/a	*	cpe:/a:zonelabs:zonealarm_security_suite:6.1.737.000	cpe:2.3:a:zonelabs:zonealarm_security_suite:6.1.737.000:*:*:*:*:*:*:*	*	*	*	*
2595	zonealarm_security_suite	zonelabs	6.1.744.000	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Security Suite 6.1.744.000	[]	/a	*	cpe:/a:zonelabs:zonealarm_security_suite:6.1.744.000	cpe:2.3:a:zonelabs:zonealarm_security_suite:6.1.744.000:*:*:*:*:*:*:*	*	*	*	*
2596	zonealarm_security_suite	zonelabs	6.5.722.000	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Internet Security Suite 6.5.722.000	[]	/a	*	cpe:/a:zonelabs:zonealarm_security_suite:6.5.722.000	cpe:2.3:a:zonelabs:zonealarm_security_suite:6.5.722.000:*:*:*:*:*:*:*	*	*	*	*
2597	zonealarm_wireless_security	zonelabs	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Wireless	[]	/a	*	cpe:/a:zonelabs:zonealarm_wireless_security:-	cpe:2.3:a:zonelabs:zonealarm_wireless_security:-:*:*:*:*:*:*:*	*	*	*	*
2598	zonealarm_wireless_security	zonelabs	5.5.080.000	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zone Labs ZoneAlarm Wireless 5.5.080.000	[]	/a	*	cpe:/a:zonelabs:zonealarm_wireless_security:5.5.080.000	cpe:2.3:a:zonelabs:zonealarm_wireless_security:5.5.080.000:*:*:*:*:*:*:*	*	*	*	*
2599	phptraffica	zoneo-soft	2.2.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZoneO-Soft phpTrafficA 2.2.1	[{"Vendor website":"http://soft.zoneo.net/"}]	/a	*	cpe:/a:zoneo-soft:phptraffica:2.2.1	cpe:2.3:a:zoneo-soft:phptraffica:2.2.1:*:*:*:*:*:*:*	*	*	*	*
2600	phptraffica	zoneo-soft	2.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZoneO-Soft phpTrafficA 2.3	[{"Product Information":"http://soft.zoneo.net/phpTrafficA/"},{"Vendor website":"http://soft.zoneo.net/"}]	/a	*	cpe:/a:zoneo-soft:phptraffica:2.3	cpe:2.3:a:zoneo-soft:phptraffica:2.3:*:*:*:*:*:*:*	*	*	*	*
2601	zoner_antivirus_free	zoner	-	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zoner Zoner AntiVirus Free for Android	[]	/a	*	cpe:/a:zoner:zoner_antivirus_free:-:-:~~~android~~	cpe:2.3:a:zoner:zoner_antivirus_free:-:-:*:*:*:android:*:*	*	*	*	*
2602	zoner_antivirus_free	zoner	1.7.0	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zoner AntiVirus Free 1.7.0 for Android	[]	/a	*	cpe:/a:zoner:zoner_antivirus_free:1.7.0:-:~~~android~~	cpe:2.3:a:zoner:zoner_antivirus_free:1.7.0:-:*:*:*:android:*:*	*	*	*	*
2603	kid_mode:_free_games_+_lock	zoodles	4.9.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zoodles Kid Mode: Free Games + Lock (aka com.zoodles.kidmode) application for Android 4.9.8	[{"Product Information":"https://play.google.com/store/apps/details?id=com.zoodles.kidmode"},{"Vendor Website":"http://www.zoodles.com/en-US/home/marketing"}]	/a	*	cpe:/a:zoodles:kid_mode%3a_free_games_%2b_lock:4.9.8::~~~android~~	cpe:2.3:a:zoodles:kid_mode\\:_free_games_\\+_lock:4.9.8:*:*:*:*:android:*:*	*	*	*	*
2604	zooeffect	zooeffect	1.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZooEffect plugin 1.0	[]	/a	*	cpe:/a:zooeffect:zooeffect:1.0	cpe:2.3:a:zooeffect:zooeffect:1.0:*:*:*:*:*:*:*	*	*	*	*
2605	zooeffect	zooeffect	1.01	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZooEffect plugin 1.01	[]	/a	*	cpe:/a:zooeffect:zooeffect:1.01	cpe:2.3:a:zooeffect:zooeffect:1.01:*:*:*:*:*:*:*	*	*	*	*
2606	zooeffect	zooeffect	1.02	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZooEffect plugin 1.02	[]	/a	*	cpe:/a:zooeffect:zooeffect:1.02	cpe:2.3:a:zooeffect:zooeffect:1.02:*:*:*:*:*:*:*	*	*	*	*
2607	zooeffect	zooeffect	1.03	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZooEffect plugin 1.03	[]	/a	*	cpe:/a:zooeffect:zooeffect:1.03	cpe:2.3:a:zooeffect:zooeffect:1.03:*:*:*:*:*:*:*	*	*	*	*
2608	zooeffect	zooeffect	1.04	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZooEffect plugin 1.04	[]	/a	*	cpe:/a:zooeffect:zooeffect:1.04	cpe:2.3:a:zooeffect:zooeffect:1.04:*:*:*:*:*:*:*	*	*	*	*
2609	zoom_cloud_meetings	zoom	@7f060008	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZOOM Cloud Meetings (aka us.zoom.videomeetings) for Android @7F060008	[{"Product Information":"https://play.google.com/store/apps/details?id=us.zoom.videomeetings"},{"Vendor Website":"http://zoom.us/"}]	/a	*	cpe:/a:zoom:zoom_cloud_meetings:%407f060008::~~~android~~	cpe:2.3:a:zoom:zoom_cloud_meetings:\\@7f060008:*:*:*:*:android:*:*	*	*	*	*
2610	zope	zope	2.10.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.10.3	[]	/a	*	cpe:/a:zope:zope:2.10.3	cpe:2.3:a:zope:zope:2.10.3:*:*:*:*:*:*:*	*	*	*	*
2611	zope	zope	2.10.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.10.8	[]	/a	*	cpe:/a:zope:zope:2.10.8	cpe:2.3:a:zope:zope:2.10.8:*:*:*:*:*:*:*	*	*	*	*
2612	zope	zope	2.11.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.11.0	[]	/a	*	cpe:/a:zope:zope:2.11.0	cpe:2.3:a:zope:zope:2.11.0:*:*:*:*:*:*:*	*	*	*	*
2613	zope	zope	2.11.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.11.1	[]	/a	*	cpe:/a:zope:zope:2.11.1	cpe:2.3:a:zope:zope:2.11.1:*:*:*:*:*:*:*	*	*	*	*
2614	zope	zope	2.11.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.11.2	[]	/a	*	cpe:/a:zope:zope:2.11.2	cpe:2.3:a:zope:zope:2.11.2:*:*:*:*:*:*:*	*	*	*	*
2615	zope	zope	2.11.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.11.3	[]	/a	*	cpe:/a:zope:zope:2.11.3	cpe:2.3:a:zope:zope:2.11.3:*:*:*:*:*:*:*	*	*	*	*
2616	zope	zope	2.5.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.5.1	[]	/a	*	cpe:/a:zope:zope:2.5.1	cpe:2.3:a:zope:zope:2.5.1:*:*:*:*:*:*:*	*	*	*	*
2617	zope	zope	2.6.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.6.1	[]	/a	*	cpe:/a:zope:zope:2.6.1	cpe:2.3:a:zope:zope:2.6.1:*:*:*:*:*:*:*	*	*	*	*
2618	zope	zope	2.6.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.6.4	[]	/a	*	cpe:/a:zope:zope:2.6.4	cpe:2.3:a:zope:zope:2.6.4:*:*:*:*:*:*:*	*	*	*	*
2619	zope	zope	2.7.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.0	[]	/a	*	cpe:/a:zope:zope:2.7.0	cpe:2.3:a:zope:zope:2.7.0:*:*:*:*:*:*:*	*	*	*	*
2620	zope	zope	2.7.3	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.3	[]	/a	*	cpe:/a:zope:zope:2.7.3	cpe:2.3:a:zope:zope:2.7.3:*:*:*:*:*:*:*	*	*	*	*
2621	zope	zope	2.7.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.4	[]	/a	*	cpe:/a:zope:zope:2.7.4	cpe:2.3:a:zope:zope:2.7.4:*:*:*:*:*:*:*	*	*	*	*
2622	zope	zope	2.7.5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.5	[]	/a	*	cpe:/a:zope:zope:2.7.5	cpe:2.3:a:zope:zope:2.7.5:*:*:*:*:*:*:*	*	*	*	*
2623	zope	zope	2.7.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.6	[]	/a	*	cpe:/a:zope:zope:2.7.6	cpe:2.3:a:zope:zope:2.7.6:*:*:*:*:*:*:*	*	*	*	*
2624	zope	zope	2.7.7	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.7	[]	/a	*	cpe:/a:zope:zope:2.7.7	cpe:2.3:a:zope:zope:2.7.7:*:*:*:*:*:*:*	*	*	*	*
2625	zope	zope	2.7.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.7.8	[]	/a	*	cpe:/a:zope:zope:2.7.8	cpe:2.3:a:zope:zope:2.7.8:*:*:*:*:*:*:*	*	*	*	*
2626	zope	zope	2.8.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.8.1	[]	/a	*	cpe:/a:zope:zope:2.8.1	cpe:2.3:a:zope:zope:2.8.1:*:*:*:*:*:*:*	*	*	*	*
2627	zope	zope	2.8.4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.8.4	[]	/a	*	cpe:/a:zope:zope:2.8.4	cpe:2.3:a:zope:zope:2.8.4:*:*:*:*:*:*:*	*	*	*	*
2628	zope	zope	2.8.6	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.8.6	[]	/a	*	cpe:/a:zope:zope:2.8.6	cpe:2.3:a:zope:zope:2.8.6:*:*:*:*:*:*:*	*	*	*	*
2629	zope	zope	2.8.8	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 2.8.8	[]	/a	*	cpe:/a:zope:zope:2.8.8	cpe:2.3:a:zope:zope:2.8.8:*:*:*:*:*:*:*	*	*	*	*
2636	zope	zope	3.4.0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope 3.4.0	[]	/a	*	cpe:/a:zope:zope:3.4.0	cpe:2.3:a:zope:zope:3.4.0:*:*:*:*:*:*:*	*	*	*	*
2637	zserver	zope	1.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zope zserver 1.1	[]	/a	*	cpe:/a:zope:zserver:1.1	cpe:2.3:a:zope:zserver:1.1:*:*:*:*:*:*:*	*	*	*	*
2638	zserver	zope	1.1b1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zope zserver 1.1b1	[]	/a	*	cpe:/a:zope:zserver:1.1b1	cpe:2.3:a:zope:zserver:1.1b1:*:*:*:*:*:*:*	*	*	*	*
2639	zserver	zope	11.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zope Zserver 11.1	[]	/a	*	cpe:/a:zope:zserver:11.1	cpe:2.3:a:zope:zserver:11.1:*:*:*:*:*:*:*	*	*	*	*
2640	zotpress	zotpress_project	6.1.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zotpress Project Zotpress 6.1.2 for Wordpress	[{"Change Log":"https://wordpress.org/plugins/zotpress/changelog/"}]	/a	*	cpe:/a:zotpress_project:zotpress:6.1.2::~~~wordpress~~	cpe:2.3:a:zotpress_project:zotpress:6.1.2:*:*:*:*:wordpress:*:*	*	*	*	*
2641	zpanel	zpanelcp	10.0.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZPanelCP ZPanel  10.0.1	[{"Product Information":"http://www.zpanelcp.com/download/"}]	/a	*	cpe:/a:zpanelcp:zpanel:10.0.1	cpe:2.3:a:zpanelcp:zpanel:10.0.1:*:*:*:*:*:*:*	*	*	*	*
2642	zroadster.com	zroadster	2.4.13.17	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	zroadster zroadster.com (aka com.tapatalk.zroadstercomforum) for android 2.4.13.17	[{"Product information":"https://play.google.com/store/apps/details?id=com.tapatalk.zroadstercomforum"},{"Vendor website":"http://www.zroadster.com"}]	/a	*	cpe:/a:zroadster:zroadster.com:2.4.13.17::~~~android~~	cpe:2.3:a:zroadster:zroadster.com:2.4.13.17:*:*:*:*:android:*:*	*	*	*	*
2643	f460	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE F460 modem	[{"vendor information re. CVE-2014-2321":"http://wwwen.zte.com.cn/en//about/corporate_citizenship/security/notices/201405/P020140508527486120273.pdf"}]	/h	*	cpe:/h:zte:f460:-	cpe:2.3:h:zte:f460:-:*:*:*:*:*:*:*	*	*	*	*
2644	f660	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE F660 modem	[{"vendor information re. CVE-2014-2321":"http://wwwen.zte.com.cn/en//about/corporate_citizenship/security/notices/201405/P020140508527486120273.pdf"}]	/h	*	cpe:/h:zte:f660:-	cpe:2.3:h:zte:f660:-:*:*:*:*:*:*:*	*	*	*	*
2645	zxdsl_831	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTEUSA ZXDSL 831	[{"Vendor":"http://www.zteusa.com/"}]	/h	*	cpe:/h:zte:zxdsl_831:-	cpe:2.3:h:zte:zxdsl_831:-:*:*:*:*:*:*:*	*	*	*	*
2646	zxdsl_831cii	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTEUSA ZXDSL 831CII	[{"Vendor":"http://www.zteusa.com/"}]	/h	*	cpe:/h:zte:zxdsl_831cii:-	cpe:2.3:h:zte:zxdsl_831cii:-:*:*:*:*:*:*:*	*	*	*	*
2647	zxhn_h108l	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTEUSA ZXHN H108L	[{"Vendor":"http://www.zteusa.com/"}]	/h	*	cpe:/h:zte:zxhn_h108l:-	cpe:2.3:h:zte:zxhn_h108l:-:*:*:*:*:*:*:*	*	*	*	*
2648	zxhn_h108l_firmware	zte	4.0.0d_zrq_gr4	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTEUSA ZXHN H108L firmware 4.0.0d ZRQ GR4	[{"Vendor":"http://www.zteusa.com/"}]	/o	*	cpe:/o:zte:zxhn_h108l_firmware:4.0.0d_zrq_gr4	cpe:2.3:o:zte:zxhn_h108l_firmware:4.0.0d_zrq_gr4:*:*:*:*:*:*:*	*	*	*	*
2649	zxhn_h108n_r1a	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE ZXHN H108N R1A	[{"Vendor":"http://www.zteusa.com/"},{"Advisory":"https://www.kb.cert.org/vuls/id/391604"}]	/h	*	cpe:/h:zte:zxhn_h108n_r1a:-	cpe:2.3:h:zte:zxhn_h108n_r1a:-:*:*:*:*:*:*:*	*	*	*	*
2650	zxhn_h108n_r1a_firmware	zte	zte.bhs.zxhnh108nr1a.h_pe	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE ZXHN H108N R1A Firmware ZTE.BHS.ZXHNH108NR1A.H PE	[{"Vendor":"http://www.zteusa.com/"},{"Advisory":"https://www.kb.cert.org/vuls/id/391604"}]	/o	*	cpe:/o:zte:zxhn_h108n_r1a_firmware:zte.bhs.zxhnh108nr1a.h_pe	cpe:2.3:o:zte:zxhn_h108n_r1a_firmware:zte.bhs.zxhnh108nr1a.h_pe:*:*:*:*:*:*:*	*	*	*	*
2651	zxv10_w300	zte	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE ZXV10 W300 Router	[{"vendor website":"http://wwwen.zte.com.cn/en/products/access/cpe/201302/t20130204_386351.html"}]	/h	*	cpe:/h:zte:zxv10_w300:-	cpe:2.3:h:zte:zxv10_w300:-:*:*:*:*:*:*:*	*	*	*	*
2652	zxv10_w300_firmware	zte	1.0.0a_zrd_lk	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE ZXV10 W300 Router firmware 1.0.0a_ZRD_LK	[{"vendor website":"http://wwwen.zte.com.cn/en/products/access/cpe/201302/t20130204_386351.html"}]	/o	*	cpe:/o:zte:zxv10_w300_firmware:1.0.0a_zrd_lk	cpe:2.3:o:zte:zxv10_w300_firmware:1.0.0a_zrd_lk:*:*:*:*:*:*:*	*	*	*	*
2653	zxv10_w300_firmware	zte	w300v1.0.0f_er1_pe	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZTE ZXV10 W300 Firmware W300V1.0.0F ER1 PE	[{"Vendor":"http://www.zteusa.com/"},{"Advisory":"https://www.kb.cert.org/vuls/id/391604"}]	/o	*	cpe:/o:zte:zxv10_w300_firmware:w300v1.0.0f_er1_pe	cpe:2.3:o:zte:zxv10_w300_firmware:w300v1.0.0f_er1_pe:*:*:*:*:*:*:*	*	*	*	*
2654	ztree	ztree_project	3.5.19.1	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Ztree Project Ztree 3.5.19.1	[{"Project":"https://github.com/zTree/zTree_v3"}]	/a	*	cpe:/a:ztree_project:ztree:3.5.19.1	cpe:2.3:a:ztree_project:ztree:3.5.19.1:*:*:*:*:*:*:*	*	*	*	*
2655	zurmo_crm	zurmo	3.0.2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zurmo Zurmo CRM 3.0.2	[{"Vendor Website":"http://zurmo.org/"}]	/a	*	cpe:/a:zurmo:zurmo_crm:3.0.2	cpe:2.3:a:zurmo:zurmo_crm:3.0.2:*:*:*:*:*:*:*	*	*	*	*
2656	n300_netusb_nbg-419n	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL Wireless N300 NetUSB NBG-419N router	[{"product information":"http://www.zyxel.com/us/en/products_services/nbg_419n_v2.shtml?t=p"}]	/h	*	cpe:/h:zyxel:n300_netusb_nbg-419n:-	cpe:2.3:h:zyxel:n300_netusb_nbg-419n:-:*:*:*:*:*:*:*	*	*	*	*
2657	n300_netusb_nbg-419n_firmware	zyxel	1.00(bfq_6)c0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL Wireless N300 NetUSB NBG-419N router firmware 1.00(BFQ.6)C0	[{"product information":"http://www.zyxel.com/us/en/products_services/nbg_419n_v2.shtml?t=p"}]	/o	*	cpe:/o:zyxel:n300_netusb_nbg-419n_firmware:1.00%28bfq_6%29c0	cpe:2.3:o:zyxel:n300_netusb_nbg-419n_firmware:1.00\\(bfq_6\\)c0:*:*:*:*:*:*:*	*	*	*	*
2658	nbg-418n	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL NBG-418N	[{"Product":"http://www4.zyxel.com/products_services/nbg_418n_v2.shtml?t=p"},{"Product":"http://www.zyxel.com/us/en/products_services/product_overview.shtml"}]	/h	*	cpe:/h:zyxel:nbg-418n:-	cpe:2.3:h:zyxel:nbg-418n:-:*:*:*:*:*:*:*	*	*	*	*
2659	nbg-418n_firmware	zyxel	1.00(aadz.3)c0	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL NBG-418N Firmware 1.00(AADZ.3)C0	[{"Product":"http://www4.zyxel.com/products_services/nbg_418n_v2.shtml?t=p"},{"Product":"http://www.zyxel.com/us/en/products_services/product_overview.shtml"}]	/o	*	cpe:/o:zyxel:nbg-418n_firmware:1.00%28aadz.3%29c0	cpe:2.3:o:zyxel:nbg-418n_firmware:1.00\\(aadz.3\\)c0:*:*:*:*:*:*:*	*	*	*	*
2660	p-660h-61	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-61	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-61:-	cpe:2.3:h:zyxel:p-660h-61:-:*:*:*:*:*:*:*	*	*	*	*
2661	p-660h-63	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-63	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-63:-	cpe:2.3:h:zyxel:p-660h-63:-:*:*:*:*:*:*:*	*	*	*	*
2662	p-660h-67	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-67	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-67:-	cpe:2.3:h:zyxel:p-660h-67:-:*:*:*:*:*:*:*	*	*	*	*
2781	jdk	sun	1.5.0	update20		\N	2018-05-31 16:59:57.484116	2018-05-31 16:59:57.484116	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update20	\N	\N	\N	\N	\N
2663	p-660h-d1	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-D1	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-d1:-	cpe:2.3:h:zyxel:p-660h-d1:-:*:*:*:*:*:*:*	*	*	*	*
2664	p-660h-d3	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-D3	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-d3:-	cpe:2.3:h:zyxel:p-660h-d3:-:*:*:*:*:*:*:*	*	*	*	*
2665	p-660h-t1	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-T1	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-t1:-	cpe:2.3:h:zyxel:p-660h-t1:-:*:*:*:*:*:*:*	*	*	*	*
2666	p-660h-t1	zyxel	v2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-T1 v2	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-t1:v2	cpe:2.3:h:zyxel:p-660h-t1:v2:*:*:*:*:*:*:*	*	*	*	*
2667	p-660h-t3	zyxel	v2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660H-T3 v2	[{"product information":"http://www.zyxel.com/products_services/p_660h_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660h-t3:v2	cpe:2.3:h:zyxel:p-660h-t3:v2:*:*:*:*:*:*:*	*	*	*	*
2668	p-660hw	zyxel	_t1	-	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW T1 Model (initial release)	[]	/h	*	cpe:/h:zyxel:p-660hw:_t1:-	cpe:2.3:h:zyxel:p-660hw:_t1:-:*:*:*:*:*:*	*	*	*	*
2669	p-660hw	zyxel	_t1	v2	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW T1 Model v2	[]	/h	*	cpe:/h:zyxel:p-660hw:_t1:v2	cpe:2.3:h:zyxel:p-660hw:_t1:v2:*:*:*:*:*:*	*	*	*	*
2670	p-660hw	zyxel	_t1	v3	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW T1 V3	[{"vendor product information":"http://www.zyxel.com/tr/tr/products_services/p_660hw_series.shtml?t=p"}]	/h	*	cpe:/h:zyxel:p-660hw:_t1:v3	cpe:2.3:h:zyxel:p-660hw:_t1:v3:*:*:*:*:*:*	*	*	*	*
2671	p-660hw-t1_2	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel P-660HW-T1 2	[{"Advisory":"https://www.kb.cert.org/vuls/id/870744"}]	/h	*	cpe:/h:zyxel:p-660hw-t1_2:-	cpe:2.3:h:zyxel:p-660hw-t1_2:-:*:*:*:*:*:*:*	*	*	*	*
2672	p-660hw_d1	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW D1 Model (initial release)	[]	/h	*	cpe:/h:zyxel:p-660hw_d1:-	cpe:2.3:h:zyxel:p-660hw_d1:-:*:*:*:*:*:*:*	*	*	*	*
2673	p-660hw_d1	zyxel	v2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW D1 Model v2	[]	/h	*	cpe:/h:zyxel:p-660hw_d1:v2	cpe:2.3:h:zyxel:p-660hw_d1:v2:*:*:*:*:*:*:*	*	*	*	*
2674	p-660hw_d3	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW D3 Model (initial release)	[]	/h	*	cpe:/h:zyxel:p-660hw_d3:-	cpe:2.3:h:zyxel:p-660hw_d3:-:*:*:*:*:*:*:*	*	*	*	*
2675	p-660hw_t3	zyxel	-	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW T3 Model (initial release)	[]	/h	*	cpe:/h:zyxel:p-660hw_t3:-	cpe:2.3:h:zyxel:p-660hw_t3:-:*:*:*:*:*:*:*	*	*	*	*
2676	p-660hw_t3	zyxel	v2	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL P-660HW T3 Model v2	[]	/h	*	cpe:/h:zyxel:p-660hw_t3:v2	cpe:2.3:h:zyxel:p-660hw_t3:v2:*:*:*:*:*:*:*	*	*	*	*
2677	pmg5318-b20a_firmware	zyxel	v100aanc0b5	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	ZyXEL PMG5318-B20A Firmware V100AANC0b5	[{"Advisory":"https://www.kb.cert.org/vuls/id/870744"},{"Vendor":"http://www.zyxel.com/support/support_landing.shtml"}]	/o	*	cpe:/o:zyxel:pmg5318-b20a_firmware:v100aanc0b5	cpe:2.3:o:zyxel:pmg5318-b20a_firmware:v100aanc0b5:*:*:*:*:*:*:*	*	*	*	*
2678	zynos_firmware	zyxel	3.40(axh.0)	*	*	\N	2018-05-31 16:59:43	2018-05-31 16:59:43	Zyxel Zynos Firmware 3.40(AXH.0)	[{"Advisory":"https://www.kb.cert.org/vuls/id/870744"}]	/o	*	cpe:/o:zyxel:zynos_firmware:3.40%28axh.0%29	cpe:2.3:o:zyxel:zynos_firmware:3.40\\(axh.0\\):*:*:*:*:*:*:*	*	*	*	*
2680	javafx	oracle	1.2			\N	2018-05-31 16:59:56.831663	2018-05-31 16:59:56.831663	Oracle Javafx 1.2	\N	/a		cpe:/a:oracle:javafx:1.2	\N	\N	\N	\N	\N
2681	javafx	oracle	1.2.2			\N	2018-05-31 16:59:56.845042	2018-05-31 16:59:56.845042	Oracle Javafx 1.2.2	\N	/a		cpe:/a:oracle:javafx:1.2.2	\N	\N	\N	\N	\N
2682	javafx	oracle	1.2.3			\N	2018-05-31 16:59:56.854126	2018-05-31 16:59:56.854126	Oracle Javafx 1.2.3	\N	/a		cpe:/a:oracle:javafx:1.2.3	\N	\N	\N	\N	\N
2683	javafx	oracle	1.3.0			\N	2018-05-31 16:59:56.876724	2018-05-31 16:59:56.876724	Oracle Javafx 1.3.0	\N	/a		cpe:/a:oracle:javafx:1.3.0	\N	\N	\N	\N	\N
2684	javafx	oracle	1.3.1			\N	2018-05-31 16:59:56.883091	2018-05-31 16:59:56.883091	Oracle Javafx 1.3.1	\N	/a		cpe:/a:oracle:javafx:1.3.1	\N	\N	\N	\N	\N
2685	javafx	oracle	2.0			\N	2018-05-31 16:59:56.88879	2018-05-31 16:59:56.88879	Oracle Javafx 2.0	\N	/a		cpe:/a:oracle:javafx:2.0	\N	\N	\N	\N	\N
2686	javafx	oracle	2.0.2			\N	2018-05-31 16:59:56.896704	2018-05-31 16:59:56.896704	Oracle Javafx 2.0.2	\N	/a		cpe:/a:oracle:javafx:2.0.2	\N	\N	\N	\N	\N
2687	javafx	oracle	2.0.3			\N	2018-05-31 16:59:56.9029	2018-05-31 16:59:56.9029	Oracle Javafx 2.0.3	\N	/a		cpe:/a:oracle:javafx:2.0.3	\N	\N	\N	\N	\N
2688	javafx	oracle	2.1			\N	2018-05-31 16:59:56.908858	2018-05-31 16:59:56.908858	Oracle Javafx 2.1	\N	/a		cpe:/a:oracle:javafx:2.1	\N	\N	\N	\N	\N
2689	jdk	oracle	1.7.0			\N	2018-05-31 16:59:56.91597	2018-05-31 16:59:56.91597	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0	\N	\N	\N	\N	\N
2690	jdk	oracle	1.7.0	update1		\N	2018-05-31 16:59:56.921912	2018-05-31 16:59:56.921912	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update1	\N	\N	\N	\N	\N
2691	jdk	oracle	1.7.0	update2		\N	2018-05-31 16:59:56.927971	2018-05-31 16:59:56.927971	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update2	\N	\N	\N	\N	\N
2692	jdk	oracle	1.7.0	update3		\N	2018-05-31 16:59:56.934235	2018-05-31 16:59:56.934235	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update3	\N	\N	\N	\N	\N
2693	jdk	oracle	1.7.0	update4		\N	2018-05-31 16:59:56.940494	2018-05-31 16:59:56.940494	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update4	\N	\N	\N	\N	\N
2694	jdk	oracle	1.7.0	update5		\N	2018-05-31 16:59:56.946112	2018-05-31 16:59:56.946112	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update5	\N	\N	\N	\N	\N
2695	jdk	oracle	1.7.0	update6		\N	2018-05-31 16:59:56.95192	2018-05-31 16:59:56.95192	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update6	\N	\N	\N	\N	\N
2696	jre	oracle	1.7.0			\N	2018-05-31 16:59:56.959136	2018-05-31 16:59:56.959136	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0	\N	\N	\N	\N	\N
2697	jre	oracle	1.7.0	update1		\N	2018-05-31 16:59:56.964551	2018-05-31 16:59:56.964551	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update1	\N	\N	\N	\N	\N
2698	jre	oracle	1.7.0	update2		\N	2018-05-31 16:59:56.970328	2018-05-31 16:59:56.970328	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update2	\N	\N	\N	\N	\N
2699	jre	oracle	1.7.0	update3		\N	2018-05-31 16:59:56.9761	2018-05-31 16:59:56.9761	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update3	\N	\N	\N	\N	\N
2700	jre	oracle	1.7.0	update4		\N	2018-05-31 16:59:56.981916	2018-05-31 16:59:56.981916	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update4	\N	\N	\N	\N	\N
2701	jre	oracle	1.7.0	update5		\N	2018-05-31 16:59:56.98794	2018-05-31 16:59:56.98794	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update5	\N	\N	\N	\N	\N
2702	jre	oracle	1.7.0	update6		\N	2018-05-31 16:59:56.994203	2018-05-31 16:59:56.994203	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update6	\N	\N	\N	\N	\N
2703	jdk	oracle	1.6.0	update_22		\N	2018-05-31 16:59:57.001271	2018-05-31 16:59:57.001271	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_22	\N	\N	\N	\N	\N
2704	jdk	oracle	1.6.0	update_23		\N	2018-05-31 16:59:57.006871	2018-05-31 16:59:57.006871	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_23	\N	\N	\N	\N	\N
2705	jdk	oracle	1.6.0	update_24		\N	2018-05-31 16:59:57.01247	2018-05-31 16:59:57.01247	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_24	\N	\N	\N	\N	\N
2706	jdk	oracle	1.6.0	update_25		\N	2018-05-31 16:59:57.018071	2018-05-31 16:59:57.018071	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_25	\N	\N	\N	\N	\N
2707	jdk	oracle	1.6.0	update_26		\N	2018-05-31 16:59:57.023881	2018-05-31 16:59:57.023881	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_26	\N	\N	\N	\N	\N
2708	jdk	oracle	1.6.0	update_27		\N	2018-05-31 16:59:57.029657	2018-05-31 16:59:57.029657	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_27	\N	\N	\N	\N	\N
2717	jre	oracle	1.6.0	update_24		\N	2018-05-31 16:59:57.085043	2018-05-31 16:59:57.085043	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_24	\N	\N	\N	\N	\N
2718	jre	oracle	1.6.0	update_25		\N	2018-05-31 16:59:57.090821	2018-05-31 16:59:57.090821	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_25	\N	\N	\N	\N	\N
2719	jre	oracle	1.6.0	update_26		\N	2018-05-31 16:59:57.096736	2018-05-31 16:59:57.096736	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_26	\N	\N	\N	\N	\N
2720	jre	oracle	1.6.0	update_27		\N	2018-05-31 16:59:57.102677	2018-05-31 16:59:57.102677	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_27	\N	\N	\N	\N	\N
2721	jre	oracle	1.6.0	update_29		\N	2018-05-31 16:59:57.108654	2018-05-31 16:59:57.108654	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_29	\N	\N	\N	\N	\N
2722	jre	oracle	1.6.0	update_30		\N	2018-05-31 16:59:57.114488	2018-05-31 16:59:57.114488	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_30	\N	\N	\N	\N	\N
2723	jre	oracle	1.6.0	update_31		\N	2018-05-31 16:59:57.120222	2018-05-31 16:59:57.120222	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_31	\N	\N	\N	\N	\N
2724	jre	oracle	1.6.0	update_32		\N	2018-05-31 16:59:57.126335	2018-05-31 16:59:57.126335	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_32	\N	\N	\N	\N	\N
2725	jre	oracle	1.6.0	update_33		\N	2018-05-31 16:59:57.1325	2018-05-31 16:59:57.1325	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_33	\N	\N	\N	\N	\N
2726	jre	oracle	1.6.0	update_34		\N	2018-05-31 16:59:57.138267	2018-05-31 16:59:57.138267	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_34	\N	\N	\N	\N	\N
2727	jdk	sun	1.6.0	update1		\N	2018-05-31 16:59:57.145588	2018-05-31 16:59:57.145588	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update1	\N	\N	\N	\N	\N
2728	jdk	sun	1.6.0	update1_b06		\N	2018-05-31 16:59:57.151451	2018-05-31 16:59:57.151451	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update1_b06	\N	\N	\N	\N	\N
2729	jdk	sun	1.6.0	update2		\N	2018-05-31 16:59:57.157767	2018-05-31 16:59:57.157767	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update2	\N	\N	\N	\N	\N
2730	jdk	sun	1.6.0	update_10		\N	2018-05-31 16:59:57.163397	2018-05-31 16:59:57.163397	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_10	\N	\N	\N	\N	\N
2731	jdk	sun	1.6.0	update_11		\N	2018-05-31 16:59:57.168828	2018-05-31 16:59:57.168828	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_11	\N	\N	\N	\N	\N
2732	jdk	sun	1.6.0	update_12		\N	2018-05-31 16:59:57.174731	2018-05-31 16:59:57.174731	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_12	\N	\N	\N	\N	\N
2733	jdk	sun	1.6.0	update_13		\N	2018-05-31 16:59:57.180477	2018-05-31 16:59:57.180477	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_13	\N	\N	\N	\N	\N
2734	jdk	sun	1.6.0	update_14		\N	2018-05-31 16:59:57.186595	2018-05-31 16:59:57.186595	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_14	\N	\N	\N	\N	\N
2735	jdk	sun	1.6.0	update_15		\N	2018-05-31 16:59:57.192855	2018-05-31 16:59:57.192855	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_15	\N	\N	\N	\N	\N
2736	jdk	sun	1.6.0	update_16		\N	2018-05-31 16:59:57.199146	2018-05-31 16:59:57.199146	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_16	\N	\N	\N	\N	\N
2737	jdk	sun	1.6.0	update_17		\N	2018-05-31 16:59:57.204714	2018-05-31 16:59:57.204714	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_17	\N	\N	\N	\N	\N
2738	jdk	sun	1.6.0	update_18		\N	2018-05-31 16:59:57.210151	2018-05-31 16:59:57.210151	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_18	\N	\N	\N	\N	\N
2739	jdk	sun	1.6.0	update_19		\N	2018-05-31 16:59:57.215921	2018-05-31 16:59:57.215921	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_19	\N	\N	\N	\N	\N
2740	jdk	sun	1.6.0	update_3		\N	2018-05-31 16:59:57.221653	2018-05-31 16:59:57.221653	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_3	\N	\N	\N	\N	\N
2741	jdk	sun	1.6.0	update_4		\N	2018-05-31 16:59:57.227281	2018-05-31 16:59:57.227281	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_4	\N	\N	\N	\N	\N
2742	jdk	sun	1.6.0	update_5		\N	2018-05-31 16:59:57.232805	2018-05-31 16:59:57.232805	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_5	\N	\N	\N	\N	\N
2743	jdk	sun	1.6.0	update_6		\N	2018-05-31 16:59:57.238606	2018-05-31 16:59:57.238606	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_6	\N	\N	\N	\N	\N
2744	jdk	sun	1.6.0	update_7		\N	2018-05-31 16:59:57.244865	2018-05-31 16:59:57.244865	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_7	\N	\N	\N	\N	\N
2745	jdk	sun	1.6.0.200	update20		\N	2018-05-31 16:59:57.25072	2018-05-31 16:59:57.25072	Sun Jdk 1.6.0.200	\N	/a		cpe:/a:sun:jdk:1.6.0.200:update20	\N	\N	\N	\N	\N
2746	jdk	sun	1.6.0.210	update21		\N	2018-05-31 16:59:57.256519	2018-05-31 16:59:57.256519	Sun Jdk 1.6.0.210	\N	/a		cpe:/a:sun:jdk:1.6.0.210:update21	\N	\N	\N	\N	\N
2747	jre	sun	1.6.0			\N	2018-05-31 16:59:57.262391	2018-05-31 16:59:57.262391	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0	\N	\N	\N	\N	\N
2748	jre	sun	1.6.0	update_1		\N	2018-05-31 16:59:57.268658	2018-05-31 16:59:57.268658	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_1	\N	\N	\N	\N	\N
2749	jre	sun	1.6.0	update_10		\N	2018-05-31 16:59:57.27457	2018-05-31 16:59:57.27457	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_10	\N	\N	\N	\N	\N
2750	jre	sun	1.6.0	update_11		\N	2018-05-31 16:59:57.280101	2018-05-31 16:59:57.280101	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_11	\N	\N	\N	\N	\N
2751	jre	sun	1.6.0	update_12		\N	2018-05-31 16:59:57.285992	2018-05-31 16:59:57.285992	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_12	\N	\N	\N	\N	\N
2752	jre	sun	1.6.0	update_13		\N	2018-05-31 16:59:57.291907	2018-05-31 16:59:57.291907	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_13	\N	\N	\N	\N	\N
2753	jre	sun	1.6.0	update_14		\N	2018-05-31 16:59:57.297665	2018-05-31 16:59:57.297665	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_14	\N	\N	\N	\N	\N
2754	jre	sun	1.6.0	update_15		\N	2018-05-31 16:59:57.303603	2018-05-31 16:59:57.303603	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_15	\N	\N	\N	\N	\N
2755	jre	sun	1.6.0	update_16		\N	2018-05-31 16:59:57.309517	2018-05-31 16:59:57.309517	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_16	\N	\N	\N	\N	\N
2756	jre	sun	1.6.0	update_17		\N	2018-05-31 16:59:57.315171	2018-05-31 16:59:57.315171	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_17	\N	\N	\N	\N	\N
2757	jre	sun	1.6.0	update_18		\N	2018-05-31 16:59:57.322029	2018-05-31 16:59:57.322029	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_18	\N	\N	\N	\N	\N
2758	jre	sun	1.6.0	update_19		\N	2018-05-31 16:59:57.33334	2018-05-31 16:59:57.33334	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_19	\N	\N	\N	\N	\N
2759	jre	sun	1.6.0	update_2		\N	2018-05-31 16:59:57.340861	2018-05-31 16:59:57.340861	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_2	\N	\N	\N	\N	\N
2760	jre	sun	1.6.0	update_20		\N	2018-05-31 16:59:57.346804	2018-05-31 16:59:57.346804	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_20	\N	\N	\N	\N	\N
2761	jre	sun	1.6.0	update_21		\N	2018-05-31 16:59:57.353542	2018-05-31 16:59:57.353542	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_21	\N	\N	\N	\N	\N
2762	jre	sun	1.6.0	update_3		\N	2018-05-31 16:59:57.361029	2018-05-31 16:59:57.361029	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_3	\N	\N	\N	\N	\N
2763	jre	sun	1.6.0	update_4		\N	2018-05-31 16:59:57.366552	2018-05-31 16:59:57.366552	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_4	\N	\N	\N	\N	\N
2764	jre	sun	1.6.0	update_5		\N	2018-05-31 16:59:57.371755	2018-05-31 16:59:57.371755	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_5	\N	\N	\N	\N	\N
2765	jre	sun	1.6.0	update_6		\N	2018-05-31 16:59:57.377499	2018-05-31 16:59:57.377499	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_6	\N	\N	\N	\N	\N
2766	jre	sun	1.6.0	update_7		\N	2018-05-31 16:59:57.384771	2018-05-31 16:59:57.384771	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_7	\N	\N	\N	\N	\N
2767	jdk	sun	1.5.0			\N	2018-05-31 16:59:57.401566	2018-05-31 16:59:57.401566	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0	\N	\N	\N	\N	\N
2768	jdk	sun	1.5.0	update1		\N	2018-05-31 16:59:57.408292	2018-05-31 16:59:57.408292	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update1	\N	\N	\N	\N	\N
2769	jdk	sun	1.5.0	update10		\N	2018-05-31 16:59:57.414061	2018-05-31 16:59:57.414061	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update10	\N	\N	\N	\N	\N
2770	jdk	sun	1.5.0	update11		\N	2018-05-31 16:59:57.419425	2018-05-31 16:59:57.419425	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update11	\N	\N	\N	\N	\N
2771	jdk	sun	1.5.0	update11_b03		\N	2018-05-31 16:59:57.42529	2018-05-31 16:59:57.42529	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update11_b03	\N	\N	\N	\N	\N
2772	jdk	sun	1.5.0	update12		\N	2018-05-31 16:59:57.431324	2018-05-31 16:59:57.431324	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update12	\N	\N	\N	\N	\N
2773	jdk	sun	1.5.0	update13		\N	2018-05-31 16:59:57.437289	2018-05-31 16:59:57.437289	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update13	\N	\N	\N	\N	\N
2774	jdk	sun	1.5.0	update14		\N	2018-05-31 16:59:57.442884	2018-05-31 16:59:57.442884	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update14	\N	\N	\N	\N	\N
2775	jdk	sun	1.5.0	update15		\N	2018-05-31 16:59:57.448409	2018-05-31 16:59:57.448409	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update15	\N	\N	\N	\N	\N
2787	jdk	sun	1.5.0	update26		\N	2018-05-31 16:59:57.518517	2018-05-31 16:59:57.518517	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update26	\N	\N	\N	\N	\N
2788	jdk	sun	1.5.0	update27		\N	2018-05-31 16:59:57.52468	2018-05-31 16:59:57.52468	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update27	\N	\N	\N	\N	\N
2789	jdk	sun	1.5.0	update28		\N	2018-05-31 16:59:57.530683	2018-05-31 16:59:57.530683	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update28	\N	\N	\N	\N	\N
2790	jdk	sun	1.5.0	update29		\N	2018-05-31 16:59:57.541008	2018-05-31 16:59:57.541008	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update29	\N	\N	\N	\N	\N
2791	jdk	sun	1.5.0	update3		\N	2018-05-31 16:59:57.547871	2018-05-31 16:59:57.547871	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update3	\N	\N	\N	\N	\N
2792	jdk	sun	1.5.0	update31		\N	2018-05-31 16:59:57.554287	2018-05-31 16:59:57.554287	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update31	\N	\N	\N	\N	\N
2793	jdk	sun	1.5.0	update33		\N	2018-05-31 16:59:57.560036	2018-05-31 16:59:57.560036	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update33	\N	\N	\N	\N	\N
2794	jdk	sun	1.5.0	update4		\N	2018-05-31 16:59:57.565726	2018-05-31 16:59:57.565726	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update4	\N	\N	\N	\N	\N
2795	jdk	sun	1.5.0	update5		\N	2018-05-31 16:59:57.579959	2018-05-31 16:59:57.579959	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update5	\N	\N	\N	\N	\N
2796	jdk	sun	1.5.0	update6		\N	2018-05-31 16:59:57.587594	2018-05-31 16:59:57.587594	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update6	\N	\N	\N	\N	\N
2797	jdk	sun	1.5.0	update7		\N	2018-05-31 16:59:57.596782	2018-05-31 16:59:57.596782	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update7	\N	\N	\N	\N	\N
2798	jdk	sun	1.5.0	update7_b03		\N	2018-05-31 16:59:57.603444	2018-05-31 16:59:57.603444	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update7_b03	\N	\N	\N	\N	\N
2799	jdk	sun	1.5.0	update8		\N	2018-05-31 16:59:57.610067	2018-05-31 16:59:57.610067	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update8	\N	\N	\N	\N	\N
2800	jdk	sun	1.5.0	update9		\N	2018-05-31 16:59:57.615584	2018-05-31 16:59:57.615584	Sun Jdk 1.5.0	\N	/a		cpe:/a:sun:jdk:1.5.0:update9	\N	\N	\N	\N	\N
2801	jre	sun	1.5.0			\N	2018-05-31 16:59:57.620944	2018-05-31 16:59:57.620944	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0	\N	\N	\N	\N	\N
2802	jre	sun	1.5.0	update1		\N	2018-05-31 16:59:57.626515	2018-05-31 16:59:57.626515	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update1	\N	\N	\N	\N	\N
2803	jre	sun	1.5.0	update10		\N	2018-05-31 16:59:57.631983	2018-05-31 16:59:57.631983	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update10	\N	\N	\N	\N	\N
2804	jre	sun	1.5.0	update11		\N	2018-05-31 16:59:57.637512	2018-05-31 16:59:57.637512	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update11	\N	\N	\N	\N	\N
2805	jre	sun	1.5.0	update12		\N	2018-05-31 16:59:57.643255	2018-05-31 16:59:57.643255	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update12	\N	\N	\N	\N	\N
2806	jre	sun	1.5.0	update13		\N	2018-05-31 16:59:57.648989	2018-05-31 16:59:57.648989	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update13	\N	\N	\N	\N	\N
2807	jre	sun	1.5.0	update14		\N	2018-05-31 16:59:57.655004	2018-05-31 16:59:57.655004	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update14	\N	\N	\N	\N	\N
2808	jre	sun	1.5.0	update15		\N	2018-05-31 16:59:57.660995	2018-05-31 16:59:57.660995	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update15	\N	\N	\N	\N	\N
2809	jre	sun	1.5.0	update16		\N	2018-05-31 16:59:57.667206	2018-05-31 16:59:57.667206	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update16	\N	\N	\N	\N	\N
2810	jre	sun	1.5.0	update17		\N	2018-05-31 16:59:57.672919	2018-05-31 16:59:57.672919	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update17	\N	\N	\N	\N	\N
2811	jre	sun	1.5.0	update18		\N	2018-05-31 16:59:57.678619	2018-05-31 16:59:57.678619	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update18	\N	\N	\N	\N	\N
2812	jre	sun	1.5.0	update19		\N	2018-05-31 16:59:57.684371	2018-05-31 16:59:57.684371	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update19	\N	\N	\N	\N	\N
2813	jre	sun	1.5.0	update2		\N	2018-05-31 16:59:57.6902	2018-05-31 16:59:57.6902	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update2	\N	\N	\N	\N	\N
2814	jre	sun	1.5.0	update20		\N	2018-05-31 16:59:57.696431	2018-05-31 16:59:57.696431	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update20	\N	\N	\N	\N	\N
2815	jre	sun	1.5.0	update21		\N	2018-05-31 16:59:57.7025	2018-05-31 16:59:57.7025	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update21	\N	\N	\N	\N	\N
2816	jre	sun	1.5.0	update22		\N	2018-05-31 16:59:57.708535	2018-05-31 16:59:57.708535	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update22	\N	\N	\N	\N	\N
2817	jre	sun	1.5.0	update23		\N	2018-05-31 16:59:57.71472	2018-05-31 16:59:57.71472	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update23	\N	\N	\N	\N	\N
2818	jre	sun	1.5.0	update24		\N	2018-05-31 16:59:57.720539	2018-05-31 16:59:57.720539	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update24	\N	\N	\N	\N	\N
2819	jre	sun	1.5.0	update25		\N	2018-05-31 16:59:57.726447	2018-05-31 16:59:57.726447	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update25	\N	\N	\N	\N	\N
2820	jre	sun	1.5.0	update26		\N	2018-05-31 16:59:57.732201	2018-05-31 16:59:57.732201	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update26	\N	\N	\N	\N	\N
2821	jre	sun	1.5.0	update27		\N	2018-05-31 16:59:57.737892	2018-05-31 16:59:57.737892	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update27	\N	\N	\N	\N	\N
2822	jre	sun	1.5.0	update28		\N	2018-05-31 16:59:57.74403	2018-05-31 16:59:57.74403	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update28	\N	\N	\N	\N	\N
2823	jre	sun	1.5.0	update29		\N	2018-05-31 16:59:57.750361	2018-05-31 16:59:57.750361	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update29	\N	\N	\N	\N	\N
2824	jre	sun	1.5.0	update3		\N	2018-05-31 16:59:57.756809	2018-05-31 16:59:57.756809	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update3	\N	\N	\N	\N	\N
2825	jre	sun	1.5.0	update31		\N	2018-05-31 16:59:57.773349	2018-05-31 16:59:57.773349	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update31	\N	\N	\N	\N	\N
2826	jre	sun	1.5.0	update33		\N	2018-05-31 16:59:57.779071	2018-05-31 16:59:57.779071	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update33	\N	\N	\N	\N	\N
2827	jre	sun	1.5.0	update4		\N	2018-05-31 16:59:57.785563	2018-05-31 16:59:57.785563	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update4	\N	\N	\N	\N	\N
2828	jre	sun	1.5.0	update5		\N	2018-05-31 16:59:57.791836	2018-05-31 16:59:57.791836	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update5	\N	\N	\N	\N	\N
2829	jre	sun	1.5.0	update6		\N	2018-05-31 16:59:57.797501	2018-05-31 16:59:57.797501	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update6	\N	\N	\N	\N	\N
2830	jre	sun	1.5.0	update7		\N	2018-05-31 16:59:57.803221	2018-05-31 16:59:57.803221	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update7	\N	\N	\N	\N	\N
2831	jre	sun	1.5.0	update8		\N	2018-05-31 16:59:57.809211	2018-05-31 16:59:57.809211	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update8	\N	\N	\N	\N	\N
2832	jre	sun	1.5.0	update9		\N	2018-05-31 16:59:57.815145	2018-05-31 16:59:57.815145	Sun Jre 1.5.0	\N	/a		cpe:/a:sun:jre:1.5.0:update9	\N	\N	\N	\N	\N
2833	jdk	sun	1.4.2			\N	2018-05-31 16:59:57.824518	2018-05-31 16:59:57.824518	Sun Jdk 1.4.2	\N	/a		cpe:/a:sun:jdk:1.4.2	\N	\N	\N	\N	\N
2834	jdk	sun	1.4.2_1			\N	2018-05-31 16:59:57.830352	2018-05-31 16:59:57.830352	Sun Jdk 1.4.2_1	\N	/a		cpe:/a:sun:jdk:1.4.2_1	\N	\N	\N	\N	\N
2835	jdk	sun	1.4.2_2			\N	2018-05-31 16:59:57.836297	2018-05-31 16:59:57.836297	Sun Jdk 1.4.2_2	\N	/a		cpe:/a:sun:jdk:1.4.2_2	\N	\N	\N	\N	\N
2836	jdk	sun	1.4.2_3			\N	2018-05-31 16:59:57.842136	2018-05-31 16:59:57.842136	Sun Jdk 1.4.2_3	\N	/a		cpe:/a:sun:jdk:1.4.2_3	\N	\N	\N	\N	\N
2837	jdk	sun	1.4.2_4			\N	2018-05-31 16:59:57.847762	2018-05-31 16:59:57.847762	Sun Jdk 1.4.2_4	\N	/a		cpe:/a:sun:jdk:1.4.2_4	\N	\N	\N	\N	\N
2838	jdk	sun	1.4.2_5			\N	2018-05-31 16:59:57.854281	2018-05-31 16:59:57.854281	Sun Jdk 1.4.2_5	\N	/a		cpe:/a:sun:jdk:1.4.2_5	\N	\N	\N	\N	\N
2839	jdk	sun	1.4.2_6			\N	2018-05-31 16:59:57.860406	2018-05-31 16:59:57.860406	Sun Jdk 1.4.2_6	\N	/a		cpe:/a:sun:jdk:1.4.2_6	\N	\N	\N	\N	\N
2840	jdk	sun	1.4.2_7			\N	2018-05-31 16:59:57.866762	2018-05-31 16:59:57.866762	Sun Jdk 1.4.2_7	\N	/a		cpe:/a:sun:jdk:1.4.2_7	\N	\N	\N	\N	\N
2841	jdk	sun	1.4.2_8			\N	2018-05-31 16:59:57.873605	2018-05-31 16:59:57.873605	Sun Jdk 1.4.2_8	\N	/a		cpe:/a:sun:jdk:1.4.2_8	\N	\N	\N	\N	\N
2842	jdk	sun	1.4.2_9			\N	2018-05-31 16:59:57.880059	2018-05-31 16:59:57.880059	Sun Jdk 1.4.2_9	\N	/a		cpe:/a:sun:jdk:1.4.2_9	\N	\N	\N	\N	\N
2843	jdk	sun	1.4.2_10			\N	2018-05-31 16:59:57.886054	2018-05-31 16:59:57.886054	Sun Jdk 1.4.2_10	\N	/a		cpe:/a:sun:jdk:1.4.2_10	\N	\N	\N	\N	\N
2844	jdk	sun	1.4.2_11			\N	2018-05-31 16:59:57.892049	2018-05-31 16:59:57.892049	Sun Jdk 1.4.2_11	\N	/a		cpe:/a:sun:jdk:1.4.2_11	\N	\N	\N	\N	\N
2845	jdk	sun	1.4.2_12			\N	2018-05-31 16:59:57.897942	2018-05-31 16:59:57.897942	Sun Jdk 1.4.2_12	\N	/a		cpe:/a:sun:jdk:1.4.2_12	\N	\N	\N	\N	\N
2846	jdk	sun	1.4.2_13			\N	2018-05-31 16:59:57.904051	2018-05-31 16:59:57.904051	Sun Jdk 1.4.2_13	\N	/a		cpe:/a:sun:jdk:1.4.2_13	\N	\N	\N	\N	\N
2847	jdk	sun	1.4.2_14			\N	2018-05-31 16:59:57.910667	2018-05-31 16:59:57.910667	Sun Jdk 1.4.2_14	\N	/a		cpe:/a:sun:jdk:1.4.2_14	\N	\N	\N	\N	\N
2848	jdk	sun	1.4.2_15			\N	2018-05-31 16:59:57.916624	2018-05-31 16:59:57.916624	Sun Jdk 1.4.2_15	\N	/a		cpe:/a:sun:jdk:1.4.2_15	\N	\N	\N	\N	\N
2849	jdk	sun	1.4.2_16			\N	2018-05-31 16:59:57.922559	2018-05-31 16:59:57.922559	Sun Jdk 1.4.2_16	\N	/a		cpe:/a:sun:jdk:1.4.2_16	\N	\N	\N	\N	\N
2850	jdk	sun	1.4.2_17			\N	2018-05-31 16:59:57.928207	2018-05-31 16:59:57.928207	Sun Jdk 1.4.2_17	\N	/a		cpe:/a:sun:jdk:1.4.2_17	\N	\N	\N	\N	\N
2851	jdk	sun	1.4.2_18			\N	2018-05-31 16:59:57.934267	2018-05-31 16:59:57.934267	Sun Jdk 1.4.2_18	\N	/a		cpe:/a:sun:jdk:1.4.2_18	\N	\N	\N	\N	\N
2852	jdk	sun	1.4.2_19			\N	2018-05-31 16:59:57.939973	2018-05-31 16:59:57.939973	Sun Jdk 1.4.2_19	\N	/a		cpe:/a:sun:jdk:1.4.2_19	\N	\N	\N	\N	\N
2853	jdk	sun	1.4.2_22			\N	2018-05-31 16:59:57.945961	2018-05-31 16:59:57.945961	Sun Jdk 1.4.2_22	\N	/a		cpe:/a:sun:jdk:1.4.2_22	\N	\N	\N	\N	\N
2854	jdk	sun	1.4.2_23			\N	2018-05-31 16:59:57.951771	2018-05-31 16:59:57.951771	Sun Jdk 1.4.2_23	\N	/a		cpe:/a:sun:jdk:1.4.2_23	\N	\N	\N	\N	\N
2855	jdk	sun	1.4.2_25			\N	2018-05-31 16:59:57.957582	2018-05-31 16:59:57.957582	Sun Jdk 1.4.2_25	\N	/a		cpe:/a:sun:jdk:1.4.2_25	\N	\N	\N	\N	\N
2856	jdk	sun	1.4.2_26			\N	2018-05-31 16:59:57.963696	2018-05-31 16:59:57.963696	Sun Jdk 1.4.2_26	\N	/a		cpe:/a:sun:jdk:1.4.2_26	\N	\N	\N	\N	\N
2857	jdk	sun	1.4.2_27			\N	2018-05-31 16:59:57.969298	2018-05-31 16:59:57.969298	Sun Jdk 1.4.2_27	\N	/a		cpe:/a:sun:jdk:1.4.2_27	\N	\N	\N	\N	\N
2858	jdk	sun	1.4.2_28			\N	2018-05-31 16:59:57.975442	2018-05-31 16:59:57.975442	Sun Jdk 1.4.2_28	\N	/a		cpe:/a:sun:jdk:1.4.2_28	\N	\N	\N	\N	\N
2859	jdk	sun	1.4.2_29			\N	2018-05-31 16:59:57.981649	2018-05-31 16:59:57.981649	Sun Jdk 1.4.2_29	\N	/a		cpe:/a:sun:jdk:1.4.2_29	\N	\N	\N	\N	\N
2860	jdk	sun	1.4.2_30			\N	2018-05-31 16:59:57.987471	2018-05-31 16:59:57.987471	Sun Jdk 1.4.2_30	\N	/a		cpe:/a:sun:jdk:1.4.2_30	\N	\N	\N	\N	\N
2861	jdk	sun	1.4.2_31			\N	2018-05-31 16:59:57.993323	2018-05-31 16:59:57.993323	Sun Jdk 1.4.2_31	\N	/a		cpe:/a:sun:jdk:1.4.2_31	\N	\N	\N	\N	\N
2862	jdk	sun	1.4.2_32			\N	2018-05-31 16:59:57.998928	2018-05-31 16:59:57.998928	Sun Jdk 1.4.2_32	\N	/a		cpe:/a:sun:jdk:1.4.2_32	\N	\N	\N	\N	\N
2863	jdk	sun	1.4.2_33			\N	2018-05-31 16:59:58.005366	2018-05-31 16:59:58.005366	Sun Jdk 1.4.2_33	\N	/a		cpe:/a:sun:jdk:1.4.2_33	\N	\N	\N	\N	\N
2864	jdk	sun	1.4.2_34			\N	2018-05-31 16:59:58.011351	2018-05-31 16:59:58.011351	Sun Jdk 1.4.2_34	\N	/a		cpe:/a:sun:jdk:1.4.2_34	\N	\N	\N	\N	\N
2865	jdk	sun	1.4.2_35			\N	2018-05-31 16:59:58.016857	2018-05-31 16:59:58.016857	Sun Jdk 1.4.2_35	\N	/a		cpe:/a:sun:jdk:1.4.2_35	\N	\N	\N	\N	\N
2866	jdk	sun	1.4.2_36			\N	2018-05-31 16:59:58.022492	2018-05-31 16:59:58.022492	Sun Jdk 1.4.2_36	\N	/a		cpe:/a:sun:jdk:1.4.2_36	\N	\N	\N	\N	\N
2867	jdk	sun	1.4.2_37			\N	2018-05-31 16:59:58.028287	2018-05-31 16:59:58.028287	Sun Jdk 1.4.2_37	\N	/a		cpe:/a:sun:jdk:1.4.2_37	\N	\N	\N	\N	\N
2868	jre	sun	1.4.2_1			\N	2018-05-31 16:59:58.034064	2018-05-31 16:59:58.034064	Sun Jre 1.4.2_1	\N	/a		cpe:/a:sun:jre:1.4.2_1	\N	\N	\N	\N	\N
2869	jre	sun	1.4.2_2			\N	2018-05-31 16:59:58.039669	2018-05-31 16:59:58.039669	Sun Jre 1.4.2_2	\N	/a		cpe:/a:sun:jre:1.4.2_2	\N	\N	\N	\N	\N
2870	jre	sun	1.4.2_3			\N	2018-05-31 16:59:58.045529	2018-05-31 16:59:58.045529	Sun Jre 1.4.2_3	\N	/a		cpe:/a:sun:jre:1.4.2_3	\N	\N	\N	\N	\N
2871	jre	sun	1.4.2_4			\N	2018-05-31 16:59:58.051172	2018-05-31 16:59:58.051172	Sun Jre 1.4.2_4	\N	/a		cpe:/a:sun:jre:1.4.2_4	\N	\N	\N	\N	\N
2872	jre	sun	1.4.2_5			\N	2018-05-31 16:59:58.056777	2018-05-31 16:59:58.056777	Sun Jre 1.4.2_5	\N	/a		cpe:/a:sun:jre:1.4.2_5	\N	\N	\N	\N	\N
2873	jre	sun	1.4.2_6			\N	2018-05-31 16:59:58.062541	2018-05-31 16:59:58.062541	Sun Jre 1.4.2_6	\N	/a		cpe:/a:sun:jre:1.4.2_6	\N	\N	\N	\N	\N
2874	jre	sun	1.4.2_7			\N	2018-05-31 16:59:58.068096	2018-05-31 16:59:58.068096	Sun Jre 1.4.2_7	\N	/a		cpe:/a:sun:jre:1.4.2_7	\N	\N	\N	\N	\N
2875	jre	sun	1.4.2_8			\N	2018-05-31 16:59:58.07392	2018-05-31 16:59:58.07392	Sun Jre 1.4.2_8	\N	/a		cpe:/a:sun:jre:1.4.2_8	\N	\N	\N	\N	\N
2876	jre	sun	1.4.2_9			\N	2018-05-31 16:59:58.079772	2018-05-31 16:59:58.079772	Sun Jre 1.4.2_9	\N	/a		cpe:/a:sun:jre:1.4.2_9	\N	\N	\N	\N	\N
2877	jre	sun	1.4.2_10			\N	2018-05-31 16:59:58.085578	2018-05-31 16:59:58.085578	Sun Jre 1.4.2_10	\N	/a		cpe:/a:sun:jre:1.4.2_10	\N	\N	\N	\N	\N
2878	jre	sun	1.4.2_11			\N	2018-05-31 16:59:58.091425	2018-05-31 16:59:58.091425	Sun Jre 1.4.2_11	\N	/a		cpe:/a:sun:jre:1.4.2_11	\N	\N	\N	\N	\N
2879	jre	sun	1.4.2_12			\N	2018-05-31 16:59:58.097682	2018-05-31 16:59:58.097682	Sun Jre 1.4.2_12	\N	/a		cpe:/a:sun:jre:1.4.2_12	\N	\N	\N	\N	\N
2880	jre	sun	1.4.2_13			\N	2018-05-31 16:59:58.103651	2018-05-31 16:59:58.103651	Sun Jre 1.4.2_13	\N	/a		cpe:/a:sun:jre:1.4.2_13	\N	\N	\N	\N	\N
2881	jre	sun	1.4.2_14			\N	2018-05-31 16:59:58.109425	2018-05-31 16:59:58.109425	Sun Jre 1.4.2_14	\N	/a		cpe:/a:sun:jre:1.4.2_14	\N	\N	\N	\N	\N
2882	jre	sun	1.4.2_15			\N	2018-05-31 16:59:58.115703	2018-05-31 16:59:58.115703	Sun Jre 1.4.2_15	\N	/a		cpe:/a:sun:jre:1.4.2_15	\N	\N	\N	\N	\N
2883	jre	sun	1.4.2_16			\N	2018-05-31 16:59:58.121234	2018-05-31 16:59:58.121234	Sun Jre 1.4.2_16	\N	/a		cpe:/a:sun:jre:1.4.2_16	\N	\N	\N	\N	\N
2884	jre	sun	1.4.2_17			\N	2018-05-31 16:59:58.127125	2018-05-31 16:59:58.127125	Sun Jre 1.4.2_17	\N	/a		cpe:/a:sun:jre:1.4.2_17	\N	\N	\N	\N	\N
2885	jre	sun	1.4.2_18			\N	2018-05-31 16:59:58.132763	2018-05-31 16:59:58.132763	Sun Jre 1.4.2_18	\N	/a		cpe:/a:sun:jre:1.4.2_18	\N	\N	\N	\N	\N
2886	jre	sun	1.4.2_19			\N	2018-05-31 16:59:58.139563	2018-05-31 16:59:58.139563	Sun Jre 1.4.2_19	\N	/a		cpe:/a:sun:jre:1.4.2_19	\N	\N	\N	\N	\N
2887	jre	sun	1.4.2_20			\N	2018-05-31 16:59:58.147652	2018-05-31 16:59:58.147652	Sun Jre 1.4.2_20	\N	/a		cpe:/a:sun:jre:1.4.2_20	\N	\N	\N	\N	\N
2888	jre	sun	1.4.2_21			\N	2018-05-31 16:59:58.15446	2018-05-31 16:59:58.15446	Sun Jre 1.4.2_21	\N	/a		cpe:/a:sun:jre:1.4.2_21	\N	\N	\N	\N	\N
2889	jre	sun	1.4.2_22			\N	2018-05-31 16:59:58.159894	2018-05-31 16:59:58.159894	Sun Jre 1.4.2_22	\N	/a		cpe:/a:sun:jre:1.4.2_22	\N	\N	\N	\N	\N
2890	jre	sun	1.4.2_23			\N	2018-05-31 16:59:58.167754	2018-05-31 16:59:58.167754	Sun Jre 1.4.2_23	\N	/a		cpe:/a:sun:jre:1.4.2_23	\N	\N	\N	\N	\N
2891	jre	sun	1.4.2_24			\N	2018-05-31 16:59:58.173695	2018-05-31 16:59:58.173695	Sun Jre 1.4.2_24	\N	/a		cpe:/a:sun:jre:1.4.2_24	\N	\N	\N	\N	\N
2892	jre	sun	1.4.2_25			\N	2018-05-31 16:59:58.179206	2018-05-31 16:59:58.179206	Sun Jre 1.4.2_25	\N	/a		cpe:/a:sun:jre:1.4.2_25	\N	\N	\N	\N	\N
2893	jre	sun	1.4.2_26			\N	2018-05-31 16:59:58.187408	2018-05-31 16:59:58.187408	Sun Jre 1.4.2_26	\N	/a		cpe:/a:sun:jre:1.4.2_26	\N	\N	\N	\N	\N
2894	jre	sun	1.4.2_27			\N	2018-05-31 16:59:58.195541	2018-05-31 16:59:58.195541	Sun Jre 1.4.2_27	\N	/a		cpe:/a:sun:jre:1.4.2_27	\N	\N	\N	\N	\N
2895	jre	sun	1.4.2_28			\N	2018-05-31 16:59:58.201481	2018-05-31 16:59:58.201481	Sun Jre 1.4.2_28	\N	/a		cpe:/a:sun:jre:1.4.2_28	\N	\N	\N	\N	\N
2896	jre	sun	1.4.2_29			\N	2018-05-31 16:59:58.207635	2018-05-31 16:59:58.207635	Sun Jre 1.4.2_29	\N	/a		cpe:/a:sun:jre:1.4.2_29	\N	\N	\N	\N	\N
2897	jre	sun	1.4.2_30			\N	2018-05-31 16:59:58.223227	2018-05-31 16:59:58.223227	Sun Jre 1.4.2_30	\N	/a		cpe:/a:sun:jre:1.4.2_30	\N	\N	\N	\N	\N
2898	jre	sun	1.4.2_31			\N	2018-05-31 16:59:58.229566	2018-05-31 16:59:58.229566	Sun Jre 1.4.2_31	\N	/a		cpe:/a:sun:jre:1.4.2_31	\N	\N	\N	\N	\N
2899	jre	sun	1.4.2_32			\N	2018-05-31 16:59:58.235245	2018-05-31 16:59:58.235245	Sun Jre 1.4.2_32	\N	/a		cpe:/a:sun:jre:1.4.2_32	\N	\N	\N	\N	\N
2900	jre	sun	1.4.2_33			\N	2018-05-31 16:59:58.240831	2018-05-31 16:59:58.240831	Sun Jre 1.4.2_33	\N	/a		cpe:/a:sun:jre:1.4.2_33	\N	\N	\N	\N	\N
2901	jre	sun	1.4.2_34			\N	2018-05-31 16:59:58.246183	2018-05-31 16:59:58.246183	Sun Jre 1.4.2_34	\N	/a		cpe:/a:sun:jre:1.4.2_34	\N	\N	\N	\N	\N
2902	jre	sun	1.4.2_35			\N	2018-05-31 16:59:58.251483	2018-05-31 16:59:58.251483	Sun Jre 1.4.2_35	\N	/a		cpe:/a:sun:jre:1.4.2_35	\N	\N	\N	\N	\N
2903	jre	sun	1.4.2_36			\N	2018-05-31 16:59:58.257065	2018-05-31 16:59:58.257065	Sun Jre 1.4.2_36	\N	/a		cpe:/a:sun:jre:1.4.2_36	\N	\N	\N	\N	\N
2904	jre	sun	1.4.2_37			\N	2018-05-31 16:59:58.26307	2018-05-31 16:59:58.26307	Sun Jre 1.4.2_37	\N	/a		cpe:/a:sun:jre:1.4.2_37	\N	\N	\N	\N	\N
2905	jdk	oracle	1.6.0	update_115		\N	2018-05-31 16:59:59.955917	2018-05-31 16:59:59.955917	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_115	\N	\N	\N	\N	\N
2906	jdk	oracle	1.7.0	update_101		\N	2018-05-31 16:59:59.963354	2018-05-31 16:59:59.963354	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update_101	\N	\N	\N	\N	\N
23	jdk	oracle	1.8.0	update_92		\N	2018-05-31 16:59:43	2018-05-31 16:59:59.968684	Oracle Jdk 1.8.0	[{"Advisory":"http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html"}]	/a		cpe:/a:oracle:jdk:1.8.0:update_92	cpe:2.3:a:oracle:jdk:1.8.0:update_92:*:*:*:*:*:*	*	*	*	*
2907	jre	oracle	1.6.0	update_115		\N	2018-05-31 16:59:59.974173	2018-05-31 16:59:59.974173	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_115	\N	\N	\N	\N	\N
2908	jre	oracle	1.7.0	update_101		\N	2018-05-31 16:59:59.980654	2018-05-31 16:59:59.980654	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update_101	\N	\N	\N	\N	\N
2909	jre	oracle	1.8.0	update_92		\N	2018-05-31 16:59:59.985991	2018-05-31 16:59:59.985991	Oracle Jre 1.8.0	\N	/a		cpe:/a:oracle:jre:1.8.0:update_92	\N	\N	\N	\N	\N
2910	linux	oracle	5.0			\N	2018-05-31 16:59:59.992213	2018-05-31 16:59:59.992213	Oracle Linux 5.0	\N	/o		cpe:/o:oracle:linux:5.0	\N	\N	\N	\N	\N
2911	linux	oracle	6.0			\N	2018-05-31 16:59:59.997683	2018-05-31 16:59:59.997683	Oracle Linux 6.0	\N	/o		cpe:/o:oracle:linux:6.0	\N	\N	\N	\N	\N
2912	linux	oracle	7.0			\N	2018-05-31 17:00:00.003919	2018-05-31 17:00:00.003919	Oracle Linux 7.0	\N	/o		cpe:/o:oracle:linux:7.0	\N	\N	\N	\N	\N
2913	jscript	microsoft	5.7			\N	2018-05-31 17:00:01.295011	2018-05-31 17:00:01.295011	Microsoft Jscript 5.7	\N	/a		cpe:/a:microsoft:jscript:5.7	\N	\N	\N	\N	\N
2914	jscript	microsoft	5.8			\N	2018-05-31 17:00:01.302504	2018-05-31 17:00:01.302504	Microsoft Jscript 5.8	\N	/a		cpe:/a:microsoft:jscript:5.8	\N	\N	\N	\N	\N
2915	vbscript	microsoft	5.7			\N	2018-05-31 17:00:01.308266	2018-05-31 17:00:01.308266	Microsoft Vbscript 5.7	\N	/a		cpe:/a:microsoft:vbscript:5.7	\N	\N	\N	\N	\N
2916	vbscript	microsoft	5.8			\N	2018-05-31 17:00:01.31348	2018-05-31 17:00:01.31348	Microsoft Vbscript 5.8	\N	/a		cpe:/a:microsoft:vbscript:5.8	\N	\N	\N	\N	\N
2917	internet_explorer	microsoft	8			\N	2018-05-31 17:00:01.318517	2018-05-31 17:00:01.318517	Microsoft Internet_explorer 8	\N	/a		cpe:/a:microsoft:internet_explorer:8	\N	\N	\N	\N	\N
2918	internet_explorer	microsoft	9			\N	2018-05-31 17:00:01.323473	2018-05-31 17:00:01.323473	Microsoft Internet_explorer 9	\N	/a		cpe:/a:microsoft:internet_explorer:9	\N	\N	\N	\N	\N
2919	internet_explorer	microsoft	10			\N	2018-05-31 17:00:01.328845	2018-05-31 17:00:01.328845	Microsoft Internet_explorer 10	\N	/a		cpe:/a:microsoft:internet_explorer:10	\N	\N	\N	\N	\N
2920	internet_explorer	microsoft	11	-		\N	2018-05-31 17:00:01.333981	2018-05-31 17:00:01.333981	Microsoft Internet_explorer 11	\N	/a		cpe:/a:microsoft:internet_explorer:11:-	\N	\N	\N	\N	\N
2921	django	djangoproject	1.8.0			\N	2018-05-31 17:00:02.621208	2018-05-31 17:00:02.621208	Djangoproject Django 1.8.0	\N	/a		cpe:/a:djangoproject:django:1.8.0	\N	\N	\N	\N	\N
2922	django	djangoproject	1.8.1			\N	2018-05-31 17:00:02.627068	2018-05-31 17:00:02.627068	Djangoproject Django 1.8.1	\N	/a		cpe:/a:djangoproject:django:1.8.1	\N	\N	\N	\N	\N
2923	jre	oracle	1.7.0	update10		\N	2018-05-31 17:00:05.300762	2018-05-31 17:00:05.300762	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update10	\N	\N	\N	\N	\N
2924	jre	oracle	1.7.0	update11		\N	2018-05-31 17:00:05.309022	2018-05-31 17:00:05.309022	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update11	\N	\N	\N	\N	\N
2925	jre	oracle	1.7.0	update7		\N	2018-05-31 17:00:05.324194	2018-05-31 17:00:05.324194	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update7	\N	\N	\N	\N	\N
2926	jre	oracle	1.7.0	update9		\N	2018-05-31 17:00:05.329621	2018-05-31 17:00:05.329621	Oracle Jre 1.7.0	\N	/a		cpe:/a:oracle:jre:1.7.0:update9	\N	\N	\N	\N	\N
2927	jdk	oracle	1.7.0	update10		\N	2018-05-31 17:00:05.339167	2018-05-31 17:00:05.339167	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update10	\N	\N	\N	\N	\N
2928	jdk	oracle	1.7.0	update11		\N	2018-05-31 17:00:05.345021	2018-05-31 17:00:05.345021	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update11	\N	\N	\N	\N	\N
2929	jdk	oracle	1.7.0	update7		\N	2018-05-31 17:00:05.360491	2018-05-31 17:00:05.360491	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update7	\N	\N	\N	\N	\N
2930	jdk	oracle	1.7.0	update9		\N	2018-05-31 17:00:05.365824	2018-05-31 17:00:05.365824	Oracle Jdk 1.7.0	\N	/a		cpe:/a:oracle:jdk:1.7.0:update9	\N	\N	\N	\N	\N
2931	jre	oracle	1.6.0	update_35		\N	2018-05-31 17:00:05.396009	2018-05-31 17:00:05.396009	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_35	\N	\N	\N	\N	\N
2932	jre	oracle	1.6.0	update_37		\N	2018-05-31 17:00:05.401738	2018-05-31 17:00:05.401738	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_37	\N	\N	\N	\N	\N
2933	jre	oracle	1.6.0	update_38		\N	2018-05-31 17:00:05.407235	2018-05-31 17:00:05.407235	Oracle Jre 1.6.0	\N	/a		cpe:/a:oracle:jre:1.6.0:update_38	\N	\N	\N	\N	\N
2934	jre	sun	1.6.0	update_9		\N	2018-05-31 17:00:05.452092	2018-05-31 17:00:05.452092	Sun Jre 1.6.0	\N	/a		cpe:/a:sun:jre:1.6.0:update_9	\N	\N	\N	\N	\N
2935	jdk	oracle	1.6.0	update_35		\N	2018-05-31 17:00:05.485479	2018-05-31 17:00:05.485479	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_35	\N	\N	\N	\N	\N
2936	jdk	oracle	1.6.0	update_37		\N	2018-05-31 17:00:05.491975	2018-05-31 17:00:05.491975	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_37	\N	\N	\N	\N	\N
2937	jdk	oracle	1.6.0	update_38		\N	2018-05-31 17:00:05.498839	2018-05-31 17:00:05.498839	Oracle Jdk 1.6.0	\N	/a		cpe:/a:oracle:jdk:1.6.0:update_38	\N	\N	\N	\N	\N
2938	jdk	sun	1.6.0			\N	2018-05-31 17:00:05.504712	2018-05-31 17:00:05.504712	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0	\N	\N	\N	\N	\N
2939	jdk	sun	1.6.0	update_20		\N	2018-05-31 17:00:05.541343	2018-05-31 17:00:05.541343	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_20	\N	\N	\N	\N	\N
2940	jdk	sun	1.6.0	update_21		\N	2018-05-31 17:00:05.547267	2018-05-31 17:00:05.547267	Sun Jdk 1.6.0	\N	/a		cpe:/a:sun:jdk:1.6.0:update_21	\N	\N	\N	\N	\N
2941	jre	oracle	1.5.0	update_36		\N	2018-05-31 17:00:05.566335	2018-05-31 17:00:05.566335	Oracle Jre 1.5.0	\N	/a		cpe:/a:oracle:jre:1.5.0:update_36	\N	\N	\N	\N	\N
2942	jre	oracle	1.5.0	update_38		\N	2018-05-31 17:00:05.571771	2018-05-31 17:00:05.571771	Oracle Jre 1.5.0	\N	/a		cpe:/a:oracle:jre:1.5.0:update_38	\N	\N	\N	\N	\N
2943	jre	oracle	1.4.2_38			\N	2018-05-31 17:00:05.732085	2018-05-31 17:00:05.732085	Oracle Jre 1.4.2_38	\N	/a		cpe:/a:oracle:jre:1.4.2_38	\N	\N	\N	\N	\N
2944	jre	sun	1.4.2			\N	2018-05-31 17:00:05.741618	2018-05-31 17:00:05.741618	Sun Jre 1.4.2	\N	/a		cpe:/a:sun:jre:1.4.2	\N	\N	\N	\N	\N
\.


--
-- Name: dependencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dependencies_id_seq', 2944, true);


--
-- Data for Name: dependency_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dependency_sources (dependency_id, source_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
31	1
32	1
33	1
78	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
79	1
54	1
55	1
56	1
57	1
58	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
125	1
126	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
167	1
168	1
169	1
170	1
171	1
172	1
173	1
174	1
175	1
176	1
177	1
178	1
179	1
180	1
181	1
182	1
183	1
184	1
185	1
186	1
187	1
188	1
189	1
190	1
191	1
192	1
193	1
194	1
195	1
196	1
197	1
198	1
199	1
200	1
201	1
202	1
203	1
204	1
205	1
206	1
207	1
208	1
209	1
210	1
211	1
212	1
213	1
214	1
215	1
216	1
217	1
218	1
219	1
220	1
221	1
222	1
223	1
224	1
225	1
226	1
227	1
228	1
229	1
230	1
231	1
232	1
233	1
234	1
235	1
236	1
237	1
238	1
239	1
240	1
241	1
242	1
243	1
244	1
245	1
246	1
247	1
248	1
249	1
250	1
251	1
252	1
253	1
254	1
255	1
256	1
257	1
258	1
259	1
260	1
261	1
262	1
263	1
264	1
265	1
266	1
267	1
268	1
269	1
270	1
271	1
272	1
273	1
274	1
275	1
276	1
277	1
278	1
279	1
280	1
281	1
282	1
283	1
284	1
285	1
286	1
287	1
288	1
289	1
290	1
291	1
292	1
293	1
294	1
295	1
296	1
297	1
298	1
299	1
300	1
301	1
302	1
303	1
304	1
305	1
306	1
307	1
308	1
309	1
310	1
311	1
312	1
313	1
314	1
315	1
316	1
317	1
318	1
319	1
320	1
321	1
322	1
323	1
324	1
325	1
326	1
327	1
328	1
329	1
330	1
331	1
332	1
333	1
334	1
335	1
336	1
337	1
338	1
339	1
340	1
341	1
342	1
343	1
344	1
345	1
346	1
347	1
348	1
349	1
350	1
351	1
352	1
353	1
354	1
355	1
356	1
357	1
358	1
359	1
360	1
361	1
362	1
363	1
364	1
365	1
366	1
367	1
368	1
369	1
370	1
371	1
372	1
373	1
374	1
375	1
376	1
377	1
378	1
379	1
380	1
381	1
382	1
383	1
384	1
385	1
386	1
387	1
388	1
389	1
390	1
391	1
392	1
393	1
394	1
395	1
396	1
397	1
398	1
399	1
400	1
401	1
402	1
403	1
404	1
405	1
406	1
407	1
408	1
409	1
410	1
411	1
412	1
413	1
414	1
415	1
416	1
417	1
418	1
419	1
420	1
421	1
422	1
423	1
424	1
425	1
426	1
427	1
428	1
429	1
430	1
431	1
432	1
433	1
434	1
435	1
436	1
437	1
438	1
439	1
440	1
441	1
442	1
443	1
444	1
445	1
446	1
447	1
448	1
449	1
450	1
451	1
452	1
453	1
454	1
455	1
456	1
457	1
458	1
459	1
460	1
461	1
462	1
463	1
464	1
465	1
466	1
467	1
468	1
469	1
470	1
471	1
472	1
473	1
474	1
475	1
476	1
477	1
478	1
479	1
480	1
481	1
482	1
483	1
484	1
485	1
486	1
487	1
488	1
489	1
490	1
491	1
492	1
493	1
494	1
495	1
496	1
497	1
498	1
499	1
500	1
501	1
502	1
503	1
504	1
505	1
506	1
507	1
508	1
509	1
510	1
511	1
512	1
513	1
514	1
515	1
516	1
517	1
518	1
519	1
520	1
521	1
522	1
523	1
524	1
525	1
526	1
527	1
528	1
529	1
530	1
531	1
532	1
533	1
534	1
535	1
536	1
537	1
538	1
539	1
540	1
541	1
542	1
543	1
544	1
545	1
546	1
547	1
548	1
549	1
550	1
551	1
552	1
553	1
554	1
555	1
556	1
557	1
558	1
559	1
560	1
561	1
562	1
563	1
564	1
565	1
566	1
567	1
568	1
569	1
570	1
571	1
572	1
573	1
574	1
575	1
576	1
577	1
578	1
579	1
580	1
581	1
582	1
583	1
584	1
585	1
586	1
587	1
588	1
589	1
590	1
591	1
592	1
593	1
594	1
595	1
596	1
597	1
598	1
599	1
600	1
601	1
602	1
603	1
604	1
605	1
606	1
607	1
608	1
609	1
610	1
611	1
612	1
613	1
614	1
615	1
616	1
617	1
618	1
619	1
620	1
621	1
622	1
623	1
624	1
625	1
626	1
627	1
628	1
629	1
630	1
631	1
632	1
633	1
634	1
635	1
636	1
637	1
638	1
639	1
640	1
641	1
642	1
643	1
644	1
645	1
646	1
647	1
648	1
649	1
650	1
651	1
652	1
653	1
654	1
655	1
656	1
657	1
658	1
659	1
660	1
661	1
662	1
663	1
664	1
665	1
666	1
667	1
668	1
669	1
670	1
671	1
672	1
673	1
674	1
675	1
676	1
677	1
678	1
679	1
680	1
681	1
682	1
683	1
684	1
685	1
686	1
687	1
688	1
689	1
690	1
691	1
692	1
693	1
694	1
695	1
696	1
697	1
698	1
699	1
700	1
701	1
702	1
703	1
704	1
705	1
706	1
707	1
708	1
709	1
710	1
711	1
712	1
713	1
714	1
715	1
716	1
717	1
718	1
719	1
720	1
721	1
722	1
723	1
724	1
725	1
726	1
727	1
728	1
729	1
730	1
731	1
732	1
733	1
734	1
735	1
736	1
737	1
738	1
739	1
740	1
741	1
742	1
743	1
744	1
745	1
746	1
747	1
748	1
749	1
750	1
751	1
752	1
753	1
754	1
755	1
756	1
757	1
758	1
759	1
760	1
761	1
762	1
763	1
764	1
765	1
766	1
767	1
768	1
769	1
770	1
771	1
772	1
773	1
774	1
775	1
776	1
777	1
778	1
779	1
780	1
781	1
782	1
783	1
784	1
785	1
786	1
787	1
788	1
789	1
790	1
791	1
792	1
793	1
794	1
795	1
796	1
797	1
798	1
799	1
800	1
801	1
802	1
803	1
804	1
805	1
806	1
807	1
808	1
809	1
810	1
811	1
812	1
813	1
814	1
815	1
816	1
817	1
818	1
819	1
820	1
821	1
822	1
823	1
824	1
825	1
826	1
827	1
828	1
829	1
830	1
831	1
832	1
833	1
834	1
835	1
836	1
837	1
838	1
839	1
840	1
841	1
842	1
843	1
844	1
845	1
846	1
847	1
848	1
849	1
850	1
851	1
852	1
853	1
854	1
855	1
856	1
857	1
858	1
859	1
860	1
861	1
862	1
863	1
864	1
865	1
866	1
867	1
868	1
869	1
870	1
871	1
872	1
873	1
874	1
875	1
876	1
877	1
878	1
880	1
881	1
882	1
883	1
884	1
885	1
886	1
887	1
888	1
889	1
890	1
891	1
892	1
893	1
894	1
895	1
896	1
897	1
898	1
899	1
900	1
901	1
902	1
903	1
904	1
905	1
906	1
907	1
908	1
909	1
910	1
911	1
912	1
913	1
914	1
915	1
916	1
917	1
918	1
919	1
920	1
921	1
922	1
923	1
924	1
925	1
926	1
927	1
928	1
929	1
930	1
931	1
932	1
933	1
934	1
935	1
936	1
937	1
938	1
939	1
940	1
941	1
942	1
943	1
944	1
945	1
946	1
947	1
948	1
949	1
950	1
951	1
952	1
953	1
954	1
955	1
956	1
957	1
958	1
959	1
960	1
961	1
962	1
963	1
964	1
965	1
966	1
967	1
968	1
969	1
970	1
971	1
972	1
973	1
974	1
975	1
976	1
977	1
978	1
979	1
980	1
981	1
982	1
983	1
984	1
985	1
986	1
987	1
988	1
989	1
990	1
991	1
992	1
993	1
994	1
995	1
996	1
997	1
998	1
999	1
1000	1
1001	1
1002	1
1003	1
1004	1
1005	1
1006	1
1007	1
1008	1
1009	1
1010	1
1011	1
1012	1
1013	1
1014	1
1015	1
1016	1
1017	1
1018	1
1019	1
1020	1
1021	1
1022	1
1023	1
1024	1
1025	1
1026	1
1027	1
1028	1
1029	1
1030	1
1031	1
1032	1
1033	1
1034	1
1035	1
1036	1
1037	1
1038	1
1039	1
1040	1
1041	1
1042	1
1043	1
1044	1
1045	1
1046	1
1047	1
1048	1
1049	1
1050	1
1051	1
1052	1
1053	1
1054	1
1055	1
1056	1
1057	1
1058	1
1059	1
1060	1
1061	1
1062	1
1063	1
1064	1
1065	1
1066	1
1067	1
1068	1
1069	1
1070	1
1071	1
1072	1
1073	1
1074	1
1075	1
1076	1
1077	1
1078	1
1079	1
1080	1
1081	1
1082	1
1083	1
1084	1
1085	1
1086	1
1087	1
1088	1
1089	1
1090	1
1091	1
1092	1
1093	1
1094	1
1095	1
1096	1
1097	1
1098	1
1099	1
1100	1
1101	1
1102	1
1103	1
1104	1
1105	1
1106	1
1107	1
1108	1
1109	1
1110	1
1111	1
1112	1
1113	1
1114	1
1115	1
1116	1
1117	1
1118	1
1119	1
1120	1
1121	1
1122	1
1123	1
1124	1
1125	1
1126	1
1127	1
1128	1
1129	1
1130	1
1131	1
1132	1
1133	1
1134	1
1135	1
1136	1
1137	1
1138	1
1139	1
1140	1
1141	1
1142	1
1143	1
1144	1
1145	1
1146	1
1147	1
1148	1
1149	1
1150	1
1151	1
1152	1
1153	1
1154	1
1155	1
1156	1
1157	1
1158	1
1159	1
1160	1
1161	1
1162	1
1163	1
1164	1
1165	1
1166	1
1167	1
1168	1
1169	1
1170	1
1171	1
1172	1
1173	1
1174	1
1175	1
1176	1
1177	1
1178	1
1179	1
1180	1
1181	1
1182	1
1183	1
1184	1
1185	1
1186	1
1187	1
1188	1
1189	1
1190	1
1191	1
1192	1
1193	1
1194	1
1195	1
1196	1
1197	1
1198	1
1199	1
1200	1
1201	1
1202	1
1203	1
1204	1
1205	1
1206	1
1207	1
1208	1
1209	1
1210	1
1211	1
1212	1
1213	1
1214	1
1215	1
1216	1
1217	1
1218	1
1219	1
1220	1
1221	1
1222	1
1223	1
1224	1
1225	1
1226	1
1227	1
1228	1
1229	1
1230	1
1231	1
1232	1
1233	1
1234	1
1235	1
1236	1
1237	1
1238	1
1239	1
1240	1
1241	1
1242	1
1243	1
1244	1
1245	1
1246	1
1247	1
1248	1
1249	1
1250	1
1251	1
1252	1
1253	1
1254	1
1255	1
1256	1
1257	1
1258	1
1259	1
1260	1
1261	1
1262	1
1263	1
1264	1
1265	1
1266	1
1267	1
1268	1
1269	1
1270	1
1271	1
1272	1
1273	1
1274	1
1275	1
1276	1
1277	1
1278	1
1279	1
1280	1
1281	1
1282	1
1283	1
1284	1
1285	1
1286	1
1287	1
1288	1
1289	1
1290	1
1291	1
1292	1
1293	1
1294	1
1295	1
1296	1
1297	1
1298	1
1299	1
1300	1
1301	1
1302	1
1303	1
1304	1
1305	1
1306	1
1307	1
1308	1
1309	1
1310	1
1311	1
1312	1
1313	1
1314	1
1315	1
1316	1
1317	1
1318	1
1319	1
1320	1
1321	1
1322	1
1323	1
1324	1
1325	1
1326	1
1327	1
1328	1
1329	1
1330	1
1331	1
1332	1
1333	1
1334	1
1335	1
1336	1
1337	1
1338	1
1339	1
1340	1
1341	1
1342	1
1343	1
1344	1
1345	1
1346	1
1347	1
1348	1
1349	1
1350	1
1351	1
1352	1
1353	1
1354	1
1355	1
1356	1
1357	1
1358	1
1359	1
1360	1
1361	1
1362	1
1363	1
1364	1
1365	1
1366	1
1367	1
1368	1
1369	1
1370	1
1371	1
1372	1
1373	1
1374	1
1375	1
1376	1
1377	1
1378	1
1379	1
1380	1
1381	1
1382	1
1383	1
1384	1
1385	1
1386	1
1387	1
1388	1
1389	1
1390	1
1391	1
1392	1
1393	1
1394	1
1395	1
1396	1
1397	1
1398	1
1399	1
1400	1
1401	1
1402	1
1403	1
1404	1
1405	1
1406	1
1407	1
1408	1
1409	1
1410	1
1411	1
1412	1
1413	1
1414	1
1415	1
1416	1
1417	1
1418	1
1419	1
1420	1
1421	1
1422	1
1423	1
1424	1
1425	1
1426	1
1427	1
1428	1
1429	1
1430	1
1431	1
1432	1
1433	1
1434	1
1435	1
1436	1
1437	1
1438	1
1439	1
1440	1
1441	1
1442	1
1443	1
1444	1
1445	1
1446	1
1447	1
1448	1
1449	1
1450	1
1451	1
1452	1
1453	1
1454	1
1455	1
1456	1
1457	1
1458	1
1459	1
1460	1
1461	1
1462	1
1463	1
1464	1
1465	1
1466	1
1467	1
1468	1
1469	1
1470	1
1471	1
1472	1
1473	1
1474	1
1475	1
1476	1
1477	1
1478	1
1479	1
1480	1
1481	1
1482	1
1483	1
1484	1
1485	1
1486	1
1487	1
1704	1
1488	1
1489	1
1490	1
1491	1
1492	1
1493	1
1494	1
1495	1
1496	1
1497	1
1498	1
1499	1
1500	1
1501	1
1502	1
1503	1
1504	1
1505	1
1506	1
1507	1
1508	1
1509	1
1510	1
1511	1
1512	1
1513	1
1514	1
1515	1
1516	1
1517	1
1518	1
1519	1
1520	1
1521	1
1522	1
1523	1
1524	1
1525	1
1526	1
1527	1
1528	1
1529	1
1530	1
1531	1
1532	1
1533	1
1534	1
1535	1
1536	1
1537	1
1538	1
1539	1
1540	1
1541	1
1542	1
1543	1
1544	1
1545	1
1546	1
1547	1
1548	1
1549	1
1550	1
1551	1
1552	1
1553	1
1554	1
1555	1
1556	1
1557	1
1558	1
1559	1
1560	1
1561	1
1562	1
1563	1
1564	1
1565	1
1566	1
1567	1
1568	1
1569	1
1570	1
1571	1
1572	1
1573	1
1574	1
1575	1
1576	1
1577	1
1578	1
1579	1
1580	1
1581	1
1582	1
1583	1
1705	1
1584	1
1585	1
1586	1
1587	1
1588	1
1589	1
1590	1
1591	1
1592	1
1593	1
1594	1
1595	1
1596	1
1597	1
1598	1
1599	1
1600	1
1601	1
1602	1
1603	1
1604	1
1605	1
1706	1
1606	1
1607	1
1608	1
1609	1
1610	1
1611	1
1612	1
1613	1
1614	1
1615	1
1616	1
1617	1
1618	1
1619	1
1620	1
1621	1
1622	1
1623	1
1624	1
1625	1
1626	1
1627	1
1628	1
1629	1
1630	1
1631	1
1632	1
1633	1
1634	1
1635	1
1636	1
1637	1
1638	1
1639	1
1640	1
1641	1
1642	1
1643	1
1644	1
1645	1
1646	1
1647	1
1648	1
1649	1
1650	1
1651	1
1652	1
1653	1
1654	1
1655	1
1656	1
1657	1
1658	1
1659	1
1660	1
1661	1
1662	1
1663	1
1664	1
1665	1
1666	1
1667	1
1668	1
1669	1
1670	1
1671	1
1672	1
1673	1
1674	1
1675	1
1676	1
1677	1
1678	1
1679	1
1707	1
1680	1
1681	1
1682	1
1683	1
1684	1
1685	1
1686	1
1687	1
1688	1
1689	1
1690	1
1691	1
1692	1
1693	1
1694	1
1695	1
1696	1
1697	1
1698	1
1699	1
1700	1
1701	1
1702	1
1703	1
1708	1
1709	1
1710	1
1711	1
1712	1
1713	1
1714	1
1715	1
1716	1
1717	1
1718	1
1719	1
1720	1
1721	1
1722	1
1723	1
1724	1
1725	1
1726	1
1727	1
1728	1
1729	1
1730	1
1731	1
1732	1
1733	1
1734	1
1735	1
1736	1
1737	1
1738	1
1739	1
1740	1
1741	1
1742	1
1743	1
1744	1
1745	1
1746	1
1747	1
1748	1
1749	1
1750	1
1751	1
1752	1
1753	1
1754	1
1755	1
1756	1
1757	1
1758	1
1759	1
1760	1
1761	1
1762	1
1763	1
1764	1
1765	1
1766	1
1767	1
1768	1
1769	1
1770	1
1771	1
1772	1
1773	1
1774	1
1775	1
1776	1
1777	1
1778	1
1779	1
1780	1
1781	1
1782	1
1783	1
1784	1
1785	1
1786	1
1787	1
1788	1
1789	1
1790	1
1791	1
1792	1
1793	1
1794	1
1795	1
1796	1
1797	1
1798	1
1799	1
1800	1
1801	1
1802	1
1803	1
1804	1
1805	1
1806	1
1807	1
1808	1
1809	1
1810	1
1811	1
1812	1
1813	1
1814	1
1815	1
1816	1
1817	1
1818	1
1819	1
1820	1
1821	1
1822	1
1823	1
1824	1
1825	1
1826	1
1827	1
1828	1
1829	1
1830	1
1831	1
1832	1
1833	1
1834	1
1835	1
1836	1
1837	1
2633	1
1838	1
1839	1
1840	1
1841	1
1842	1
1843	1
1844	1
1845	1
1846	1
1847	1
1848	1
1849	1
1850	1
1851	1
1852	1
1853	1
1854	1
1855	1
1856	1
1857	1
1858	1
1859	1
1860	1
1861	1
1862	1
1863	1
1864	1
1865	1
1866	1
1867	1
1868	1
1869	1
1870	1
1871	1
1872	1
1873	1
1874	1
1875	1
1876	1
1877	1
1878	1
1879	1
1880	1
1881	1
1882	1
1883	1
1884	1
1885	1
1886	1
1887	1
1888	1
1889	1
1890	1
1891	1
1892	1
1893	1
1894	1
1895	1
1896	1
1897	1
1898	1
1899	1
1900	1
1901	1
1902	1
1903	1
1904	1
1905	1
1906	1
1907	1
1908	1
1909	1
1910	1
1911	1
1912	1
1913	1
1914	1
1915	1
1916	1
1917	1
1918	1
1919	1
1920	1
1921	1
1922	1
1923	1
1924	1
1925	1
1926	1
1927	1
1928	1
1929	1
1930	1
1931	1
1932	1
1933	1
1934	1
1935	1
1936	1
1937	1
1938	1
1939	1
1940	1
1941	1
1942	1
1943	1
1944	1
1945	1
1946	1
1947	1
1948	1
2634	1
1949	1
1950	1
1951	1
1952	1
1953	1
1954	1
1955	1
1956	1
1957	1
1958	1
1959	1
1960	1
1961	1
1962	1
1963	1
1964	1
1965	1
1966	1
1967	1
1968	1
1969	1
1970	1
1971	1
1972	1
1973	1
1974	1
1975	1
1976	1
1977	1
1978	1
1979	1
1980	1
1981	1
1982	1
1983	1
1984	1
1985	1
1986	1
1987	1
1988	1
1989	1
1990	1
1991	1
1992	1
1993	1
1994	1
1995	1
1996	1
1997	1
1998	1
1999	1
2000	1
2001	1
2002	1
2003	1
2004	1
2005	1
2006	1
2007	1
2008	1
2009	1
2010	1
2011	1
2012	1
2013	1
2014	1
2015	1
2016	1
2017	1
2018	1
2019	1
2020	1
2021	1
2022	1
2023	1
2024	1
2025	1
2026	1
2027	1
2028	1
2029	1
2030	1
2031	1
2032	1
2033	1
2034	1
2035	1
2036	1
2037	1
2038	1
2039	1
2040	1
2041	1
2042	1
2043	1
2044	1
2078	1
2045	1
2046	1
2047	1
2048	1
2049	1
2050	1
2051	1
2052	1
2053	1
2054	1
2055	1
2056	1
2057	1
2058	1
2059	1
2060	1
2061	1
2062	1
2063	1
2064	1
2065	1
2066	1
2067	1
2068	1
2069	1
2070	1
2071	1
2072	1
2073	1
2074	1
2075	1
2076	1
2077	1
2079	1
2080	1
2081	1
2082	1
2083	1
2084	1
2085	1
2086	1
2087	1
2088	1
2089	1
2090	1
2091	1
2092	1
2093	1
2094	1
2095	1
2096	1
2097	1
2098	1
2099	1
2100	1
2101	1
2102	1
2103	1
2104	1
2105	1
2106	1
2107	1
2108	1
2109	1
2110	1
2111	1
2112	1
2113	1
2114	1
2115	1
2116	1
2117	1
2118	1
2119	1
2120	1
2121	1
2122	1
2123	1
2124	1
2125	1
2126	1
2127	1
2128	1
2129	1
2130	1
2131	1
2132	1
2133	1
2134	1
2135	1
2136	1
2137	1
2138	1
2139	1
2140	1
2141	1
2142	1
2143	1
2144	1
2145	1
2146	1
2147	1
2148	1
2149	1
2150	1
2151	1
2152	1
2153	1
2154	1
2155	1
2156	1
2157	1
2158	1
2159	1
2160	1
2161	1
2162	1
2163	1
2164	1
2165	1
2166	1
2167	1
2168	1
2169	1
2170	1
2171	1
2172	1
2173	1
2174	1
2175	1
2176	1
2177	1
2178	1
2179	1
2180	1
2181	1
2182	1
2183	1
2184	1
2185	1
2186	1
2187	1
2188	1
2189	1
2190	1
2191	1
2192	1
2193	1
2194	1
2195	1
2196	1
2197	1
2198	1
2199	1
2200	1
2201	1
2202	1
2203	1
2204	1
2205	1
2206	1
2207	1
2208	1
2209	1
2210	1
2211	1
2212	1
2213	1
2214	1
2215	1
2216	1
2217	1
2218	1
2219	1
2220	1
2221	1
2222	1
2223	1
2224	1
2225	1
2226	1
2227	1
2228	1
2229	1
2230	1
2231	1
2232	1
2233	1
2234	1
2235	1
2236	1
2237	1
2238	1
2239	1
2240	1
2241	1
2242	1
2243	1
2244	1
2245	1
2246	1
2247	1
2248	1
2249	1
2250	1
2251	1
2252	1
2253	1
2254	1
2255	1
2256	1
2257	1
2258	1
2259	1
2260	1
2261	1
2262	1
2263	1
2264	1
2265	1
2266	1
2267	1
2268	1
2269	1
2270	1
2271	1
2272	1
2273	1
2274	1
2275	1
2276	1
2277	1
2278	1
2279	1
2280	1
2281	1
2282	1
2283	1
2284	1
2285	1
2635	1
2286	1
2287	1
2288	1
2289	1
2290	1
2291	1
2292	1
2293	1
2294	1
2295	1
2296	1
2297	1
2298	1
2299	1
2300	1
2301	1
2302	1
2303	1
2304	1
2305	1
2306	1
2307	1
2355	1
2308	1
2309	1
2310	1
2311	1
2312	1
2313	1
2314	1
2315	1
2316	1
2317	1
2318	1
2319	1
2320	1
2321	1
2322	1
2323	1
2324	1
2325	1
2326	1
2327	1
2328	1
2329	1
2630	1
2330	1
2331	1
2332	1
2333	1
2334	1
2335	1
2336	1
2337	1
2338	1
2339	1
2340	1
2341	1
2342	1
2343	1
2344	1
2345	1
2346	1
2347	1
2348	1
2349	1
2350	1
2351	1
2352	1
2353	1
2354	1
2356	1
2357	1
2358	1
2359	1
2360	1
2361	1
2362	1
2363	1
2364	1
2365	1
2366	1
2367	1
2368	1
2369	1
2370	1
2371	1
2372	1
2373	1
2374	1
2375	1
2376	1
2377	1
2378	1
2379	1
2380	1
2381	1
2382	1
2383	1
2384	1
2385	1
2386	1
2387	1
2388	1
2389	1
2390	1
2391	1
2392	1
2393	1
2394	1
2395	1
2396	1
2397	1
2398	1
2399	1
2400	1
2401	1
2402	1
2403	1
2404	1
2405	1
2406	1
2407	1
2408	1
2409	1
2410	1
2411	1
2412	1
2413	1
2414	1
2415	1
2416	1
2417	1
2418	1
2419	1
2420	1
2421	1
2422	1
2423	1
2424	1
2425	1
2426	1
2427	1
2428	1
2429	1
2430	1
2431	1
2432	1
2433	1
2434	1
2435	1
2436	1
2437	1
2438	1
2439	1
2440	1
2441	1
2442	1
2443	1
2444	1
2445	1
2446	1
2447	1
2448	1
2449	1
2450	1
2451	1
2452	1
2453	1
2454	1
2455	1
2456	1
2457	1
2458	1
2459	1
2460	1
2461	1
2462	1
2463	1
2464	1
2465	1
2466	1
2467	1
2468	1
2469	1
2470	1
2631	1
2471	1
2472	1
2473	1
2474	1
2475	1
2476	1
2477	1
2478	1
2479	1
2480	1
2481	1
2482	1
2483	1
2484	1
2485	1
2486	1
2487	1
2488	1
2489	1
2490	1
2491	1
2492	1
2493	1
2494	1
2495	1
2496	1
2497	1
2498	1
2499	1
2500	1
2501	1
2502	1
2503	1
2504	1
2505	1
2506	1
2507	1
2508	1
2509	1
2510	1
2511	1
2512	1
2513	1
2514	1
2515	1
2516	1
2517	1
2518	1
2519	1
2520	1
2521	1
2522	1
2523	1
2524	1
2525	1
2526	1
2527	1
2528	1
2529	1
2530	1
2531	1
2532	1
2533	1
2534	1
2535	1
2536	1
2537	1
2538	1
2539	1
2540	1
2541	1
2542	1
2543	1
2632	1
2544	1
2545	1
2546	1
2547	1
2548	1
2549	1
2550	1
2551	1
2552	1
2553	1
2554	1
2555	1
2556	1
2557	1
2558	1
2559	1
2560	1
2561	1
2562	1
2563	1
2564	1
2565	1
2566	1
2567	1
2568	1
2569	1
2570	1
2571	1
2572	1
2573	1
2574	1
2575	1
2576	1
2577	1
2578	1
2579	1
2580	1
2581	1
2582	1
2583	1
2584	1
2585	1
2586	1
2587	1
2588	1
2589	1
2590	1
2591	1
2592	1
2593	1
2594	1
2595	1
2596	1
2597	1
2598	1
2599	1
2600	1
2601	1
2602	1
2603	1
2604	1
2605	1
2606	1
2607	1
2608	1
2609	1
2610	1
2611	1
2612	1
2613	1
2614	1
2615	1
2616	1
2617	1
2618	1
2619	1
2620	1
2621	1
2622	1
2623	1
2624	1
2625	1
2626	1
2627	1
2628	1
2629	1
2636	1
2637	1
2638	1
2639	1
2640	1
2641	1
2642	1
2643	1
2644	1
2645	1
2646	1
2647	1
2648	1
2649	1
2650	1
2651	1
2652	1
2653	1
2654	1
2655	1
2656	1
2657	1
2658	1
2659	1
2660	1
2661	1
2662	1
2663	1
2664	1
2665	1
2666	1
2667	1
2668	1
2669	1
2670	1
2671	1
2672	1
2673	1
2674	1
2675	1
2676	1
2677	1
2678	1
2680	1
2681	1
2682	1
2683	1
2684	1
2685	1
2686	1
2687	1
2688	1
2689	1
2690	1
2691	1
2692	1
2693	1
2694	1
2695	1
2696	1
2697	1
2698	1
2699	1
2700	1
2701	1
2702	1
2703	1
2704	1
2705	1
2706	1
2707	1
2708	1
2709	1
2710	1
2711	1
2712	1
2713	1
2714	1
2715	1
2716	1
2717	1
2718	1
2719	1
2720	1
2721	1
2722	1
2723	1
2724	1
2725	1
2726	1
2727	1
2728	1
2729	1
2730	1
2731	1
2732	1
2733	1
2734	1
2735	1
2736	1
2737	1
2738	1
2739	1
2740	1
2741	1
2742	1
2743	1
2744	1
2745	1
2746	1
2747	1
2748	1
2749	1
2750	1
2751	1
2752	1
2753	1
2754	1
2755	1
2756	1
2757	1
2758	1
2759	1
2760	1
2761	1
2762	1
2763	1
2764	1
2765	1
2766	1
2767	1
2768	1
2769	1
2770	1
2771	1
2772	1
2773	1
2774	1
2775	1
2776	1
2777	1
2778	1
2779	1
2780	1
2781	1
2782	1
2783	1
2784	1
2785	1
2786	1
2787	1
2788	1
2789	1
2790	1
2791	1
2792	1
2793	1
2794	1
2795	1
2796	1
2797	1
2798	1
2799	1
2800	1
2801	1
2802	1
2803	1
2804	1
2805	1
2806	1
2807	1
2808	1
2809	1
2810	1
2811	1
2812	1
2813	1
2814	1
2815	1
2816	1
2817	1
2818	1
2819	1
2820	1
2821	1
2822	1
2823	1
2824	1
2825	1
2826	1
2827	1
2828	1
2829	1
2830	1
2831	1
2832	1
2833	1
2834	1
2835	1
2836	1
2837	1
2838	1
2839	1
2840	1
2841	1
2842	1
2843	1
2844	1
2845	1
2846	1
2847	1
2848	1
2849	1
2850	1
2851	1
2852	1
2853	1
2854	1
2855	1
2856	1
2857	1
2858	1
2859	1
2860	1
2861	1
2862	1
2863	1
2864	1
2865	1
2866	1
2867	1
2868	1
2869	1
2870	1
2871	1
2872	1
2873	1
2874	1
2875	1
2876	1
2877	1
2878	1
2879	1
2880	1
2881	1
2882	1
2883	1
2884	1
2885	1
2886	1
2887	1
2888	1
2889	1
2890	1
2891	1
2892	1
2893	1
2894	1
2895	1
2896	1
2897	1
2898	1
2899	1
2900	1
2901	1
2902	1
2903	1
2904	1
2905	1
2906	1
2907	1
2908	1
2909	1
2910	1
2911	1
2912	1
2913	1
2914	1
2915	1
2916	1
2917	1
2918	1
2919	1
2920	1
2921	1
2922	1
2923	1
2924	1
2925	1
2926	1
2927	1
2928	1
2929	1
2930	1
2931	1
2932	1
2933	1
2934	1
2935	1
2936	1
2937	1
2938	1
2939	1
2940	1
2941	1
2942	1
2943	1
2944	1
\.


--
-- Data for Name: dependency_vulnerabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dependency_vulnerabilities (dependency_id, vulnerability_id) FROM stdin;
2680	2
2681	2
2682	2
2683	2
2684	2
2685	2
2686	2
2687	2
2688	2
2689	2
2690	2
2691	2
2692	2
2693	2
2694	2
2695	2
19	2
20	2
21	2
22	2
15	2
16	2
18	2
2696	2
2697	2
2698	2
2699	2
2700	2
2701	2
2702	2
2703	2
2704	2
2705	2
2706	2
2707	2
2708	2
2709	2
2710	2
2711	2
2712	2
2713	2
2714	2
2715	2
2716	2
2717	2
2718	2
2719	2
2720	2
2721	2
2722	2
2723	2
2724	2
2725	2
2726	2
2727	2
2728	2
2729	2
2730	2
2731	2
2732	2
2733	2
2734	2
2735	2
2736	2
2737	2
2738	2
2739	2
2740	2
2741	2
2742	2
2743	2
2744	2
2745	2
2746	2
2747	2
2748	2
2749	2
2750	2
2751	2
2752	2
2753	2
2754	2
2755	2
2756	2
2757	2
2758	2
2759	2
2760	2
2761	2
2762	2
2763	2
2764	2
2765	2
2766	2
2767	2
2768	2
2769	2
2770	2
2771	2
2772	2
2773	2
2774	2
2775	2
2776	2
2777	2
2778	2
2779	2
2780	2
2781	2
2782	2
2783	2
2784	2
2785	2
2786	2
2787	2
2788	2
2789	2
2790	2
2791	2
2792	2
2793	2
2794	2
2795	2
2796	2
2797	2
2798	2
2799	2
2800	2
2801	2
2802	2
2803	2
2804	2
2805	2
2806	2
2807	2
2808	2
2809	2
2810	2
2811	2
2812	2
2813	2
2814	2
2815	2
2816	2
2817	2
2818	2
2819	2
2820	2
2821	2
2822	2
2823	2
2824	2
2825	2
2826	2
2827	2
2828	2
2829	2
2830	2
2831	2
2832	2
17	2
23	2
2833	2
2834	2
2835	2
2836	2
2837	2
2838	2
2839	2
2840	2
2841	2
2842	2
2843	2
2844	2
2845	2
2846	2
2847	2
2848	2
2849	2
2850	2
2851	2
2852	2
2853	2
2854	2
2855	2
2856	2
2857	2
2858	2
2859	2
2860	2
2861	2
2862	2
2863	2
2864	2
2865	2
2866	2
2867	2
2868	2
2869	2
2870	2
2871	2
2872	2
2873	2
2874	2
2875	2
2876	2
2877	2
2878	2
2879	2
2880	2
2881	2
2882	2
2883	2
2884	2
2885	2
2886	2
2887	2
2888	2
2889	2
2890	2
2891	2
2892	2
2893	2
2894	2
2895	2
2896	2
2897	2
2898	2
2899	2
2900	2
2901	2
2902	2
2903	2
2904	2
2689	3
2690	3
2691	3
2692	3
2693	3
2694	3
2695	3
19	3
20	3
21	3
22	3
2703	3
2704	3
2705	3
2706	3
2707	3
2708	3
2709	3
2710	3
2711	3
2712	3
2713	3
2714	3
15	3
16	3
18	3
2696	3
2697	3
2698	3
2699	3
2700	3
2701	3
2702	3
2715	3
2716	3
2717	3
2718	3
2719	3
2720	3
2721	3
2722	3
2723	3
2724	3
2725	3
2726	3
2727	3
2728	3
2729	3
2730	3
2731	3
2732	3
2733	3
2734	3
2735	3
2736	3
2737	3
2738	3
2739	3
2740	3
2741	3
2742	3
2743	3
2744	3
2745	3
2746	3
2747	3
2748	3
2749	3
2750	3
2751	3
2752	3
2753	3
2754	3
2755	3
2756	3
2757	3
2758	3
2759	3
2760	3
2761	3
2762	3
2763	3
2764	3
2765	3
2766	3
2767	3
2768	3
2769	3
2770	3
2771	3
2772	3
2773	3
2774	3
2775	3
2776	3
2777	3
2778	3
2779	3
2780	3
2781	3
2782	3
2783	3
2784	3
2785	3
2786	3
2787	3
2788	3
2789	3
2790	3
2791	3
2792	3
2793	3
2794	3
2795	3
2796	3
2797	3
2798	3
2799	3
2800	3
2801	3
2802	3
2803	3
2804	3
2805	3
2806	3
2807	3
2808	3
2809	3
2810	3
2811	3
2812	3
2813	3
2814	3
2815	3
2816	3
2817	3
2818	3
2819	3
2820	3
2821	3
2822	3
2823	3
2824	3
2825	3
2826	3
2827	3
2828	3
2829	3
2830	3
2831	3
2832	3
17	3
23	3
2833	3
2834	3
2835	3
2836	3
2837	3
2838	3
2839	3
2840	3
2841	3
2842	3
2843	3
2844	3
2845	3
2846	3
2847	3
2848	3
2849	3
2850	3
2851	3
2852	3
2853	3
2854	3
2855	3
2856	3
2857	3
2858	3
2859	3
2860	3
2861	3
2862	3
2863	3
2864	3
2865	3
2866	3
2867	3
2868	3
2869	3
2870	3
2871	3
2872	3
2873	3
2874	3
2875	3
2876	3
2877	3
2878	3
2879	3
2880	3
2881	3
2882	3
2883	3
2884	3
2885	3
2886	3
2887	3
2888	3
2889	3
2890	3
2891	3
2892	3
2893	3
2894	3
2895	3
2896	3
2897	3
2898	3
2899	3
2900	3
2901	3
2902	3
2903	3
2904	3
2905	4
2906	4
23	4
2907	4
2908	4
2909	4
2910	4
2911	4
2912	4
2913	5
2914	5
2915	5
2916	5
2917	5
2918	5
2919	5
2920	5
2921	6
2922	6
2696	8
2697	8
2923	8
2924	8
2698	8
2699	8
2700	8
2701	8
2702	8
2925	8
2926	8
2689	8
2690	8
2927	8
2928	8
2691	8
2692	8
2693	8
2694	8
2695	8
2929	8
2930	8
2715	8
2716	8
2717	8
2718	8
2719	8
2720	8
2721	8
2722	8
2723	8
2724	8
2725	8
2726	8
2931	8
2932	8
2933	8
2747	8
2748	8
2749	8
2750	8
2751	8
2752	8
2753	8
2754	8
2755	8
2756	8
2757	8
2758	8
2759	8
2760	8
2761	8
2762	8
2763	8
2764	8
2765	8
2766	8
2934	8
2703	8
2704	8
2705	8
2706	8
2707	8
2708	8
2709	8
2710	8
2711	8
2712	8
2713	8
2714	8
2935	8
2936	8
2937	8
2938	8
2727	8
2728	8
2729	8
2730	8
2731	8
2732	8
2733	8
2734	8
2735	8
2736	8
2737	8
2738	8
2739	8
2939	8
2940	8
2740	8
2741	8
2742	8
2743	8
2744	8
2941	8
2942	8
2801	8
2802	8
2803	8
2804	8
2805	8
2806	8
2807	8
2808	8
2809	8
2810	8
2811	8
2812	8
2813	8
2814	8
2815	8
2816	8
2817	8
2818	8
2819	8
2820	8
2821	8
2822	8
2823	8
2824	8
2825	8
2826	8
2827	8
2828	8
2829	8
2830	8
2831	8
2832	8
21	8
22	8
2767	8
2768	8
2769	8
2770	8
2771	8
2772	8
2773	8
2774	8
2775	8
2776	8
2777	8
2778	8
2779	8
2780	8
2781	8
2782	8
2783	8
2784	8
2785	8
2786	8
2787	8
2788	8
2789	8
2790	8
2791	8
2792	8
2793	8
2794	8
2795	8
2796	8
2797	8
2798	8
2799	8
2800	8
2943	8
2907	8
2908	8
2909	8
2944	8
2868	8
2869	8
2870	8
2871	8
2872	8
2873	8
2874	8
2875	8
2876	8
2877	8
2878	8
2879	8
2880	8
2881	8
2882	8
2883	8
2884	8
2885	8
2886	8
2887	8
2888	8
2889	8
2890	8
2891	8
2892	8
2893	8
2894	8
2895	8
2896	8
2897	8
2898	8
2899	8
2900	8
2901	8
2902	8
2903	8
2904	8
19	8
20	8
2905	8
15	8
2906	8
16	8
18	8
17	8
23	8
2833	8
2834	8
2835	8
2836	8
2837	8
2838	8
2839	8
2840	8
2841	8
2842	8
2843	8
2844	8
2845	8
2846	8
2847	8
2848	8
2849	8
2850	8
2851	8
2852	8
2853	8
2854	8
2855	8
2856	8
2857	8
2858	8
2859	8
2860	8
2861	8
2862	8
2863	8
2864	8
2865	8
2866	8
2867	8
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20160628032730
20161202154955
20161202154956
20161202154957
20170204174113
20170204174655
20170204181351
20170204211046
20170205162716
20170205184344
20170206231748
20170209151055
20170213191327
20170404120012
20170601144523
20170602115650
20171208220500
20180208220500
20180312235115
20180329593029
20180424593030
20180430593031
20180501395891
20180501593032
20180522593033
\.


--
-- Data for Name: sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sources (id, name, description, created_at, updated_at, attribution, license, copyright_url) FROM stdin;
2	RHSA	Red Hat Security Advisories	2018-05-31 16:59:24.600942	2018-05-31 16:59:24.600942	\N	\N	\N
1	NVD	National Vulnerability Database	2018-05-31 16:59:24.033703	2018-05-31 16:59:43.024587	Copyright © 1999–2017, The MITRE Corporation. CVE and the CVE logo are registered trademarks and CVE-Compatible is a trademark of The MITRE Corporation.	Submissions: For all materials you submit to the Common Vulnerabilities and Exposures (CVE®), you hereby grant to The MITRE Corporation (MITRE) and all CVE Numbering Authorities (CNAs) a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute such materials and derivative works. Unless required by applicable law or agreed to in writing, you provide such materials on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE.\n\nCVE Usage: MITRE hereby grants you a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute Common Vulnerabilities and Exposures (CVE®). Any copy you make for such purposes is authorized provided that you reproduce MITRE's copyright designation and this license in any such copy.\n	http://cve.mitre.org/about/termsofuse.html
\.


--
-- Name: sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sources_id_seq', 1, true);


--
-- Data for Name: vulnerability_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vulnerability_sources (vulnerability_id, source_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
\.


--
-- Data for Name: vulnerability_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vulnerability_versions (id, external_id, title, summary, score, vector, access_complexity, vulnerability_authentication, confidentiality_impact, integrity_impact, availability_impact, vulnerability_source, assessment_check, scanner, recommendation, "references", modified_at, published_at, created_at, updated_at, score_version, score_system, score_details) FROM stdin;
1	CVE-2014-1457	CVE-2014-1457	Open Web Analytics (OWA) before 1.5.6 improperly generates random nonce values, which makes it easier for remote attackers to bypass a CSRF protection mechanism by leveraging knowledge of an OWA user name.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://www.openwebanalytics.com/?p=384","text":"http://www.openwebanalytics.com/?p=384"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/65573","text":"http://www.securityfocus.com/bid/65573"},{"type":"UNKNOWN","source":"","url":"https://exchange.xforce.ibmcloud.com/vulnerabilities/91125","text":"https://exchange.xforce.ibmcloud.com/vulnerabilities/91125"},{"type":"UNKNOWN","source":"","url":"https://www.secureworks.com/research/swrx-2014-006","text":"https://www.secureworks.com/research/swrx-2014-006"}]	2018-03-20 21:29:00	2018-03-20 21:29:00	2018-05-31 16:59:55.494096	2018-05-31 16:59:55.494096	2.0		{"cvssv2":null,"cvssv3":null}
2	CVE-2012-1531	CVE-2012-1531	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."	10.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1391.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1391.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1392.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1392.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1465.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1465.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1466.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1466.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1467.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1467.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51141","text":"http://secunia.com/advisories/51141"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51313","text":"http://secunia.com/advisories/51313"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51315","text":"http://secunia.com/advisories/51315"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51326","text":"http://secunia.com/advisories/51326"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51327","text":"http://secunia.com/advisories/51327"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51328","text":"http://secunia.com/advisories/51328"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51390","text":"http://secunia.com/advisories/51390"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51393","text":"http://secunia.com/advisories/51393"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51438","text":"http://secunia.com/advisories/51438"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21625794","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21625794"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786"},{"type":"UNKNOWN","source":"","url":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html","text":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html"},{"type":"UNKNOWN","source":"","url":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:150","text":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:150"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html","text":"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html","text":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/56033","text":"http://www.securityfocus.com/bid/56033"},{"type":"UNKNOWN","source":"","url":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf","text":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16546","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16546"}]	2017-11-30 02:29:00	2012-10-16 21:55:00	2018-05-31 16:59:58.372243	2018-05-31 16:59:58.372243	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:C/I:C/A:C)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"COMPLETE","integrityImpact":"COMPLETE","availabilityImpact":"COMPLETE","baseScore":10.0},"cvssv3":null}
3	CVE-2012-3216	CVE-2012-3216	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier allows remote attackers to affect confidentiality via unknown vectors related to Libraries.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"	2.6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00023.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00023.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00011.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00011.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1385.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1385.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1386.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1386.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1391.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1391.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1392.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1392.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1465.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1465.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1466.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1466.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1467.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1467.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51028","text":"http://secunia.com/advisories/51028"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51029","text":"http://secunia.com/advisories/51029"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51141","text":"http://secunia.com/advisories/51141"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51166","text":"http://secunia.com/advisories/51166"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51313","text":"http://secunia.com/advisories/51313"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51315","text":"http://secunia.com/advisories/51315"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51326","text":"http://secunia.com/advisories/51326"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51327","text":"http://secunia.com/advisories/51327"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51328","text":"http://secunia.com/advisories/51328"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51390","text":"http://secunia.com/advisories/51390"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51393","text":"http://secunia.com/advisories/51393"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51438","text":"http://secunia.com/advisories/51438"},{"type":"UNKNOWN","source":"","url":"http://security.gentoo.org/glsa/glsa-201406-32.xml","text":"http://security.gentoo.org/glsa/glsa-201406-32.xml"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786"},{"type":"UNKNOWN","source":"","url":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html","text":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html","text":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/56075","text":"http://www.securityfocus.com/bid/56075"},{"type":"UNKNOWN","source":"","url":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf","text":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16538","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16538"}]	2017-09-19 01:35:00	2012-10-16 21:55:00	2018-05-31 16:59:59.536665	2018-05-31 16:59:59.536665	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:H/Au:N/C:P/I:N/A:N)","accessVector":"NETWORK","accessComplexity":"HIGH","authentication":"NONE","confidentialityImpact":"PARTIAL","integrityImpact":"NONE","availabilityImpact":"NONE","baseScore":2.6},"cvssv3":null}
4	CVE-2016-3458	CVE-2016-3458	Unspecified vulnerability in Oracle Java SE 6u115, 7u101, and 8u92; and Java SE Embedded 8u91 allows remote attackers to affect integrity via vectors related to CORBA.	4.3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00011.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00011.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00024.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00024.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00032.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00032.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00033.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00033.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00034.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00034.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00035.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00035.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-updates/2016-08/msg00028.html","text":"http://lists.opensuse.org/opensuse-updates/2016-08/msg00028.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2016-1504.html","text":"http://rhn.redhat.com/errata/RHSA-2016-1504.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2016-1776.html","text":"http://rhn.redhat.com/errata/RHSA-2016-1776.html"},{"type":"UNKNOWN","source":"","url":"http://www.debian.org/security/2016/dsa-3641","text":"http://www.debian.org/security/2016/dsa-3641"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html","text":"http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/linuxbulletinjul2016-3090544.html","text":"http://www.oracle.com/technetwork/topics/security/linuxbulletinjul2016-3090544.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/91787","text":"http://www.securityfocus.com/bid/91787"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/91945","text":"http://www.securityfocus.com/bid/91945"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1036365","text":"http://www.securitytracker.com/id/1036365"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3043-1","text":"http://www.ubuntu.com/usn/USN-3043-1"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3062-1","text":"http://www.ubuntu.com/usn/USN-3062-1"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3077-1","text":"http://www.ubuntu.com/usn/USN-3077-1"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1458","text":"https://access.redhat.com/errata/RHSA-2016:1458"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1475","text":"https://access.redhat.com/errata/RHSA-2016:1475"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1476","text":"https://access.redhat.com/errata/RHSA-2016:1476"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1477","text":"https://access.redhat.com/errata/RHSA-2016:1477"},{"type":"UNKNOWN","source":"","url":"https://security.gentoo.org/glsa/201610-08","text":"https://security.gentoo.org/glsa/201610-08"},{"type":"UNKNOWN","source":"","url":"https://security.gentoo.org/glsa/201701-43","text":"https://security.gentoo.org/glsa/201701-43"},{"type":"UNKNOWN","source":"","url":"https://security.netapp.com/advisory/ntap-20160721-0001/","text":"https://security.netapp.com/advisory/ntap-20160721-0001/"}]	2017-11-10 02:29:00	2016-07-21 10:12:00	2018-05-31 17:00:00.012605	2018-05-31 17:00:00.012605	3.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:M/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"MEDIUM","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":4.3},"cvssv3":{"version":"3.0","vectorString":"CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:N","attackVector":"NETWORK","attackComplexity":"LOW","privilegesRequired":"NONE","userInteraction":"REQUIRED","scope":"UNCHANGED","confidentialityImpact":"NONE","integrityImpact":"LOW","availabilityImpact":"NONE","baseScore":4.3,"baseSeverity":"MEDIUM"}}
5	CVE-2016-0002	CVE-2016-0002	The Microsoft (1) VBScript 5.7 and 5.8 and (2) JScript 5.7 and 5.8 engines, as used in Internet Explorer 8 through 11 and other products, allow remote attackers to execute arbitrary code via a crafted web site, aka "Scripting Engine Memory Corruption Vulnerability."	7.5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://technet.microsoft.com/security/bulletin/MS16-001","text":"http://technet.microsoft.com/security/bulletin/MS16-001"},{"type":"UNKNOWN","source":"","url":"http://technet.microsoft.com/security/bulletin/MS16-003","text":"http://technet.microsoft.com/security/bulletin/MS16-003"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1034648","text":"http://www.securitytracker.com/id/1034648"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1034650","text":"http://www.securitytracker.com/id/1034650"},{"type":"UNKNOWN","source":"","url":"https://www.verisign.com/en_US/security-services/security-intelligence/vulnerability-reports/articles/index.xhtml?id=1215","text":"https://www.verisign.com/en_US/security-services/security-intelligence/vulnerability-reports/articles/index.xhtml?id=1215"}]	2016-12-07 18:30:00	2016-01-13 05:59:00	2018-05-31 17:00:01.341922	2018-05-31 17:00:01.341922	3.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:H/Au:N/C:C/I:C/A:C)","accessVector":"NETWORK","accessComplexity":"HIGH","authentication":"NONE","confidentialityImpact":"COMPLETE","integrityImpact":"COMPLETE","availabilityImpact":"COMPLETE","baseScore":7.6},"cvssv3":{"version":"3.0","vectorString":"CVSS:3.0/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:H","attackVector":"NETWORK","attackComplexity":"HIGH","privilegesRequired":"NONE","userInteraction":"REQUIRED","scope":"UNCHANGED","confidentialityImpact":"HIGH","integrityImpact":"HIGH","availabilityImpact":"HIGH","baseScore":7.5,"baseSeverity":"HIGH"}}
6	CVE-2015-3982	CVE-2015-3982	The session.flush function in the cached_db backend in Django 1.8.x before 1.8.2 does not properly flush the session, which allows remote attackers to hijack user sessions via an empty string in the session key.\\n<a href="http://cwe.mitre.org/data/definitions/384.html">CWE-384: Session Fixation</a>	5.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/74960","text":"http://www.securityfocus.com/bid/74960"},{"type":"UNKNOWN","source":"","url":"https://www.djangoproject.com/weblog/2015/may/20/security-release/","text":"https://www.djangoproject.com/weblog/2015/may/20/security-release/"}]	2016-12-06 03:01:00	2015-06-02 14:59:00	2018-05-31 17:00:02.632622	2018-05-31 17:00:02.632622	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":5.0},"cvssv3":null}
7	CVE-2015-3983	CVE-2015-3983	The pcs daemon (pcsd) in PCS 0.9.137 and earlier does not include the HTTPOnly flag in a Set-Cookie header, which makes it easier for remote attackers to obtain potentially sensitive information via script access to this cookie.  NOTE: this issue was SPLIT from CVE-2015-1848 per ADT2 due to different vulnerability types.	4.3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159374.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159374.html"},{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159401.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159401.html"},{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159412.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159412.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2015-0980.html","text":"http://rhn.redhat.com/errata/RHSA-2015-0980.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2015-0990.html","text":"http://rhn.redhat.com/errata/RHSA-2015-0990.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/74682","text":"http://www.securityfocus.com/bid/74682"},{"type":"UNKNOWN","source":"","url":"https://bugzilla.redhat.com/attachment.cgi?id=1009855","text":"https://bugzilla.redhat.com/attachment.cgi?id=1009855"}]	2016-12-31 02:59:00	2015-05-14 14:59:00	2018-05-31 17:00:03.967004	2018-05-31 17:00:03.967004	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:M/Au:N/C:P/I:N/A:N)","accessVector":"NETWORK","accessComplexity":"MEDIUM","authentication":"NONE","confidentialityImpact":"PARTIAL","integrityImpact":"NONE","availabilityImpact":"NONE","baseScore":4.3},"cvssv3":null}
8	CVE-2013-0424	CVE-2013-0424	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 through Update 11, 6 through Update 38, 5.0 through Update 38, and 1.4.2_40 and earlier, and OpenJDK 7, allows remote attackers to affect integrity via vectors related to RMI. NOTE: the previous information is from the February 2013 CPU. Oracle has not commented on claims from another vendor that this issue is related to cross-site scripting (XSS) in the sun.rmi.transport.proxy CGIHandler class that does not properly handle error messages in a (1) command or (2) port number.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"	5.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://icedtea.classpath.org/hg/release/icedtea6-1.11/file/icedtea6-1.11.6/NEWS","text":"http://icedtea.classpath.org/hg/release/icedtea6-1.11/file/icedtea6-1.11.6/NEWS"},{"type":"UNKNOWN","source":"","url":"http://icedtea.classpath.org/hg/release/icedtea7-forest-2.3/jdk/rev/6e173569e1e7","text":"http://icedtea.classpath.org/hg/release/icedtea7-forest-2.3/jdk/rev/6e173569e1e7"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00014.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00014.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00001.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00001.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00034.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00034.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136439120408139\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136439120408139\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136570436423916\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136570436423916\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136733161405818\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136733161405818\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0236.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0236.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0237.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0237.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0245.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0245.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0246.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0246.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0247.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0247.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://security.gentoo.org/glsa/glsa-201406-32.xml","text":"http://security.gentoo.org/glsa/glsa-201406-32.xml"},{"type":"UNKNOWN","source":"","url":"http://www.kb.cert.org/vuls/id/858729","text":"http://www.kb.cert.org/vuls/id/858729"},{"type":"UNKNOWN","source":"","url":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:095","text":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:095"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html","text":"http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/57715","text":"http://www.securityfocus.com/bid/57715"},{"type":"UNKNOWN","source":"","url":"http://www.us-cert.gov/cas/techalerts/TA13-032A.html","text":"http://www.us-cert.gov/cas/techalerts/TA13-032A.html"},{"type":"UNKNOWN","source":"","url":"https://bugzilla.redhat.com/show_bug.cgi?id=906813","text":"https://bugzilla.redhat.com/show_bug.cgi?id=906813"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16519","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16519"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19131","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19131"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19423","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19423"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19522","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19522"},{"type":"UNKNOWN","source":"","url":"https://wiki.mageia.org/en/Support/Advisories/MGASA-2013-0056","text":"https://wiki.mageia.org/en/Support/Advisories/MGASA-2013-0056"}]	2017-09-19 01:35:00	2013-02-02 00:55:00	2018-05-31 17:00:06.054365	2018-05-31 17:00:06.054365	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":5.0},"cvssv3":null}
\.


--
-- Name: vulnerability_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vulnerability_versions_id_seq', 8, true);


--
-- Name: bunsen_nvd_versions bunsen_nvd_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bunsen_nvd_versions
    ADD CONSTRAINT bunsen_nvd_versions_pkey PRIMARY KEY (id);


--
-- Name: current_vulnerabilities current_vulnerabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY current_vulnerabilities
    ADD CONSTRAINT current_vulnerabilities_pkey PRIMARY KEY (id);


--
-- Name: dependencies dependencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dependencies
    ADD CONSTRAINT dependencies_pkey PRIMARY KEY (id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: vulnerability_versions vulnerability_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vulnerability_versions
    ADD CONSTRAINT vulnerability_versions_pkey PRIMARY KEY (id);


--
-- Name: dependencies_name_ix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dependencies_name_ix ON dependencies USING btree (name);


--
-- Name: dependencies_name_version_ix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dependencies_name_version_ix ON dependencies USING btree (name, version);


--
-- Name: dependencies_org_name_version_ix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dependencies_org_name_version_ix ON dependencies USING btree (org, name, version);


--
-- Name: dependencies_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dependencies_unique ON dependencies USING btree (org, name, version, up, edition, part, language, target_hw, target_sw, sw_edition, other);


--
-- Name: dependency_sources_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dependency_sources_unique ON dependency_sources USING btree (dependency_id, source_id);


--
-- Name: dependency_vulnerabilities_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dependency_vulnerabilities_unique ON dependency_vulnerabilities USING btree (dependency_id, vulnerability_id);


--
-- Name: index_current_vulnerabilities_on_external_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_current_vulnerabilities_on_external_id ON current_vulnerabilities USING btree (external_id);


--
-- Name: index_current_vulnerabilities_on_vulnerability_version_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_current_vulnerabilities_on_vulnerability_version_id ON current_vulnerabilities USING btree (vulnerability_version_id);


--
-- Name: index_dependencies_on_external_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_dependencies_on_external_id ON dependencies USING btree (external_id);


--
-- Name: index_dependency_sources_on_dependency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dependency_sources_on_dependency_id ON dependency_sources USING btree (dependency_id);


--
-- Name: index_dependency_sources_on_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dependency_sources_on_source_id ON dependency_sources USING btree (source_id);


--
-- Name: index_dependency_vulnerabilities_on_dependency_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dependency_vulnerabilities_on_dependency_id ON dependency_vulnerabilities USING btree (dependency_id);


--
-- Name: index_dependency_vulnerabilities_on_vulnerability_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dependency_vulnerabilities_on_vulnerability_id ON dependency_vulnerabilities USING btree (vulnerability_id);


--
-- Name: index_sources_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_sources_on_name ON sources USING btree (name);


--
-- Name: index_vulnerability_sources_on_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_vulnerability_sources_on_source_id ON vulnerability_sources USING btree (source_id);


--
-- Name: index_vulnerability_sources_on_vulnerability_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_vulnerability_sources_on_vulnerability_id ON vulnerability_sources USING btree (vulnerability_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: vulnerability_sources_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vulnerability_sources_unique ON vulnerability_sources USING btree (vulnerability_id, source_id);


--
-- Name: vulnerability_versions_external_id_ix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX vulnerability_versions_external_id_ix ON vulnerability_versions USING btree (external_id);


--
-- Name: vulnerability_versions_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vulnerability_versions_unique ON vulnerability_versions USING btree (external_id, modified_at);


--
-- Name: vulnerability_versions update_cv_table; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_cv_table AFTER INSERT OR UPDATE ON vulnerability_versions FOR EACH ROW EXECUTE PROCEDURE update_cv_pointers();


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;



--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect waldorf

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rule_evaluations; Type: TABLE; Schema: public; Owner: postgres
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

--
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
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
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE rules OWNER TO postgres;

--
-- Name: rulesets; Type: TABLE; Schema: public; Owner: postgres
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

--
-- Name: rulesets_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rulesets_rules (
    ruleset_id uuid,
    rule_id uuid,
    threshold json
);


ALTER TABLE rulesets_rules OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Data for Name: rule_evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--
--

-- 4428a359-5f6f-445c-8f10-2ea5de800448	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071

COPY rule_evaluations (project_id, team_id, analysis_id, rule_evaluation_summary, rule_eval_created_at, created_at, updated_at) FROM stdin;
8ca10aea-7449-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	b182a814-c4c2-4c07-8c06-ec81104cdc95	{"ruleset_name":"test-ruleset","summary":"fail","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 1 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":1,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"high","type":"Not Evaluated","passed":false},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":85}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Code Coverage \\u003e 80%","description":"The analyzed project must have greater than 80% code coverage.","type":"external_coverage"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
8ca10aea-7449-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	4428a359-5f6f-445c-8f10-2ea5de800448	{"ruleset_name":"test-ruleset","summary":"fail","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 1 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":1,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"high","type":"Not Evaluated","passed":false},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":74.99999999999}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"high","name":"Code Coverage \\u003e 80%","description":"The analyzed project must have greater than 80% code coverage.","type":"external_coverage"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
8ca10aea-7449-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	00788850-9b58-4280-97f9-fd34281e022e	{"ruleset_name":"test-ruleset","summary":"fail","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 0 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":0,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"low","type":"Not Evaluated","passed":false},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":75.0}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"high","name":"Code Coverage \\u003e 80%","description":"The analyzed project must have greater than 80% code coverage.","type":"external_coverage"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
8ca10aea-7448-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	7074b7f2-8f3c-4494-9e1a-af858e536c57	{"ruleset_name":"test-ruleset","summary":"fail","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 5 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":5,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"high","type":"virus","passed":false},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":65}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"Code Coverage \\u003e 50%","description":"The analyzed project must have greater than 50% code coverage.","type":"Not Evaluated"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
8ca10aea-7451-4fba-920e-e0abab735071	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	d9401f7a-703b-4179-abb6-a8ca674e0938	{"ruleset_name":"test-ruleset","summary":"pass","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 0 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":0,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"high","type":"virus","passed":true},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":69.8}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Code Coverage \\u003e 50%","description":"The analyzed project must have greater than 50% code coverage.","type":"external_coverage"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
81838d7e-3ecb-4989-ad9c-ca156a538391	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	c32671c4-d76f-47a6-8902-ce6d81728b58	{"ruleset_name":"test-ruleset","summary":"fail","ruleresults":[{"id":"a36484f2-e99a-e5b5-ab30-1f253260c07e","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"ef93c652-5182-4f16-a247-d6cd323d5f4a","summary":"Finished clamav scan for ion-channel-eicar, found 1 infected files.","results":{"type":"virus","data":{"known_viruses":6658667,"engine_version":"0.100.1","scanned_directories":22,"scanned_files":36,"infected_files":1,"data_scanned":"0.38 MB","data_read":"0.25 MB (ratio 1.56:1)","time":"28.884 sec (0 m 28 s)","file_notes":{"empty_file":null},"clam_av_details":{"clamav_version":"","clamav_db_version":""}}},"created_at":"2018-10-01T19:04:48.628779Z","updated_at":"2018-10-01T19:04:48.628779Z","duration":28966.841170000407,"name":"Has no viruses","description":"The project must not have any viruses found in the analysis.","risk":"high","type":"virus","passed":false},{"id":"7a03c4b7-b4c0-41fd-bf64-005ce821ff0c","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"dependency":{"dependencies":[{"latest_version":"2.0","name":"javacsv","org":"net.sourceforge.javacsv","package":"jar","scope":"compile","type":"maven","version":"2.0"},{"latest_version":"4.12-beta-2","name":"junit","org":"junit","package":"jar","scope":"test","type":"maven","version":"4.11"},{"latest_version":"1.3","name":"hamcrest-core","org":"org.hamcrest","package":"jar","scope":"test","type":"maven","version":"1.3"},{"latest_version":"4.5.2","name":"httpclient","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.4"},{"latest_version":"4.4.5","name":"httpcore","org":"org.apache.httpcomponents","package":"jar","scope":"compile","type":"maven","version":"4.3.2"},{"latest_version":"1.2","name":"commons-logging","org":"commons-logging","package":"jar","scope":"compile","type":"maven","version":"1.1.3"},{"latest_version":"1.3","name":"commons-codec","org":"commons-codec","package":"jar","scope":"compile","type":"maven","version":"1.6"}],"meta":{"first_degree_count":3,"no_version_count":0,"total_unique_count":7,"update_available_count":0}}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Dependencies Version Exist","description":"Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.","type":"dependencies_version_exist"},{"id":"234435b9-7b85-4ec4-99e3-12674dd300f5","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"vulnerabilities":{"meta":{"vulnerability_count":1},"vulnerabilities":[{"name":"httpclient","org":"org.apache.httpcomponents","version":"4.3.4","vulnerabilities":[{"access_complexity":"MEDIUM","access_vector":"NETWORK","assessment_check":{},"availability_impact":"NONE","confidentiality_impact":"PARTIAL","created_at":"2016-09-06T19:23:21.146Z","cve_name":"CVE-2014-3577","date_generated":"2014-08-21T11:53:06.033-04:00","date_published":"2014-08-21T10:55:05.100-04:00","id":1234,"integrity_impact":"PARTIAL","last_modified":"2015-10-28T21:59:07.987-04:00","score":"8.5","score_version":"3.0","references":[{"text":"https://access.redhat.com/solutions/1165533","type":"UNKNOWN","source":"CONFIRM","url":"https://access.redhat.com"},{"text":"USN-2769-1","type":"UNKNOWN","source":"UBUNTU","url":"https://access.redhat.com"},{"text":"20140818 CVE-2014-3577: Apache HttpComponents client: Hostname verification susceptible to MITM attack","type":"UNKNOWN","source":"FULLDISC","url":"https://access.redhat.com"},{"text":"RHSA-2015:1177","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:1176","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0851","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0850","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0765","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0720","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0675","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0158","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2015:0125","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1892","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1891","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1836","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1835","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1834","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1833","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1166","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"RHSA-2014:1146","type":"UNKNOWN","source":"REDHAT","url":"https://access.redhat.com"},{"text":"http://packetstormsecurity.com/files/127913/Apache-HttpComponents-Man-In-The-Middle.html","type":"UNKNOWN","source":"MISC","url":"https://access.redhat.com"}],"scanner":{},"summary":"orgapachehttpconnsslAbstractVerifier in Apache HttpComponents HttpClient before 435 and HttpAsyncClient before 402 does not properly verify that the server hostname matches a domain name in the subjects Common Name CN or subjectAltName field of the X509 certificate, which allows man-in-the-middle attackers to spoof SSL servers via a CN= string in a field in the distinguished name DN of a certificate, as demonstrated by the foo,CN=wwwapacheorg string in the O field","updated_at":"2016-09-06T19:23:21.146Z","vulnerability_authentication":"NONE","vulnerability_score":"5.8","vulnerability_source":"http://nvd.nist.gov"}]}]}},"updated_at":null,"created_at":null,"duration":6000,"passed":false,"risk":"low","name":"High And Up Vulnerabilities \\u003c 1","description":"No more than 1 High And Up scored vulnerability to be present in an analyzed project.","type":"Not Evaluated"},{"id":"4e985dad-5096-45c3-a918-3643e4cc2f0a","team_id":"bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c","project_id":"8ca10aea-7451-4fba-920e-e0abab735071","analysis_id":"d9401f7a-703b-4179-abb6-a8ca674e0938","summary":null,"results":{"coverage":{"value":69.8}},"updated_at":null,"created_at":null,"duration":6000,"passed":true,"risk":"low","name":"Code Coverage \\u003e 50%","description":"The analyzed project must have greater than 50% code coverage.","type":"external_coverage"}]}	2018-05-31T16:59:34+00:00	2018-05-31 16:59:34.35596	2018-05-31 16:59:34.35596
\.


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rules (id, scan_type, name, description, category, policy_url, remediation_url, created_at, updated_at) FROM stdin;
81959ec3-2b6d-4bd4-b94b-6ce2533524bb	external_vulnerability	No High and Up external vulnerabilities	No High and Up scored external vulnerability to be present in an analyzed project.	Vulnerabilities	url	url	2018-05-31 16:59:25.89316	2018-05-31 16:59:25.89316
a053a87e-2e69-4f32-8d6f-fe61bd686821	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 0%	Compares code coverage against the prior analysis, and checks for any drop in code coverage.	external_coverage	url	url	2018-05-31 16:59:25.900435	2018-05-31 16:59:25.900435
ae0c3362-620d-488b-baad-6d1c63ea8ce7	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 1%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 1%.	external_coverage	url	url	2018-05-31 16:59:25.903807	2018-05-31 16:59:25.903807
60c64600-b826-4691-9b21-e3b6f918d0a9	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 2%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 2%.	external_coverage	url	url	2018-05-31 16:59:25.906739	2018-05-31 16:59:25.906739
d42d82c7-ac71-4d65-a4bc-27df95e45933	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 3%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 3%.	external_coverage	url	url	2018-05-31 16:59:25.909887	2018-05-31 16:59:25.909887
f9b58a44-b614-4b92-adc7-11105371cdc4	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 4%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 4%.	external_coverage	url	url	2018-05-31 16:59:25.912373	2018-05-31 16:59:25.912373
774e040a-818f-4a02-81ad-4cab376f1c4b	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 5%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 5%.	external_coverage	url	url	2018-05-31 16:59:25.914869	2018-05-31 16:59:25.914869
c14ceff3-96f9-47a4-a933-1895e435bbd4	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 6%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 6%.	external_coverage	url	url	2018-05-31 16:59:25.921257	2018-05-31 16:59:25.921257
3dc3084d-dba5-4f1d-9913-eea16e5b35c2	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 7%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 7%.	external_coverage	url	url	2018-05-31 16:59:25.925446	2018-05-31 16:59:25.925446
09e28982-e3bd-4380-8712-a526cb024130	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 8%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 8%.	external_coverage	url	url	2018-05-31 16:59:25.931303	2018-05-31 16:59:25.931303
d6d5233d-1c0e-43f6-b2a3-57ed12efa5e6	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 9%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 9%.	external_coverage	url	url	2018-05-31 16:59:25.936561	2018-05-31 16:59:25.936561
844876ff-6c10-4aa8-943d-ca03c0a69d18	compare_previous_code_coverage	Code Coverage Will Not Drop By More Than 10%	Compares code coverage against the prior analysis, and checks for a drop in code coverage greater than 10%.	external_coverage	url	url	2018-05-31 16:59:25.940134	2018-05-31 16:59:25.940134
276bbec3-cc77-44b9-a46d-c7760947ec9d	dependencies_version_exist	Dependencies Version Exist	Checks to ensure all dependencies have an explicit version defined instead of allowing latest to always be used.	Dependencies	url	url	2018-05-31 16:59:25.946523	2018-05-31 16:59:25.946523
00be1862-959c-45d8-8fb5-2b748fe854d6	vulnerabilities	High And Up Vulnerabilities < 1	No more than 1 High And Up scored vulnerability to be present in an analyzed project.	Vulnerabilities	url	url	2018-05-31 16:59:25.949946	2018-05-31 16:59:25.949946
0f170f1c-8934-4211-b0fe-0e52099f81cb	vulnerabilities	High And Up Vulnerabilities < 2	No more than 2 High And Up scored vulnerabilities to be present in an analyzed project.	Vulnerabilities	url	url	2018-05-31 16:59:25.957111	2018-05-31 16:59:25.957111
b4fa3ece-5998-4004-baf0-14e3114aa236	vulnerabilities	High And Up Vulnerabilities < 3	No more than 3 High And Up scored vulnerabilities to be present in an analyzed project.	Vulnerabilities	url	url	2018-05-31 16:59:25.964592	2018-05-31 16:59:25.964592
0239f0f8-c522-3fc4-7f32-ebdf6636f4f0	external_coverage	Code Coverage > 50%	The analyzed project must have greater than 50% code coverage.	Code Coverage	url	url	2018-05-31 16:59:25.971888	2018-05-31 16:59:25.971888
15ce3fee-5d9d-2c15-06c4-f167df2168d6	external_coverage	Code Coverage > 60%	The analyzed project must have greater than 60% code coverage.	Code Coverage	url	url	2018-05-31 16:59:25.976692	2018-05-31 16:59:25.976692
d928de6b-9aa0-2b98-4663-17c23d68efc3	external_coverage	Code Coverage > 70%	The analyzed project must have greater than 70% code coverage.	Code Coverage	url	url	2018-05-31 16:59:25.984194	2018-05-31 16:59:25.984194
786adcff-70d7-3f4e-cee2-385068ae0ed1	external_coverage	Code Coverage > 80%	The analyzed project must have greater than 80% code coverage.	Code Coverage	url	url	2018-05-31 16:59:25.98836	2018-05-31 16:59:25.98836
865b64e5-d9d9-36ce-d715-82e88146dd11	external_coverage	Code Coverage > 90%	The analyzed project must have greater than 90% code coverage.	Code Coverage	url	url	2018-05-31 16:59:25.991875	2018-05-31 16:59:25.991875
c30b9179-56c3-040d-aa2c-571ef31dbe3a	about_yml	Has a valid .about.yml file	The project source is required to include a valid .about.yml file.	About Dot Yaml	url	url	2018-05-31 16:59:26.000465	2018-05-31 16:59:26.000465
1c373d1f-abe8-432f-ae46-002fe2b218ca	license	Has a valid license file	The project source is required to include a valid license file.	License	url	url	2018-05-31 16:59:26.004267	2018-05-31 16:59:26.004267
f746023f-16cc-46db-9422-1e4e3364ab97	virus	Has no viruses	The project must not have any viruses found in the analysis.	Virus	url	url	2018-05-31 16:59:26.010324	2018-05-31 16:59:26.010324
\.


--
-- Data for Name: rulesets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rulesets (id, team_id, name, description, rule_ids, created_at, updated_at) FROM stdin;
85d05a6b-bc96-430e-8e81-ba87cab84230	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	test-ruleset	test ruleset description	\N	2018-05-31 16:59:32.81324	2018-05-31 16:59:32.81324
4ad3633c-0ada-4489-8a67-41086e460fcf	bdfda532-4450-4b64-8150-338d72fb4f41	team 2 ruleset	a ruleset just for team 2	\N	2018-06-28 19:42:18.44032	2018-06-28 19:42:18.44032
42135c81-4603-4109-ad3e-911cc7831b55	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	a new ruleset	a new ruleset, that starts with the letter A	\N	2018-10-29 23:44:47.314523	2018-10-29 23:44:47.314523
\.


--
-- Data for Name: rulesets_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rulesets_rules (ruleset_id, rule_id, threshold) FROM stdin;
85d05a6b-bc96-430e-8e81-ba87cab84230	276bbec3-cc77-44b9-a46d-c7760947ec9d	\N
85d05a6b-bc96-430e-8e81-ba87cab84230	00be1862-959c-45d8-8fb5-2b748fe854d6	\N
85d05a6b-bc96-430e-8e81-ba87cab84230	0239f0f8-c522-3fc4-7f32-ebdf6636f4f0	\N
85d05a6b-bc96-430e-8e81-ba87cab84230	786adcff-70d7-3f4e-cee2-385068ae0ed1	\N
003c6378-c8ef-4a74-9bc1-334e95d24d2b	0239f0f8-c522-3fc4-7f32-ebdf6636f4f0	\N
42135c81-4603-4109-ad3e-911cc7831b55	c30b9179-56c3-040d-aa2c-571ef31dbe3a	\N
42135c81-4603-4109-ad3e-911cc7831b55	1c373d1f-abe8-432f-ae46-002fe2b218ca	\N
42135c81-4603-4109-ad3e-911cc7831b55	f746023f-16cc-46db-9422-1e4e3364ab97	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
0
1
2
3
4
\.


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: rulesets rulesets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rulesets
    ADD CONSTRAINT rulesets_pkey PRIMARY KEY (id);


--
-- Name: index_rule_evaluations_on_analysis_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rule_evaluations_on_analysis_id ON rule_evaluations USING btree (analysis_id);


--
-- Name: index_rules_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rules_on_id ON rules USING btree (id);


--
-- Name: index_rulesets_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rulesets_on_id ON rulesets USING btree (id);


--
-- Name: index_rulesets_on_id_and_team_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rulesets_on_id_and_team_id ON rulesets USING btree (id, team_id);


--
-- Name: index_rulesets_rules_on_ruleset_id_and_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_rulesets_rules_on_ruleset_id_and_rule_id ON rulesets_rules USING btree (ruleset_id, rule_id);


--
-- Name: trifecta_of_doom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX trifecta_of_doom ON rule_evaluations USING btree (team_id, project_id, analysis_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);



--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

\connect kermit;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: analysis_statuses; Type: TABLE; Schema: public; Owner: postgres
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
    branch character varying DEFAULT 'master'::character varying NOT NULL
);


ALTER TABLE analysis_statuses OWNER TO postgres;

--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: postgres
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

--
-- Name: scan_statuses; Type: TABLE; Schema: public; Owner: postgres
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


--
-- Name: works; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE works (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    read boolean,
    filename text,
    project text,
    status text,
    checksum character varying,
    results json,
    message text,
    work json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE works OWNER TO postgres;

--
-- Data for Name: analysis_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY analysis_statuses (id, team_id, project_id, build_number, status, message, created_at, updated_at, branch) FROM stdin;
\.


--
-- Data for Name: deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY deliveries (id, analysis_id, team_id, project_id, destination, status, created_at, updated_at, filename, label, hazh, message) FROM stdin;
\.


--
-- Data for Name: scan_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scan_statuses (id, analysis_status_id, team_id, project_id, name, read, status, message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY works (id, read, filename, project, status, checksum, results, message, work, created_at, updated_at) FROM stdin;
\.

--
-- Name: analysis_statuses analysis_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY analysis_statuses
    ADD CONSTRAINT analysis_statuses_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: scan_statuses scan_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY scan_statuses
    ADD CONSTRAINT scan_statuses_pkey PRIMARY KEY (id);


--
-- Name: works works_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--



SELECT NULL AS "Finished seeding...";



--
-- Data for Name: analysis_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY analysis_statuses (id, team_id, project_id, build_number, status, message, created_at, updated_at, branch) FROM stdin;
56b409f4-ee60-4ee6-bfa5-c57465467cf5	2D227027-F865-45A3-9DDD-8B9567AAB797	db844096-4aa2-4a08-9a26-728b8684c740	44	accepted	Request for analysis blah.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
c32671c4-d76f-47a6-8902-ce6d81728b58	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	81838d7e-3ecb-4989-ad9c-ca156a538391	10	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
d9401f7a-703b-4179-abb6-a8ca674e0938	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7451-4fba-920e-e0abab735071	10	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
00788850-9b58-4280-97f9-fd34281e022e	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	11	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
4428a359-5f6f-445c-8f10-2ea5de800448	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	12	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
b182a814-c4c2-4c07-8c06-ec81104cdc95	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7449-4fba-920e-e0abab735071	12	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
7074b7f2-8f3c-4494-9e1a-af858e536c57	bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c	8ca10aea-7448-4fba-920e-e0abab735071	12	finished	Your analysis is finished.	2018-06-29 22:27:59.166975	2018-06-29 22:27:59.166975	master
\.



--
-- Data for Name: scan_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY scan_statuses (id, analysis_status_id, team_id, project_id, name, read, status, message, created_at, updated_at) FROM stdin;
\.



--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY works (id, read, filename, project, status, checksum, results, message, work, created_at, updated_at) FROM stdin;
feb0d519-cbb0-4703-a8ce-c7d16e5ba897	t	\N	\N	accepted	\N	\N	foo	\N	2018-06-29 22:28:14.742927	2018-06-29 22:28:14.747332
\.

SELECT NULL AS "Finished seeding... again";
