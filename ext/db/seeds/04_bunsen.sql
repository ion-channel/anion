CREATE DATABASE bunsen WITH TEMPLATE = template0 OWNER = postgres;

\connect bunsen

SET default_transaction_read_only = off;
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;
COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';
SET search_path = public, pg_catalog;

--
-- Functions
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


--
-- bunsen_nvd_versions
--

CREATE TABLE bunsen_nvd_versions (
    id integer NOT NULL,
    version_type character varying,
    version character varying,
    applied timestamp without time zone
);

ALTER TABLE bunsen_nvd_versions OWNER TO postgres;
ALTER TABLE ONLY bunsen_nvd_versions ADD CONSTRAINT bunsen_nvd_versions_pkey PRIMARY KEY (id);


--
-- bunsen_nvd_versions_id_seq
--

CREATE SEQUENCE bunsen_nvd_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE bunsen_nvd_versions_id_seq OWNER TO postgres;
ALTER SEQUENCE bunsen_nvd_versions_id_seq OWNED BY bunsen_nvd_versions.id;
ALTER TABLE ONLY bunsen_nvd_versions ALTER COLUMN id SET DEFAULT nextval('bunsen_nvd_versions_id_seq'::regclass);


--
-- current_vulnerabilities
--

CREATE TABLE current_vulnerabilities (
    id integer NOT NULL,
    external_id character varying NOT NULL,
    vulnerability_version_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);

ALTER TABLE current_vulnerabilities OWNER TO postgres;
ALTER TABLE ONLY current_vulnerabilities ADD CONSTRAINT current_vulnerabilities_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_current_vulnerabilities_on_external_id ON current_vulnerabilities USING btree (external_id);
CREATE UNIQUE INDEX index_current_vulnerabilities_on_vulnerability_version_id ON current_vulnerabilities USING btree (vulnerability_version_id);


--
-- current_vulnerabilities_id_seq
--

CREATE SEQUENCE current_vulnerabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE current_vulnerabilities_id_seq OWNER TO postgres;
ALTER SEQUENCE current_vulnerabilities_id_seq OWNED BY current_vulnerabilities.id;
ALTER TABLE ONLY current_vulnerabilities ALTER COLUMN id SET DEFAULT nextval('current_vulnerabilities_id_seq'::regclass);


--
-- dependencies
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
ALTER TABLE ONLY dependencies ADD CONSTRAINT dependencies_pkey PRIMARY KEY (id);
CREATE INDEX dependencies_name_ix ON dependencies USING btree (name);
CREATE INDEX dependencies_name_version_ix ON dependencies USING btree (name, version);
CREATE INDEX dependencies_org_name_version_ix ON dependencies USING btree (org, name, version);
CREATE UNIQUE INDEX dependencies_unique ON dependencies USING btree (org, name, version, up, edition, part, language, target_hw, target_sw, sw_edition, other);
CREATE UNIQUE INDEX index_dependencies_on_external_id ON dependencies USING btree (external_id);

--
-- dependencies_id_seq
--

CREATE SEQUENCE dependencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE dependencies_id_seq OWNER TO postgres;
ALTER SEQUENCE dependencies_id_seq OWNED BY dependencies.id;
ALTER TABLE ONLY dependencies ALTER COLUMN id SET DEFAULT nextval('dependencies_id_seq'::regclass);


--
-- dependency_sources
--

CREATE TABLE dependency_sources (
    dependency_id integer,
    source_id integer
);

ALTER TABLE dependency_sources OWNER TO postgres;
CREATE UNIQUE INDEX dependency_sources_unique ON dependency_sources USING btree (dependency_id, source_id);
CREATE INDEX index_dependency_sources_on_dependency_id ON dependency_sources USING btree (dependency_id);
CREATE INDEX index_dependency_sources_on_source_id ON dependency_sources USING btree (source_id);


--
-- dependency_vulnerabilities
--

CREATE TABLE dependency_vulnerabilities (
    dependency_id integer,
    vulnerability_id integer
);

ALTER TABLE dependency_vulnerabilities OWNER TO postgres;
CREATE UNIQUE INDEX dependency_vulnerabilities_unique ON dependency_vulnerabilities USING btree (dependency_id, vulnerability_id);
CREATE INDEX index_dependency_vulnerabilities_on_dependency_id ON dependency_vulnerabilities USING btree (dependency_id);
CREATE INDEX index_dependency_vulnerabilities_on_vulnerability_id ON dependency_vulnerabilities USING btree (vulnerability_id);


