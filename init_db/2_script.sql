-- Table: public.tbl2
-- DROP TABLE IF EXISTS public.tbl2;
CREATE TABLE IF NOT EXISTS public.tbl2
(
    id bigSERIAL NOT NULL ,
	dt TIMESTAMP default (now()),
    txt character varying(255) COLLATE pg_catalog."default",
    json_data jsonb,
    CONSTRAINT tbl2_pkey PRIMARY KEY (id)
);
ALTER TABLE IF EXISTS public.tbl2
    OWNER to denysm;

INSERT INTO tbl2(txt, json_data)
SELECT 'test_string_' || data.id::text as str, ('[{"key1":"value_' || id::text || '", "key2":"tvalue_00' || id::text || '"}]')::jsonb as jsondata

FROM generate_series(1, 5000) as data(id);
