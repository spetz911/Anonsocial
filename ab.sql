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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ab_board; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_board (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    dir character varying(50) NOT NULL
);


ALTER TABLE public.ab_board OWNER TO oleg;

--
-- Name: ab_board_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE ab_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_board_id_seq OWNER TO oleg;

--
-- Name: ab_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE ab_board_id_seq OWNED BY ab_board.id;


--
-- Name: ab_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('ab_board_id_seq', 2, true);


--
-- Name: ab_msg; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_msg (
    id integer NOT NULL,
    message text NOT NULL,
    "time" time without time zone NOT NULL,
    show_name boolean NOT NULL,
    show_tripcode boolean NOT NULL
);


ALTER TABLE public.ab_msg OWNER TO oleg;

--
-- Name: ab_msg_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE ab_msg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_msg_id_seq OWNER TO oleg;

--
-- Name: ab_msg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE ab_msg_id_seq OWNED BY ab_msg.id;


--
-- Name: ab_msg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('ab_msg_id_seq', 1, false);


--
-- Name: ab_post; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_post (
    msg_ptr_id integer NOT NULL,
    thread_id integer NOT NULL,
    user_id integer NOT NULL,
    parent_id integer NOT NULL,
    subject character varying(50) NOT NULL
);


ALTER TABLE public.ab_post OWNER TO oleg;

--
-- Name: ab_privmsg; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_privmsg (
    msg_ptr_id integer NOT NULL,
    to_id character varying(50) NOT NULL,
    from_id character varying(50) NOT NULL
);


ALTER TABLE public.ab_privmsg OWNER TO oleg;

--
-- Name: ab_tag; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.ab_tag OWNER TO oleg;

--
-- Name: ab_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE ab_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_tag_id_seq OWNER TO oleg;

--
-- Name: ab_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE ab_tag_id_seq OWNED BY ab_tag.id;


--
-- Name: ab_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('ab_tag_id_seq', 4, true);


--
-- Name: ab_thread; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_thread (
    id integer NOT NULL,
    board_id integer NOT NULL,
    user_id integer NOT NULL,
    tag_id integer NOT NULL,
    subject character varying(50) NOT NULL
);


ALTER TABLE public.ab_thread OWNER TO oleg;

--
-- Name: ab_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE ab_thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_thread_id_seq OWNER TO oleg;

--
-- Name: ab_thread_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE ab_thread_id_seq OWNED BY ab_thread.id;


--
-- Name: ab_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('ab_thread_id_seq', 1, true);


