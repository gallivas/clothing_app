--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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
-- Name: clothing; Type: TABLE; Schema: public; Owner: stephengallivan
--

CREATE TABLE public.clothing (
    item_id uuid DEFAULT gen_random_uuid() NOT NULL,
    item_name character varying(100) NOT NULL,
    item_category character varying(20) NOT NULL,
    item_condition character varying(15),
    item_description character varying(255),
    item_photo character varying(255),
    item_brand character varying(50),
    location_id uuid NOT NULL,
    owner_id uuid NOT NULL
);


ALTER TABLE public.clothing OWNER TO stephengallivan;

--
-- Name: location; Type: TABLE; Schema: public; Owner: stephengallivan
--

CREATE TABLE public.location (
    location_id uuid DEFAULT gen_random_uuid() NOT NULL,
    nickname character varying(50) NOT NULL,
    street_address character varying(255),
    apartment_number character varying(50),
    city character varying(100),
    state character varying(100),
    postal_code character varying(20),
    country character varying(100)
);


ALTER TABLE public.location OWNER TO stephengallivan;

--
-- Name: owner; Type: TABLE; Schema: public; Owner: stephengallivan
--

CREATE TABLE public.owner (
    owner_id uuid DEFAULT gen_random_uuid() NOT NULL,
    f_name character varying(50) NOT NULL,
    l_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.owner OWNER TO stephengallivan;

--
-- Data for Name: clothing; Type: TABLE DATA; Schema: public; Owner: stephengallivan
--

COPY public.clothing (item_id, item_name, item_category, item_condition, item_description, item_photo, item_brand, location_id, owner_id) FROM stdin;
94c731f4-90d2-4670-afb5-c9b73a566abb	Green Jacket	Outerwear	Good	Green jacket with hood and many pockets	jacket-photo-url.jpg	Columbia	beb8c174-c320-4fdd-9791-db7b0a00fa31	78c96b8f-bc81-4b76-9a32-0fd3354b28d9
69067d7e-d780-4392-a0dd-f98de15107e9	Brown Shacket	Outerwear	Good	Fuzzy brown shacket with click buttons and two pockes	shacket-photo-url.jpg	Toad & Co	153fe813-c223-4331-9210-68964cf18103	78c96b8f-bc81-4b76-9a32-0fd3354b28d9
2d6d2c14-4543-4812-9b7e-b0c4ea68ca9d	Hiking Boots	Shoes	Good	Small hole on little toe of one boot	photo-url.jpg	Columbia	153fe813-c223-4331-9210-68964cf18103	78c96b8f-bc81-4b76-9a32-0fd3354b28d9
0ed1706b-060b-4c8a-8710-2fc8fcd0ea75	Hoka Trail Running Shoes	Shoes	Good	Pink and purple	hoka-photo-url.jpg	Hoka	153fe813-c223-4331-9210-68964cf18103	c08aa0c2-9232-4d1d-ac03-0e9d81479b9d
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: stephengallivan
--

COPY public.location (location_id, nickname, street_address, apartment_number, city, state, postal_code, country) FROM stdin;
573c6cf8-cded-411f-8ae7-134967fcfdf8	Home	1009 S Trenton Ave	Apt 2	Pittsburgh	Pennsylvania	15221	USA
beb8c174-c320-4fdd-9791-db7b0a00fa31	Grammy's House	225 Laurel St.	\N	Rehoboth Beach	Delaware	19971	USA
f8110dc5-7515-41a8-a0e6-21f55daf7e86	Mom & Dad's	146 Canon Dr.	\N	Santa Barbara	California	93105	USA
153fe813-c223-4331-9210-68964cf18103	Schoen Cabin	40 Clark Point Rd.		Bernard	Maine	04612	USA
\.


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: stephengallivan
--

COPY public.owner (owner_id, f_name, l_name, email) FROM stdin;
78c96b8f-bc81-4b76-9a32-0fd3354b28d9	Stephen	Gallivan	sgallivan13@gmail.com
c08aa0c2-9232-4d1d-ac03-0e9d81479b9d	Cheyenne	Gallivan	cheyenne.shoen@gmail.com
9cd14030-8d2e-40f8-91e4-af820b83f29c	Andrew	Gallivan	andrewt.gallivan@gmail.com
\.


--
-- Name: clothing clothing_pkey; Type: CONSTRAINT; Schema: public; Owner: stephengallivan
--

ALTER TABLE ONLY public.clothing
    ADD CONSTRAINT clothing_pkey PRIMARY KEY (item_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: stephengallivan
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: stephengallivan
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (owner_id);


--
-- Name: clothing clothing_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stephengallivan
--

ALTER TABLE ONLY public.clothing
    ADD CONSTRAINT clothing_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON DELETE CASCADE;


--
-- Name: clothing clothing_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stephengallivan
--

ALTER TABLE ONLY public.clothing
    ADD CONSTRAINT clothing_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owner(owner_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

