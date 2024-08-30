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

CREATE TABLE public.state (
  state_id integer PRIMARY KEY,
  state_name text NOT NULL,
  user_triggerable BOOLEAN NOT NULL
);

ALTER TABLE public.state OWNER TO staff_user;


COPY public.state (state_id, state_name, user_triggerable) FROM stdin WITH DELIMITER ',';
1,Submitted,false
2,Approved,false
3,Rejected,false
4,Canceled,true
5,In Preparation,false
6,In Delivery,false
7,Delivered,false
\.
CREATE TABLE public.next_state (
  state_id integer NOT NULL,
  next_state_id integer NOT NULL
);

ALTER TABLE public.state OWNER TO staff_user;

ALTER TABLE ONLY public.next_state
    ADD CONSTRAINT next_state_pkey PRIMARY KEY (state_id, next_state_id);
 
COPY public.next_state (state_id, next_state_id) FROM stdin WITH DELIMITER ' ';
1 2
1 3
1 4
2 4
2 5
5 6
6 7
\.
--
-- Name: user; Type: TABLE; Schema: public; Owner: staff_user
--
CREATE TABLE IF NOT EXISTS public.user (
    email text PRIMARY KEY,
    user_name text NOT NULL,
    firstname text NOT NULL,
    password_hash text NOT NULL
);

ALTER TABLE public.user OWNER TO staff_user;


--
-- Name: plate; Type: TABLE; Schema: public; Owner: staff_user
--

CREATE TABLE IF NOT EXISTS public.plate (
    plate_id integer NOT NULL,
    plate_name text NOT NULL,
    price double precision NOT NULL,
    picture text
);


ALTER TABLE public.plate OWNER TO staff_user;

--
-- Name: plate_plate_id_seq; Type: SEQUENCE; Schema: public; Owner: staff_user
--

CREATE SEQUENCE public.plate_plate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plate_plate_id_seq OWNER TO staff_user;

--
-- Name: plate_plate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff_user
--

ALTER SEQUENCE public.plate_plate_id_seq OWNED BY public.plate.plate_id;

--
-- Name: plate plate_id; Type: DEFAULT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.plate ALTER COLUMN plate_id SET DEFAULT nextval('public.plate_plate_id_seq'::regclass);

--
-- Name: plate plate_pkey; Type: CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.plate
    ADD CONSTRAINT plate_pkey PRIMARY KEY (plate_id);

--
-- Name: order; Type: TABLE; Schema: public; Owner: staff_user
--

CREATE TABLE IF NOT EXISTS public."order" (
    order_id integer NOT NULL,
    order_time timestamp with time zone NOT NULL,
    "_Order__finish_time" timestamp with time zone NOT NULL,
    user_email text NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public."order" OWNER TO staff_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: staff_user
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO staff_user;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: staff_user
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;

--
-- Name: order order_id; Type: DEFAULT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_email_fkey FOREIGN KEY (user_email) REFERENCES public."user"(email);

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_state_fkey FOREIGN KEY (state_id) REFERENCES public."state"(state_id);
--
-- Name: plate_order; Type: TABLE; Schema: public; Owner: staff_user
--
CREATE TABLE IF NOT EXISTS public.plate_order (
    plate_id integer NOT NULL,
    order_id integer NOT NULL,
    quantity integer NOT NULL
);



ALTER TABLE public.plate_order OWNER TO staff_user;

--
-- Name: plate_order plate_order_pkey; Type: CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.plate_order
    ADD CONSTRAINT plate_order_pkey PRIMARY KEY (plate_id, order_id);

--
-- Name: plate_order plate_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.plate_order
    ADD CONSTRAINT plate_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);

--
-- Name: plate_order plate_order_plate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: staff_user
--

ALTER TABLE ONLY public.plate_order
    ADD CONSTRAINT plate_order_plate_id_fkey FOREIGN KEY (plate_id) REFERENCES public.plate(plate_id);
