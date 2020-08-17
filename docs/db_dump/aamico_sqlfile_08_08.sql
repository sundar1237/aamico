--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: app_extras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_extras (
    id integer NOT NULL,
    "seqNo" smallint NOT NULL,
    name character varying(100),
    description character varying(500),
    type character varying(50),
    "createDate" timestamp with time zone NOT NULL,
    "unitPrice" double precision NOT NULL,
    CONSTRAINT "app_extras_seqNo_b3a46eaf_check" CHECK (("seqNo" >= 0))
);


ALTER TABLE public.app_extras OWNER TO postgres;

--
-- Name: app_extras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_extras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_extras_id_seq OWNER TO postgres;

--
-- Name: app_extras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_extras_id_seq OWNED BY public.app_extras.id;


--
-- Name: app_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_order (
    id integer NOT NULL,
    "paymentStatus" character varying(20) NOT NULL,
    "paymentMethod" character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    "deliveryType" character varying(30) NOT NULL,
    "totalPrice" double precision,
    "createDate" timestamp with time zone NOT NULL,
    "total_noOfItems" integer NOT NULL,
    data public.hstore,
    customer_nick_name character varying(50),
    CONSTRAINT "app_order_total_noOfItems_a0a5da68_check" CHECK (("total_noOfItems" >= 0))
);


ALTER TABLE public.app_order OWNER TO postgres;

--
-- Name: app_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_order_id_seq OWNER TO postgres;

--
-- Name: app_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_order_id_seq OWNED BY public.app_order.id;


--
-- Name: app_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_orderitem (
    id integer NOT NULL,
    "seqNo" integer NOT NULL,
    "noOfItems" integer NOT NULL,
    "unitPrice" double precision NOT NULL,
    "extrasPrice" double precision NOT NULL,
    "userInput" character varying(250),
    "totalPrice" double precision,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT "app_orderitem_noOfItems_28b5239d_check" CHECK (("noOfItems" >= 0)),
    CONSTRAINT "app_orderitem_seqNo_6dad110a_check" CHECK (("seqNo" >= 0))
);


ALTER TABLE public.app_orderitem OWNER TO postgres;

--
-- Name: app_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_orderitem_id_seq OWNER TO postgres;

--
-- Name: app_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_orderitem_id_seq OWNED BY public.app_orderitem.id;


--
-- Name: app_orderitemextras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_orderitemextras (
    id integer NOT NULL,
    "seqNo" integer NOT NULL,
    extras_id integer NOT NULL,
    "orderItem_id" integer NOT NULL,
    CONSTRAINT "app_orderitemextras_seqNo_5e72f058_check" CHECK (("seqNo" >= 0))
);


ALTER TABLE public.app_orderitemextras OWNER TO postgres;

--
-- Name: app_orderitemextras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_orderitemextras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_orderitemextras_id_seq OWNER TO postgres;

--
-- Name: app_orderitemextras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_orderitemextras_id_seq OWNED BY public.app_orderitemextras.id;


--
-- Name: app_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_product (
    id integer NOT NULL,
    "seqNo" smallint NOT NULL,
    name character varying(100),
    description character varying(500),
    "createDate" timestamp with time zone NOT NULL,
    "unitPrice" double precision NOT NULL,
    "productType" character varying(500),
    "imagePath" character varying(500),
    data public.hstore,
    CONSTRAINT "app_product_seqNo_c139ce51_check" CHECK (("seqNo" >= 0))
);


ALTER TABLE public.app_product OWNER TO postgres;

--
-- Name: app_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_product_id_seq OWNER TO postgres;

--
-- Name: app_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_product_id_seq OWNED BY public.app_product.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO postgres;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: app_extras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_extras ALTER COLUMN id SET DEFAULT nextval('public.app_extras_id_seq'::regclass);


--
-- Name: app_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_order ALTER COLUMN id SET DEFAULT nextval('public.app_order_id_seq'::regclass);


--
-- Name: app_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitem ALTER COLUMN id SET DEFAULT nextval('public.app_orderitem_id_seq'::regclass);


--
-- Name: app_orderitemextras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitemextras ALTER COLUMN id SET DEFAULT nextval('public.app_orderitemextras_id_seq'::regclass);


