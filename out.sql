--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: ccc(integer); Type: FUNCTION; Schema: public; Owner: oleg
--

CREATE FUNCTION ccc(c1 integer) RETURNS character
    LANGUAGE plpgsql
    AS $$
DECLARE
a int := 0;
z int := 1;
BEGIN

RETURN to_char(55);

END;
$$;


ALTER FUNCTION public.ccc(c1 integer) OWNER TO oleg;

--
-- Name: multiple_years(integer, integer); Type: FUNCTION; Schema: public; Owner: oleg
--

CREATE FUNCTION multiple_years(start_y integer, end_y integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
a int := start_y;
z int := 1;
BEGIN
	<<my_label>>
	WHILE a < end_y LOOP
    z := z * a;
    a := a + 1;
	END LOOP my_label;
	RETURN z;
END;
$$;


ALTER FUNCTION public.multiple_years(start_y integer, end_y integer) OWNER TO oleg;

--
-- Name: sale(integer); Type: FUNCTION; Schema: public; Owner: oleg
--

CREATE FUNCTION sale(num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE

BEGIN
	UPDATE books
		SET cost = cost - num;
END;
$$;


ALTER FUNCTION public.sale(num integer) OWNER TO oleg;

--
-- Name: xynta(character, integer); Type: FUNCTION; Schema: public; Owner: oleg
--

CREATE FUNCTION xynta(letter character, numrow integer) RETURNS SETOF character
    LANGUAGE plpgsql
    AS $$
DECLARE
	st integer;
	ed integer;
	cur integer;
BEGIN
	IF numrow > 0 THEN
		st := ascii(letter);
		ed := st + numrow - 1;
	ELSE
		ed := ascii(letter);
		st := ed + numrow + 1;
	END IF;
	FOR cur IN st..ed LOOP
		RETURN NEXT chr(cur);
	END LOOP;
END;
$$;


ALTER FUNCTION public.xynta(letter character, numrow integer) OWNER TO oleg;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    name character varying(20),
    cost integer
);


ALTER TABLE public.books OWNER TO oleg;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO oleg;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('books_id_seq', 3, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY books (id, name, cost) FROM stdin;
1	dsad	13
2	dsad2	13
3	dsad4	11
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