CREATE TABLE IF NOT EXISTS public.review (
  plate_id integer NOT NULL,
  user_email text NOT NULL,
  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment text NOT NULL
);

ALTER TABLE public.review OWNER TO staff_user;

ALTER TABLE ONLY public.review
  ADD CONSTRAINT review_plate_id_fkey FOREIGN KEY (plate_id) REFERENCES public.plate(plate_id);

ALTER TABLE ONLY public.review
  ADD CONSTRAINT review_user_email_fkey FOREIGN KEY (user_email) REFERENCES public.user(email);
--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: staff_user
--

COPY public."user" (email, user_name, firstname, password_hash) FROM stdin WITH DELIMITER ' ';
toto@gmail.com Doe John 9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
tata@gmail.com Wilson Patrick 9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
titi@gmail.com Dupont Titi 9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08
\.

COPY public."order" (order_id, order_time, "_Order__finish_time", user_email, state_id) FROM stdin WITH DELIMITER ',';
1,2023-05-02 23:25:48.168407+00,2023-05-02 23:37:22.168469+00,toto@gmail.com,1
2,2023-05-02 23:31:14.594509+00,2023-05-02 23:35:39.594689+00,toto@gmail.com,7
3,2023-05-02 23:31:35.101242+00,2023-05-02 23:35:43.101272+00,toto@gmail.com,7
4,2023-05-02 23:31:46.821307+00,2023-05-02 23:39:43.821336+00,titi@gmail.com,7
\.


--
-- Data for Name: plate; Type: TABLE DATA; Schema: public; Owner: staff_user
--

COPY public.plate (plate_id, plate_name, price, picture) FROM stdin;
1	Pizza Margherita	12.99	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg/440px-Eq_it-na_pizza-margherita_sep2005_sml.jpg
2	Rösti	15.99	https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Roesti.jpg/500px-Roesti.jpg
3	Fondue	13.99	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Swiss_fondue.jpg/500px-Swiss_fondue.jpg
4	Raclette	18.99	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Raclette_20040817_140816.jpg/440px-Raclette_20040817_140816.jpg
5	Carpaccio	23.99	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Carpaccio_with_cheese_in_Warsaw.jpg/500px-Carpaccio_with_cheese_in_Warsaw.jpg
6	BBQ Chicken Burger & Sweet Potato Fries	12.99	https://www.howsweeteats.com/wp-content/uploads/2011/04/bbqburgers-7.jpg
7	Spaghetti Carbonara	11.99	https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Espaguetis_carbonara.jpg/500px-Espaguetis_carbonara.jpg
8	Risotto	15.99	https://upload.wikimedia.org/wikipedia/commons/4/40/Italian_Risotto.png
\.


--
-- Data for Name: plate_order; Type: TABLE DATA; Schema: public; Owner: staff_user
--

COPY public.plate_order (plate_id, order_id, quantity) FROM stdin WITH DELIMITER ' ';
1 1 3
3 1 1
1 2 1
2 2 1
3 2 1
4 2 1
3 3 1
4 3 1
5 3 1
4 4 1
\.

COPY public.review(plate_id, user_email,rating,comment) FROM stdin WITH DELIMITER ',';
1,tata@gmail.com,5,Simple yet divine\, a classic Pizza Margherita is pure Italian perfection – the harmonious trio of tomato\, mozzarella\, and basil on a crispy crust is a slice of heaven!
1,titi@gmail.com,3,While the Pizza Margherita was decent with its traditional combination of tomato\, mozzarella\, and basil\, it fell a bit short of my expectations. The crust lacked the desired crispiness\, and the flavor was good but not exceptional. A solid option\, but I've had better.
\.

--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff_user
--

SELECT pg_catalog.setval('public.order_order_id_seq', 4, true);


--
-- Name: plate_plate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: staff_user
--

SELECT pg_catalog.setval('public.plate_plate_id_seq', 8, true);
