--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Name: staff_role_t; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE staff_role_t AS ENUM (
    'owner',
    'admin',
    'mod'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ab_board_staff; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_board_staff (
    staff_id integer NOT NULL,
    board_id integer NOT NULL,
    user_id integer NOT NULL,
    staff_role staff_role_t NOT NULL
);


--
-- Name: ab_board_staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_board_staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_board_staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_board_staff_staff_id_seq OWNED BY ab_board_staff.staff_id;


--
-- Name: ab_board_staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_board_staff_staff_id_seq', 1, false);


--
-- Name: ab_boards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_boards (
    board_id integer NOT NULL,
    board_dir character varying(8) NOT NULL,
    board_name character varying(35) NOT NULL
);


--
-- Name: ab_boards_board_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_boards_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_boards_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_boards_board_id_seq OWNED BY ab_boards.board_id;


--
-- Name: ab_boards_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_boards_board_id_seq', 1, false);


--
-- Name: ab_posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_posts (
    post_id integer NOT NULL,
    board_id integer NOT NULL,
    user_id integer NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    subject character varying(255),
    message text NOT NULL,
    message_time timestamp without time zone DEFAULT now() NOT NULL,
    show_name bit(1) DEFAULT B'0'::"bit" NOT NULL,
    show_tripcode bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: ab_posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_posts_post_id_seq OWNED BY ab_posts.post_id;


--
-- Name: ab_posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_posts_post_id_seq', 1, false);


--
-- Name: ab_privmsgs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_privmsgs (
    privmsg_id integer NOT NULL,
    to_id integer NOT NULL,
    from_id integer NOT NULL,
    message text NOT NULL,
    message_time timestamp without time zone DEFAULT now() NOT NULL,
    show_name bit(1) DEFAULT B'0'::"bit" NOT NULL,
    show_tripcode bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: ab_privmsgs_privmsg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_privmsgs_privmsg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_privmsgs_privmsg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_privmsgs_privmsg_id_seq OWNED BY ab_privmsgs.privmsg_id;


--
-- Name: ab_privmsgs_privmsg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_privmsgs_privmsg_id_seq', 1, false);


--
-- Name: ab_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_users (
    user_id integer NOT NULL,
    user_name character varying(64) NOT NULL,
    user_tripcode character(10) NOT NULL,
    user_regdate timestamp without time zone DEFAULT now() NOT NULL,
    user_email character varying(128) NOT NULL,
    user_password character(32) NOT NULL,
    user_deleted bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: ab_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_users_user_id_seq OWNED BY ab_users.user_id;


--
-- Name: ab_users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_users_user_id_seq', 1, false);


--
-- Name: ab_wall; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ab_wall (
    wallmsg_id integer NOT NULL,
    to_id integer NOT NULL,
    from_id integer NOT NULL,
    message text NOT NULL,
    message_time timestamp without time zone DEFAULT now() NOT NULL,
    show_name bit(1) DEFAULT B'0'::"bit" NOT NULL,
    show_tripcode bit(1) DEFAULT B'0'::"bit" NOT NULL
);


--
-- Name: ab_wall_wallmsg_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ab_wall_wallmsg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ab_wall_wallmsg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ab_wall_wallmsg_id_seq OWNED BY ab_wall.wallmsg_id;


--
-- Name: ab_wall_wallmsg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ab_wall_wallmsg_id_seq', 1, false);


--
-- Name: staff_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_board_staff ALTER COLUMN staff_id SET DEFAULT nextval('ab_board_staff_staff_id_seq'::regclass);


--
-- Name: board_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_boards ALTER COLUMN board_id SET DEFAULT nextval('ab_boards_board_id_seq'::regclass);


--
-- Name: post_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_posts ALTER COLUMN post_id SET DEFAULT nextval('ab_posts_post_id_seq'::regclass);


--
-- Name: privmsg_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_privmsgs ALTER COLUMN privmsg_id SET DEFAULT nextval('ab_privmsgs_privmsg_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_users ALTER COLUMN user_id SET DEFAULT nextval('ab_users_user_id_seq'::regclass);


--
-- Name: wallmsg_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ab_wall ALTER COLUMN wallmsg_id SET DEFAULT nextval('ab_wall_wallmsg_id_seq'::regclass);


--
-- Data for Name: ab_board_staff; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_board_staff (staff_id, board_id, user_id, staff_role) FROM stdin;
\.


--
-- Data for Name: ab_boards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_boards (board_id, board_dir, board_name) FROM stdin;
\.


--
-- Data for Name: ab_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_posts (post_id, board_id, user_id, parent_id, subject, message, message_time, show_name, show_tripcode) FROM stdin;
\.


--
-- Data for Name: ab_privmsgs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_privmsgs (privmsg_id, to_id, from_id, message, message_time, show_name, show_tripcode) FROM stdin;
\.


--
-- Data for Name: ab_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_users (user_id, user_name, user_tripcode, user_regdate, user_email, user_password, user_deleted) FROM stdin;
\.


--
-- Data for Name: ab_wall; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ab_wall (wallmsg_id, to_id, from_id, message, message_time, show_name, show_tripcode) FROM stdin;
\.


--
-- Name: ab_board_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_board_staff
    ADD CONSTRAINT ab_board_staff_pkey PRIMARY KEY (board_id, user_id);


--
-- Name: ab_board_staff_staff_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_board_staff
    ADD CONSTRAINT ab_board_staff_staff_id_key UNIQUE (staff_id);


--
-- Name: ab_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_boards
    ADD CONSTRAINT ab_boards_pkey PRIMARY KEY (board_id);


--
-- Name: ab_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_posts
    ADD CONSTRAINT ab_posts_pkey PRIMARY KEY (post_id);


--
-- Name: ab_privmsgs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_privmsgs
    ADD CONSTRAINT ab_privmsgs_pkey PRIMARY KEY (privmsg_id);


--
-- Name: ab_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_users
    ADD CONSTRAINT ab_users_pkey PRIMARY KEY (user_id);


--
-- Name: ab_wall_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ab_wall
    ADD CONSTRAINT ab_wall_pkey PRIMARY KEY (wallmsg_id);


--
-- Name: ab_posts_display_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX ab_posts_display_idx ON ab_posts USING btree (board_id, parent_id);


--
-- Name: ab_board_staff_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_board_staff
    ADD CONSTRAINT ab_board_staff_board_id_fkey FOREIGN KEY (board_id) REFERENCES ab_boards(board_id);


--
-- Name: ab_board_staff_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_board_staff
    ADD CONSTRAINT ab_board_staff_user_id_fkey FOREIGN KEY (user_id) REFERENCES ab_users(user_id);


--
-- Name: ab_posts_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_posts
    ADD CONSTRAINT ab_posts_board_id_fkey FOREIGN KEY (board_id) REFERENCES ab_boards(board_id);


--
-- Name: ab_posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_posts
    ADD CONSTRAINT ab_posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES ab_users(user_id);


--
-- Name: ab_privmsgs_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_privmsgs
    ADD CONSTRAINT ab_privmsgs_from_id_fkey FOREIGN KEY (from_id) REFERENCES ab_users(user_id);


--
-- Name: ab_privmsgs_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_privmsgs
    ADD CONSTRAINT ab_privmsgs_to_id_fkey FOREIGN KEY (to_id) REFERENCES ab_users(user_id);


--
-- Name: ab_wall_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ab_wall
    ADD CONSTRAINT ab_wall_from_id_fkey FOREIGN KEY (from_id) REFERENCES ab_users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