--
-- sources
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
ALTER TABLE ONLY sources ADD CONSTRAINT sources_pkey PRIMARY KEY (id);
CREATE UNIQUE INDEX index_sources_on_name ON sources USING btree (name);


--
-- sources_id_seq
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE sources_id_seq OWNER TO postgres;
ALTER SEQUENCE sources_id_seq OWNED BY sources.id;
ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- vulnerability_versions
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
ALTER TABLE ONLY vulnerability_versions ADD CONSTRAINT vulnerability_versions_pkey PRIMARY KEY (id);
CREATE INDEX vulnerability_versions_external_id_ix ON vulnerability_versions USING btree (external_id);
CREATE UNIQUE INDEX vulnerability_versions_unique ON vulnerability_versions USING btree (external_id, modified_at);
CREATE TRIGGER update_cv_table AFTER INSERT OR UPDATE ON vulnerability_versions FOR EACH ROW EXECUTE PROCEDURE update_cv_pointers();


--
-- vulnerabilities
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
-- vulnerability_sources
--

CREATE TABLE vulnerability_sources (
    vulnerability_id integer,
    source_id integer
);

ALTER TABLE vulnerability_sources OWNER TO postgres;
CREATE INDEX index_vulnerability_sources_on_source_id ON vulnerability_sources USING btree (source_id);
CREATE INDEX index_vulnerability_sources_on_vulnerability_id ON vulnerability_sources USING btree (vulnerability_id);
CREATE UNIQUE INDEX vulnerability_sources_unique ON vulnerability_sources USING btree (vulnerability_id, source_id);

--
-- vulnerability_versions_id_seq
--

CREATE SEQUENCE vulnerability_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE vulnerability_versions_id_seq OWNER TO postgres;
ALTER SEQUENCE vulnerability_versions_id_seq OWNED BY vulnerability_versions.id;
ALTER TABLE ONLY vulnerability_versions ALTER COLUMN id SET DEFAULT nextval('vulnerability_versions_id_seq'::regclass);



--
-- Data
--

COPY bunsen_nvd_versions (id, version_type, version, applied) FROM stdin;
\.

SELECT pg_catalog.setval('bunsen_nvd_versions_id_seq', 1, false);

COPY current_vulnerabilities (id, external_id, vulnerability_version_id, created_at, updated_at) FROM stdin;
1	CVE-2014-1457	1	2018-05-31 16:59:55.493153	2018-05-31 16:59:55.493153
2	CVE-2012-1531	2	2018-05-31 16:59:58.355934	2018-05-31 16:59:58.355934
3	CVE-2012-3216	3	2018-05-31 16:59:59.525263	2018-05-31 16:59:59.525263
4	CVE-2016-3458	4	2018-05-31 17:00:00.010962	2018-05-31 17:00:00.010962
5	CVE-2016-0002	5	2018-05-31 17:00:01.340942	2018-05-31 17:00:01.340942
6	CVE-2015-3982	6	2018-05-31 17:00:02.632098	2018-05-31 17:00:02.632098
7	CVE-2015-3983	7	2018-05-31 17:00:03.96677	2018-05-31 17:00:03.96677
8	CVE-2013-0424	8	2018-05-31 17:00:06.041014	2018-05-31 17:00:06.041014
9	CVE-2018-16492	9	2019-02-01 19:37:27.789796	2019-02-08 19:32:17.976394
\.

SELECT pg_catalog.setval('current_vulnerabilities_id_seq', 8, true);


