CREATE TABLE ab_board (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    dir character varying(50) NOT NULL
);

CREATE TABLE ab_msg (
    id integer NOT NULL,
    message text NOT NULL,
    "time" time  NOT NULL,
    show_name boolean NOT NULL,
    show_tripcode boolean NOT NULL
);

CREATE TABLE ab_post (
    msg_ptr_id integer NOT NULL,
    thread_id integer NOT NULL,
    user_id integer NOT NULL,
    parent_id integer NOT NULL,
    subject character varying(50) NOT NULL
);

CREATE TABLE ab_privmsg (
    msg_ptr_id integer NOT NULL,
    to_id character varying(50) NOT NULL,
    from_id character varying(50) NOT NULL
);

CREATE TABLE ab_tag (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


CREATE TABLE ab_thread (
    id integer NOT NULL,
    board_id integer NOT NULL,
    user_id integer NOT NULL,
    tag_id integer NOT NULL,
    subject character varying(50) NOT NULL
);


CREATE TABLE ab_user (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    tripcode character varying(50) NOT NULL,
    regdate time without time zone NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(50) NOT NULL,
    deleted boolean NOT NULL
);

CREATE TABLE ab_wallmsg (
    msg_ptr_id integer NOT NULL,
    to_id character varying(50) NOT NULL,
    from_id character varying(50) NOT NULL
);





