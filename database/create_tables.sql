-- Table: public.anchor_point

-- DROP TABLE IF EXISTS public.anchor_point;

CREATE TABLE IF NOT EXISTS public.anchor_point
(
    id character varying(254) COLLATE pg_catalog."default",
    parent_id character varying(254) COLLATE pg_catalog."default",
    catchment_name character varying(254) COLLATE pg_catalog."default",
    location_type character varying(254) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    geom geometry(Geometry,4326)
)

TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.anchor_point
--     OWNER to docker;
-- Index: anchor_point_geom_1674141386829

-- DROP INDEX IF EXISTS public.anchor_point_geom_1674141386829;

CREATE INDEX IF NOT EXISTS anchor_point_geom_1674141386829
    ON public.anchor_point USING gist
    (geom)
    TABLESPACE pg_default;