COPY dependencies (id, name, org, version, up, edition, aliases, created_at, updated_at, title, "references", part, language, external_id, cpe23, target_hw, target_sw, sw_edition, other) FROM stdin;
1	django	djangoproject	1.8.0			\N	2018-05-31 17:00:02.621208	2018-05-31 17:00:02.621208	Djangoproject Django 1.8.0	\N	/a		cpe:/a:djangoproject:django:1.8.0	\N	\N	\N	\N	\N
2	django	djangoproject	1.8.1			\N	2018-05-31 17:00:02.627068	2018-05-31 17:00:02.627068	Djangoproject Django 1.8.1	\N	/a		cpe:/a:djangoproject:django:1.8.1	\N	\N	\N	\N	\N
3	extend	extend_project	1.1.0			\N	2019-07-20 19:34:46.442984	2019-09-25 20:50:14.779896	Extend_project Extend 1.1.0	[]	/a		cpe:/a:extend_project:extend:1.1.0	\N	\N	\N	\N	\N
4	extend	extend_project	1.1.1			\N	2019-07-20 19:34:46.454487	2019-09-25 20:50:14.785103	Extend_project Extend 1.1.1	[]	/a		cpe:/a:extend_project:extend:1.1.1	\N	\N	\N	\N	\N
5	extend	extend_project	1.1.3			\N	2019-07-20 19:34:46.46659	2019-09-25 20:50:14.793854	Extend_project Extend 1.1.3	[]	/a		cpe:/a:extend_project:extend:1.1.3	\N	\N	\N	\N	\N
6	extend	extend_project	1.2.1			\N	2019-07-20 19:34:46.489499	2019-09-25 20:50:14.805029	Extend_project Extend 1.2.1	[]	/a		cpe:/a:extend_project:extend:1.2.1	\N	\N	\N	\N	\N
7	extend	extend_project	1.3.0			\N	2019-07-20 19:34:46.501581	2019-09-25 20:50:14.81069	Extend_project Extend 1.3.0	[]	/a		cpe:/a:extend_project:extend:1.3.0	\N	\N	\N	\N	\N
8	extend	extend_project	2.0.0			\N	2019-07-20 19:34:46.513325	2019-09-25 20:50:14.816058	Extend_project Extend 2.0.0	[]	/a		cpe:/a:extend_project:extend:2.0.0	\N	\N	\N	\N	\N
9	extend	extend_project	2.0.1			\N	2019-07-20 19:34:46.524561	2019-09-25 20:50:14.821191	Extend_project Extend 2.0.1	[]	/a		cpe:/a:extend_project:extend:2.0.1	\N	\N	\N	\N	\N
10	extend	extend_project	3.0.0			\N	2019-07-20 19:34:46.535786	2019-09-25 20:50:14.826515	Extend_project Extend 3.0.0	[]	/a		cpe:/a:extend_project:extend:3.0.0	\N	\N	\N	\N	\N
11	extend	extend_project	3.0.1			\N	2019-07-20 19:34:46.562329	2019-09-25 20:50:14.831975	Extend_project Extend 3.0.1	[]	/a		cpe:/a:extend_project:extend:3.0.1	\N	\N	\N	\N	\N
12	extend	justmoon	3.0.1			\N	2019-09-19 18:37:38.756819	2019-09-25 20:50:14.696146	Justmoon Extend 3.0.1	[]	/a		cpe:/a:justmoon:extend:3.0.1	\N	\N	\N	\N	\N
13	extend	justmoon	3.0.0			\N	2019-09-19 18:37:38.766326	2019-09-25 20:50:14.708685	Justmoon Extend 3.0.0	[]	/a		cpe:/a:justmoon:extend:3.0.0	\N	\N	\N	\N	\N
14	extend	justmoon	2.0.1			\N	2019-09-19 18:37:38.773867	2019-09-25 20:50:14.714919	Justmoon Extend 2.0.1	[]	/a		cpe:/a:justmoon:extend:2.0.1	\N	\N	\N	\N	\N
15	extend	justmoon	2.0.0			\N	2019-09-19 18:37:38.781468	2019-09-25 20:50:14.721145	Justmoon Extend 2.0.0	[]	/a		cpe:/a:justmoon:extend:2.0.0	\N	\N	\N	\N	\N
16	extend	justmoon	1.3.0			\N	2019-09-19 18:37:38.78895	2019-09-25 20:50:14.727202	Justmoon Extend 1.3.0	[]	/a		cpe:/a:justmoon:extend:1.3.0	\N	\N	\N	\N	\N
17	extend	justmoon	1.2.1			\N	2019-09-19 18:37:38.796491	2019-09-25 20:50:14.736265	Justmoon Extend 1.2.1	[]	/a		cpe:/a:justmoon:extend:1.2.1	\N	\N	\N	\N	\N
18	extend	justmoon	1.2.0			\N	2019-09-19 18:37:38.804239	2019-09-25 20:50:14.742655	Justmoon Extend 1.2.0	[]	/a		cpe:/a:justmoon:extend:1.2.0	\N	\N	\N	\N	\N
19	extend	justmoon	1.1.3			\N	2019-09-19 18:37:38.81162	2019-09-25 20:50:14.748595	Justmoon Extend 1.1.3	[]	/a		cpe:/a:justmoon:extend:1.1.3	\N	\N	\N	\N	\N
20	extend	justmoon	1.1.1			\N	2019-09-19 18:37:38.819073	2019-09-25 20:50:14.754847	Justmoon Extend 1.1.1	[]	/a		cpe:/a:justmoon:extend:1.1.1	\N	\N	\N	\N	\N
21	extend	justmoon	1.1.0			\N	2019-09-19 18:37:38.826708	2019-09-25 20:50:14.760961	Justmoon Extend 1.1.0	[]	/a		cpe:/a:justmoon:extend:1.1.0	\N	\N	\N	\N	\N
22	extend	justmoon	1.0.0			\N	2019-09-19 18:37:38.834429	2019-09-25 20:50:14.767287	Justmoon Extend 1.0.0	[]	/a		cpe:/a:justmoon:extend:1.0.0	\N	\N	\N	\N	\N
23	extend	extend_project	1.0.0			\N	2019-07-20 19:34:46.424711	2019-09-25 20:50:14.772796	Extend_project Extend 1.0.0	[]	/a		cpe:/a:extend_project:extend:1.0.0	\N	\N	\N	\N	\N
24	extend	extend_project	1.2.0			\N	2019-07-20 19:34:46.477934	2019-09-25 20:50:14.799113	Extend_project Extend 1.2.0	[]	/a		cpe:/a:extend_project:extend:1.2.0	\N	\N	\N	\N	\N
\.

