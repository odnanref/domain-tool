--
-- PostgreSQL database dump
--

\c domaintool;

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: domain_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domain_info (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    registrar character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    transfer_to character varying(255),
    last_check timestamp without time zone NOT NULL,
    spf character varying(255),
    dmarc character varying(255),
    nameservers text,
    tier character varying(254),
    whois character varying(254),
    status boolean
);


ALTER TABLE public.domain_info OWNER TO postgres;

--
-- Name: domain_info_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domain_info_history (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    registrar character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    tier character varying(255) NOT NULL,
    transfer_to character varying(255),
    last_check timestamp without time zone NOT NULL,
    spf character varying(255),
    dmarc character varying(255),
    nameservers text,
    whois character varying(254),
    status boolean
);


ALTER TABLE public.domain_info_history OWNER TO postgres;

--
-- Name: domain_info_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domain_info_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.domain_info_history_id_seq OWNER TO postgres;

--
-- Name: domain_info_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domain_info_history_id_seq OWNED BY public.domain_info_history.id;


--
-- Name: domain_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domain_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.domain_info_id_seq OWNER TO postgres;

--
-- Name: domain_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domain_info_id_seq OWNED BY public.domain_info.id;


--
-- Name: domain_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_info ALTER COLUMN id SET DEFAULT nextval('public.domain_info_id_seq'::regclass);


--
-- Name: domain_info_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_info_history ALTER COLUMN id SET DEFAULT nextval('public.domain_info_history_id_seq'::regclass);


