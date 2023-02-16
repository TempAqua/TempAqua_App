CREATE SCHEMA IF NOT EXISTS %(schema)s;
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS %(schema)s.anchor_point
(
    id SERIAL PRIMARY KEY,
	point_id character varying(254) COLLATE pg_catalog."default",
    parent_point_id character varying(254) COLLATE pg_catalog."default",
    catchment_name character varying(254) COLLATE pg_catalog."default",
    location_type character varying(254) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    geom public.geometry(Geometry,4326)
)
TABLESPACE pg_default;

CREATE INDEX IF NOT EXISTS anchor_point_geom_1674141386829
    ON %(schema)s.anchor_point USING gist
    (geom)
    TABLESPACE pg_default;

-- Set permissions on DB
REVOKE ALL ON SCHEMA public FROM PUBLIC;

-- Create user %(user)s
Do
$do$
BEGIN
IF NOT EXISTS (
    SELECT FROM pg_catalog.pg_roles
        WHERE  rolname = '%(user)s') THEN
    CREATE USER %(user)s WITH PASSWORD %(pass)s;
END IF;

end
$do$;

GRANT CONNECT ON DATABASE %(db)s TO %(user)s;
GRANT USAGE ON SCHEMA %(schema)s, public TO %(user)s;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA %(schema)s TO %(user)s;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO %(user)s;
GRANT SELECT ON TABLE public.spatial_ref_sys TO %(user)s;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE %(schema)s.anchor_point_id_seq TO %(user)s;