SELECT pg_catalog.setval('dependencies_id_seq', 24, true);

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
\.

COPY dependency_vulnerabilities (dependency_id, vulnerability_id) FROM stdin;
3	9
4	9
5	9
6	9
7	9
8	9
9	9
10	9
11	9
12	9
14	9
15	9
16	9
17	9
18	9
19	9
20	9
21	9
22	9
23	9
24	9
\.

COPY sources (id, name, description, created_at, updated_at, attribution, license, copyright_url) FROM stdin;
2	RHSA	Red Hat Security Advisories	2018-05-31 16:59:24.600942	2018-05-31 16:59:24.600942	\N	\N	\N
1	NVD	National Vulnerability Database	2018-05-31 16:59:24.033703	2018-05-31 16:59:43.024587	Copyright © 1999–2017, The MITRE Corporation. CVE and the CVE logo are registered trademarks and CVE-Compatible is a trademark of The MITRE Corporation.	Submissions: For all materials you submit to the Common Vulnerabilities and Exposures (CVE®), you hereby grant to The MITRE Corporation (MITRE) and all CVE Numbering Authorities (CNAs) a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute such materials and derivative works. Unless required by applicable law or agreed to in writing, you provide such materials on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE.\n\nCVE Usage: MITRE hereby grants you a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute Common Vulnerabilities and Exposures (CVE®). Any copy you make for such purposes is authorized provided that you reproduce MITRE's copyright designation and this license in any such copy.\n	http://cve.mitre.org/about/termsofuse.html
\.

SELECT pg_catalog.setval('sources_id_seq', 1, true);