--
-- Data for Name: domain_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domain_info (id, name, registrar, state, transfer_to, last_check, spf, dmarc, nameservers, tier) FROM stdin;
660	joumya.com	MarkMonitor	locked		2024-06-28 12:13:30.594099	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
559	jumiaone.com.ng	MarkMonitor	locked		2024-06-28 12:13:31.10801	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
662	joumya.ma	MarkMonitor	locked		2024-06-28 12:13:31.278162	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
645	djoumia.ng	MarkMonitor	locked		2024-06-28 12:13:31.412327	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
647	djumia.com	MarkMonitor	locked		2024-06-28 12:13:31.671522	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
646	djoumia.org	MarkMonitor	locked		2024-06-28 12:13:31.846169	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
565	jumiapay.co.ug	MarkMonitor	locked		2024-06-28 12:13:32.327917	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
648	djumia.com.ng	MarkMonitor	locked		2024-06-28 12:13:32.854227	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
663	joumya.net	MarkMonitor	locked		2024-06-28 12:13:32.985872	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
650	djumia.net	MarkMonitor	locked		2024-06-28 12:13:33.238431	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns6.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns5.markmonitor.com., ns7.markmonitor.com.	missword
651	djumia.ng	MarkMonitor	locked		2024-06-28 12:13:33.427194	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
643	djoumia.ma	MarkMonitor	locked		2024-06-28 12:13:33.605282	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
653	highlife.africa	MarkMonitor	locked		2024-06-28 12:13:33.762542	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
666	juima.ma	MarkMonitor	locked		2024-06-28 12:13:33.916813	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
656	joumia.ma	MarkMonitor	locked		2024-06-28 12:13:34.054551	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
642	djoumia.com.ng	MarkMonitor	locked		2024-06-28 12:13:34.321066	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
657	joumia.net	MarkMonitor	locked		2024-06-28 12:13:34.521485	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
669	jumia1.ci	MarkMonitor	locked		2024-06-28 12:13:34.713967	v=spf1 -all	v=DMARC1; p=reject	, ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns6.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com.	missword
672	jumia1.co.ke	MarkMonitor	locked		2024-06-28 12:13:35.349661	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
659	joumia.org	MarkMonitor	locked		2024-06-28 12:13:35.515266	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
661	joumya.com.ng	MarkMonitor	locked		2024-06-28 12:13:35.706047	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
556	jumiaone.cm	MarkMonitor	locked		2024-06-28 12:13:35.866466	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
641	djoumia.com	MarkMonitor	locked		2024-06-28 12:13:36.0205	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns5.markmonitor.com., ns7.markmonitor.com.	missword
592	jumiatravel.ug	MarkMonitor	locked		2024-06-28 12:13:36.160491	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
644	djoumia.net	MarkMonitor	locked		2024-06-28 12:13:36.342609	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
558	jumiaone.com	MarkMonitor	locked		2024-06-28 12:13:30.471732	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
658	joumia.ng	MarkMonitor	locked		2024-06-28 12:13:37.309583	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com.	missword
649	djumia.ma	MarkMonitor	locked		2024-06-28 12:13:36.615375	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com.	missword
553	jumiamarket.tn	#N/A	locked		2024-06-28 12:13:38.058794		v=DMARC1; p=reject	, ns1.is-fun.net., ns2.is-fun.net.	tier_3
665	joumya.org	MarkMonitor	locked		2024-06-28 12:13:37.429664	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
655	joumia.com.ng	MarkMonitor	locked		2024-06-28 12:13:36.816128	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com.	missword
664	joumya.ng	MarkMonitor	locked		2024-06-28 12:13:37.621277	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
668	jumai.ma	MarkMonitor	locked		2024-06-28 12:13:38.245119	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
652	djumia.org	MarkMonitor	locked		2024-06-28 12:13:38.409779	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
654	joumia.com	MarkMonitor	locked		2024-06-28 12:13:36.992283	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
670	jumia1.cm	MarkMonitor	locked		2024-06-28 12:13:37.746376	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
554	jumianow.com	MarkMonitor	locked		2024-06-28 12:13:37.132695	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
671	jumia1.com.ng	MarkMonitor	locked		2024-06-28 12:13:41.517508	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
667	juima.ng	MarkMonitor	locked		2024-06-28 12:13:37.902162	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns3.markmonitor.com., ns2.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.	missword
531	jumiago.com	MarkMonitor	locked		2024-06-28 12:13:39.095256	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
674	jumia1.ma	MarkMonitor	locked		2024-06-28 12:13:39.260422	v=spf1 -all	v=DMARC1; p=reject	, ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
686	jumya.ng	MarkMonitor	locked		2024-06-28 12:13:39.448355	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
687	jumya.org	MarkMonitor	locked		2024-06-28 12:13:39.745837	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
439	jumia-travel.ug	MarkMonitor	locked		2024-06-28 12:13:40.252773				tier_3
677	jummia.ma	MarkMonitor	locked		2024-06-28 12:13:40.453907	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns3.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.	missword
430	jumia-travel.ci	MarkMonitor	locked		2024-06-28 12:13:40.68355				tier_3
678	jummia.ng	MarkMonitor	locked		2024-06-28 12:13:41.061901	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
428	blackfriday.com.ng	MarkMonitor	locked		2024-06-28 12:13:41.467572	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
673	jumia1.com.ng	MarkMonitor	locked		2024-06-28 12:13:41.517508	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
676	jumiya.ng	MarkMonitor	locked		2024-06-28 12:13:38.88482	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
431	jumia-travel.cm	MarkMonitor	locked		2024-06-28 12:13:41.744518			, bob.ns.cloudflare.com., dana.ns.cloudflare.com.	tier_3
682	jumuia.ng	MarkMonitor	locked		2024-06-28 12:13:41.945793	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
448	jumia.ci	MarkMonitor	locked		2024-06-28 12:13:42.118005	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-103.awsdns-12.com., ns-1256.awsdns-29.org., ns-1969.awsdns-54.co.uk., ns-687.awsdns-21.net.	tier_1
526	jumiafood.com.gh	#N/A	locked		2024-06-28 12:13:42.262243			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
440	jumia.ae	MarkMonitor	locked		2024-06-28 12:13:42.733917				tier_1
432	jumia-travel.co.ke	MarkMonitor	locked		2024-06-28 12:13:48.95195				tier_3
527	jumiafood.com.ng	MarkMonitor	locked		2024-06-28 12:13:49.523935			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
528	jumiafood.ma	MarkMonitor	locked		2024-06-28 12:13:49.658012			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
680	jumuia.com.ng	MarkMonitor	locked		2024-06-28 12:13:49.925695	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
433	jumia-travel.co.tz	MarkMonitor	locked		2024-06-28 12:13:50.036903	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
529	jumiafood.rw	MarkMonitor	locked		2024-06-28 12:13:50.197224			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
441	jumia.africa	MarkMonitor	locked		2024-06-28 12:13:50.344787	v=spf1 -all	v=DMARC1; p=reject;	, ns-148.awsdns-18.com., ns-1481.awsdns-57.org., ns-1576.awsdns-05.co.uk., ns-534.awsdns-02.net.	tier_1
434	jumia-travel.co.ug	MarkMonitor	locked		2024-06-28 12:13:50.752366				tier_3
435	jumia-travel.com	MarkMonitor	locked		2024-06-28 12:13:50.845615	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
442	jumia.bf	is-fun	locked		2024-06-28 12:13:50.993256	v=spf1 -all	v=DMARC1; p=reject;	, ns-1417.awsdns-49.org., ns-1865.awsdns-41.co.uk., ns-411.awsdns-51.com., ns-622.awsdns-13.net.	tier_1
436	jumia-travel.com.gh	#N/A	locked		2024-06-28 12:13:51.227146				tier_3
450	jumia.co.ao	is-fun	locked		2024-06-28 12:13:51.374851	v=spf1 -all	v=DMARC1; p=reject;	, ns-1195.awsdns-21.org., ns-1554.awsdns-02.co.uk., ns-342.awsdns-42.com., ns-604.awsdns-11.net.	tier_3
444	jumia.biz	MarkMonitor	locked		2024-06-28 12:13:51.515795	v=spf1 -all	v=DMARC1; p=reject;	, ns-1511.awsdns-60.org., ns-1631.awsdns-11.co.uk., ns-226.awsdns-28.com., ns-957.awsdns-55.net.	tier_1
445	jumia.bj	MarkMonitor	locked		2024-06-28 12:13:51.793648	v=spf1 -all	v=DMARC1; p=reject;	, ns-1090.awsdns-08.org., ns-1574.awsdns-04.co.uk., ns-488.awsdns-61.com., ns-583.awsdns-08.net.	tier_1
684	jumya.ma	MarkMonitor	locked		2024-06-28 12:13:52.004364	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.	missword
596	techinporto.com	#N/A	locked		2024-06-28 12:13:52.615524				tier_3
447	jumia.cg	is-fun	locked		2024-06-28 12:13:52.735343	v=spf1 -all	v=DMARC1; p=reject;	, ns-117.awsdns-14.com., ns-1327.awsdns-37.org., ns-1749.awsdns-26.co.uk., ns-892.awsdns-47.net.	tier_1
437	jumia-travel.com.ng	MarkMonitor	locked		2024-06-28 12:13:53.476109	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
438	jumia-travel.sn	MarkMonitor	locked		2024-06-28 12:13:53.681649				tier_3
675	jumiya.ma	MarkMonitor	locked		2024-06-28 12:13:53.814851	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
685	jumya.net	MarkMonitor	locked		2024-06-28 12:13:41.645275	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
537	jumiahouse.co.tz	MarkMonitor	locked		2024-06-28 12:13:54.129717	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
539	jumiahouse.ug	MarkMonitor	locked		2024-06-28 12:13:54.357848	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
542	jumiamarket.cm	MarkMonitor	locked		2024-06-28 12:13:54.485169	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
544	jumiamarket.co.mz	MarkMonitor	locked		2024-06-28 12:13:54.651692	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
546	jumiamarket.co.ug	MarkMonitor	locked		2024-06-28 12:13:55.117772	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
548	jumiamarket.com.gh	#N/A	locked		2024-06-28 12:13:55.572274				tier_3
550	jumiamarket.ga	MarkMonitor	locked		2024-06-28 12:13:55.701633	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
552	jumiamarket.sn	MarkMonitor	locked		2024-06-28 12:13:55.881553	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
560	jumiaone.ma	MarkMonitor	locked		2024-06-28 12:13:56.004092	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
561	jumiapay.ci	MarkMonitor	locked		2024-06-28 12:13:56.147356	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns7.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com., ns6.markmonitor.com.	tier_1
563	jumiapay.co.ke	MarkMonitor	locked		2024-06-28 12:13:56.805462	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com.	tier_1
566	jumiapay.com.gh	#N/A	locked		2024-06-28 12:13:57.343711				tier_1
567	jumiapay.com.ng	MarkMonitor	locked		2024-06-28 12:13:57.689177			, jonah.ns.cloudflare.com., lia.ns.cloudflare.com.	tier_1
569	jumiapay.ng	MarkMonitor	locked		2024-06-28 12:13:58.006471	v=spf1 include:_realspf1.jumia.com -all		, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
571	jumiapay.tn	#N/A	locked		2024-06-28 12:13:58.473356				tier_1
572	jumiapop.cm	#N/A	locked		2024-06-28 12:13:58.985119				tier_3
577	jumiaservices.co.ao	is-fun	locked		2024-06-28 12:13:59.155798	v=spf1 -all		, ns2.is-fun.net., ns1.is-fun.net.	tier_3
579	jumiaservices.com	MarkMonitor	locked		2024-06-28 12:13:59.378915			, ns-104.awsdns-13.com., ns-1463.awsdns-54.org., ns-1745.awsdns-26.co.uk., ns-765.awsdns-31.net.	tier_3
582	jumiaservices.ug	MarkMonitor	locked		2024-06-28 12:13:59.613269	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com.	tier_3
583	jumiatravel.ci	MarkMonitor	locked		2024-06-28 12:13:59.723353	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
585	jumiatravel.co.ke	MarkMonitor	locked		2024-06-28 12:14:00.056775	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
587	jumiatravel.co.ug	MarkMonitor	locked		2024-06-28 12:14:00.381956				tier_3
588	jumiatravel.com	MarkMonitor	locked		2024-06-28 12:14:00.478022	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
589	jumiatravel.com.gh	#N/A	locked		2024-06-28 12:14:01.155991				tier_3
591	jumiatravel.sn	MarkMonitor	locked		2024-06-28 12:14:01.296305			, bob.ns.cloudflare.com., dana.ns.cloudflare.com.	tier_3
593	jumiatravels.com	MarkMonitor	locked		2024-06-28 12:14:01.426587	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
598	jovago.com	MarkMonitor	locked		2024-06-28 12:14:01.544056	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
599	jovago.bf	#N/A	locked		2024-06-28 12:14:01.801859				tier_3
601	jovago.dj	#N/A	locked		2024-06-28 12:14:01.926918	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
602	jovago.ne	#N/A	locked		2024-06-28 12:14:02.114317				tier_3
603	carmudi.com.zm	#N/A	locked		2024-06-28 12:14:02.853918				tier_3
604	darazpay.pk	#N/A	locked		2024-06-28 12:14:03.263683				tier_3
606	hellofood.cd	#N/A	locked		2024-06-28 12:14:03.363066	v=spf1 ip4:217.110.53.72 include:_spf.google.com ~all		, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_3
608	daraz.mobi	#N/A	locked		2024-06-28 12:14:03.569877			, ns2.101domain.com., ns5.101domain.com., ns1.101domain.com.	tier_3
609	dazlogistics.com.bd	#N/A	locked		2024-06-28 12:14:04.415865			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
611	dazlogistics.pk	#N/A	locked		2024-06-28 12:14:04.955108			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
612	dex.com.pk	#N/A	locked		2024-06-28 12:14:06.172898			, ns7.alidns.com., ns8.alidns.com.	tier_3
525	jumiafood.com	MarkMonitor	locked		2024-06-28 12:14:06.348289			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
573	jumiapop.com	MarkMonitor	locked		2024-06-28 12:14:06.894659				tier_3
532	jumiahomes.co.zw	#N/A	locked		2024-06-28 12:14:07.708377				tier_3
534	jumiahotels.com	MarkMonitor	locked		2024-06-28 12:13:53.906862	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
463	jumia.co.zw	is-fun	locked		2024-06-28 12:14:08.012995	v=spf1 -all	v=DMARC1; p=reject;	, ns-1218.awsdns-24.org., ns-143.awsdns-17.com., ns-1832.awsdns-37.co.uk., ns-548.awsdns-04.net.	tier_3
683	jumya.com.ng	MarkMonitor	locked		2024-06-28 12:14:08.264806	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
474	jumia.cv	is-fun	locked		2024-06-28 12:14:08.729875				tier_1
468	jumia.com.gh	is-fun	locked		2024-06-28 12:14:08.849818	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1392.awsdns-46.org., ns-158.awsdns-19.com., ns-1584.awsdns-06.co.uk., ns-621.awsdns-13.net.	tier_1
460	jumia.co.ug	MarkMonitor	locked		2024-06-28 12:14:09.447714	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1389.awsdns-45.org., ns-1860.awsdns-40.co.uk., ns-279.awsdns-34.com., ns-745.awsdns-29.net.	tier_1
464	jumia.com	MarkMonitor	locked		2024-06-28 12:14:09.51097	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; fo=1;	, ns-1076.awsdns-06.org., ns-1942.awsdns-50.co.uk., ns-64.awsdns-08.com., ns-879.awsdns-45.net.	tier_1
478	jumia.fr	MarkMonitor	locked		2024-06-28 12:14:09.648114	v=spf1 -all	v=DMARC1; p=reject;	, ns-1180.awsdns-19.org., ns-1570.awsdns-04.co.uk., ns-199.awsdns-24.com., ns-778.awsdns-33.net.	tier_1
461	jumia.co.uk	MarkMonitor	locked		2024-06-28 12:14:09.787222	v=spf1 -all	v=DMARC1; p=reject;	, ns-1386.awsdns-45.org., ns-1933.awsdns-49.co.uk., ns-279.awsdns-34.com., ns-821.awsdns-38.net.	tier_1
472	jumia.com.ng	MarkMonitor	locked		2024-06-28 12:14:09.993812	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1302.awsdns-34.org., ns-1660.awsdns-15.co.uk., ns-263.awsdns-32.com., ns-682.awsdns-21.net.	tier_1
465	jumia.com.cm	MarkMonitor	locked		2024-06-28 12:14:10.190232	v=spf1 -all	v=DMARC1; p=reject;	, ns-1481.awsdns-57.org., ns-1838.awsdns-37.co.uk., ns-362.awsdns-45.com., ns-548.awsdns-04.net.	tier_3
462	jumia.co.za	MarkMonitor	locked		2024-06-28 12:14:10.357669	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1355.awsdns-41.org., ns-1586.awsdns-06.co.uk., ns-17.awsdns-02.com., ns-769.awsdns-32.net.	tier_1
469	jumia.com.ly	MarkMonitor	locked		2024-06-28 12:14:10.577515	v=spf1 -all	v=DMARC1; p=reject;	, ns-1298.awsdns-34.org., ns-1699.awsdns-20.co.uk., ns-385.awsdns-48.com., ns-571.awsdns-07.net.	tier_3
481	jumia.info	MarkMonitor	locked		2024-06-28 12:14:10.715793	v=spf1 -all	v=DMARC1; p=reject;	, ns-1493.awsdns-58.org., ns-1602.awsdns-08.co.uk., ns-504.awsdns-63.com., ns-668.awsdns-19.net.	tier_1
475	jumia.dj	is-fun	locked		2024-06-28 12:14:10.91536	v=spf1 -all	v=DMARC1; p=reject;	, ns-1316.awsdns-36.org., ns-1616.awsdns-10.co.uk., ns-404.awsdns-50.com., ns-991.awsdns-59.net.	tier_1
466	jumia.com.eg	#N/A	locked		2024-06-28 12:14:11.060677	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1116.awsdns-11.org., ns-1993.awsdns-57.co.uk., ns-341.awsdns-42.com., ns-613.awsdns-12.net.	tier_1
470	jumia.com.mu	MarkMonitor	locked		2024-06-28 12:14:13.933941	v=spf1 -all	v=DMARC1; p=reject;	, ns-1020.awsdns-63.net., ns-1400.awsdns-47.org., ns-1588.awsdns-06.co.uk., ns-231.awsdns-28.com.	tier_3
473	jumia.com.tn	is-fun	locked		2024-06-28 12:14:14.100859	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1456.awsdns-54.org., ns-2038.awsdns-62.co.uk., ns-233.awsdns-29.com., ns-934.awsdns-52.net.	tier_1
467	jumia.com.et	is-fun	locked		2024-06-28 12:14:14.567292	v=spf1 -all	v=DMARC1; p=reject;	, ns-1221.awsdns-24.org., ns-1900.awsdns-45.co.uk., ns-345.awsdns-43.com., ns-919.awsdns-50.net.	tier_3
477	jumia.es	is-fun	locked		2024-06-28 12:14:14.728473	v=spf1 -all	v=DMARC1; p=reject;	, ns-1465.awsdns-55.org., ns-1879.awsdns-42.co.uk., ns-405.awsdns-50.com., ns-562.awsdns-06.net.	tier_1
483	jumia.is	MarkMonitor	locked		2024-06-28 12:14:14.861095	v=spf1 -all	v=DMARC1; p=reject;	, ns-117.awsdns-14.com., ns-1475.awsdns-56.org., ns-1944.awsdns-51.co.uk., ns-937.awsdns-53.net.	tier_1
471	jumia.com.na	MarkMonitor	locked		2024-06-28 12:14:15.02718	v=spf1 -all	v=DMARC1; p=reject;	, ns-1020.awsdns-63.net., ns-1240.awsdns-27.org., ns-1696.awsdns-20.co.uk., ns-499.awsdns-62.com.	tier_3
480	jumia.gw	is-fun	locked		2024-06-28 12:14:15.192069	v=spf1 -all	v=DMARC1; p=reject;	, ns-1506.awsdns-60.org., ns-1723.awsdns-23.co.uk., ns-285.awsdns-35.com., ns-519.awsdns-00.net.	tier_1
476	jumia.dz	MarkMonitor	locked		2024-06-28 12:14:15.34446	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1047.awsdns-02.org., ns-1670.awsdns-16.co.uk., ns-337.awsdns-42.com., ns-873.awsdns-45.net.	tier_1
479	jumia.ga	MarkMonitor	locked		2024-06-28 12:14:15.511976	v=spf1 -all	v=DMARC1; p=reject;	, ns-1288.awsdns-33.org., ns-1550.awsdns-01.co.uk., ns-762.awsdns-31.net., ns-87.awsdns-10.com.	tier_1
482	jumia.io	MarkMonitor	locked		2024-06-28 12:14:15.651766	v=spf1 -all	v=DMARC1; p=reject;	, ns-1436.awsdns-51.org., ns-1634.awsdns-12.co.uk., ns-401.awsdns-50.com., ns-892.awsdns-47.net.	tier_1
484	jumia.it	MarkMonitor	locked		2024-06-28 12:14:15.776245	v=spf1 -all	v=DMARC1; p=reject;	, ns-1189.awsdns-20.org., ns-1860.awsdns-40.co.uk., ns-622.awsdns-13.net., ns-94.awsdns-11.com.	tier_1
679	jumuia.co.ke	MarkMonitor	locked		2024-06-28 12:14:16.193587	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns2.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.	missword
429	blackfriday.ng	MarkMonitor	locked		2024-06-28 12:14:16.398479	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
681	jumuia.ma	MarkMonitor	locked		2024-06-28 12:14:07.894702	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	missword
578	jumiaservices.co.ke	MarkMonitor	locked		2024-06-28 12:14:17.054464	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
449	jumia.cm	MarkMonitor	locked		2024-06-28 12:14:18.208948	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;	, ns-1532.awsdns-63.org., ns-1979.awsdns-55.co.uk., ns-198.awsdns-24.com., ns-834.awsdns-40.net.	tier_1
443	jumia.bi	MarkMonitor	locked		2024-06-28 12:14:19.600375	v=spf1 -all	v=DMARC1; p=reject;	, ns-1205.awsdns-22.org., ns-1895.awsdns-44.co.uk., ns-694.awsdns-22.net., ns-73.awsdns-09.com.	tier_1
584	jumiatravel.cm	MarkMonitor	locked		2024-06-28 12:14:18.351608	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
595	jumiaworld.com	MarkMonitor	locked		2024-06-28 12:14:17.209635	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
575	jumiaservices.ci	MarkMonitor	locked		2024-06-28 12:14:18.787315	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
576	jumiaservices.cm	MarkMonitor	locked		2024-06-28 12:14:19.950789	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.	tier_3
580	jumiaservices.ma	MarkMonitor	locked		2024-06-28 12:14:17.419457	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com.	tier_3
530	jumiafood.sn	MarkMonitor	locked		2024-06-28 12:14:19.104271	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_2
594	jumiatrip.com	MarkMonitor	locked		2024-06-28 12:14:20.039557	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
574	jumiaproductionservices.ci	MarkMonitor	locked		2024-06-28 12:14:17.588913	v=spf1 -all	v=DMARC1; p=reject;	, ns-1293.awsdns-33.org., ns-1590.awsdns-06.co.uk., ns-228.awsdns-28.com., ns-656.awsdns-18.net.	tier_3
446	jumia.cd	MarkMonitor	locked		2024-06-28 12:14:20.254318	v=spf1 -all	v=DMARC1; p=reject;	, ns-1001.awsdns-61.net., ns-1361.awsdns-42.org., ns-1831.awsdns-36.co.uk., ns-54.awsdns-06.com.	tier_1
586	jumiatravel.co.tz	MarkMonitor	locked		2024-06-28 12:14:19.211366	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
581	jumiaservices.ng	MarkMonitor	locked		2024-06-28 12:14:18.066158	v=spf1 -all	v=DMARC1; p=reject	, ns3.markmonitor.com., ns2.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
600	jovago.cd	#N/A	locked		2024-06-28 12:14:20.445417	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
610	dazlogistics.lk	#N/A	locked		2024-06-28 12:14:21.432467			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
613	dfg.com.pk	#N/A	locked		2024-06-28 12:14:22.044978			, ns2.101domain.com., ns5.101domain.com., ns1.101domain.com.	tier_3
541	jumiamarket.ci	MarkMonitor	locked		2024-06-28 12:14:22.313466	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
533	jumiahotel.com	MarkMonitor	locked		2024-06-28 12:14:22.429296	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
535	jumiahouse.cm	MarkMonitor	locked		2024-06-28 12:14:23.234136	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
536	jumiahouse.co.ke	MarkMonitor	locked		2024-06-28 12:14:23.855882	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
486	jumia.ly	MarkMonitor	locked		2024-06-28 12:14:24.19603	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject;  rua=mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1039.awsdns-01.org., ns-1610.awsdns-09.co.uk., ns-538.awsdns-03.net., ns-80.awsdns-10.com.	tier_3
489	jumia.marketing	MarkMonitor	locked		2024-06-28 12:14:24.861824	v=spf1 -all		, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
491	jumia.mobi	MarkMonitor	locked		2024-06-28 12:14:25.067478	v=spf1 -all	v=DMARC1; p=reject;	, ns-1407.awsdns-47.org., ns-1652.awsdns-14.co.uk., ns-338.awsdns-42.com., ns-970.awsdns-57.net.	tier_1
493	jumia.mu	MarkMonitor	locked		2024-06-28 12:14:25.423079	v=spf1 -all	v=DMARC1; p=reject;	, ns-1088.awsdns-08.org., ns-1634.awsdns-12.co.uk., ns-379.awsdns-47.com., ns-754.awsdns-30.net.	tier_1
497	jumia.ng	MarkMonitor	locked		2024-06-28 12:14:25.593118	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject; rua=mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1232.awsdns-26.org., ns-1709.awsdns-21.co.uk., ns-94.awsdns-11.com., ns-970.awsdns-57.net.	tier_1
499	jumia.rw	MarkMonitor	locked		2024-06-28 12:14:26.043925	v=spf1 -all	v=DMARC1; p=reject;	, ns-1421.awsdns-49.org., ns-1666.awsdns-16.co.uk., ns-742.awsdns-28.net., ns-90.awsdns-11.com.	tier_3
501	jumia.sd	MarkMonitor	locked		2024-06-28 12:14:26.235755	v=spf1 -all	v=DMARC1; p=reject;	, ns-1009.awsdns-62.net., ns-1484.awsdns-57.org., ns-1796.awsdns-32.co.uk., ns-396.awsdns-49.com.	tier_1
504	jumia.sl	is-fun	locked		2024-06-28 12:14:26.620227	v=spf1 -all	v=DMARC1; p=reject;	, ns-1035.awsdns-01.org., ns-1694.awsdns-19.co.uk., ns-184.awsdns-23.com., ns-554.awsdns-05.net.	tier_3
538	jumiahouse.ma	MarkMonitor	locked		2024-06-28 12:14:26.807283	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
590	jumiatravel.com.ng	MarkMonitor	locked		2024-06-28 12:14:27.551637	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
605	hellofood.co.za	#N/A	locked		2024-06-28 12:14:27.841324	v=spf1 ip4:217.110.53.72 include:_spf.google.com ~all		, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_3
607	daraz.la	#N/A	locked		2024-06-28 12:14:28.24256			, NS1.101DOMAIN.COM., NS2.101DOMAIN.COM., NS5.101DOMAIN.COM.	tier_3
540	jumiajobs.cm	MarkMonitor	locked		2024-06-28 12:14:28.569077	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
543	jumiamarket.co.ke	MarkMonitor	locked		2024-06-28 12:14:29.059847	v=spf1 -all	v=DMARC1; p=reject	, ns3.markmonitor.com., ns1.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns6.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.	tier_3
545	jumiamarket.co.tz	MarkMonitor	locked		2024-06-28 12:14:29.279115	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
547	jumiamarket.com	MarkMonitor	locked		2024-06-28 12:14:29.829878	v=spf1 -all	v=DMARC1; p=reject	, ns4.markmonitor.com., ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com., ns6.markmonitor.com., ns5.markmonitor.com.	tier_3
549	jumiamarket.com.ng	MarkMonitor	locked		2024-06-28 12:14:30.3428	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com.	tier_3
551	jumiamarket.ma	MarkMonitor	locked		2024-06-28 12:14:30.548151	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
555	jumiaone.ci	MarkMonitor	locked		2024-06-28 12:14:30.706871	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
557	jumiaone.co.ke	MarkMonitor	locked		2024-06-28 12:14:31.363853	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
562	jumiapay.cm	MarkMonitor	locked		2024-06-28 12:14:31.530426	v=spf1 -all	v=DMARC1; p=reject	, ns5.markmonitor.com., ns7.markmonitor.com., ns6.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com.	tier_3
564	jumiapay.co.tz	MarkMonitor	locked		2024-06-28 12:14:31.865034	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
597	jovago.net	MarkMonitor	locked		2024-06-28 12:14:20.351424	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
490	jumia.mg	MarkMonitor	locked		2024-06-28 12:14:33.070047	v=spf1 -all	v=DMARC1; p=reject;	, ns-1105.awsdns-10.org., ns-1772.awsdns-29.co.uk., ns-221.awsdns-27.com., ns-525.awsdns-01.net.	tier_1
496	jumia.net	MarkMonitor	locked		2024-06-28 12:14:35.864546	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1062.awsdns-04.org., ns-17.awsdns-02.com., ns-1878.awsdns-42.co.uk., ns-844.awsdns-41.net.	tier_1
494	jumia.mw	MarkMonitor	locked		2024-06-28 12:14:34.629017	v=spf1 -all	v=DMARC1; p=reject;	, ns-1149.awsdns-15.org., ns-1628.awsdns-11.co.uk., ns-395.awsdns-49.com., ns-671.awsdns-19.net.	tier_3
500	jumia.sc	MarkMonitor	locked		2024-06-28 12:14:33.39187	v=spf1 -all	v=DMARC1; p=reject;	, ns-1500.awsdns-59.org., ns-1754.awsdns-27.co.uk., ns-439.awsdns-54.com., ns-910.awsdns-49.net.	tier_3
485	jumia.ke	MarkMonitor	locked		2024-06-28 12:14:35.012851	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-131.awsdns-16.com., ns-1328.awsdns-38.org., ns-1571.awsdns-04.co.uk., ns-699.awsdns-23.net.	tier_1
568	jumiapay.ma	MarkMonitor	locked		2024-06-28 12:14:33.636967	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
503	jumia.sh	MarkMonitor	locked		2024-06-28 12:14:35.347939	v=spf1 -all	v=DMARC1; p=reject;	, ns-1226.awsdns-25.org., ns-1598.awsdns-07.co.uk., ns-333.awsdns-41.com., ns-594.awsdns-10.net.	tier_3
487	jumia.ma	MarkMonitor	locked		2024-06-28 12:14:35.47515	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1505.awsdns-60.org., ns-1963.awsdns-53.co.uk., ns-447.awsdns-55.com., ns-596.awsdns-10.net.	tier_1
492	jumia.mr	is-fun	locked		2024-06-28 12:14:34.091416	v=spf1 -all	v=DMARC1; p=reject;	, ns-1455.awsdns-53.org., ns-1878.awsdns-42.co.uk., ns-231.awsdns-28.com., ns-777.awsdns-33.net.	tier_1
502	jumia.services	MarkMonitor	locked		2024-06-28 12:14:34.255544			, ns-1062.awsdns-04.org., ns-148.awsdns-18.com., ns-1849.awsdns-39.co.uk., ns-716.awsdns-25.net.	tier_1
488	jumia.market	MarkMonitor	locked		2024-06-28 12:14:32.146465	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
495	jumia.ne	MarkMonitor	locked		2024-06-28 12:14:35.693766	v=spf1 -all	v=DMARC1; p=reject;	, ns-1452.awsdns-53.org., ns-1952.awsdns-52.co.uk., ns-291.awsdns-36.com., ns-794.awsdns-35.net.	tier_3
570	jumiapay.sn	MarkMonitor	locked		2024-06-28 12:14:34.482813	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_1
498	jumia.re	MarkMonitor	locked		2024-06-28 12:14:32.452082	v=spf1 -all	v=DMARC1; p=reject;	, ns-118.awsdns-14.com., ns-1417.awsdns-49.org., ns-1805.awsdns-33.co.uk., ns-823.awsdns-38.net.	tier_1
516	jumiacars.sn	MarkMonitor	locked		2024-06-28 12:14:36.705164	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
513	jumiacars.cm	MarkMonitor	locked		2024-06-28 12:14:37.500997	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
459	jumia.co.tz	MarkMonitor	locked		2024-06-28 12:14:38.588761	v=spf1 -all	v=DMARC1; p=reject;	, ns-1451.awsdns-53.org., ns-1649.awsdns-14.co.uk., ns-346.awsdns-43.com., ns-947.awsdns-54.net.	tier_3
522	jumiafood.co.ke	MarkMonitor	locked		2024-06-28 12:14:38.826316			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
453	jumia.co.ke	MarkMonitor	locked		2024-06-28 12:14:38.298016	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1111.awsdns-10.org., ns-2012.awsdns-59.co.uk., ns-328.awsdns-41.com., ns-650.awsdns-17.net.	tier_1
454	jumia.co.ls	MarkMonitor	locked		2024-06-28 12:14:39.036708	v=spf1 -all	v=DMARC1; p=reject;	, ns-1209.awsdns-23.org., ns-145.awsdns-18.com., ns-1942.awsdns-50.co.uk., ns-665.awsdns-19.net.	tier_1
521	jumiafood.ci	MarkMonitor	locked		2024-06-28 12:14:39.515808	v=spf1 -all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_2
510	jumia.tv	MarkMonitor	locked		2024-06-28 12:14:40.934004	v=spf1 -all	v=DMARC1; p=reject;	, ns-1009.awsdns-62.net., ns-116.awsdns-14.com., ns-1476.awsdns-56.org., ns-1538.awsdns-00.co.uk.	tier_3
505	jumia.sn	MarkMonitor	locked		2024-06-28 12:14:39.180405	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1392.awsdns-46.org., ns-165.awsdns-20.com., ns-1779.awsdns-30.co.uk., ns-809.awsdns-37.net.	tier_1
507	jumia.td	MarkMonitor	locked		2024-06-28 12:14:45.197553	v=spf1 -all	v=DMARC1; p=reject;	, ns-1461.awsdns-54.org., ns-1613.awsdns-09.co.uk., ns-191.awsdns-23.com., ns-548.awsdns-04.net.	tier_3
455	jumia.co.mg	MarkMonitor	locked		2024-06-28 12:14:40.770918	v=spf1 -all	v=DMARC1; p=reject;	, ns-1519.awsdns-61.org., ns-1608.awsdns-09.co.uk., ns-283.awsdns-35.com., ns-869.awsdns-44.net.	tier_3
511	jumia.ug	MarkMonitor	locked		2024-06-28 12:14:45.476337	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1195.awsdns-21.org., ns-133.awsdns-16.com., ns-1827.awsdns-36.co.uk., ns-576.awsdns-08.net.	tier_1
456	jumia.co.mu	MarkMonitor	locked		2024-06-28 12:14:44.780107	v=spf1 -all	v=DMARC1; p=reject;	, ns-115.awsdns-14.com., ns-1185.awsdns-20.org., ns-2018.awsdns-60.co.uk., ns-763.awsdns-31.net.	tier_3
508	jumia.tg	is-fun	locked		2024-06-28 12:14:45.804784	v=spf1 -all	v=DMARC1; p=reject;	, ns-1374.awsdns-43.org., ns-1735.awsdns-24.co.uk., ns-294.awsdns-36.com., ns-654.awsdns-17.net.	tier_3
506	jumia.so	MarkMonitor	locked		2024-06-28 12:14:45.337942	v=spf1 -all	v=DMARC1; p=reject;	, ns-1056.awsdns-04.org., ns-1826.awsdns-36.co.uk., ns-50.awsdns-06.com., ns-797.awsdns-35.net.	tier_3
519	jumiaeats.com	MarkMonitor	locked		2024-06-28 12:14:46.454425	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_2
517	jumiadeals.com	MarkMonitor	locked		2024-06-28 12:14:45.602124	v=spf1 -all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com	, nina.ns.cloudflare.com., thomas.ns.cloudflare.com.	tier_1
512	jumiacars.ci	MarkMonitor	locked		2024-06-28 12:14:47.020593	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
457	jumia.co.mz	MarkMonitor	locked		2024-06-28 12:14:46.185493	v=spf1 -all	v=DMARC1; p=reject;	, ns-1104.awsdns-10.org., ns-1939.awsdns-50.co.uk., ns-425.awsdns-53.com., ns-995.awsdns-60.net.	tier_3
524	jumiafood.co.ug	MarkMonitor	locked		2024-06-28 12:14:47.512142			, ns-1032.awsdns-01.org., ns-1581.awsdns-05.co.uk., ns-352.awsdns-44.com., ns-784.awsdns-34.net.	tier_3
520	jumiafly.com	MarkMonitor	locked		2024-06-28 12:14:46.684465	v=spf1 -all	v=DMARC1; p=quarantine; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_3
515	jumiacars.com.ng	MarkMonitor	locked		2024-06-28 12:14:48.132179	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.	tier_3
518	jumiaeat.com	MarkMonitor	locked		2024-06-28 12:14:48.33345	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns4.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com.	tier_2
458	jumia.co.na	MarkMonitor	locked		2024-06-28 12:14:48.53756	v=spf1 -all	v=DMARC1; p=reject;	, ns-1275.awsdns-31.org., ns-1765.awsdns-28.co.uk., ns-356.awsdns-44.com., ns-721.awsdns-26.net.	tier_3
514	jumiacars.com.gh	#N/A	locked		2024-06-28 12:14:48.968921				tier_3
509	jumia.tn	is-fun	locked		2024-06-28 12:14:36.836827	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1138.awsdns-14.org., ns-1584.awsdns-06.co.uk., ns-502.awsdns-62.com., ns-531.awsdns-02.net.	tier_1
452	jumia.co.cm	MarkMonitor	locked		2024-06-28 12:14:37.369949	v=spf1 -all	v=DMARC1; p=reject;	, ns-1046.awsdns-02.org., ns-192.awsdns-24.com., ns-2003.awsdns-58.co.uk., ns-810.awsdns-37.net.	tier_3
451	jumia.co.bw	MarkMonitor	locked		2024-06-28 12:14:36.509077	v=spf1 -all	v=DMARC1; p=reject;	, ns-1310.awsdns-35.org., ns-1976.awsdns-55.co.uk., ns-435.awsdns-54.com., ns-816.awsdns-38.net.	tier_3
523	jumiafood.co.tz	MarkMonitor	locked		2024-06-28 12:14:49.125678			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.	tier_2
628	hellopayng.com	MarkMonitor	locked		2024-06-28 12:14:52.969692	v=spf1 include:_spf.mx.cloudflare.net ~all	v=DMARC1; p=none; rua=mailto:rua@dmarc.brevo.com	, ernest.ns.cloudflare.com., nicole.ns.cloudflare.com.	tier_1
630	lr.jumia.com	#N/A	locked		2024-06-28 12:14:54.916023	v=spf1 -all	v=DMARC1; p=reject;	, ns-1457.awsdns-54.org., ns-1785.awsdns-31.co.uk., ns-825.awsdns-39.net., ns-90.awsdns-11.com.	tier_1
626	email.jumia.com.ng	#N/A	locked		2024-06-28 12:14:49.853889	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;		tier_1
639	jumiapay.io	#N/A	locked		2024-06-28 12:14:51.81791	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-150.awsdns-18.com., ns-1528.awsdns-63.org., ns-1730.awsdns-24.co.uk., ns-607.awsdns-11.net.	tier_1
627	email.jumia.ma	#N/A	locked		2024-06-28 12:14:58.579628	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;		tier_1
629	km.jumia.com	#N/A	locked		2024-06-28 12:14:53.343586	v=spf1 -all	v=DMARC1; p=reject;	, ns-1092.awsdns-08.org., ns-1656.awsdns-15.co.uk., ns-181.awsdns-22.com., ns-970.awsdns-57.net.	tier_1
623	zm.jumia.com	#N/A	locked		2024-06-28 12:14:57.174598	v=spf1 -all	v=DMARC1; p=reject;	, ns-1351.awsdns-40.org., ns-1852.awsdns-39.co.uk., ns-350.awsdns-43.com., ns-736.awsdns-28.net.	tier_1
631	mg.jumia.com	#N/A	locked		2024-06-28 12:14:53.70036	v=spf1 include:mailgun.org ~all			tier_1
620	lmp-daraz.com	#N/A	locked		2024-06-28 12:14:52.057488			, ns5.101domain.com., ns1.101domain.com., ns2.101domain.com.	tier_3
638	zm.jumia.com	#N/A	locked		2024-06-28 12:14:57.174598	v=spf1 -all	v=DMARC1; p=reject;	, ns-1351.awsdns-40.org., ns-1852.awsdns-39.co.uk., ns-350.awsdns-43.com., ns-736.awsdns-28.net.	tier_1
621	lms-daraz.com	#N/A	locked		2024-06-28 12:14:53.939434			, ns1.101domain.com., ns2.101domain.com., ns5.101domain.com.	tier_3
615	dlportal.lk	#N/A	locked		2024-06-28 12:14:59.422779			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
624	cf.jumia.com	#N/A	locked		2024-06-28 12:14:57.576514	v=spf1 -all	v=DMARC1; p=reject;	, ns-122.awsdns-15.com., ns-1310.awsdns-35.org., ns-1906.awsdns-46.co.uk., ns-551.awsdns-04.net.	tier_1
636	tools-jm.net	#N/A	locked		2024-06-28 12:14:50.149711				tier_3
617	insidedaraz.com	#N/A	locked		2024-06-28 12:14:56.245868			, vip3.alidns.com., vip4.alidns.com.	tier_3
619	kaymu.ph	#N/A	locked		2024-06-28 12:14:58.322962			, ns1.commonmx.com., ns2.commonmx.com.	tier_3
618	kaymu.id	#N/A	locked		2024-06-28 12:14:52.47848				tier_3
622	powwerliving.com	#N/A	locked		2024-06-28 12:14:59.724058				tier_3
616	dlportal.pk	#N/A	locked		2024-06-28 12:14:50.92348			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
625	e-mail.zando.co.za	#N/A	locked		2024-06-28 12:14:58.438436	v=spf1 include:mailgun.org include:amazonses.com ~all			tier_1
614	dlportal.com.bd	#N/A	locked		2024-06-28 12:14:57.123279			, ns2.alibabadns.com., ns1.alibabadns.com.	tier_3
632	ml.jumia.com	#N/A	locked		2024-06-28 12:14:54.405916	v=spf1 -all	v=DMARC1; p=reject;	, ns-1205.awsdns-22.org., ns-1827.awsdns-36.co.uk., ns-446.awsdns-55.com., ns-761.awsdns-31.net.	tier_1
635	st.jumia.com	#N/A	locked		2024-06-28 12:14:51.538311	v=spf1 -all	v=DMARC1; p=reject;	, ns-1325.awsdns-37.org., ns-1731.awsdns-24.co.uk., ns-438.awsdns-54.com., ns-555.awsdns-05.net.	tier_1
640	jumia.co	#N/A	locked		2024-06-28 12:14:59.845927			, cleo.ns.cloudflare.com., lola.ns.cloudflare.com.	tier_1
633	ops.jumia.com	#N/A	locked		2024-06-28 12:14:52.868064	v=spf1 -all	v=DMARC1; p=reject;	, ns-1088.awsdns-08.org., ns-153.awsdns-19.com., ns-1816.awsdns-35.co.uk., ns-652.awsdns-17.net.	tier_1
634	ss.jumia.com	#N/A	locked		2024-06-28 12:15:00.448729				tier_1
637	zando.co.za	#N/A	locked		2024-06-28 12:14:51.667293	v=spf1 mx include:_netblocks.google.com include:_netblocks2.google.com include:_netblocks3.google.com  include:mail.zendesk.com include:amazonses.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, dilbert.ns.cloudflare.com., ruth.ns.cloudflare.com.	tier_1
\.


