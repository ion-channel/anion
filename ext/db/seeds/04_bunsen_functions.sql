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

CREATE FUNCTION word_similarity_op(IN text, IN text) RETURNS "bool"
	AS '$libdir/pg_trgm','word_similarity_op'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	STABLE;
ALTER FUNCTION word_similarity_op(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION word_similarity_commutator_op(IN text, IN text) RETURNS "bool"
	AS '$libdir/pg_trgm','word_similarity_commutator_op'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	STABLE;
ALTER FUNCTION word_similarity_commutator_op(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "similarity_dist"(IN text, IN text) RETURNS "float4"
	AS '$libdir/pg_trgm','similarity_dist'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "similarity_dist"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "word_similarity_dist_op"(IN text, IN text) RETURNS "float4"
	AS '$libdir/pg_trgm','word_similarity_dist_op'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "word_similarity_dist_op"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "word_similarity_dist_commutator_op"(IN text, IN text) RETURNS "float4"
	AS '$libdir/pg_trgm','word_similarity_dist_commutator_op'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "word_similarity_dist_commutator_op"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "gtrgm_in"(IN cstring) RETURNS "gtrgm"
	AS '$libdir/pg_trgm','gtrgm_in'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_in"(IN cstring) OWNER TO postgres;

CREATE FUNCTION "gtrgm_out"(IN "gtrgm") RETURNS "cstring"
	AS '$libdir/pg_trgm','gtrgm_out'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_out"(IN "gtrgm") OWNER TO postgres;

CREATE FUNCTION "gtrgm_consistent"(IN internal, IN text, IN int2, IN oid, IN internal) RETURNS "bool"
	AS '$libdir/pg_trgm','gtrgm_consistent'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_consistent"(IN internal, IN text, IN int2, IN oid, IN internal) OWNER TO postgres;

CREATE FUNCTION "set_limit"(IN float4) RETURNS "float4"
	AS '$libdir/pg_trgm','set_limit'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "set_limit"(IN float4) OWNER TO postgres;

CREATE FUNCTION "show_limit"() RETURNS "float4"
	AS '$libdir/pg_trgm','show_limit'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	STABLE;
ALTER FUNCTION "show_limit"() OWNER TO postgres;

CREATE FUNCTION "show_trgm"(IN text) RETURNS "_text"
	AS '$libdir/pg_trgm','show_trgm'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "show_trgm"(IN text) OWNER TO postgres;

CREATE FUNCTION "similarity"(IN text, IN text) RETURNS "float4"
	AS '$libdir/pg_trgm','similarity'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "similarity"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "similarity_op"(IN text, IN text) RETURNS "bool"
	AS '$libdir/pg_trgm','similarity_op'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	STABLE;
ALTER FUNCTION "similarity_op"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "word_similarity"(IN text, IN text) RETURNS "float4"
	AS '$libdir/pg_trgm','word_similarity'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "word_similarity"(IN text, IN text) OWNER TO postgres;

CREATE FUNCTION "gtrgm_distance"(IN internal, IN text, IN int2, IN oid, IN internal) RETURNS "float8"
	AS '$libdir/pg_trgm','gtrgm_distance'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_distance"(IN internal, IN text, IN int2, IN oid, IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_compress"(IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gtrgm_compress'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_compress"(IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_decompress"(IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gtrgm_decompress'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_decompress"(IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_penalty"(IN internal, IN internal, IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gtrgm_penalty'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_penalty"(IN internal, IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_picksplit"(IN internal, IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gtrgm_picksplit'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_picksplit"(IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_union"(IN internal, IN internal) RETURNS "gtrgm"
	AS '$libdir/pg_trgm','gtrgm_union'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_union"(IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "gtrgm_same"(IN "gtrgm", IN "gtrgm", IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gtrgm_same'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gtrgm_same"(IN "gtrgm", IN "gtrgm", IN internal) OWNER TO postgres;

CREATE FUNCTION "gin_extract_value_trgm"(IN text, IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gin_extract_value_trgm'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gin_extract_value_trgm"(IN text, IN internal) OWNER TO postgres;

CREATE FUNCTION "gin_extract_query_trgm"(IN text, IN internal, IN int2, IN internal, IN internal, IN internal, IN internal) RETURNS "internal"
	AS '$libdir/pg_trgm','gin_extract_query_trgm'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gin_extract_query_trgm"(IN text, IN internal, IN int2, IN internal, IN internal, IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "gin_trgm_consistent"(IN internal, IN int2, IN text, IN int4, IN internal, IN internal, IN internal, IN internal) RETURNS "bool"
	AS '$libdir/pg_trgm','gin_trgm_consistent'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gin_trgm_consistent"(IN internal, IN int2, IN text, IN int4, IN internal, IN internal, IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "gin_trgm_triconsistent"(IN internal, IN int2, IN text, IN int4, IN internal, IN internal, IN internal) RETURNS "char"
	AS '$libdir/pg_trgm','gin_trgm_triconsistent'
	LANGUAGE c
	COST 1
	STRICT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "gin_trgm_triconsistent"(IN internal, IN int2, IN text, IN int4, IN internal, IN internal, IN internal) OWNER TO postgres;

CREATE FUNCTION "version_parts"(IN "version" text) RETURNS "_int8"
	AS $BODY$
    DECLARE
    	parts BIGINT[];
    	poops TEXT[];
    	v TEXT;
    BEGIN
    	-- 	begin with 0 to eliminate version `-`, ...
    	parts = '{ 0 }'::BIGINT[];
    	poops = string_to_array(version, '.');
    	FOREACH v IN ARRAY poops
    	LOOP
    	IF (v ~ '^[\d]+$') THEN
    		parts = parts || v::bigint;
    	ELSE
    		parts = parts || 0::bigint;
    	END IF;
    	END LOOP;

        RETURN parts;
    END;
    $BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "version_parts"(IN "version" text) OWNER TO postgres;

CREATE FUNCTION "tokens_from_query"(IN q text) RETURNS "_text"
	AS $BODY$
    DECLARE
    BEGIN
       RETURN tsvector_to_array(to_tsvector(querytree(to_tsquery('simple', q))));
    END;
    $BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "tokens_from_query"(IN q text) OWNER TO postgres;

CREATE FUNCTION "dep_tfidf"(IN d text) RETURNS "float8"
	AS $BODY$
DECLARE
    answer FLOAT;
	tf FLOAT;
	idf FLOAT;
BEGIN
	SELECT COUNT(*) INTO tf
	FROM
		(
			SELECT * FROM dependencies
		) AS sub
 	WHERE text_search_vector @@ d::tsquery;

	SELECT reltuples::bigint into idf
	FROM pg_catalog.pg_class
	WHERE relname = 'dependencies';
    RETURN tf * (1 / idf);
END;
$BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "dep_tfidf"(IN d text) OWNER TO postgres;

CREATE FUNCTION "max_token"(IN q text) RETURNS "text"
	AS $BODY$
    DECLARE
    	maximus TEXT;
    	current FLOAT;
    	candidate FLOAT;
    	tokens TEXT[];
    	t TEXT;
    BEGIN
    	current = -1.0;
    	tokens = tokens_from_query(q);
    	FOREACH t IN ARRAY tokens
    	LOOP
    		candidate = dep_tfidf(t);
    		IF candidate > current THEN
    			current = candidate;
    		   	maximus = t;
    		END IF;
    	END LOOP;
        RETURN maximus::TEXT;
    END;
    $BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "max_token"(IN q text) OWNER TO postgres;

CREATE FUNCTION "min_token"(IN q text) RETURNS "text"
	AS $BODY$
DECLARE
	minimus TEXT;
	current FLOAT;
	candidate FLOAT;
	tokens TEXT[];
	t TEXT;
BEGIN
	current = 1.0;
	tokens = tokens_from_query(q);
	FOREACH t IN ARRAY tokens
	LOOP
		candidate = dep_tfidf(t);
		IF candidate < current THEN
			current = candidate;
		   	minimus = t;
		END IF;
	END LOOP;
    RETURN minimus::TEXT;
END;
$BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "min_token"(IN q text) OWNER TO postgres;

CREATE FUNCTION "improve_tokens"(IN q text) RETURNS "text"
	AS $BODY$
    DECLARE
    	tokens TEXT [];
    	t TEXT;
    	t2 TEXT;
    BEGIN
    	tokens = tokens_from_query (q);
    	FOREACH t IN ARRAY tokens LOOP
    		t2 = t;
    		IF t ~ '[\d]+\.[\d]+.*' THEN
    			t2 = REPLACE(t, '.', '');
    			IF REPLACE(q, t, t2 || ':*') !~ '.*\:\*[\:\w\.]+.*' THEN
    				t2 = t2 || ':*';
    			END IF;
    			q = REPLACE(q, t, t2);
    		ELSIF REPLACE(q, t, concat(t2, ':*')) !~ '.*\:\*[\-\_\w\/\.].*|.*\:\*\:\*' THEN
    			q = REPLACE(q, t, concat(t2, ':*'));
    		END IF;
    	END LOOP;
    	RETURN q::TEXT;
    END;
    $BODY$
	LANGUAGE plpgsql
	COST 100
	CALLED ON NULL INPUT
	SECURITY INVOKER
	VOLATILE;
ALTER FUNCTION "improve_tokens"(IN q text) OWNER TO postgres;
