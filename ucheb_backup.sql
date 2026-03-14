--
-- PostgreSQL database dump
--

\restrict cyaRRt9ij3sV2FRAdiNEkL9fnHDVxzympC6ncN8ZHoGBaW4cgzbqGAsiHQ1ewr8

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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
-- Name: materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    stockquantity integer NOT NULL
);


ALTER TABLE public.materials OWNER TO postgres;

--
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- Name: productcomposition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcomposition (
    id integer NOT NULL,
    productid integer NOT NULL,
    materialid integer NOT NULL,
    materialquantity integer NOT NULL
);


ALTER TABLE public.productcomposition OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    coefficient numeric(4,2) NOT NULL,
    defectpercentage numeric(4,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    partnerid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materials (id, name, stockquantity) FROM stdin;
1	Материал 1	2500
2	Материал 2	2500
3	Материал 3	2500
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, name) FROM stdin;
1	Партнер 1
2	Партнер 2
3	Партнер 3
\.


--
-- Data for Name: productcomposition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productcomposition (id, productid, materialid, materialquantity) FROM stdin;
1	1	1	2
2	1	2	1
3	2	2	3
4	2	3	2
5	3	1	4
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, coefficient, defectpercentage) FROM stdin;
1	Продукт A	1.20	5.00
2	Продукт B	1.50	10.00
3	Продукт C	1.00	8.00
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (id, partnerid, productid, quantity) FROM stdin;
1	1	1	100
2	1	2	50
3	2	1	200
4	1	1	300
5	2	2	200
\.


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: productcomposition productcomposition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcomposition
    ADD CONSTRAINT productcomposition_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- Name: productcomposition productcomposition_materialid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcomposition
    ADD CONSTRAINT productcomposition_materialid_fkey FOREIGN KEY (materialid) REFERENCES public.materials(id);


--
-- Name: productcomposition productcomposition_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcomposition
    ADD CONSTRAINT productcomposition_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(id);


--
-- Name: sales sales_partnerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_partnerid_fkey FOREIGN KEY (partnerid) REFERENCES public.partners(id);


--
-- Name: sales sales_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

\unrestrict cyaRRt9ij3sV2FRAdiNEkL9fnHDVxzympC6ncN8ZHoGBaW4cgzbqGAsiHQ1ewr8