--
-- Data for Name: domain_info_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domain_info_history (id, name, registrar, state, tier, transfer_to, last_check, spf, dmarc, nameservers) FROM stdin;
1	jumiaone.com	MarkMonitor	locked	tier_1		2024-06-28 13:13:30.473982	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
2	joumya.com	MarkMonitor	locked	missword		2024-06-28 13:13:30.595899	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
3	jumiaone.com.ng	MarkMonitor	locked	tier_1		2024-06-28 13:13:31.111611	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
4	joumya.ma	MarkMonitor	locked	missword		2024-06-28 13:13:31.280156	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
5	djoumia.ng	MarkMonitor	locked	missword		2024-06-28 13:13:31.414981	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
6	djumia.com	MarkMonitor	locked	missword		2024-06-28 13:13:31.673921	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
7	djoumia.org	MarkMonitor	locked	missword		2024-06-28 13:13:31.848507	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
8	jumiapay.co.ug	MarkMonitor	locked	tier_1		2024-06-28 13:13:32.330272	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
9	djumia.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:32.857287	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
10	joumya.net	MarkMonitor	locked	missword		2024-06-28 13:13:32.988711	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
11	djumia.net	MarkMonitor	locked	missword		2024-06-28 13:13:33.241077	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns6.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns5.markmonitor.com., ns7.markmonitor.com.
12	djumia.ng	MarkMonitor	locked	missword		2024-06-28 13:13:33.429956	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
13	djoumia.ma	MarkMonitor	locked	missword		2024-06-28 13:13:33.607636	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
14	highlife.africa	MarkMonitor	locked	missword		2024-06-28 13:13:33.765054	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
15	juima.ma	MarkMonitor	locked	missword		2024-06-28 13:13:33.918961	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
16	joumia.ma	MarkMonitor	locked	missword		2024-06-28 13:13:34.057316	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
17	djoumia.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:34.323485	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
18	joumia.net	MarkMonitor	locked	missword		2024-06-28 13:13:34.523516	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
19	jumia1.ci	MarkMonitor	locked	missword		2024-06-28 13:13:34.716615	v=spf1 -all	v=DMARC1; p=reject	, ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns6.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com.
20	jumia1.co.ke	MarkMonitor	locked	missword		2024-06-28 13:13:35.353477	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
21	joumia.org	MarkMonitor	locked	missword		2024-06-28 13:13:35.517911	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
22	joumya.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:35.708545	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
23	jumiaone.cm	MarkMonitor	locked	tier_1		2024-06-28 13:13:35.868559	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
24	djoumia.com	MarkMonitor	locked	missword		2024-06-28 13:13:36.023005	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns5.markmonitor.com., ns7.markmonitor.com.
25	jumiatravel.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:36.162919	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
26	djoumia.net	MarkMonitor	locked	missword		2024-06-28 13:13:36.345371	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
27	djumia.ma	MarkMonitor	locked	missword		2024-06-28 13:13:36.618872	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com.
28	joumia.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:36.818707	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com.
29	joumia.com	MarkMonitor	locked	missword		2024-06-28 13:13:36.994684	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
30	jumianow.com	MarkMonitor	locked	tier_1		2024-06-28 13:13:37.134477	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
31	joumia.ng	MarkMonitor	locked	missword		2024-06-28 13:13:37.312569	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com.
32	joumya.org	MarkMonitor	locked	missword		2024-06-28 13:13:37.432311	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
33	joumya.ng	MarkMonitor	locked	missword		2024-06-28 13:13:37.623031	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
34	jumia1.cm	MarkMonitor	locked	missword		2024-06-28 13:13:37.749364	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
35	juima.ng	MarkMonitor	locked	missword		2024-06-28 13:13:37.905506	v=spf1 -all	v=DMARC1; p=reject	, ns6.markmonitor.com., ns3.markmonitor.com., ns2.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.
36	jumiamarket.tn	#N/A	locked	tier_3		2024-06-28 13:13:38.061547		v=DMARC1; p=reject	, ns1.is-fun.net., ns2.is-fun.net.
37	jumai.ma	MarkMonitor	locked	missword		2024-06-28 13:13:38.247929	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
38	djumia.org	MarkMonitor	locked	missword		2024-06-28 13:13:38.412961	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
39	jumia1.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:38.732263	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
40	jumiya.ng	MarkMonitor	locked	missword		2024-06-28 13:13:38.887613	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
41	jumiago.com	MarkMonitor	locked	tier_1		2024-06-28 13:13:39.098509	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
42	jumia1.ma	MarkMonitor	locked	missword		2024-06-28 13:13:39.262535	v=spf1 -all	v=DMARC1; p=reject	, ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
43	jumya.ng	MarkMonitor	locked	missword		2024-06-28 13:13:39.450929	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
44	jumya.org	MarkMonitor	locked	missword		2024-06-28 13:13:39.748463	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
45	jumia-travel.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:40.256387			
46	jummia.ma	MarkMonitor	locked	missword		2024-06-28 13:13:40.45689	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns3.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.
47	jumia-travel.ci	MarkMonitor	locked	tier_3		2024-06-28 13:13:40.685143			
48	jummia.ng	MarkMonitor	locked	missword		2024-06-28 13:13:41.06453	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
49	blackfriday.com.ng	MarkMonitor	locked	tier_3		2024-06-28 13:13:41.469769	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
50	jumia1.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:41.519632	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
51	jumya.net	MarkMonitor	locked	missword		2024-06-28 13:13:41.648825	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
52	jumia-travel.cm	MarkMonitor	locked	tier_3		2024-06-28 13:13:41.747443			, bob.ns.cloudflare.com., dana.ns.cloudflare.com.
53	jumuia.ng	MarkMonitor	locked	missword		2024-06-28 13:13:41.948821	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
54	jumia.ci	MarkMonitor	locked	tier_1		2024-06-28 13:13:42.120846	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-103.awsdns-12.com., ns-1256.awsdns-29.org., ns-1969.awsdns-54.co.uk., ns-687.awsdns-21.net.
55	jumiafood.com.gh	#N/A	locked	tier_2		2024-06-28 13:13:42.264822			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
56	jumia.ae	MarkMonitor	locked	tier_1		2024-06-28 13:13:42.737714			
57	jumia-travel.co.ke	MarkMonitor	locked	tier_3		2024-06-28 13:13:48.955393			
58	jumiafood.com.ng	MarkMonitor	locked	tier_2		2024-06-28 13:13:49.526736			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
59	jumiafood.ma	MarkMonitor	locked	tier_2		2024-06-28 13:13:49.661008			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
60	jumuia.com.ng	MarkMonitor	locked	missword		2024-06-28 13:13:49.948222	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
61	jumia-travel.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:13:50.040238	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
62	jumiafood.rw	MarkMonitor	locked	tier_2		2024-06-28 13:13:50.20002			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
63	jumia.africa	MarkMonitor	locked	tier_1		2024-06-28 13:13:50.347597	v=spf1 -all	v=DMARC1; p=reject;	, ns-148.awsdns-18.com., ns-1481.awsdns-57.org., ns-1576.awsdns-05.co.uk., ns-534.awsdns-02.net.
64	jumia-travel.co.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:50.75515			
65	jumia-travel.com	MarkMonitor	locked	tier_3		2024-06-28 13:13:50.847433	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
66	jumia.bf	is-fun	locked	tier_1		2024-06-28 13:13:50.996127	v=spf1 -all	v=DMARC1; p=reject;	, ns-1417.awsdns-49.org., ns-1865.awsdns-41.co.uk., ns-411.awsdns-51.com., ns-622.awsdns-13.net.
67	jumia-travel.com.gh	#N/A	locked	tier_3		2024-06-28 13:13:51.229894			
68	jumia.co.ao	is-fun	locked	tier_3		2024-06-28 13:13:51.377287	v=spf1 -all	v=DMARC1; p=reject;	, ns-1195.awsdns-21.org., ns-1554.awsdns-02.co.uk., ns-342.awsdns-42.com., ns-604.awsdns-11.net.
69	jumia.biz	MarkMonitor	locked	tier_1		2024-06-28 13:13:51.518854	v=spf1 -all	v=DMARC1; p=reject;	, ns-1511.awsdns-60.org., ns-1631.awsdns-11.co.uk., ns-226.awsdns-28.com., ns-957.awsdns-55.net.
70	jumia.bj	MarkMonitor	locked	tier_1		2024-06-28 13:13:51.795854	v=spf1 -all	v=DMARC1; p=reject;	, ns-1090.awsdns-08.org., ns-1574.awsdns-04.co.uk., ns-488.awsdns-61.com., ns-583.awsdns-08.net.
71	jumya.ma	MarkMonitor	locked	missword		2024-06-28 13:13:52.006577	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.
72	techinporto.com	#N/A	locked	tier_3		2024-06-28 13:13:52.618319			
73	jumia.cg	is-fun	locked	tier_1		2024-06-28 13:13:52.738216	v=spf1 -all	v=DMARC1; p=reject;	, ns-117.awsdns-14.com., ns-1327.awsdns-37.org., ns-1749.awsdns-26.co.uk., ns-892.awsdns-47.net.
74	jumia-travel.com.ng	MarkMonitor	locked	tier_3		2024-06-28 13:13:53.480514	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
75	jumia-travel.sn	MarkMonitor	locked	tier_3		2024-06-28 13:13:53.684334			
76	jumiya.ma	MarkMonitor	locked	missword		2024-06-28 13:13:53.817534	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
77	jumiahotels.com	MarkMonitor	locked	tier_3		2024-06-28 13:13:53.910376	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
78	jumiahouse.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:13:54.132288	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
79	jumiahouse.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:54.361248	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
80	jumiamarket.cm	MarkMonitor	locked	tier_3		2024-06-28 13:13:54.487741	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
81	jumiamarket.co.mz	MarkMonitor	locked	tier_3		2024-06-28 13:13:54.654852	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
82	jumiamarket.co.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:55.12134	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
83	jumiamarket.com.gh	#N/A	locked	tier_3		2024-06-28 13:13:55.575553			
84	jumiamarket.ga	MarkMonitor	locked	tier_3		2024-06-28 13:13:55.704196	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
85	jumiamarket.sn	MarkMonitor	locked	tier_3		2024-06-28 13:13:55.883314	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
86	jumiaone.ma	MarkMonitor	locked	tier_1		2024-06-28 13:13:56.006777	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
87	jumiapay.ci	MarkMonitor	locked	tier_1		2024-06-28 13:13:56.149823	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns7.markmonitor.com., ns5.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns3.markmonitor.com., ns6.markmonitor.com.
88	jumiapay.co.ke	MarkMonitor	locked	tier_1		2024-06-28 13:13:56.808984	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com.
89	jumiapay.com.gh	#N/A	locked	tier_1		2024-06-28 13:13:57.347326			
90	jumiapay.com.ng	MarkMonitor	locked	tier_1		2024-06-28 13:13:57.693236			, jonah.ns.cloudflare.com., lia.ns.cloudflare.com.
91	jumiapay.ng	MarkMonitor	locked	tier_1		2024-06-28 13:13:58.009451	v=spf1 include:_realspf1.jumia.com -all		, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
92	jumiapay.tn	#N/A	locked	tier_1		2024-06-28 13:13:58.476961			
93	jumiapop.cm	#N/A	locked	tier_3		2024-06-28 13:13:58.987753			
94	jumiaservices.co.ao	is-fun	locked	tier_3		2024-06-28 13:13:59.159077	v=spf1 -all		, ns2.is-fun.net., ns1.is-fun.net.
95	jumiaservices.com	MarkMonitor	locked	tier_3		2024-06-28 13:13:59.381727			, ns-104.awsdns-13.com., ns-1463.awsdns-54.org., ns-1745.awsdns-26.co.uk., ns-765.awsdns-31.net.
96	jumiaservices.ug	MarkMonitor	locked	tier_3		2024-06-28 13:13:59.615764	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com.
97	jumiatravel.ci	MarkMonitor	locked	tier_3		2024-06-28 13:13:59.725716	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
98	jumiatravel.co.ke	MarkMonitor	locked	tier_3		2024-06-28 13:14:00.059085	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
99	jumiatravel.co.ug	MarkMonitor	locked	tier_3		2024-06-28 13:14:00.384228			
100	jumiatravel.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:00.480539	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
101	jumiatravel.com.gh	#N/A	locked	tier_3		2024-06-28 13:14:01.159328			
102	jumiatravel.sn	MarkMonitor	locked	tier_3		2024-06-28 13:14:01.297885			, bob.ns.cloudflare.com., dana.ns.cloudflare.com.
103	jumiatravels.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:01.429613	v=spf1 -all		, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
104	jovago.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:01.546489	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
105	jovago.bf	#N/A	locked	tier_3		2024-06-28 13:14:01.805288			
106	jovago.dj	#N/A	locked	tier_3		2024-06-28 13:14:01.929763	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
107	jovago.ne	#N/A	locked	tier_3		2024-06-28 13:14:02.11702			
108	carmudi.com.zm	#N/A	locked	tier_3		2024-06-28 13:14:02.85667			
109	darazpay.pk	#N/A	locked	tier_3		2024-06-28 13:14:03.266944			
110	hellofood.cd	#N/A	locked	tier_3		2024-06-28 13:14:03.365782	v=spf1 ip4:217.110.53.72 include:_spf.google.com ~all		, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
111	daraz.mobi	#N/A	locked	tier_3		2024-06-28 13:14:03.572235			, ns2.101domain.com., ns5.101domain.com., ns1.101domain.com.
112	dazlogistics.com.bd	#N/A	locked	tier_3		2024-06-28 13:14:04.419358			, ns2.alibabadns.com., ns1.alibabadns.com.
113	dazlogistics.pk	#N/A	locked	tier_3		2024-06-28 13:14:04.958601			, ns2.alibabadns.com., ns1.alibabadns.com.
114	dex.com.pk	#N/A	locked	tier_3		2024-06-28 13:14:06.176908			, ns7.alidns.com., ns8.alidns.com.
115	jumiafood.com	MarkMonitor	locked	tier_2		2024-06-28 13:14:06.350715			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
116	jumiapop.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:06.897678			
117	jumiahomes.co.zw	#N/A	locked	tier_3		2024-06-28 13:14:07.710575			
118	jumuia.ma	MarkMonitor	locked	missword		2024-06-28 13:14:07.896948	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
119	jumia.co.zw	is-fun	locked	tier_3		2024-06-28 13:14:08.015578	v=spf1 -all	v=DMARC1; p=reject;	, ns-1218.awsdns-24.org., ns-143.awsdns-17.com., ns-1832.awsdns-37.co.uk., ns-548.awsdns-04.net.
120	jumya.com.ng	MarkMonitor	locked	missword		2024-06-28 13:14:08.268041	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
121	jumia.cv	is-fun	locked	tier_1		2024-06-28 13:14:08.733303			
122	jumia.com.gh	is-fun	locked	tier_1		2024-06-28 13:14:08.852502	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1392.awsdns-46.org., ns-158.awsdns-19.com., ns-1584.awsdns-06.co.uk., ns-621.awsdns-13.net.
123	jumia.co.ug	MarkMonitor	locked	tier_1		2024-06-28 13:14:09.450927	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1389.awsdns-45.org., ns-1860.awsdns-40.co.uk., ns-279.awsdns-34.com., ns-745.awsdns-29.net.
124	jumia.com	MarkMonitor	locked	tier_1		2024-06-28 13:14:09.51239	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; fo=1;	, ns-1076.awsdns-06.org., ns-1942.awsdns-50.co.uk., ns-64.awsdns-08.com., ns-879.awsdns-45.net.
125	jumia.fr	MarkMonitor	locked	tier_1		2024-06-28 13:14:09.65081	v=spf1 -all	v=DMARC1; p=reject;	, ns-1180.awsdns-19.org., ns-1570.awsdns-04.co.uk., ns-199.awsdns-24.com., ns-778.awsdns-33.net.
126	jumia.co.uk	MarkMonitor	locked	tier_1		2024-06-28 13:14:09.789883	v=spf1 -all	v=DMARC1; p=reject;	, ns-1386.awsdns-45.org., ns-1933.awsdns-49.co.uk., ns-279.awsdns-34.com., ns-821.awsdns-38.net.
127	jumia.com.ng	MarkMonitor	locked	tier_1		2024-06-28 13:14:09.996858	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1302.awsdns-34.org., ns-1660.awsdns-15.co.uk., ns-263.awsdns-32.com., ns-682.awsdns-21.net.
128	jumia.com.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:10.193916	v=spf1 -all	v=DMARC1; p=reject;	, ns-1481.awsdns-57.org., ns-1838.awsdns-37.co.uk., ns-362.awsdns-45.com., ns-548.awsdns-04.net.
129	jumia.co.za	MarkMonitor	locked	tier_1		2024-06-28 13:14:10.360859	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1355.awsdns-41.org., ns-1586.awsdns-06.co.uk., ns-17.awsdns-02.com., ns-769.awsdns-32.net.
130	jumia.com.ly	MarkMonitor	locked	tier_3		2024-06-28 13:14:10.579807	v=spf1 -all	v=DMARC1; p=reject;	, ns-1298.awsdns-34.org., ns-1699.awsdns-20.co.uk., ns-385.awsdns-48.com., ns-571.awsdns-07.net.
131	jumia.info	MarkMonitor	locked	tier_1		2024-06-28 13:14:10.717729	v=spf1 -all	v=DMARC1; p=reject;	, ns-1493.awsdns-58.org., ns-1602.awsdns-08.co.uk., ns-504.awsdns-63.com., ns-668.awsdns-19.net.
132	jumia.dj	is-fun	locked	tier_1		2024-06-28 13:14:10.917461	v=spf1 -all	v=DMARC1; p=reject;	, ns-1316.awsdns-36.org., ns-1616.awsdns-10.co.uk., ns-404.awsdns-50.com., ns-991.awsdns-59.net.
133	jumia.com.eg	#N/A	locked	tier_1		2024-06-28 13:14:11.063003	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1116.awsdns-11.org., ns-1993.awsdns-57.co.uk., ns-341.awsdns-42.com., ns-613.awsdns-12.net.
134	jumia.com.mu	MarkMonitor	locked	tier_3		2024-06-28 13:14:13.937716	v=spf1 -all	v=DMARC1; p=reject;	, ns-1020.awsdns-63.net., ns-1400.awsdns-47.org., ns-1588.awsdns-06.co.uk., ns-231.awsdns-28.com.
135	jumia.com.tn	is-fun	locked	tier_1		2024-06-28 13:14:14.103423	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1456.awsdns-54.org., ns-2038.awsdns-62.co.uk., ns-233.awsdns-29.com., ns-934.awsdns-52.net.
136	jumia.com.et	is-fun	locked	tier_3		2024-06-28 13:14:14.569584	v=spf1 -all	v=DMARC1; p=reject;	, ns-1221.awsdns-24.org., ns-1900.awsdns-45.co.uk., ns-345.awsdns-43.com., ns-919.awsdns-50.net.
137	jumia.es	is-fun	locked	tier_1		2024-06-28 13:14:14.731149	v=spf1 -all	v=DMARC1; p=reject;	, ns-1465.awsdns-55.org., ns-1879.awsdns-42.co.uk., ns-405.awsdns-50.com., ns-562.awsdns-06.net.
138	jumia.is	MarkMonitor	locked	tier_1		2024-06-28 13:14:14.86347	v=spf1 -all	v=DMARC1; p=reject;	, ns-117.awsdns-14.com., ns-1475.awsdns-56.org., ns-1944.awsdns-51.co.uk., ns-937.awsdns-53.net.
139	jumia.com.na	MarkMonitor	locked	tier_3		2024-06-28 13:14:15.02975	v=spf1 -all	v=DMARC1; p=reject;	, ns-1020.awsdns-63.net., ns-1240.awsdns-27.org., ns-1696.awsdns-20.co.uk., ns-499.awsdns-62.com.
140	jumia.gw	is-fun	locked	tier_1		2024-06-28 13:14:15.194799	v=spf1 -all	v=DMARC1; p=reject;	, ns-1506.awsdns-60.org., ns-1723.awsdns-23.co.uk., ns-285.awsdns-35.com., ns-519.awsdns-00.net.
141	jumia.dz	MarkMonitor	locked	tier_1		2024-06-28 13:14:15.346671	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1047.awsdns-02.org., ns-1670.awsdns-16.co.uk., ns-337.awsdns-42.com., ns-873.awsdns-45.net.
142	jumia.ga	MarkMonitor	locked	tier_1		2024-06-28 13:14:15.514611	v=spf1 -all	v=DMARC1; p=reject;	, ns-1288.awsdns-33.org., ns-1550.awsdns-01.co.uk., ns-762.awsdns-31.net., ns-87.awsdns-10.com.
143	jumia.io	MarkMonitor	locked	tier_1		2024-06-28 13:14:15.654864	v=spf1 -all	v=DMARC1; p=reject;	, ns-1436.awsdns-51.org., ns-1634.awsdns-12.co.uk., ns-401.awsdns-50.com., ns-892.awsdns-47.net.
144	jumia.it	MarkMonitor	locked	tier_1		2024-06-28 13:14:15.77859	v=spf1 -all	v=DMARC1; p=reject;	, ns-1189.awsdns-20.org., ns-1860.awsdns-40.co.uk., ns-622.awsdns-13.net., ns-94.awsdns-11.com.
145	jumuia.co.ke	MarkMonitor	locked	missword		2024-06-28 13:14:16.197176	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns2.markmonitor.com., ns1.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.
146	blackfriday.ng	MarkMonitor	locked	tier_3		2024-06-28 13:14:16.401565	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
147	jumiaservices.co.ke	MarkMonitor	locked	tier_3		2024-06-28 13:14:17.058108	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
148	jumiaworld.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:17.211977	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
149	jumiaservices.ma	MarkMonitor	locked	tier_3		2024-06-28 13:14:17.423367	v=spf1 -all	v=DMARC1; p=reject	, ns7.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com.
150	jumiaproductionservices.ci	MarkMonitor	locked	tier_3		2024-06-28 13:14:17.591856	v=spf1 -all	v=DMARC1; p=reject;	, ns-1293.awsdns-33.org., ns-1590.awsdns-06.co.uk., ns-228.awsdns-28.com., ns-656.awsdns-18.net.
151	jumiaservices.ng	MarkMonitor	locked	tier_3		2024-06-28 13:14:18.068779	v=spf1 -all	v=DMARC1; p=reject	, ns3.markmonitor.com., ns2.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
152	jumia.cm	MarkMonitor	locked	tier_1		2024-06-28 13:14:18.211311	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject;	, ns-1532.awsdns-63.org., ns-1979.awsdns-55.co.uk., ns-198.awsdns-24.com., ns-834.awsdns-40.net.
153	jumiatravel.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:18.355357	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
154	jumiaservices.ci	MarkMonitor	locked	tier_3		2024-06-28 13:14:18.789865	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
155	jumiafood.sn	MarkMonitor	locked	tier_2		2024-06-28 13:14:19.106735	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
156	jumiatravel.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:14:19.213725	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
157	jumia.bi	MarkMonitor	locked	tier_1		2024-06-28 13:14:19.602977	v=spf1 -all	v=DMARC1; p=reject;	, ns-1205.awsdns-22.org., ns-1895.awsdns-44.co.uk., ns-694.awsdns-22.net., ns-73.awsdns-09.com.
158	jumiaservices.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:19.953866	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns5.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns6.markmonitor.com., ns3.markmonitor.com.
159	jumiatrip.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:20.042966	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
160	jumia.cd	MarkMonitor	locked	tier_1		2024-06-28 13:14:20.257155	v=spf1 -all	v=DMARC1; p=reject;	, ns-1001.awsdns-61.net., ns-1361.awsdns-42.org., ns-1831.awsdns-36.co.uk., ns-54.awsdns-06.com.
161	jovago.net	MarkMonitor	locked	tier_3		2024-06-28 13:14:20.354082	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
162	jovago.cd	#N/A	locked	tier_3		2024-06-28 13:14:20.447935	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
163	dazlogistics.lk	#N/A	locked	tier_3		2024-06-28 13:14:21.43617			, ns2.alibabadns.com., ns1.alibabadns.com.
164	dfg.com.pk	#N/A	locked	tier_3		2024-06-28 13:14:22.048445			, ns2.101domain.com., ns5.101domain.com., ns1.101domain.com.
165	jumiamarket.ci	MarkMonitor	locked	tier_3		2024-06-28 13:14:22.316227	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
166	jumiahotel.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:22.43183	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
167	jumiahouse.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:23.2378	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
168	jumiahouse.co.ke	MarkMonitor	locked	tier_3		2024-06-28 13:14:23.858639	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
169	jumia.ly	MarkMonitor	locked	tier_3		2024-06-28 13:14:24.19896	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject;  rua=mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1039.awsdns-01.org., ns-1610.awsdns-09.co.uk., ns-538.awsdns-03.net., ns-80.awsdns-10.com.
170	jumia.marketing	MarkMonitor	locked	tier_1		2024-06-28 13:14:24.864156	v=spf1 -all		, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
171	jumia.mobi	MarkMonitor	locked	tier_1		2024-06-28 13:14:25.069708	v=spf1 -all	v=DMARC1; p=reject;	, ns-1407.awsdns-47.org., ns-1652.awsdns-14.co.uk., ns-338.awsdns-42.com., ns-970.awsdns-57.net.
172	jumia.mu	MarkMonitor	locked	tier_1		2024-06-28 13:14:25.426563	v=spf1 -all	v=DMARC1; p=reject;	, ns-1088.awsdns-08.org., ns-1634.awsdns-12.co.uk., ns-379.awsdns-47.com., ns-754.awsdns-30.net.
173	jumia.ng	MarkMonitor	locked	tier_1		2024-06-28 13:14:25.59562	v=spf1 include:_spf.google.com -all	v=DMARC1; p=reject; rua=mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1232.awsdns-26.org., ns-1709.awsdns-21.co.uk., ns-94.awsdns-11.com., ns-970.awsdns-57.net.
174	jumia.rw	MarkMonitor	locked	tier_3		2024-06-28 13:14:26.046808	v=spf1 -all	v=DMARC1; p=reject;	, ns-1421.awsdns-49.org., ns-1666.awsdns-16.co.uk., ns-742.awsdns-28.net., ns-90.awsdns-11.com.
175	jumia.sd	MarkMonitor	locked	tier_1		2024-06-28 13:14:26.238533	v=spf1 -all	v=DMARC1; p=reject;	, ns-1009.awsdns-62.net., ns-1484.awsdns-57.org., ns-1796.awsdns-32.co.uk., ns-396.awsdns-49.com.
176	jumia.sl	is-fun	locked	tier_3		2024-06-28 13:14:26.624072	v=spf1 -all	v=DMARC1; p=reject;	, ns-1035.awsdns-01.org., ns-1694.awsdns-19.co.uk., ns-184.awsdns-23.com., ns-554.awsdns-05.net.
177	jumiahouse.ma	MarkMonitor	locked	tier_3		2024-06-28 13:14:26.810577	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
178	jumiatravel.com.ng	MarkMonitor	locked	tier_3		2024-06-28 13:14:27.554556	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
179	hellofood.co.za	#N/A	locked	tier_3		2024-06-28 13:14:27.843822	v=spf1 ip4:217.110.53.72 include:_spf.google.com ~all		, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
180	daraz.la	#N/A	locked	tier_3		2024-06-28 13:14:28.245387			, NS1.101DOMAIN.COM., NS2.101DOMAIN.COM., NS5.101DOMAIN.COM.
181	jumiajobs.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:28.572502	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
182	jumiamarket.co.ke	MarkMonitor	locked	tier_3		2024-06-28 13:14:29.063176	v=spf1 -all	v=DMARC1; p=reject	, ns3.markmonitor.com., ns1.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns6.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com.
183	jumiamarket.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:14:29.281436	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
184	jumiamarket.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:29.832588	v=spf1 -all	v=DMARC1; p=reject	, ns4.markmonitor.com., ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns7.markmonitor.com., ns6.markmonitor.com., ns5.markmonitor.com.
185	jumiamarket.com.ng	MarkMonitor	locked	tier_3		2024-06-28 13:14:30.345035	v=spf1 -all	v=DMARC1; p=reject	, ns2.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com.
186	jumiamarket.ma	MarkMonitor	locked	tier_3		2024-06-28 13:14:30.550827	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
187	jumiaone.ci	MarkMonitor	locked	tier_3		2024-06-28 13:14:30.70972	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
188	jumiaone.co.ke	MarkMonitor	locked	tier_1		2024-06-28 13:14:31.367418	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
189	jumiapay.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:31.532697	v=spf1 -all	v=DMARC1; p=reject	, ns5.markmonitor.com., ns7.markmonitor.com., ns6.markmonitor.com., ns2.markmonitor.com., ns4.markmonitor.com., ns1.markmonitor.com., ns3.markmonitor.com.
190	jumiapay.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:14:31.86776	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
191	jumia.market	MarkMonitor	locked	tier_1		2024-06-28 13:14:32.148836	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
192	jumia.re	MarkMonitor	locked	tier_1		2024-06-28 13:14:32.455153	v=spf1 -all	v=DMARC1; p=reject;	, ns-118.awsdns-14.com., ns-1417.awsdns-49.org., ns-1805.awsdns-33.co.uk., ns-823.awsdns-38.net.
193	jumia.mg	MarkMonitor	locked	tier_1		2024-06-28 13:14:33.073285	v=spf1 -all	v=DMARC1; p=reject;	, ns-1105.awsdns-10.org., ns-1772.awsdns-29.co.uk., ns-221.awsdns-27.com., ns-525.awsdns-01.net.
194	jumia.sc	MarkMonitor	locked	tier_3		2024-06-28 13:14:33.394431	v=spf1 -all	v=DMARC1; p=reject;	, ns-1500.awsdns-59.org., ns-1754.awsdns-27.co.uk., ns-439.awsdns-54.com., ns-910.awsdns-49.net.
195	jumiapay.ma	MarkMonitor	locked	tier_1		2024-06-28 13:14:33.639838	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
196	jumia.mr	is-fun	locked	tier_1		2024-06-28 13:14:34.094054	v=spf1 -all	v=DMARC1; p=reject;	, ns-1455.awsdns-53.org., ns-1878.awsdns-42.co.uk., ns-231.awsdns-28.com., ns-777.awsdns-33.net.
197	jumia.services	MarkMonitor	locked	tier_1		2024-06-28 13:14:34.25799			, ns-1062.awsdns-04.org., ns-148.awsdns-18.com., ns-1849.awsdns-39.co.uk., ns-716.awsdns-25.net.
198	jumiapay.sn	MarkMonitor	locked	tier_1		2024-06-28 13:14:34.485414	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
199	jumia.mw	MarkMonitor	locked	tier_3		2024-06-28 13:14:34.630904	v=spf1 -all	v=DMARC1; p=reject;	, ns-1149.awsdns-15.org., ns-1628.awsdns-11.co.uk., ns-395.awsdns-49.com., ns-671.awsdns-19.net.
200	jumia.ke	MarkMonitor	locked	tier_1		2024-06-28 13:14:35.015656	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-131.awsdns-16.com., ns-1328.awsdns-38.org., ns-1571.awsdns-04.co.uk., ns-699.awsdns-23.net.
201	jumia.sh	MarkMonitor	locked	tier_3		2024-06-28 13:14:35.350402	v=spf1 -all	v=DMARC1; p=reject;	, ns-1226.awsdns-25.org., ns-1598.awsdns-07.co.uk., ns-333.awsdns-41.com., ns-594.awsdns-10.net.
202	jumia.ma	MarkMonitor	locked	tier_1		2024-06-28 13:14:35.477546	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1505.awsdns-60.org., ns-1963.awsdns-53.co.uk., ns-447.awsdns-55.com., ns-596.awsdns-10.net.
203	jumia.ne	MarkMonitor	locked	tier_3		2024-06-28 13:14:35.696398	v=spf1 -all	v=DMARC1; p=reject;	, ns-1452.awsdns-53.org., ns-1952.awsdns-52.co.uk., ns-291.awsdns-36.com., ns-794.awsdns-35.net.
204	jumia.net	MarkMonitor	locked	tier_1		2024-06-28 13:14:35.867088	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1062.awsdns-04.org., ns-17.awsdns-02.com., ns-1878.awsdns-42.co.uk., ns-844.awsdns-41.net.
205	jumia.co.bw	MarkMonitor	locked	tier_3		2024-06-28 13:14:36.512749	v=spf1 -all	v=DMARC1; p=reject;	, ns-1310.awsdns-35.org., ns-1976.awsdns-55.co.uk., ns-435.awsdns-54.com., ns-816.awsdns-38.net.
206	jumiacars.sn	MarkMonitor	locked	tier_3		2024-06-28 13:14:36.708488	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
207	jumia.tn	is-fun	locked	tier_1		2024-06-28 13:14:36.839368	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1138.awsdns-14.org., ns-1584.awsdns-06.co.uk., ns-502.awsdns-62.com., ns-531.awsdns-02.net.
208	jumia.co.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:37.373265	v=spf1 -all	v=DMARC1; p=reject;	, ns-1046.awsdns-02.org., ns-192.awsdns-24.com., ns-2003.awsdns-58.co.uk., ns-810.awsdns-37.net.
209	jumiacars.cm	MarkMonitor	locked	tier_3		2024-06-28 13:14:37.503822	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
210	jumia.co.ke	MarkMonitor	locked	tier_1		2024-06-28 13:14:38.301751	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1111.awsdns-10.org., ns-2012.awsdns-59.co.uk., ns-328.awsdns-41.com., ns-650.awsdns-17.net.
211	jumia.co.tz	MarkMonitor	locked	tier_3		2024-06-28 13:14:38.591536	v=spf1 -all	v=DMARC1; p=reject;	, ns-1451.awsdns-53.org., ns-1649.awsdns-14.co.uk., ns-346.awsdns-43.com., ns-947.awsdns-54.net.
212	jumiafood.co.ke	MarkMonitor	locked	tier_2		2024-06-28 13:14:38.829205			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
213	jumia.co.ls	MarkMonitor	locked	tier_1		2024-06-28 13:14:39.039863	v=spf1 -all	v=DMARC1; p=reject;	, ns-1209.awsdns-23.org., ns-145.awsdns-18.com., ns-1942.awsdns-50.co.uk., ns-665.awsdns-19.net.
214	jumia.sn	MarkMonitor	locked	tier_1		2024-06-28 13:14:39.18295	v=spf1 -all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-1392.awsdns-46.org., ns-165.awsdns-20.com., ns-1779.awsdns-30.co.uk., ns-809.awsdns-37.net.
215	jumiafood.ci	MarkMonitor	locked	tier_2		2024-06-28 13:14:39.518299	v=spf1 -all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
216	jumia.co.mg	MarkMonitor	locked	tier_3		2024-06-28 13:14:40.772727	v=spf1 -all	v=DMARC1; p=reject;	, ns-1519.awsdns-61.org., ns-1608.awsdns-09.co.uk., ns-283.awsdns-35.com., ns-869.awsdns-44.net.
217	jumia.tv	MarkMonitor	locked	tier_3		2024-06-28 13:14:40.936577	v=spf1 -all	v=DMARC1; p=reject;	, ns-1009.awsdns-62.net., ns-116.awsdns-14.com., ns-1476.awsdns-56.org., ns-1538.awsdns-00.co.uk.
218	jumia.co.mu	MarkMonitor	locked	tier_3		2024-06-28 13:14:44.78366	v=spf1 -all	v=DMARC1; p=reject;	, ns-115.awsdns-14.com., ns-1185.awsdns-20.org., ns-2018.awsdns-60.co.uk., ns-763.awsdns-31.net.
219	jumia.td	MarkMonitor	locked	tier_3		2024-06-28 13:14:45.200388	v=spf1 -all	v=DMARC1; p=reject;	, ns-1461.awsdns-54.org., ns-1613.awsdns-09.co.uk., ns-191.awsdns-23.com., ns-548.awsdns-04.net.
220	jumia.so	MarkMonitor	locked	tier_3		2024-06-28 13:14:45.340947	v=spf1 -all	v=DMARC1; p=reject;	, ns-1056.awsdns-04.org., ns-1826.awsdns-36.co.uk., ns-50.awsdns-06.com., ns-797.awsdns-35.net.
221	jumia.ug	MarkMonitor	locked	tier_1		2024-06-28 13:14:45.47897	v=spf1 include:_spf.google.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, ns-1195.awsdns-21.org., ns-133.awsdns-16.com., ns-1827.awsdns-36.co.uk., ns-576.awsdns-08.net.
222	jumiadeals.com	MarkMonitor	locked	tier_1		2024-06-28 13:14:45.604825	v=spf1 -all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com	, nina.ns.cloudflare.com., thomas.ns.cloudflare.com.
223	jumia.tg	is-fun	locked	tier_3		2024-06-28 13:14:45.806908	v=spf1 -all	v=DMARC1; p=reject;	, ns-1374.awsdns-43.org., ns-1735.awsdns-24.co.uk., ns-294.awsdns-36.com., ns-654.awsdns-17.net.
224	jumia.co.mz	MarkMonitor	locked	tier_3		2024-06-28 13:14:46.187792	v=spf1 -all	v=DMARC1; p=reject;	, ns-1104.awsdns-10.org., ns-1939.awsdns-50.co.uk., ns-425.awsdns-53.com., ns-995.awsdns-60.net.
225	jumiaeats.com	MarkMonitor	locked	tier_2		2024-06-28 13:14:46.457556	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
226	jumiafly.com	MarkMonitor	locked	tier_3		2024-06-28 13:14:46.687708	v=spf1 -all	v=DMARC1; p=quarantine; rua=mailto:a1ed2e74@in.mailhardener.com	, apollo.ns.cloudflare.com., ruth.ns.cloudflare.com.
227	jumiacars.ci	MarkMonitor	locked	tier_3		2024-06-28 13:14:47.023427	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
228	jumiafood.co.ug	MarkMonitor	locked	tier_3		2024-06-28 13:14:47.513631			, ns-1032.awsdns-01.org., ns-1581.awsdns-05.co.uk., ns-352.awsdns-44.com., ns-784.awsdns-34.net.
229	jumiacars.com.ng	MarkMonitor	locked	tier_3		2024-06-28 13:14:48.134807	v=spf1 -all	v=DMARC1; p=reject	, ns1.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns4.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com., ns7.markmonitor.com.
230	jumiaeat.com	MarkMonitor	locked	tier_2		2024-06-28 13:14:48.336405	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=none; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns4.markmonitor.com., ns7.markmonitor.com., ns2.markmonitor.com., ns3.markmonitor.com., ns1.markmonitor.com., ns5.markmonitor.com., ns6.markmonitor.com.
231	jumia.co.na	MarkMonitor	locked	tier_3		2024-06-28 13:14:48.540115	v=spf1 -all	v=DMARC1; p=reject;	, ns-1275.awsdns-31.org., ns-1765.awsdns-28.co.uk., ns-356.awsdns-44.com., ns-721.awsdns-26.net.
232	jumiacars.com.gh	#N/A	locked	tier_3		2024-06-28 13:14:48.973036			
233	jumiafood.co.tz	MarkMonitor	locked	tier_2		2024-06-28 13:14:49.127983			, ivan.ns.cloudflare.com., jean.ns.cloudflare.com.
234	email.jumia.com.ng	#N/A	locked	tier_1		2024-06-28 13:14:49.856914	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	
235	tools-jm.net	#N/A	locked	tier_3		2024-06-28 13:14:50.152355			
236	dlportal.pk	#N/A	locked	tier_3		2024-06-28 13:14:50.926582			, ns2.alibabadns.com., ns1.alibabadns.com.
237	st.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:51.541854	v=spf1 -all	v=DMARC1; p=reject;	, ns-1325.awsdns-37.org., ns-1731.awsdns-24.co.uk., ns-438.awsdns-54.com., ns-555.awsdns-05.net.
238	zando.co.za	#N/A	locked	tier_1		2024-06-28 13:14:51.670478	v=spf1 mx include:_netblocks.google.com include:_netblocks2.google.com include:_netblocks3.google.com  include:mail.zendesk.com include:amazonses.com ~all	v=DMARC1; p=reject;  rua=mailto:a1ed2e74@in.mailhardener.com,mailto:dmarc@jumia.com; ruf=mailto:dmarc@jumia.com; fo=1;	, dilbert.ns.cloudflare.com., ruth.ns.cloudflare.com.
239	jumiapay.io	#N/A	locked	tier_1		2024-06-28 13:14:51.82023	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	, ns-150.awsdns-18.com., ns-1528.awsdns-63.org., ns-1730.awsdns-24.co.uk., ns-607.awsdns-11.net.
240	lmp-daraz.com	#N/A	locked	tier_3		2024-06-28 13:14:52.060065			, ns5.101domain.com., ns1.101domain.com., ns2.101domain.com.
241	kaymu.id	#N/A	locked	tier_3		2024-06-28 13:14:52.48195			
242	ops.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:52.871891	v=spf1 -all	v=DMARC1; p=reject;	, ns-1088.awsdns-08.org., ns-153.awsdns-19.com., ns-1816.awsdns-35.co.uk., ns-652.awsdns-17.net.
243	hellopayng.com	MarkMonitor	locked	tier_1		2024-06-28 13:14:52.972129	v=spf1 include:_spf.mx.cloudflare.net ~all	v=DMARC1; p=none; rua=mailto:rua@dmarc.brevo.com	, ernest.ns.cloudflare.com., nicole.ns.cloudflare.com.
244	km.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:53.347578	v=spf1 -all	v=DMARC1; p=reject;	, ns-1092.awsdns-08.org., ns-1656.awsdns-15.co.uk., ns-181.awsdns-22.com., ns-970.awsdns-57.net.
245	mg.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:53.704205	v=spf1 include:mailgun.org ~all		
246	lms-daraz.com	#N/A	locked	tier_3		2024-06-28 13:14:53.942029			, ns1.101domain.com., ns2.101domain.com., ns5.101domain.com.
247	ml.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:54.409298	v=spf1 -all	v=DMARC1; p=reject;	, ns-1205.awsdns-22.org., ns-1827.awsdns-36.co.uk., ns-446.awsdns-55.com., ns-761.awsdns-31.net.
248	lr.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:54.919663	v=spf1 -all	v=DMARC1; p=reject;	, ns-1457.awsdns-54.org., ns-1785.awsdns-31.co.uk., ns-825.awsdns-39.net., ns-90.awsdns-11.com.
249	zm.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:55.326908	v=spf1 -all	v=DMARC1; p=reject;	, ns-1351.awsdns-40.org., ns-1852.awsdns-39.co.uk., ns-350.awsdns-43.com., ns-736.awsdns-28.net.
250	insidedaraz.com	#N/A	locked	tier_3		2024-06-28 13:14:56.249543			, vip3.alidns.com., vip4.alidns.com.
251	dlportal.com.bd	#N/A	locked	tier_3		2024-06-28 13:14:57.126816			, ns2.alibabadns.com., ns1.alibabadns.com.
252	zm.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:57.177438	v=spf1 -all	v=DMARC1; p=reject;	, ns-1351.awsdns-40.org., ns-1852.awsdns-39.co.uk., ns-350.awsdns-43.com., ns-736.awsdns-28.net.
253	cf.jumia.com	#N/A	locked	tier_1		2024-06-28 13:14:57.580077	v=spf1 -all	v=DMARC1; p=reject;	, ns-122.awsdns-15.com., ns-1310.awsdns-35.org., ns-1906.awsdns-46.co.uk., ns-551.awsdns-04.net.
254	kaymu.ph	#N/A	locked	tier_3		2024-06-28 13:14:58.326308			, ns1.commonmx.com., ns2.commonmx.com.
255	e-mail.zando.co.za	#N/A	locked	tier_1		2024-06-28 13:14:58.441197	v=spf1 include:mailgun.org include:amazonses.com ~all		
256	email.jumia.ma	#N/A	locked	tier_1		2024-06-28 13:14:58.581901	v=spf1 include:_realspf1.jumia.com ~all	v=DMARC1; p=reject; rua=mailto:a1ed2e74@in.mailhardener.com; ruf=mailto:a1ed2e74@in.mailhardener.com; fo=1;	
257	dlportal.lk	#N/A	locked	tier_3		2024-06-28 13:14:59.426199			, ns2.alibabadns.com., ns1.alibabadns.com.
258	powwerliving.com	#N/A	locked	tier_3		2024-06-28 13:14:59.727192			
259	jumia.co	#N/A	locked	tier_1		2024-06-28 13:14:59.848195			, cleo.ns.cloudflare.com., lola.ns.cloudflare.com.
260	ss.jumia.com	#N/A	locked	tier_1		2024-06-28 13:15:00.452577			
\.


--
-- Name: domain_info_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domain_info_history_id_seq', 260, true);


--
-- Name: domain_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domain_info_id_seq', 687, true);


--
-- Name: domain_info_history domain_info_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_info_history
    ADD CONSTRAINT domain_info_history_pkey PRIMARY KEY (id);


--
-- Name: domain_info domain_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_info
    ADD CONSTRAINT domain_info_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--