--
-- Name: app_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product ALTER COLUMN id SET DEFAULT nextval('public.app_product_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: app_extras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_extras (id, "seqNo", name, description, type, "createDate", "unitPrice") FROM stdin;
22	19	Meeresfrüchte		direct	2020-08-06 12:12:57.993469+00	2
27	25	Poulet		direct	2020-08-06 12:15:27.450065+00	1.5
29	26	Risencrevetten		direct	2020-08-06 12:19:26.806135+00	2
30	27	Crevetten		direct	2020-08-06 12:20:00.431399+00	1.5
31	28	Lachs		direct	2020-08-06 12:20:15.905413+00	2
32	29	Kebab Fleisch		direct	2020-08-06 12:20:37.88802+00	3
33	30	Grana Padano		beyound_3	2020-08-06 12:21:08.481866+00	1
4	1	Frische Tomaten		beyound_3	2020-08-06 12:04:32.519483+00	0
5	2	Artischocken		beyound_3	2020-08-06 12:06:00.977509+00	0
6	3	Peporoni		beyound_3	2020-08-06 12:06:20.663573+00	0
7	4	Gorgonzola		beyound_3	2020-08-06 12:06:40.857441+00	0
8	5	Vorderschinken		beyound_3	2020-08-06 12:07:02.034467+00	0
9	6	Salami(scharf)		beyound_3	2020-08-06 12:07:21.747749+00	0
10	7	Speck		beyound_3	2020-08-06 12:07:36.512676+00	0
11	8	Thon		beyound_3	2020-08-06 12:07:52.057801+00	0
12	9	Kapern		beyound_3	2020-08-06 12:08:05.470593+00	0
13	10	Champignons		beyound_3	2020-08-06 12:08:29.424495+00	0
14	11	Auberginen		beyound_3	2020-08-06 12:08:44.35045+00	0
15	12	Pfefferschoten		beyound_3	2020-08-06 12:09:01.298663+00	0
16	13	Salami		beyound_3	2020-08-06 12:11:06.66119+00	0
17	14	Birne		beyound_3	2020-08-06 12:11:28.935811+00	0
18	15	Erbsen		beyound_3	2020-08-06 12:11:41.582841+00	0
19	16	Eier		beyound_3	2020-08-06 12:11:52.394552+00	0
20	17	Ananas		beyound_3	2020-08-06 12:12:05.098062+00	0
21	18	Spinat		beyound_3	2020-08-06 12:12:16.058707+00	0
23	20	Oliven		beyound_3	2020-08-06 12:13:46.311595+00	0
24	21	Sardllen		beyound_3	2020-08-06 12:14:12.35607+00	0
28	22	Zwiebeln		beyound_3	2020-08-06 12:17:20.781814+00	0
25	23	Knoblauch		beyound_3	2020-08-06 12:14:39.460608+00	0
26	24	Rucola		beyound_3	2020-08-06 12:14:54.8792+00	0
\.


--
-- Data for Name: app_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_order (id, "paymentStatus", "paymentMethod", status, type, "deliveryType", "totalPrice", "createDate", "total_noOfItems", data, customer_nick_name) FROM stdin;
1	Unpaid	on	New	Direct	on	0	2020-08-08 10:13:34.765746+00	1	\N	sundar
2	Unpaid	on	New	Direct	eat_here	0	2020-08-08 10:24:14.315624+00	1	\N	raju
3	Unpaid	By Cash	New	Direct	Take Away	0	2020-08-08 10:25:38.977659+00	1	\N	babu
4	Unpaid	By Cash	New	Direct	Take Away	9.95	2020-08-08 10:28:41.087901+00	1	\N	kunna
5	Paid	By Cash	Progress	Direct	Take Away	12.95	2020-08-08 10:39:31.980498+00	1	\N	Kumar
\.


--
-- Data for Name: app_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_orderitem (id, "seqNo", "noOfItems", "unitPrice", "extrasPrice", "userInput", "totalPrice", order_id, product_id) FROM stdin;
1	1	1	9.95	0	hi	9.95	1	1
2	2	1	12.95	0	should be hot and spicy	12.95	1	12
3	3	2	25.95	3		57.9	1	48
4	1	1	9.95	0		9.95	2	1
5	1	1	23.95	0		23.95	3	45
6	1	1	9.95	0		9.95	4	8
7	1	1	9.95	3	Less spicy	12.95	5	1
\.


--
-- Data for Name: app_orderitemextras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_orderitemextras (id, "seqNo", extras_id, "orderItem_id") FROM stdin;
1	1	32	3
2	1	4	7
3	2	7	7
4	3	10	7
5	4	22	7
\.


--
-- Data for Name: app_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_product (id, "seqNo", name, description, "createDate", "unitPrice", "productType", "imagePath", data) FROM stdin;
1	1	Napoli	Tomaten, Mozzarella, Sardellen, Kapern	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
2	2	Marinara	Frische Tomaten, Knoblauch, Basilikum, Sardellen (ohne Mozzarella)	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
3	3	Margherita	Mozzarella, Basilikum	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
4	4	Quattro Stagioni	Prosciutto di Spalla, Artischocken, Champignons, Peperoni, Oliven	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
5	5	Hawaii	Prosciutto di Spalla, Ananas, Basilikum	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
6	6	Prosciutto	Prosciutto di Spalla	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
7	7	Prosciutto Funghi	Prosciutto di Spalla, Champignons	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
8	8	Vegetariana	Diverse Gemüse	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
9	9	Diavola	Scharfe Salami, Peperoni, Zwiebeln	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
10	10	Carbonara	Speck, Eier, Scharfe Salami, Grana Padano	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
11	11	Capricciosa	Prosciutto di Spalla, Salami, Oliven, Artischocken	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
12	12	Il Padrino	Poulet, Peperoni, Zwiebeln, Pfefferschoten	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
13	13	Heidi	Verschiedene Käsesorten, Rahm Sauce	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
14	14	Piemontese	Steinpilze, Knoblauch	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
15	15	Melanzane	Grillierte Auberginen	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
16	16	Tonno	Thon, Zwiebeln, Kapern	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
17	17	Sarracino	Frische Tomaten, Rucola, Feta, Rohschinken	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
18	18	Gorgonzola	Gorgonzola	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
19	19	Marie-Louise	Frische Tomaten, Rucola, Auberginen, Grana Padano	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
20	20	Feta	Frische Tomaten, Mozzarella, Schafkäse, Oliven	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
21	21	Deliziosa	Riesencrevetten, Auberginen, Kapern, Zwiebeln, Rucola	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
22	22	Gamberoni	Riesencrevetten	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
23	23	Sapori di Mare	Meeresfrüchte mit Mischmuscheln und Riesencrevetten	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
24	24	Calzone	Artischocken, Champignons, Rohschinken	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
25	25	Parmigiana	Grillierte Auberginen, Rohschinken, Grana Padano	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
26	26	Kebab Pizza	Kebab Fleisch	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
27	27	Marco Polo	Speck, Auberginen, Knoblauch, Scharfe Salami, Chilli	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
28	28	Helvetia	Gorgonzola, Mascarpone, Birne	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
29	29	Wilhelm Tell	Speck, Schinken, Salami, Grana Padano	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
30	30	Ilangai (Ceylon)	Ananas, Erbsen, Curry Powder, Poulet	2020-08-06 12:56:30.973057+00	12.95	pizza_30cm		\N
31	31	YB	Frische Tomaten, Ananas, Rucola, Oliven	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
32	32	Sophia Loren	Frische Tomaten, Mozarella, Santa Lucia, Auberginen, Zucchetti	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
33	33	Monica Bellucci	Frische Tomaten, Steinpilze, Knoblauch, Rohschinken	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
34	34	Al Pacino	Pikante Salami, Gorgonzola	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
35	35	Roberto De Niro	Frische Tomaten, Schafkäse, Rucola	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
36	36	SCB	Frische Tomaten, Mascarpone, Rohschinken, Mozarella	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
37	37	Marlon Brando	Steinpilze, Poulet, Gorgonzola, Sardellen, Knoblauch	2020-08-06 12:56:30.973057+00	9.95	pizza_30cm		\N
38	1	Napoli 40cm	Tomaten, Mozzarella, Sardellen, Kapern	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
39	2	Marinara 40cm	Frische Tomaten, Knoblauch, Basilikum, Sardellen (ohne Mozzarella)	2020-08-06 13:00:51.004698+00	19.95	pizza_40cm		\N
40	3	Margherita 40cm	Mozzarella, Basilikum	2020-08-06 13:00:51.004698+00	18.95	pizza_40cm		\N
41	4	Quattro Stagioni 40cm	Prosciutto di Spalla, Artischocken, Champignons, Peperoni, Oliven	2020-08-06 13:00:51.004698+00	24.95	pizza_40cm		\N
42	5	Hawaii 40cm	Prosciutto di Spalla, Ananas, Basilikum	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
43	6	Prosciutto 40cm	Prosciutto di Spalla	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
44	7	Prosciutto Funghi 40cm	Prosciutto di Spalla, Champignons	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
45	8	Vegetariana 40cm	Diverse Gemüse	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
46	9	Diavola 40cm	Scharfe Salami, Peperoni, Zwiebeln	2020-08-06 13:00:51.004698+00	24.95	pizza_40cm		\N
47	10	Carbonara 40cm	Speck, Eier, Scharfe Salami, Grana Padano	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
48	11	Capricciosa 40cm	Prosciutto di Spalla, Salami, Oliven, Artischocken	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
49	12	Il Padrino 40cm	Poulet, Peperoni, Zwiebeln, Pfefferschoten	2020-08-06 13:00:51.004698+00	28.95	pizza_40cm		\N
50	13	Heidi 40cm	Verschiedene Käsesorten, Rahm Sauce	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
51	14	Piemontese 40cm	Steinpilze, Knoblauch	2020-08-06 13:00:51.004698+00	24.95	pizza_40cm		\N
52	15	Melanzane 40cm	Grillierte Auberginen	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
53	16	Tonno 40cm	Thon, Zwiebeln, Kapern	2020-08-06 13:00:51.004698+00	24.95	pizza_40cm		\N
54	17	Sarracino 40cm	Frische Tomaten, Rucola, Feta, Rohschinken	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
55	18	Gorgonzola 40cm	Gorgonzola	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
56	19	Marie-Louise 40cm	Frische Tomaten, Rucola, Auberginen, Grana Padano	2020-08-06 13:00:51.004698+00	23.95	pizza_40cm		\N
57	20	Feta 40cm	Frische Tomaten, Mozzarella, Schafkäse, Oliven	2020-08-06 13:00:51.004698+00	24.95	pizza_40cm		\N
58	21	Deliziosa 40cm	Riesencrevetten, Auberginen, Kapern, Zwiebeln, Rucola	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
59	22	Gamberoni 40cm	Riesencrevetten	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
60	23	Sapori di Mare 40cm	Meeresfrüchte mit Mischmuscheln und Riesencrevetten	2020-08-06 13:00:51.004698+00	28.95	pizza_40cm		\N
61	24	Calzone 40cm	Artischocken, Champignons, Rohschinken	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
62	25	Parmigiana 40cm	Grillierte Auberginen, Rohschinken, Grana Padano	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
63	26	Kebab Pizza 40cm	Kebab Fleisch	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
64	27	Marco Polo 40cm	Speck, Auberginen, Knoblauch, Scharfe Salami, Chilli	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
65	28	Helvetia 40cm	Gorgonzola, Mascarpone, Birne	2020-08-06 13:00:51.004698+00	26.95	pizza_40cm		\N
66	29	Wilhelm Tell 40cm	Speck, Schinken, Salami, Grana Padano	2020-08-06 13:00:51.004698+00	26.95	pizza_40cm		\N
67	30	Ilangai (Ceylon) 40cm	Ananas, Erbsen, Curry Powder, Poulet	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
68	31	YB 40cm	Frische Tomaten, Ananas, Rucola, Oliven	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
69	32	Sophia Loren 40cm	Frische Tomaten, Mozarella, Santa Lucia, Auberginen, Zucchetti	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
70	33	Monica Bellucci 40cm	Frische Tomaten, Steinpilze, Knoblauch, Rohschinken	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
71	34	Al Pacino 40cm	Pikante Salami, Gorgonzola	2020-08-06 13:00:51.004698+00	26.95	pizza_40cm		\N
72	35	Roberto De Niro 40cm	Frische Tomaten, Schafkäse, Rucola	2020-08-06 13:00:51.004698+00	26.95	pizza_40cm		\N
73	36	SCB 40cm	Frische Tomaten, Mascarpone, Rohschinken, Mozarella	2020-08-06 13:00:51.004698+00	25.95	pizza_40cm		\N
74	37	Marlon Brando 40cm	Steinpilze, Poulet, Gorgonzola, Sardellen, Knoblauch	2020-08-06 13:00:51.004698+00	27.95	pizza_40cm		\N
75	1	Chicken Wings (10 Stk)	Klein Portion - ( 10 Stk. )	2020-08-06 13:46:04.06048+00	13.95	wings_klein		\N
76	2	Chicken Nuggets (10 Stk)	Klein Portion - ( 10 Stk. )	2020-08-06 13:46:04.06048+00	12.95	wings_klein		\N
77	3	Farmer Fries (Klein)	Klein	2020-08-06 13:46:04.06048+00	3.95	wings_klein		\N
78	1	Chicken Wings (20 Stk)	Grösse  Portion - ( 20 Stk. )	2020-08-06 13:53:51.586912+00	23.95	wings_gross		\N
79	2	Chicken Nuggets (20 Stk)	Grösse  Portion - ( 20 Stk. )	2020-08-06 13:53:51.586912+00	21.95	wings_gross		\N
80	3	Farmer Fries (Grösse)	Grösse	2020-08-06 13:53:51.586912+00	8.95	wings_gross		\N
81	1	Penne		2020-08-06 14:14:52.532481+00	12.9	pasta		\N
82	2	Spaghetti		2020-08-06 14:14:52.532481+00	12.9	pasta		\N
83	3	Tagliatelle		2020-08-06 14:14:52.532481+00	14.9	pasta		\N
84	4	Torteloni		2020-08-06 14:14:52.532481+00	14.9	pasta		\N
85	5	Gnocchi		2020-08-06 14:14:52.532481+00	14.9	pasta		\N
86	1	Caprese		2020-08-06 14:18:33.815038+00	6.95	salat		\N
87	2	Thon		2020-08-06 14:18:33.815038+00	6.95	salat		\N
88	3	Grüner Salat		2020-08-06 14:18:33.815038+00	4.95	salat		\N
89	4	Gemischter Salat		2020-08-06 14:18:33.815038+00	5.95	salat		\N
90	5	Tomaten Salat		2020-08-06 14:18:33.815038+00	5.95	salat		\N
91	6	Griechischer Salat		2020-08-06 14:18:33.815038+00	6.95	salat		\N
92	7	Focacciabrot		2020-08-06 14:18:33.815038+00	4.95	salat		\N
93	8	Knoblauchbrot		2020-08-06 14:18:33.815038+00	4.95	salat		\N
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add content type	6	add_contenttype
22	Can change content type	6	change_contenttype
23	Can delete content type	6	delete_contenttype
24	Can view content type	6	view_contenttype
25	Can add session	7	add_session
26	Can change session	7	change_session
27	Can delete session	7	delete_session
28	Can view session	7	view_session
29	Can add customer	8	add_customer
30	Can change customer	8	change_customer
31	Can delete customer	8	delete_customer
32	Can view customer	8	view_customer
33	Can add extras	9	add_extras
34	Can change extras	9	change_extras
35	Can delete extras	9	delete_extras
36	Can view extras	9	view_extras
37	Can add order	10	add_order
38	Can change order	10	change_order
39	Can delete order	10	delete_order
40	Can view order	10	view_order
41	Can add order item	11	add_orderitem
42	Can change order item	11	change_orderitem
43	Can delete order item	11	delete_orderitem
44	Can view order item	11	view_orderitem
45	Can add order item extras	12	add_orderitemextras
46	Can change order item extras	12	change_orderitemextras
47	Can delete order item extras	12	delete_orderitemextras
48	Can view order item extras	12	view_orderitemextras
49	Can add product	13	add_product
50	Can change product	13	change_product
51	Can delete product	13	delete_product
52	Can view product	13	view_product
53	Can add email address	14	add_emailaddress
54	Can change email address	14	change_emailaddress
55	Can delete email address	14	delete_emailaddress
56	Can view email address	14	view_emailaddress
57	Can add email confirmation	15	add_emailconfirmation
58	Can change email confirmation	15	change_emailconfirmation
59	Can delete email confirmation	15	delete_emailconfirmation
60	Can view email confirmation	15	view_emailconfirmation
61	Can add social account	16	add_socialaccount
62	Can change social account	16	change_socialaccount
63	Can delete social account	16	delete_socialaccount
64	Can view social account	16	view_socialaccount
65	Can add social application	17	add_socialapp
66	Can change social application	17	change_socialapp
67	Can delete social application	17	delete_socialapp
68	Can view social application	17	view_socialapp
69	Can add social application token	18	add_socialtoken
70	Can change social application token	18	change_socialtoken
71	Can delete social application token	18	delete_socialtoken
72	Can view social application token	18	view_socialtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$EYmedjQaHFFQ$jeTq+FvbiRlM7AHPP0BqV3RalUFAbhqFucPZtoYpBSo=	2020-08-08 23:20:29.373319+00	t	chandra			chandra@chandra.com	t	t	2020-08-08 22:33:40.185963+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	sites	site
6	contenttypes	contenttype
7	sessions	session
8	app	customer
9	app	extras
10	app	order
11	app	orderitem
12	app	orderitemextras
13	app	product
14	account	emailaddress
15	account	emailconfirmation
16	socialaccount	socialaccount
17	socialaccount	socialapp
18	socialaccount	socialtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-08-07 09:03:58.321403+00
2	auth	0001_initial	2020-08-07 09:03:58.42393+00
3	account	0001_initial	2020-08-07 09:03:58.477411+00
4	account	0002_email_max_length	2020-08-07 09:03:58.492414+00
5	admin	0001_initial	2020-08-07 09:03:58.526543+00
6	admin	0002_logentry_remove_auto_add	2020-08-07 09:03:58.536506+00
7	admin	0003_logentry_add_action_flag_choices	2020-08-07 09:03:58.548506+00
8	app	0001_initial	2020-08-07 09:03:58.623014+00
9	contenttypes	0002_remove_content_type_name	2020-08-07 09:03:58.661547+00
10	auth	0002_alter_permission_name_max_length	2020-08-07 09:03:58.674578+00
11	auth	0003_alter_user_email_max_length	2020-08-07 09:03:58.689576+00
12	auth	0004_alter_user_username_opts	2020-08-07 09:03:58.700616+00
13	auth	0005_alter_user_last_login_null	2020-08-07 09:03:58.717628+00
14	auth	0006_require_contenttypes_0002	2020-08-07 09:03:58.722723+00
15	auth	0007_alter_validators_add_error_messages	2020-08-07 09:03:58.733723+00
16	auth	0008_alter_user_username_max_length	2020-08-07 09:03:58.753722+00
17	auth	0009_alter_user_last_name_max_length	2020-08-07 09:03:58.768722+00
18	sessions	0001_initial	2020-08-07 09:03:58.789722+00
19	sites	0001_initial	2020-08-07 09:03:58.80373+00
20	sites	0002_alter_domain_unique	2020-08-07 09:03:58.819722+00
21	socialaccount	0001_initial	2020-08-07 09:03:58.921722+00
22	socialaccount	0002_token_max_lengths	2020-08-07 09:03:58.969722+00
23	socialaccount	0003_extra_data_default_dict	2020-08-07 09:03:58.98076+00
24	app	0002_auto_20200807_1116	2020-08-07 09:17:03.297309+00
25	app	0003_auto_20200807_1120	2020-08-07 09:20:51.285912+00
26	app	0004_remove_product_discountpercentage	2020-08-07 10:02:41.488563+00
27	app	0005_auto_20200808_2328	2020-08-08 21:28:32.54701+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7he87ggo0phf88qg72zpi9e5ois526zg	N2FjN2VlNGI5MTIxZTk1ODIxODFmZTA2ZjBkNGY1N2E5YWM0YTZjNzp7Im9yZGVySXRlbUxpc3QiOlt7InByb2R1Y3QiOnsiaWQiOjQxLCJzZXFObyI6NCwibmFtZSI6IlF1YXR0cm8gU3RhZ2lvbmkgNDBjbSIsImRlc2NyaXB0aW9uIjoiUHJvc2NpdXR0byBkaSBTcGFsbGEsIEFydGlzY2hvY2tlbiwgQ2hhbXBpZ25vbnMsIFBlcGVyb25pLCBPbGl2ZW4iLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNTowMDo1MS4wMDQ2OTgrMDI6MDAiLCJ1bml0UHJpY2UiOjI0Ljk1LCJwcm9kdWN0VHlwZSI6InBpenphXzQwY20iLCJpbWFnZVBhdGgiOiIiLCJkYXRhIjpudWxsfSwibm9fb2ZfaXRlbXMiOjEsInRvdGFsX29wdGlvbnMiOjMsImV4dHJhX3ByaWNlIjoxLjAsImNoYW5nZWRfdG90YWwiOjI1Ljk1LCJleHRyYXNMaXN0IjpbeyJpZCI6NSwic2VxTm8iOjIsIm5hbWUiOiJBcnRpc2Nob2NrZW4iLCJkZXNjcmlwdGlvbiI6IiIsInR5cGUiOiJiZXlvdW5kXzMiLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNDowNjowMC45Nzc1MDkrMDI6MDAiLCJ1bml0UHJpY2UiOjAuMH0seyJpZCI6Niwic2VxTm8iOjMsIm5hbWUiOiJQZXBvcm9uaSIsImRlc2NyaXB0aW9uIjoiIiwidHlwZSI6ImJleW91bmRfMyIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjA2OjIwLjY2MzU3MyswMjowMCIsInVuaXRQcmljZSI6MC4wfSx7ImlkIjo5LCJzZXFObyI6NiwibmFtZSI6IlNhbGFtaShzY2hhcmYpIiwiZGVzY3JpcHRpb24iOiIiLCJ0eXBlIjoiYmV5b3VuZF8zIiwiY3JlYXRlRGF0ZSI6IjIwMjAtMDgtMDZUMTQ6MDc6MjEuNzQ3NzQ5KzAyOjAwIiwidW5pdFByaWNlIjowLjB9XX1dfQ==	2020-08-21 23:01:14.787166+00
g6ipvr9gwq3p48016c52pm12wxtrha5y	ODY5NjQ3ZGQ0ZDA3Yjk1ZTJlNjU1NzEzOWI2NmY0Mzg1NmJiZGQ3Mzp7Im9yZGVySXRlbUxpc3QiOlt7InByb2R1Y3QiOnsiaWQiOjEsInNlcU5vIjoxLCJuYW1lIjoiTmFwb2xpIiwiZGVzY3JpcHRpb24iOiJUb21hdGVuLCBNb3p6YXJlbGxhLCBTYXJkZWxsZW4sIEthcGVybiIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjU2OjMwLjk3MzA1NyswMjowMCIsInVuaXRQcmljZSI6OS45NSwicHJvZHVjdFR5cGUiOiJwaXp6YV8zMGNtIiwiaW1hZ2VQYXRoIjoiIiwiZGF0YSI6bnVsbH0sIm5vX29mX2l0ZW1zIjoxLCJ0b3RhbF9vcHRpb25zIjozLCJleHRyYV9wcmljZSI6MS4wLCJjaGFuZ2VkX3RvdGFsIjoxMC45NSwiZXh0cmFzTGlzdCI6W3siaWQiOjUsInNlcU5vIjoyLCJuYW1lIjoiQXJ0aXNjaG9ja2VuIiwiZGVzY3JpcHRpb24iOiIiLCJ0eXBlIjoiYmV5b3VuZF8zIiwiY3JlYXRlRGF0ZSI6IjIwMjAtMDgtMDZUMTQ6MDY6MDAuOTc3NTA5KzAyOjAwIiwidW5pdFByaWNlIjowLjB9LHsiaWQiOjgsInNlcU5vIjo1LCJuYW1lIjoiVm9yZGVyc2NoaW5rZW4iLCJkZXNjcmlwdGlvbiI6IiIsInR5cGUiOiJiZXlvdW5kXzMiLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNDowNzowMi4wMzQ0NjcrMDI6MDAiLCJ1bml0UHJpY2UiOjAuMH0seyJpZCI6MTEsInNlcU5vIjo4LCJuYW1lIjoiVGhvbiIsImRlc2NyaXB0aW9uIjoiIiwidHlwZSI6ImJleW91bmRfMyIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjA3OjUyLjA1NzgwMSswMjowMCIsInVuaXRQcmljZSI6MC4wfV19LHsicHJvZHVjdCI6eyJpZCI6MSwic2VxTm8iOjEsIm5hbWUiOiJOYXBvbGkiLCJkZXNjcmlwdGlvbiI6IlRvbWF0ZW4sIE1venphcmVsbGEsIFNhcmRlbGxlbiwgS2FwZXJuIiwiY3JlYXRlRGF0ZSI6IjIwMjAtMDgtMDZUMTQ6NTY6MzAuOTczMDU3KzAyOjAwIiwidW5pdFByaWNlIjo5Ljk1LCJwcm9kdWN0VHlwZSI6InBpenphXzMwY20iLCJpbWFnZVBhdGgiOiIiLCJkYXRhIjpudWxsfSwibm9fb2ZfaXRlbXMiOjEsInRvdGFsX29wdGlvbnMiOjMsImV4dHJhX3ByaWNlIjoxLjAsImNoYW5nZWRfdG90YWwiOjEwLjk1LCJleHRyYXNMaXN0IjpbeyJpZCI6NSwic2VxTm8iOjIsIm5hbWUiOiJBcnRpc2Nob2NrZW4iLCJkZXNjcmlwdGlvbiI6IiIsInR5cGUiOiJiZXlvdW5kXzMiLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNDowNjowMC45Nzc1MDkrMDI6MDAiLCJ1bml0UHJpY2UiOjAuMH0seyJpZCI6OCwic2VxTm8iOjUsIm5hbWUiOiJWb3JkZXJzY2hpbmtlbiIsImRlc2NyaXB0aW9uIjoiIiwidHlwZSI6ImJleW91bmRfMyIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjA3OjAyLjAzNDQ2NyswMjowMCIsInVuaXRQcmljZSI6MC4wfSx7ImlkIjoxNywic2VxTm8iOjE0LCJuYW1lIjoiQmlybmUiLCJkZXNjcmlwdGlvbiI6IiIsInR5cGUiOiJiZXlvdW5kXzMiLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNDoxMToyOC45MzU4MTErMDI6MDAiLCJ1bml0UHJpY2UiOjAuMH1dfSx7InByb2R1Y3QiOnsiaWQiOjM4LCJzZXFObyI6MSwibmFtZSI6Ik5hcG9saSA0MGNtIiwiZGVzY3JpcHRpb24iOiJUb21hdGVuLCBNb3p6YXJlbGxhLCBTYXJkZWxsZW4sIEthcGVybiIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE1OjAwOjUxLjAwNDY5OCswMjowMCIsInVuaXRQcmljZSI6MjMuOTUsInByb2R1Y3RUeXBlIjoicGl6emFfNDBjbSIsImltYWdlUGF0aCI6IiIsImRhdGEiOm51bGx9LCJub19vZl9pdGVtcyI6MSwidG90YWxfb3B0aW9ucyI6MSwiZXh0cmFfcHJpY2UiOjIuMCwiY2hhbmdlZF90b3RhbCI6MjUuOTUsImV4dHJhc0xpc3QiOlt7ImlkIjoyOSwic2VxTm8iOjI2LCJuYW1lIjoiUmlzZW5jcmV2ZXR0ZW4iLCJkZXNjcmlwdGlvbiI6IiIsInR5cGUiOiJkaXJlY3QiLCJjcmVhdGVEYXRlIjoiMjAyMC0wOC0wNlQxNDoxOToyNi44MDYxMzUrMDI6MDAiLCJ1bml0UHJpY2UiOjIuMH1dfV19	2020-08-22 09:18:30.501996+00
4maqi96hrsx1e0h427wumqri3voaup5v	ZWE2ZmZjYzgwMjkxNTRkZmE0ODFkZDlhMDY1Y2Q4MTE2ZGI1ZmUyMjp7Im9yZGVySXRlbUxpc3QiOlt7InByb2R1Y3QiOnsiaWQiOjM4LCJzZXFObyI6MSwibmFtZSI6Ik5hcG9saSA0MGNtIiwiZGVzY3JpcHRpb24iOiJUb21hdGVuLCBNb3p6YXJlbGxhLCBTYXJkZWxsZW4sIEthcGVybiIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE1OjAwOjUxLjAwNDY5OCswMjowMCIsInVuaXRQcmljZSI6MjMuOTUsInByb2R1Y3RUeXBlIjoicGl6emFfNDBjbSIsImltYWdlUGF0aCI6IiIsImRhdGEiOm51bGx9LCJub19vZl9pdGVtcyI6MSwidG90YWxfb3B0aW9ucyI6MywiZXh0cmFfcHJpY2UiOjEuMCwiY2hhbmdlZF90b3RhbCI6MjQuOTUsImV4dHJhc0xpc3QiOlt7ImlkIjo0LCJzZXFObyI6MSwibmFtZSI6IkZyaXNjaGUgVG9tYXRlbiIsImRlc2NyaXB0aW9uIjoiIiwidHlwZSI6ImJleW91bmRfMyIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjA0OjMyLjUxOTQ4MyswMjowMCIsInVuaXRQcmljZSI6MC4wfSx7ImlkIjo1LCJzZXFObyI6MiwibmFtZSI6IkFydGlzY2hvY2tlbiIsImRlc2NyaXB0aW9uIjoiIiwidHlwZSI6ImJleW91bmRfMyIsImNyZWF0ZURhdGUiOiIyMDIwLTA4LTA2VDE0OjA2OjAwLjk3NzUwOSswMjowMCIsInVuaXRQcmljZSI6MC4wfSx7ImlkIjo4LCJzZXFObyI6NSwibmFtZSI6IlZvcmRlcnNjaGlua2VuIiwiZGVzY3JpcHRpb24iOiIiLCJ0eXBlIjoiYmV5b3VuZF8zIiwiY3JlYXRlRGF0ZSI6IjIwMjAtMDgtMDZUMTQ6MDc6MDIuMDM0NDY3KzAyOjAwIiwidW5pdFByaWNlIjowLjB9XSwidXNlcl9pbnB1dCI6Ikxlc3Mgc3BpY3kifV19	2020-08-22 09:25:03.64866+00
41dzghjcv6s24ecphvns2ayd8fuu31oj	MjdjZDkxZmJmMDE1MGI5YTlmMTNkMzZjM2JiNTVkMWJhNGUxYjZjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzM0Zjk3ZTE2OWYxNDc4OTJkODVhNGVmYTQ0OTE3NjFlZDlmYjRiIn0=	2020-08-22 22:48:37.589522+00
za12lixp4efb06iagx0ufn9ufmcvop79	MjdjZDkxZmJmMDE1MGI5YTlmMTNkMzZjM2JiNTVkMWJhNGUxYjZjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzM0Zjk3ZTE2OWYxNDc4OTJkODVhNGVmYTQ0OTE3NjFlZDlmYjRiIn0=	2020-08-22 22:56:13.775499+00
8a4egwpp2k96tx8g67k45qpbljrqnj22	OGIzMjJiMTdlMWY3NmM1ODNkNDlhMzEzZjRhZDc2MzAxOTY1NWFkYzp7fQ==	2020-08-22 23:08:26.727269+00
5a8w2adpo44b0dar7eps7majo0t8xloe	MjdjZDkxZmJmMDE1MGI5YTlmMTNkMzZjM2JiNTVkMWJhNGUxYjZjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzM0Zjk3ZTE2OWYxNDc4OTJkODVhNGVmYTQ0OTE3NjFlZDlmYjRiIn0=	2020-08-22 23:13:38.627409+00
891m33mu6p2r90rj0ldudt5wkkm4gjr5	MjdjZDkxZmJmMDE1MGI5YTlmMTNkMzZjM2JiNTVkMWJhNGUxYjZjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzM0Zjk3ZTE2OWYxNDc4OTJkODVhNGVmYTQ0OTE3NjFlZDlmYjRiIn0=	2020-08-22 23:14:00.104033+00
v7lci1f3mdjr4vpjll6u3emlxleh6vlj	MjdjZDkxZmJmMDE1MGI5YTlmMTNkMzZjM2JiNTVkMWJhNGUxYjZjMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzM0Zjk3ZTE2OWYxNDc4OTJkODVhNGVmYTQ0OTE3NjFlZDlmYjRiIn0=	2020-08-22 23:20:29.378319+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: app_extras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_extras_id_seq', 33, true);


--
-- Name: app_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_order_id_seq', 5, true);


--
-- Name: app_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_orderitem_id_seq', 7, true);


--
-- Name: app_orderitemextras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_orderitemextras_id_seq', 5, true);


--
-- Name: app_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_product_id_seq', 93, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: app_extras app_extras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_extras
    ADD CONSTRAINT app_extras_pkey PRIMARY KEY (id);


--
-- Name: app_order app_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_pkey PRIMARY KEY (id);


--
-- Name: app_orderitem app_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_pkey PRIMARY KEY (id);


--
-- Name: app_orderitemextras app_orderitemextras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT app_orderitemextras_pkey PRIMARY KEY (id);


--
-- Name: app_product app_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: app_orderitem_order_id_41257a1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_orderitem_order_id_41257a1b ON public.app_orderitem USING btree (order_id);


--
-- Name: app_orderitem_product_id_5f40ddb0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_orderitem_product_id_5f40ddb0 ON public.app_orderitem USING btree (product_id);


--
-- Name: app_orderitemextras_extras_id_f8750fc7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_orderitemextras_extras_id_f8750fc7 ON public.app_orderitemextras USING btree (extras_id);


--
-- Name: app_orderitemextras_orderItem_id_946f9db9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app_orderitemextras_orderItem_id_946f9db9" ON public.app_orderitemextras USING btree ("orderItem_id");


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitem app_orderitem_order_id_41257a1b_fk_app_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_order_id_41257a1b_fk_app_order_id FOREIGN KEY (order_id) REFERENCES public.app_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitem app_orderitem_product_id_5f40ddb0_fk_app_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_product_id_5f40ddb0_fk_app_product_id FOREIGN KEY (product_id) REFERENCES public.app_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitemextras app_orderitemextras_extras_id_f8750fc7_fk_app_extras_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT app_orderitemextras_extras_id_f8750fc7_fk_app_extras_id FOREIGN KEY (extras_id) REFERENCES public.app_extras(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_orderitemextras app_orderitemextras_orderItem_id_946f9db9_fk_app_orderitem_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT "app_orderitemextras_orderItem_id_946f9db9_fk_app_orderitem_id" FOREIGN KEY ("orderItem_id") REFERENCES public.app_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