--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_user (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    tripcode character varying(50) NOT NULL,
    regdate time without time zone NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(50) NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.ab_user OWNER TO oleg;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO oleg;

--
-- Name: ab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE ab_user_id_seq OWNED BY ab_user.id;


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('ab_user_id_seq', 2, true);


--
-- Name: ab_wallmsg; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE ab_wallmsg (
    msg_ptr_id integer NOT NULL,
    to_id character varying(50) NOT NULL,
    from_id character varying(50) NOT NULL
);


ALTER TABLE public.ab_wallmsg OWNER TO oleg;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO oleg;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO oleg;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO oleg;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO oleg;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO oleg;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO oleg;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO oleg;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO oleg;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO oleg;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO oleg;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO oleg;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO oleg;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO oleg;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO oleg;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO oleg;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO oleg;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 12, true);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO oleg;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO oleg;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO oleg;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: oleg; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO oleg;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO oleg;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oleg
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ab_board ALTER COLUMN id SET DEFAULT nextval('ab_board_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ab_msg ALTER COLUMN id SET DEFAULT nextval('ab_msg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ab_tag ALTER COLUMN id SET DEFAULT nextval('ab_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ab_thread ALTER COLUMN id SET DEFAULT nextval('ab_thread_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ab_user ALTER COLUMN id SET DEFAULT nextval('ab_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Data for Name: ab_board; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_board (id, name, dir) FROM stdin;
1	bred	/b
2	erlang	/erl
\.


--
-- Data for Name: ab_msg; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_msg (id, message, "time", show_name, show_tripcode) FROM stdin;
\.


--
-- Data for Name: ab_post; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_post (msg_ptr_id, thread_id, user_id, parent_id, subject) FROM stdin;
\.


--
-- Data for Name: ab_privmsg; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_privmsg (msg_ptr_id, to_id, from_id) FROM stdin;
\.


--
-- Data for Name: ab_tag; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_tag (id, name, description) FROM stdin;
4	dummy	just nothing
\.


--
-- Data for Name: ab_thread; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_thread (id, board_id, user_id, tag_id, subject) FROM stdin;
1	1	1	4	hello segodnya den skverniy
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_user (id, name, tripcode, regdate, email, password, deleted) FROM stdin;
1	Oleg Baskakov	spetz	06:48:57.954508		12345	f
2	Arseniy Sysolatin	ar7n	06:49:20.309702			f
\.


--
-- Data for Name: ab_wallmsg; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY ab_wallmsg (msg_ptr_id, to_id, from_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add log entry	8	add_logentry
23	Can change log entry	8	change_logentry
24	Can delete log entry	8	delete_logentry
25	Can add user	9	add_user
26	Can change user	9	change_user
27	Can delete user	9	delete_user
28	Can add board	10	add_board
29	Can change board	10	change_board
30	Can delete board	10	delete_board
31	Can add msg	11	add_msg
32	Can change msg	11	change_msg
33	Can delete msg	11	delete_msg
34	Can add thread	12	add_thread
35	Can change thread	12	change_thread
36	Can delete thread	12	delete_thread
37	Can add post	13	add_post
38	Can change post	13	change_post
39	Can delete post	13	delete_post
40	Can add wall msg	14	add_wallmsg
41	Can change wall msg	14	change_wallmsg
42	Can delete wall msg	14	delete_wallmsg
43	Can add priv msg	15	add_privmsg
44	Can change priv msg	15	change_privmsg
45	Can delete priv msg	15	delete_privmsg
46	Can add tag	16	add_tag
47	Can change tag	16	change_tag
48	Can delete tag	16	delete_tag
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
1	oleg			spetz911@gmail.com	sha1$b6655$5ec58787569a10dae8b921a9d83306dfab519c08	t	t	t	2011-11-30 16:21:19.072539+04	2011-11-30 16:11:12.940544+04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2011-11-30 16:36:08.809266+04	1	10	1	bred	1	
2	2011-11-30 16:36:20.876407+04	1	10	2	anime	1	
3	2011-11-30 16:45:17.736463+04	1	10	1	bred	1	
4	2011-11-30 16:45:41.89185+04	1	10	2	erlang	1	
5	2011-11-30 16:47:16.042527+04	1	16	2	bre	1	
6	2011-11-30 16:47:26.251369+04	1	16	2	bre	3	
7	2011-11-30 16:47:31.712138+04	1	16	3	bre	1	
8	2011-11-30 16:47:37.575547+04	1	16	3	bre	3	
9	2011-11-30 16:48:03.44434+04	1	16	4	dummy	1	
10	2011-11-30 16:48:57.956714+04	1	9	1	Oleg Baskakov	1	
11	2011-11-30 16:49:20.312193+04	1	9	2	Arseniy Sysolatin	1	
12	2011-11-30 16:51:09.024254+04	1	12	1	hello segodnya den skverniy	1	
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	log entry	admin	logentry
9	user	ab	user
10	board	ab	board
11	msg	ab	msg
12	thread	ab	thread
13	post	ab	post
14	wall msg	ab	wallmsg
15	priv msg	ab	privmsg
16	tag	ab	tag
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
89a222c7b7d864f52be8be77c521f390	NzZmZGRiMzQ3NDUxYWY2MzZmZTY1YjJjMGU3ODkzM2YwNDg5NjY2MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-14 16:14:18.701035+04
5e804b648fdf9bdb99750b39c2891261	NzZmZGRiMzQ3NDUxYWY2MzZmZTY1YjJjMGU3ODkzM2YwNDg5NjY2MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2011-12-14 16:21:19.084347+04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: oleg
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: ab_board_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_board
    ADD CONSTRAINT ab_board_pkey PRIMARY KEY (id);


--
-- Name: ab_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_msg
    ADD CONSTRAINT ab_msg_pkey PRIMARY KEY (id);


--
-- Name: ab_post_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_post
    ADD CONSTRAINT ab_post_pkey PRIMARY KEY (msg_ptr_id);


--
-- Name: ab_privmsg_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_privmsg
    ADD CONSTRAINT ab_privmsg_pkey PRIMARY KEY (msg_ptr_id);


--
-- Name: ab_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_tag
    ADD CONSTRAINT ab_tag_pkey PRIMARY KEY (id);


--
-- Name: ab_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_thread
    ADD CONSTRAINT ab_thread_pkey PRIMARY KEY (id);


--
-- Name: ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_wallmsg_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY ab_wallmsg
    ADD CONSTRAINT ab_wallmsg_pkey PRIMARY KEY (msg_ptr_id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: ab_post_parent_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_post_parent_id ON ab_post USING btree (parent_id);


--
-- Name: ab_post_thread_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_post_thread_id ON ab_post USING btree (thread_id);


--
-- Name: ab_post_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_post_user_id ON ab_post USING btree (user_id);


--
-- Name: ab_thread_board_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_thread_board_id ON ab_thread USING btree (board_id);


--
-- Name: ab_thread_tag_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_thread_tag_id ON ab_thread USING btree (tag_id);


--
-- Name: ab_thread_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX ab_thread_user_id ON ab_thread USING btree (user_id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: oleg; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: ab_post_msg_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_post
    ADD CONSTRAINT ab_post_msg_ptr_id_fkey FOREIGN KEY (msg_ptr_id) REFERENCES ab_msg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_post_thread_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_post
    ADD CONSTRAINT ab_post_thread_id_fkey FOREIGN KEY (thread_id) REFERENCES ab_thread(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_post
    ADD CONSTRAINT ab_post_user_id_fkey FOREIGN KEY (user_id) REFERENCES ab_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_privmsg_msg_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_privmsg
    ADD CONSTRAINT ab_privmsg_msg_ptr_id_fkey FOREIGN KEY (msg_ptr_id) REFERENCES ab_msg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_thread_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_thread
    ADD CONSTRAINT ab_thread_board_id_fkey FOREIGN KEY (board_id) REFERENCES ab_board(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_thread_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_thread
    ADD CONSTRAINT ab_thread_user_id_fkey FOREIGN KEY (user_id) REFERENCES ab_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ab_wallmsg_msg_ptr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_wallmsg
    ADD CONSTRAINT ab_wallmsg_msg_ptr_id_fkey FOREIGN KEY (msg_ptr_id) REFERENCES ab_msg(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_msg_ptr_id_273bbe65; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_post
    ADD CONSTRAINT parent_id_refs_msg_ptr_id_273bbe65 FOREIGN KEY (parent_id) REFERENCES ab_post(msg_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tag_id_refs_id_f3cf9154; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY ab_thread
    ADD CONSTRAINT tag_id_refs_id_f3cf9154 FOREIGN KEY (tag_id) REFERENCES ab_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

