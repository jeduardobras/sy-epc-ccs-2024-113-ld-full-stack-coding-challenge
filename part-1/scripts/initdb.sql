--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hello_world; Type: TABLE; Schema: public; Owner: staff_user
--

CREATE TABLE public.hello_world (
    id integer NOT NULL,
    message text
);


ALTER TABLE public.hello_world OWNER TO staff_user;

--
-- Name: hello_world_id_seq; Type: SEQUENCE; Schema: public; Owner: staff_user
--

CREATE SEQUENCE public.hello_world_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hello_world_id_seq OWNER TO staff_user;

--
-- Name: hello_world_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff_user
--

ALTER SEQUENCE public.hello_world_id_seq OWNED BY public.hello_world.id;


--
-- Name: hello_world id; Type: DEFAULT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.hello_world ALTER COLUMN id SET DEFAULT nextval('public.hello_world_id_seq'::regclass);


--
-- Data for Name: hello_world; Type: TABLE DATA; Schema: public; Owner: staff_user
--

COPY public.hello_world (id, message) FROM stdin;
1	Hello World!
\.


--
-- Name: hello_world_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff_user
--

SELECT pg_catalog.setval('public.hello_world_id_seq', 1, true);


--
-- Name: hello_world hello_world_pkey; Type: CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.hello_world
    ADD CONSTRAINT hello_world_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