COPY vulnerability_sources (vulnerability_id, source_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
\.

COPY vulnerability_versions (id, external_id, title, summary, score, vector, access_complexity, vulnerability_authentication, confidentiality_impact, integrity_impact, availability_impact, vulnerability_source, assessment_check, scanner, recommendation, "references", modified_at, published_at, created_at, updated_at, score_version, score_system, score_details) FROM stdin;
1	CVE-2014-1457	CVE-2014-1457	Open Web Analytics (OWA) before 1.5.6 improperly generates random nonce values, which makes it easier for remote attackers to bypass a CSRF protection mechanism by leveraging knowledge of an OWA user name.	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://www.openwebanalytics.com/?p=384","text":"http://www.openwebanalytics.com/?p=384"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/65573","text":"http://www.securityfocus.com/bid/65573"},{"type":"UNKNOWN","source":"","url":"https://exchange.xforce.ibmcloud.com/vulnerabilities/91125","text":"https://exchange.xforce.ibmcloud.com/vulnerabilities/91125"},{"type":"UNKNOWN","source":"","url":"https://www.secureworks.com/research/swrx-2014-006","text":"https://www.secureworks.com/research/swrx-2014-006"}]	2018-03-20 21:29:00	2018-03-20 21:29:00	2018-05-31 16:59:55.494096	2018-05-31 16:59:55.494096	2.0		{"cvssv2":null,"cvssv3":null}
2	CVE-2012-1531	CVE-2012-1531	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."	10.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1391.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1391.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1392.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1392.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1465.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1465.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1466.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1466.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1467.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1467.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51141","text":"http://secunia.com/advisories/51141"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51313","text":"http://secunia.com/advisories/51313"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51315","text":"http://secunia.com/advisories/51315"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51326","text":"http://secunia.com/advisories/51326"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51327","text":"http://secunia.com/advisories/51327"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51328","text":"http://secunia.com/advisories/51328"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51390","text":"http://secunia.com/advisories/51390"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51393","text":"http://secunia.com/advisories/51393"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51438","text":"http://secunia.com/advisories/51438"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21625794","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21625794"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786"},{"type":"UNKNOWN","source":"","url":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html","text":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html"},{"type":"UNKNOWN","source":"","url":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:150","text":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:150"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html","text":"http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html","text":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/56033","text":"http://www.securityfocus.com/bid/56033"},{"type":"UNKNOWN","source":"","url":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf","text":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16546","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16546"}]	2017-11-30 02:29:00	2012-10-16 21:55:00	2018-05-31 16:59:58.372243	2018-05-31 16:59:58.372243	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:C/I:C/A:C)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"COMPLETE","integrityImpact":"COMPLETE","availabilityImpact":"COMPLETE","baseScore":10.0},"cvssv3":null}
3	CVE-2012-3216	CVE-2012-3216	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier allows remote attackers to affect confidentiality via unknown vectors related to Libraries.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"	2.6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00016.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00023.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-10/msg00023.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00010.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00011.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00011.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html","text":"http://lists.opensuse.org/opensuse-security-announce/2012-11/msg00022.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135542848327757\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=135758563611658\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1385.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1385.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1386.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1386.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1391.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1391.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1392.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1392.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1465.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1465.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1466.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1466.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2012-1467.html","text":"http://rhn.redhat.com/errata/RHSA-2012-1467.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51028","text":"http://secunia.com/advisories/51028"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51029","text":"http://secunia.com/advisories/51029"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51141","text":"http://secunia.com/advisories/51141"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51166","text":"http://secunia.com/advisories/51166"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51313","text":"http://secunia.com/advisories/51313"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51315","text":"http://secunia.com/advisories/51315"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51326","text":"http://secunia.com/advisories/51326"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51327","text":"http://secunia.com/advisories/51327"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51328","text":"http://secunia.com/advisories/51328"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51390","text":"http://secunia.com/advisories/51390"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51393","text":"http://secunia.com/advisories/51393"},{"type":"UNKNOWN","source":"","url":"http://secunia.com/advisories/51438","text":"http://secunia.com/advisories/51438"},{"type":"UNKNOWN","source":"","url":"http://security.gentoo.org/glsa/glsa-201406-32.xml","text":"http://security.gentoo.org/glsa/glsa-201406-32.xml"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21616490"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21620037"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21621154"},{"type":"UNKNOWN","source":"","url":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786","text":"http://www-01.ibm.com/support/docview.wss?uid=swg21631786"},{"type":"UNKNOWN","source":"","url":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html","text":"http://www.hitachi.co.jp/Prod/comp/soft1/global/security/info/vuls/HS12-023/index.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html","text":"http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/56075","text":"http://www.securityfocus.com/bid/56075"},{"type":"UNKNOWN","source":"","url":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf","text":"http://www.xerox.com/download/security/security-bulletin/16287-4d6b7b0c81f7b/cert_XRX13-003_v1.0.pdf"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16538","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16538"}]	2017-09-19 01:35:00	2012-10-16 21:55:00	2018-05-31 16:59:59.536665	2018-05-31 16:59:59.536665	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:H/Au:N/C:P/I:N/A:N)","accessVector":"NETWORK","accessComplexity":"HIGH","authentication":"NONE","confidentialityImpact":"PARTIAL","integrityImpact":"NONE","availabilityImpact":"NONE","baseScore":2.6},"cvssv3":null}
4	CVE-2016-3458	CVE-2016-3458	Unspecified vulnerability in Oracle Java SE 6u115, 7u101, and 8u92; and Java SE Embedded 8u91 allows remote attackers to affect integrity via vectors related to CORBA.	4.3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00011.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00011.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00024.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00024.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00032.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00032.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00033.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00033.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00034.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00034.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00035.html","text":"http://lists.opensuse.org/opensuse-security-announce/2016-08/msg00035.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-updates/2016-08/msg00028.html","text":"http://lists.opensuse.org/opensuse-updates/2016-08/msg00028.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2016-1504.html","text":"http://rhn.redhat.com/errata/RHSA-2016-1504.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2016-1776.html","text":"http://rhn.redhat.com/errata/RHSA-2016-1776.html"},{"type":"UNKNOWN","source":"","url":"http://www.debian.org/security/2016/dsa-3641","text":"http://www.debian.org/security/2016/dsa-3641"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html","text":"http://www.oracle.com/technetwork/security-advisory/cpujul2016-2881720.html"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/linuxbulletinjul2016-3090544.html","text":"http://www.oracle.com/technetwork/topics/security/linuxbulletinjul2016-3090544.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/91787","text":"http://www.securityfocus.com/bid/91787"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/91945","text":"http://www.securityfocus.com/bid/91945"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1036365","text":"http://www.securitytracker.com/id/1036365"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3043-1","text":"http://www.ubuntu.com/usn/USN-3043-1"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3062-1","text":"http://www.ubuntu.com/usn/USN-3062-1"},{"type":"UNKNOWN","source":"","url":"http://www.ubuntu.com/usn/USN-3077-1","text":"http://www.ubuntu.com/usn/USN-3077-1"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1458","text":"https://access.redhat.com/errata/RHSA-2016:1458"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1475","text":"https://access.redhat.com/errata/RHSA-2016:1475"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1476","text":"https://access.redhat.com/errata/RHSA-2016:1476"},{"type":"UNKNOWN","source":"","url":"https://access.redhat.com/errata/RHSA-2016:1477","text":"https://access.redhat.com/errata/RHSA-2016:1477"},{"type":"UNKNOWN","source":"","url":"https://security.gentoo.org/glsa/201610-08","text":"https://security.gentoo.org/glsa/201610-08"},{"type":"UNKNOWN","source":"","url":"https://security.gentoo.org/glsa/201701-43","text":"https://security.gentoo.org/glsa/201701-43"},{"type":"UNKNOWN","source":"","url":"https://security.netapp.com/advisory/ntap-20160721-0001/","text":"https://security.netapp.com/advisory/ntap-20160721-0001/"}]	2017-11-10 02:29:00	2016-07-21 10:12:00	2018-05-31 17:00:00.012605	2018-05-31 17:00:00.012605	3.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:M/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"MEDIUM","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":4.3},"cvssv3":{"version":"3.0","vectorString":"CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:L/A:N","attackVector":"NETWORK","attackComplexity":"LOW","privilegesRequired":"NONE","userInteraction":"REQUIRED","scope":"UNCHANGED","confidentialityImpact":"NONE","integrityImpact":"LOW","availabilityImpact":"NONE","baseScore":4.3,"baseSeverity":"MEDIUM"}}
5	CVE-2016-0002	CVE-2016-0002	The Microsoft (1) VBScript 5.7 and 5.8 and (2) JScript 5.7 and 5.8 engines, as used in Internet Explorer 8 through 11 and other products, allow remote attackers to execute arbitrary code via a crafted web site, aka "Scripting Engine Memory Corruption Vulnerability."	7.5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://technet.microsoft.com/security/bulletin/MS16-001","text":"http://technet.microsoft.com/security/bulletin/MS16-001"},{"type":"UNKNOWN","source":"","url":"http://technet.microsoft.com/security/bulletin/MS16-003","text":"http://technet.microsoft.com/security/bulletin/MS16-003"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1034648","text":"http://www.securitytracker.com/id/1034648"},{"type":"UNKNOWN","source":"","url":"http://www.securitytracker.com/id/1034650","text":"http://www.securitytracker.com/id/1034650"},{"type":"UNKNOWN","source":"","url":"https://www.verisign.com/en_US/security-services/security-intelligence/vulnerability-reports/articles/index.xhtml?id=1215","text":"https://www.verisign.com/en_US/security-services/security-intelligence/vulnerability-reports/articles/index.xhtml?id=1215"}]	2016-12-07 18:30:00	2016-01-13 05:59:00	2018-05-31 17:00:01.341922	2018-05-31 17:00:01.341922	3.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:H/Au:N/C:C/I:C/A:C)","accessVector":"NETWORK","accessComplexity":"HIGH","authentication":"NONE","confidentialityImpact":"COMPLETE","integrityImpact":"COMPLETE","availabilityImpact":"COMPLETE","baseScore":7.6},"cvssv3":{"version":"3.0","vectorString":"CVSS:3.0/AV:N/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:H","attackVector":"NETWORK","attackComplexity":"HIGH","privilegesRequired":"NONE","userInteraction":"REQUIRED","scope":"UNCHANGED","confidentialityImpact":"HIGH","integrityImpact":"HIGH","availabilityImpact":"HIGH","baseScore":7.5,"baseSeverity":"HIGH"}}
6	CVE-2015-3982	CVE-2015-3982	The session.flush function in the cached_db backend in Django 1.8.x before 1.8.2 does not properly flush the session, which allows remote attackers to hijack user sessions via an empty string in the session key.\\n<a href="http://cwe.mitre.org/data/definitions/384.html">CWE-384: Session Fixation</a>	5.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/74960","text":"http://www.securityfocus.com/bid/74960"},{"type":"UNKNOWN","source":"","url":"https://www.djangoproject.com/weblog/2015/may/20/security-release/","text":"https://www.djangoproject.com/weblog/2015/may/20/security-release/"}]	2016-12-06 03:01:00	2015-06-02 14:59:00	2018-05-31 17:00:02.632622	2018-05-31 17:00:02.632622	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":5.0},"cvssv3":null}
7	CVE-2015-3983	CVE-2015-3983	The pcs daemon (pcsd) in PCS 0.9.137 and earlier does not include the HTTPOnly flag in a Set-Cookie header, which makes it easier for remote attackers to obtain potentially sensitive information via script access to this cookie.  NOTE: this issue was SPLIT from CVE-2015-1848 per ADT2 due to different vulnerability types.	4.3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159374.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159374.html"},{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159401.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159401.html"},{"type":"UNKNOWN","source":"","url":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159412.html","text":"http://lists.fedoraproject.org/pipermail/package-announce/2015-June/159412.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2015-0980.html","text":"http://rhn.redhat.com/errata/RHSA-2015-0980.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2015-0990.html","text":"http://rhn.redhat.com/errata/RHSA-2015-0990.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/74682","text":"http://www.securityfocus.com/bid/74682"},{"type":"UNKNOWN","source":"","url":"https://bugzilla.redhat.com/attachment.cgi?id=1009855","text":"https://bugzilla.redhat.com/attachment.cgi?id=1009855"}]	2016-12-31 02:59:00	2015-05-14 14:59:00	2018-05-31 17:00:03.967004	2018-05-31 17:00:03.967004	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:M/Au:N/C:P/I:N/A:N)","accessVector":"NETWORK","accessComplexity":"MEDIUM","authentication":"NONE","confidentialityImpact":"PARTIAL","integrityImpact":"NONE","availabilityImpact":"NONE","baseScore":4.3},"cvssv3":null}
8	CVE-2013-0424	CVE-2013-0424	Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 through Update 11, 6 through Update 38, 5.0 through Update 38, and 1.4.2_40 and earlier, and OpenJDK 7, allows remote attackers to affect integrity via vectors related to RMI. NOTE: the previous information is from the February 2013 CPU. Oracle has not commented on claims from another vendor that this issue is related to cross-site scripting (XSS) in the sun.rmi.transport.proxy CGIHandler class that does not properly handle error messages in a (1) command or (2) port number.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"	5.0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"","url":"http://icedtea.classpath.org/hg/release/icedtea6-1.11/file/icedtea6-1.11.6/NEWS","text":"http://icedtea.classpath.org/hg/release/icedtea6-1.11/file/icedtea6-1.11.6/NEWS"},{"type":"UNKNOWN","source":"","url":"http://icedtea.classpath.org/hg/release/icedtea7-forest-2.3/jdk/rev/6e173569e1e7","text":"http://icedtea.classpath.org/hg/release/icedtea7-forest-2.3/jdk/rev/6e173569e1e7"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00014.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-02/msg00014.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00001.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00001.html"},{"type":"UNKNOWN","source":"","url":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00034.html","text":"http://lists.opensuse.org/opensuse-security-announce/2013-03/msg00034.html"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136439120408139\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136439120408139\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136570436423916\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136570436423916\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://marc.info/?l=bugtraq\\u0026m=136733161405818\\u0026w=2","text":"http://marc.info/?l=bugtraq\\u0026m=136733161405818\\u0026w=2"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0236.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0236.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0237.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0237.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0245.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0245.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0246.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0246.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-0247.html","text":"http://rhn.redhat.com/errata/RHSA-2013-0247.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1455.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1455.html"},{"type":"UNKNOWN","source":"","url":"http://rhn.redhat.com/errata/RHSA-2013-1456.html","text":"http://rhn.redhat.com/errata/RHSA-2013-1456.html"},{"type":"UNKNOWN","source":"","url":"http://security.gentoo.org/glsa/glsa-201406-32.xml","text":"http://security.gentoo.org/glsa/glsa-201406-32.xml"},{"type":"UNKNOWN","source":"","url":"http://www.kb.cert.org/vuls/id/858729","text":"http://www.kb.cert.org/vuls/id/858729"},{"type":"UNKNOWN","source":"","url":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:095","text":"http://www.mandriva.com/security/advisories?name=MDVSA-2013:095"},{"type":"UNKNOWN","source":"","url":"http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html","text":"http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html"},{"type":"UNKNOWN","source":"","url":"http://www.securityfocus.com/bid/57715","text":"http://www.securityfocus.com/bid/57715"},{"type":"UNKNOWN","source":"","url":"http://www.us-cert.gov/cas/techalerts/TA13-032A.html","text":"http://www.us-cert.gov/cas/techalerts/TA13-032A.html"},{"type":"UNKNOWN","source":"","url":"https://bugzilla.redhat.com/show_bug.cgi?id=906813","text":"https://bugzilla.redhat.com/show_bug.cgi?id=906813"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16519","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A16519"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19131","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19131"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19423","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19423"},{"type":"UNKNOWN","source":"","url":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19522","text":"https://oval.cisecurity.org/repository/search/definition/oval%3Aorg.mitre.oval%3Adef%3A19522"},{"type":"UNKNOWN","source":"","url":"https://wiki.mageia.org/en/Support/Advisories/MGASA-2013-0056","text":"https://wiki.mageia.org/en/Support/Advisories/MGASA-2013-0056"}]	2017-09-19 01:35:00	2013-02-02 00:55:00	2018-05-31 17:00:06.054365	2018-05-31 17:00:06.054365	2.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"(AV:N/AC:L/Au:N/C:N/I:P/A:N)","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"NONE","integrityImpact":"PARTIAL","availabilityImpact":"NONE","baseScore":5.0},"cvssv3":null}
9	CVE-2018-16492	CVE-2018-16492	A prototype pollution vulnerability was found in module extend <2.0.2, ~<3.0.2 that allows an attacker to inject arbitrary properties onto Object.prototype.	9.8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	[{"type":"UNKNOWN","source":"https://hackerone.com/reports/381185","url":"https://hackerone.com/reports/381185","text":"https://hackerone.com/reports/381185"}]	2019-02-08 17:01:00	2019-02-01 18:29:00	2019-02-08 19:32:18.076417	2019-02-08 19:32:18.076417	3.0	CVSS	{"cvssv2":{"version":"2.0","vectorString":"AV:N/AC:L/Au:N/C:P/I:P/A:P","accessVector":"NETWORK","accessComplexity":"LOW","authentication":"NONE","confidentialityImpact":"PARTIAL","integrityImpact":"PARTIAL","availabilityImpact":"PARTIAL","baseScore":7.5},"cvssv3":{"version":"3.0","vectorString":"CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H","attackVector":"NETWORK","attackComplexity":"LOW","privilegesRequired":"NONE","userInteraction":"NONE","scope":"UNCHANGED","confidentialityImpact":"HIGH","integrityImpact":"HIGH","availabilityImpact":"HIGH","baseScore":9.8,"baseSeverity":"CRITICAL"}}
\.

SELECT pg_catalog.setval('vulnerability_versions_id_seq', 9, true);
