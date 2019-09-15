--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying,
    category character varying,
    event_type character varying,
    capacity integer,
    organizer character varying,
    start_date date,
    end_date date,
    start_time time without time zone,
    end_time time without time zone,
    location_id bigint,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    city character varying,
    google_map_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    name character varying,
    amount integer,
    price bigint,
    description character varying,
    sale_start_date date,
    sale_end_date date,
    event_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    customer_id integer,
    ticket_id integer,
    amount integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-09-12 15:21:38.807941	2019-09-12 15:21:38.807941
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, first_name, last_name, email, phone, created_at, updated_at) FROM stdin;
1	koko	lingga	koko.lingga	+6282188887777	2019-09-15 13:24:30.490788	2019-09-15 13:24:30.490788
2	khabib	nurmagomedov	khabib.nurmagomedov	+6282188886666	2019-09-15 14:11:06.729796	2019-09-15 14:11:06.729796
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, category, event_type, capacity, organizer, start_date, end_date, start_time, end_time, location_id, description, created_at, updated_at) FROM stdin;
1	LINE CONCERT	Concert	Public	100	CUBE Ent	2019-10-10	2019-10-11	00:00:00	08:00:00	1	LINE CONCERT	2019-09-13 09:24:09.4576	2019-09-13 09:24:09.4576
2	LAUV Concert 2019	Public	Concert	200	Cube Ent	2019-10-10	2019-10-11	15:00:00	02:00:00	1	LAUV Concert 2019	2019-09-13 12:12:44.455158	2019-09-13 12:12:44.455158
3	G(I)-DLE MNET TOUR 2019	Public	Concert	5000	Cube Ent	2019-10-10	2019-10-10	00:00:00	00:00:00	1	G(I)-DLE MNET TOUR 2019	2019-09-14 07:05:34.740061	2019-09-14 07:05:34.740061
4	We The Fest 2019	Public	Concert	500	Ismaya	2019-10-10	2019-10-10	00:00:00	00:00:00	1	We The Fest 2019	2019-09-15 15:00:40.147739	2019-09-15 15:00:40.147739
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, address, city, google_map_url, created_at, updated_at) FROM stdin;
1	Pasaraya Blok M	Melawai	Jakarta	https://www.google.com/maps/place/Pasaraya+Blok+M	2019-09-12 17:23:36.073842	2019-09-12 17:23:36.073842
2	ICE BSD	Jln. BSD Grand Boulevard	Jakarta	https://www.google.com/maps/place/BSD+Grand+Boulevard	2019-09-12 17:36:04.882049	2019-09-12 17:36:04.882049
3	LIVESPACE SCBD	Lot 8 SCBD Senayan	Jakarta	https://www.google.com/maps/place/3	2019-09-12 17:36:16.974635	2019-09-12 17:36:16.974635
4	Upper Room Hall	Annex Building	Jakarta	https://www.google.com/maps/place/4	2019-09-12 17:37:34.857719	2019-09-12 17:37:34.857719
5	Balai Sarbini	Jln. Jendral Sudirman	Jakarta	https://www.google.com/maps/place/5	2019-09-12 17:38:09.229948	2019-09-12 17:38:09.229948
6	ELDORADO DOME	Bandung	Bandung	https://www.google.com/maps/place/6	2019-09-13 02:42:06.028864	2019-09-13 02:42:06.028864
7	Central Park Mall	Jln. Letjen S Parman	Jakarta	https://www.google.com/maps/place/7	2019-09-13 04:27:34.0745	2019-09-13 04:27:34.0745
8	ICE BSD	Tangerang	Tangerang	map/1	2019-09-13 09:19:10.146435	2019-09-13 09:19:10.146435
9	Aula Simfonia Jakarta	Gunung Sahari Kemayoran	Jakarta	https://www.google.com/maps/place/1	2019-09-15 14:45:56.984992	2019-09-15 14:45:56.984992
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20190912151841
20190913052015
20190913081803
20190914050751
20190915035534
20190915065150
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, name, amount, price, description, sale_start_date, sale_end_date, event_id, created_at, updated_at) FROM stdin;
19	Diamond Ticket	500	1250000	Diamond Ticket	2019-09-01	2019-09-11	1	2019-09-15 15:30:26.179864	2019-09-15 15:30:26.179864
20	Gold Ticket	50	550000	Gold Ticket	2019-09-01	2019-09-11	1	2019-09-15 16:37:20.78324	2019-09-15 16:37:20.78324
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, customer_id, ticket_id, amount, created_at, updated_at) FROM stdin;
27	1	19	1	2019-09-15 16:36:08.657016	2019-09-15 16:36:08.657016
28	1	20	1	2019-09-15 16:37:59.890764	2019-09-15 16:37:59.890764
29	1	20	1	2019-09-15 16:38:03.67807	2019-09-15 16:38:03.67807
30	1	19	1	2019-09-15 16:38:23.778659	2019-09-15 16:38:23.778659
31	1	19	1	2019-09-15 16:38:25.572597	2019-09-15 16:38:25.572597
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 2, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 11, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 12, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 20, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 31, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: index_events_on_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_events_on_location_id ON public.events USING btree (location_id);


--
-- Name: index_tickets_on_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tickets_on_event_id ON public.tickets USING btree (event_id);


--
-- Name: events fk_rails_3d0bd29ec6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_3d0bd29ec6 FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: tickets fk_rails_4def87ea62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_rails_4def87ea62 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- PostgreSQL database dump complete
--

