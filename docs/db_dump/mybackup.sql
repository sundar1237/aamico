PGDMP     *    
                x            postgres    12.2 (Debian 12.2-2.pgdg100+1)    12.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    13408    postgres    DATABASE     x   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3328                        3079    16385    hstore 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;
    DROP EXTENSION hstore;
                   false                       0    0    EXTENSION hstore    COMMENT     S   COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';
                        false    2            �            1259    16637    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    16635    account_emailaddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_emailaddress_id_seq;
       public          postgres    false    220                       0    0    account_emailaddress_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;
          public          postgres    false    219            �            1259    16647    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    16645     account_emailconfirmation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.account_emailconfirmation_id_seq;
       public          postgres    false    222                       0    0     account_emailconfirmation_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;
          public          postgres    false    221            �            1259    16706 
   app_extras    TABLE     l  CREATE TABLE public.app_extras (
    id integer NOT NULL,
    "seqNo" smallint NOT NULL,
    name character varying(100),
    description character varying(500),
    type character varying(50),
    "createDate" timestamp with time zone NOT NULL,
    "unitPrice" double precision NOT NULL,
    CONSTRAINT "app_extras_seqNo_b3a46eaf_check" CHECK (("seqNo" >= 0))
);
    DROP TABLE public.app_extras;
       public         heap    postgres    false            �            1259    16704    app_extras_id_seq    SEQUENCE     �   CREATE SEQUENCE public.app_extras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.app_extras_id_seq;
       public          postgres    false    226                       0    0    app_extras_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.app_extras_id_seq OWNED BY public.app_extras.id;
          public          postgres    false    225            �            1259    16718 	   app_order    TABLE     K  CREATE TABLE public.app_order (
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
    DROP TABLE public.app_order;
       public         heap    postgres    false    2    2    2    2    2            �            1259    16716    app_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.app_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.app_order_id_seq;
       public          postgres    false    228                       0    0    app_order_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.app_order_id_seq OWNED BY public.app_order.id;
          public          postgres    false    227            �            1259    16730    app_orderitem    TABLE       CREATE TABLE public.app_orderitem (
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
 !   DROP TABLE public.app_orderitem;
       public         heap    postgres    false            �            1259    16728    app_orderitem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.app_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.app_orderitem_id_seq;
       public          postgres    false    230                       0    0    app_orderitem_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.app_orderitem_id_seq OWNED BY public.app_orderitem.id;
          public          postgres    false    229            �            1259    16740    app_orderitemextras    TABLE     �   CREATE TABLE public.app_orderitemextras (
    id integer NOT NULL,
    "seqNo" integer NOT NULL,
    extras_id integer NOT NULL,
    "orderItem_id" integer NOT NULL,
    CONSTRAINT "app_orderitemextras_seqNo_5e72f058_check" CHECK (("seqNo" >= 0))
);
 '   DROP TABLE public.app_orderitemextras;
       public         heap    postgres    false            �            1259    16738    app_orderitemextras_id_seq    SEQUENCE     �   CREATE SEQUENCE public.app_orderitemextras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.app_orderitemextras_id_seq;
       public          postgres    false    232                       0    0    app_orderitemextras_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.app_orderitemextras_id_seq OWNED BY public.app_orderitemextras.id;
          public          postgres    false    231            �            1259    16749    app_product    TABLE     �  CREATE TABLE public.app_product (
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
    DROP TABLE public.app_product;
       public         heap    postgres    false    2    2    2    2    2            �            1259    16747    app_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.app_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.app_product_id_seq;
       public          postgres    false    234            	           0    0    app_product_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.app_product_id_seq OWNED BY public.app_product.id;
          public          postgres    false    233            �            1259    16541 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16539    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    210            
           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    209            �            1259    16551    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16549    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    212                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    211            �            1259    16533    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16531    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    208                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    207            �            1259    16559 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16569    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16567    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    216                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    215            �            1259    16557    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    214                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    213            �            1259    16577    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16575 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    218                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    217            �            1259    16674    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16672    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    224                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    223            �            1259    16523    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16521    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    206                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    205            �            1259    16512    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16510    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    204                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    203            �            1259    16789    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    16801    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    16799    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    237                       0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    236            �            1259    16812    socialaccount_socialaccount    TABLE     D  CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.socialaccount_socialaccount;
       public         heap    postgres    false            �            1259    16810 "   socialaccount_socialaccount_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.socialaccount_socialaccount_id_seq;
       public          postgres    false    239                       0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;
          public          postgres    false    238            �            1259    16823    socialaccount_socialapp    TABLE     #  CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);
 +   DROP TABLE public.socialaccount_socialapp;
       public         heap    postgres    false            �            1259    16821    socialaccount_socialapp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.socialaccount_socialapp_id_seq;
       public          postgres    false    241                       0    0    socialaccount_socialapp_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;
          public          postgres    false    240            �            1259    16831    socialaccount_socialapp_sites    TABLE     �   CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);
 1   DROP TABLE public.socialaccount_socialapp_sites;
       public         heap    postgres    false            �            1259    16829 $   socialaccount_socialapp_sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.socialaccount_socialapp_sites_id_seq;
       public          postgres    false    243                       0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;
          public          postgres    false    242            �            1259    16839    socialaccount_socialtoken    TABLE     �   CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);
 -   DROP TABLE public.socialaccount_socialtoken;
       public         heap    postgres    false            �            1259    16837     socialaccount_socialtoken_id_seq    SEQUENCE     �   CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.socialaccount_socialtoken_id_seq;
       public          postgres    false    245                       0    0     socialaccount_socialtoken_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;
          public          postgres    false    244            �           2604    16640    account_emailaddress id    DEFAULT     �   ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);
 F   ALTER TABLE public.account_emailaddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16650    account_emailconfirmation id    DEFAULT     �   ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);
 K   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16709    app_extras id    DEFAULT     n   ALTER TABLE ONLY public.app_extras ALTER COLUMN id SET DEFAULT nextval('public.app_extras_id_seq'::regclass);
 <   ALTER TABLE public.app_extras ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    16721    app_order id    DEFAULT     l   ALTER TABLE ONLY public.app_order ALTER COLUMN id SET DEFAULT nextval('public.app_order_id_seq'::regclass);
 ;   ALTER TABLE public.app_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    16733    app_orderitem id    DEFAULT     t   ALTER TABLE ONLY public.app_orderitem ALTER COLUMN id SET DEFAULT nextval('public.app_orderitem_id_seq'::regclass);
 ?   ALTER TABLE public.app_orderitem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    16743    app_orderitemextras id    DEFAULT     �   ALTER TABLE ONLY public.app_orderitemextras ALTER COLUMN id SET DEFAULT nextval('public.app_orderitemextras_id_seq'::regclass);
 E   ALTER TABLE public.app_orderitemextras ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    16752    app_product id    DEFAULT     p   ALTER TABLE ONLY public.app_product ALTER COLUMN id SET DEFAULT nextval('public.app_product_id_seq'::regclass);
 =   ALTER TABLE public.app_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    16544    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16554    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    16536    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207    208            �           2604    16562    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    16572    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16580    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16677    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16526    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            �           2604    16515    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            �           2604    16804    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    16815    socialaccount_socialaccount id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);
 M   ALTER TABLE public.socialaccount_socialaccount ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    16826    socialaccount_socialapp id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);
 I   ALTER TABLE public.socialaccount_socialapp ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    16834     socialaccount_socialapp_sites id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);
 O   ALTER TABLE public.socialaccount_socialapp_sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    16842    socialaccount_socialtoken id    DEFAULT     �   ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);
 K   ALTER TABLE public.socialaccount_socialtoken ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �          0    16637    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    220   m(      �          0    16647    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    222   �(      �          0    16706 
   app_extras 
   TABLE DATA           e   COPY public.app_extras (id, "seqNo", name, description, type, "createDate", "unitPrice") FROM stdin;
    public          postgres    false    226   �(      �          0    16718 	   app_order 
   TABLE DATA           �   COPY public.app_order (id, "paymentStatus", "paymentMethod", status, type, "deliveryType", "totalPrice", "createDate", "total_noOfItems", data, customer_nick_name) FROM stdin;
    public          postgres    false    228   B+      �          0    16730    app_orderitem 
   TABLE DATA           �   COPY public.app_orderitem (id, "seqNo", "noOfItems", "unitPrice", "extrasPrice", "userInput", "totalPrice", order_id, product_id) FROM stdin;
    public          postgres    false    230   ,      �          0    16740    app_orderitemextras 
   TABLE DATA           U   COPY public.app_orderitemextras (id, "seqNo", extras_id, "orderItem_id") FROM stdin;
    public          postgres    false    232   �,      �          0    16749    app_product 
   TABLE DATA           �   COPY public.app_product (id, "seqNo", name, description, "createDate", "unitPrice", "productType", "imagePath", data) FROM stdin;
    public          postgres    false    234   �,      �          0    16541 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    210   �3      �          0    16551    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    212   4      �          0    16533    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    208   84      �          0    16559 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    214   7      �          0    16569    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    216   �7      �          0    16577    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    218   �7      �          0    16674    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    224   8      �          0    16523    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    206   "8      �          0    16512    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    204   �8      �          0    16789    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    235   ?;      �          0    16801    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    237   �C      �          0    16812    socialaccount_socialaccount 
   TABLE DATA           v   COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
    public          postgres    false    239   �C      �          0    16823    socialaccount_socialapp 
   TABLE DATA           ]   COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
    public          postgres    false    241   D      �          0    16831    socialaccount_socialapp_sites 
   TABLE DATA           R   COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
    public          postgres    false    243   1D      �          0    16839    socialaccount_socialtoken 
   TABLE DATA           l   COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
    public          postgres    false    245   ND                 0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);
          public          postgres    false    219                       0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    221                       0    0    app_extras_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.app_extras_id_seq', 33, true);
          public          postgres    false    225                       0    0    app_order_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.app_order_id_seq', 5, true);
          public          postgres    false    227                       0    0    app_orderitem_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.app_orderitem_id_seq', 7, true);
          public          postgres    false    229                       0    0    app_orderitemextras_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.app_orderitemextras_id_seq', 5, true);
          public          postgres    false    231                       0    0    app_product_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.app_product_id_seq', 93, true);
          public          postgres    false    233                       0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    209                        0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    211            !           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);
          public          postgres    false    207            "           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    215            #           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    213            $           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    217            %           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    223            &           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);
          public          postgres    false    205            '           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);
          public          postgres    false    203            (           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    236            )           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);
          public          postgres    false    238            *           0    0    socialaccount_socialapp_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);
          public          postgres    false    240            +           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);
          public          postgres    false    242            ,           0    0     socialaccount_socialtoken_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);
          public          postgres    false    244                       2606    16670 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    220                       2606    16642 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    220                       2606    16654 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    222                       2606    16652 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    222                       2606    16715    app_extras app_extras_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.app_extras
    ADD CONSTRAINT app_extras_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.app_extras DROP CONSTRAINT app_extras_pkey;
       public            postgres    false    226                       2606    16727    app_order app_order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.app_order
    ADD CONSTRAINT app_order_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.app_order DROP CONSTRAINT app_order_pkey;
       public            postgres    false    228                       2606    16737     app_orderitem app_orderitem_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.app_orderitem DROP CONSTRAINT app_orderitem_pkey;
       public            postgres    false    230                       2606    16746 ,   app_orderitemextras app_orderitemextras_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT app_orderitemextras_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.app_orderitemextras DROP CONSTRAINT app_orderitemextras_pkey;
       public            postgres    false    232            !           2606    16758    app_product app_product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.app_product
    ADD CONSTRAINT app_product_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.app_product DROP CONSTRAINT app_product_pkey;
       public            postgres    false    234            �           2606    16548    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    210            �           2606    16603 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    212    212            �           2606    16556 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    212            �           2606    16546    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    210            �           2606    16589 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    208    208            �           2606    16538 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    208            �           2606    16574 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    216            �           2606    16618 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    216    216            �           2606    16564    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    214                        2606    16582 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    218                       2606    16632 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    218    218            �           2606    16784     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    214                       2606    16683 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    224            �           2606    16530 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    206    206            �           2606    16528 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    206            �           2606    16520 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    204            $           2606    16796 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    235            (           2606    16808 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    237            *           2606    16806    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    237            ,           2606    16820 <   socialaccount_socialaccount socialaccount_socialaccount_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_pkey;
       public            postgres    false    239            .           2606    16851 R   socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);
 |   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq;
       public            postgres    false    239    239            3           2606    16869 Y   socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);
 �   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq;
       public            postgres    false    243    243            1           2606    16828 4   socialaccount_socialapp socialaccount_socialapp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.socialaccount_socialapp DROP CONSTRAINT socialaccount_socialapp_pkey;
       public            postgres    false    241            5           2606    16836 @   socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp_sites_pkey;
       public            postgres    false    243            ;           2606    16849 S   socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);
 }   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq;
       public            postgres    false    245    245            =           2606    16847 8   socialaccount_socialtoken socialaccount_socialtoken_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_pkey;
       public            postgres    false    245                       1259    16671 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    220            	           1259    16661 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    220            
           1259    16668 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    222                       1259    16667 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    222                       1259    16764    app_orderitem_order_id_41257a1b    INDEX     ]   CREATE INDEX app_orderitem_order_id_41257a1b ON public.app_orderitem USING btree (order_id);
 3   DROP INDEX public.app_orderitem_order_id_41257a1b;
       public            postgres    false    230                       1259    16777 !   app_orderitem_product_id_5f40ddb0    INDEX     a   CREATE INDEX app_orderitem_product_id_5f40ddb0 ON public.app_orderitem USING btree (product_id);
 5   DROP INDEX public.app_orderitem_product_id_5f40ddb0;
       public            postgres    false    230                       1259    16775 &   app_orderitemextras_extras_id_f8750fc7    INDEX     k   CREATE INDEX app_orderitemextras_extras_id_f8750fc7 ON public.app_orderitemextras USING btree (extras_id);
 :   DROP INDEX public.app_orderitemextras_extras_id_f8750fc7;
       public            postgres    false    232                       1259    16776 )   app_orderitemextras_orderItem_id_946f9db9    INDEX     u   CREATE INDEX "app_orderitemextras_orderItem_id_946f9db9" ON public.app_orderitemextras USING btree ("orderItem_id");
 ?   DROP INDEX public."app_orderitemextras_orderItem_id_946f9db9";
       public            postgres    false    232            �           1259    16591    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    210            �           1259    16604 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    212            �           1259    16605 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    212            �           1259    16590 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    208            �           1259    16620 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    216            �           1259    16619 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    216            �           1259    16634 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    218                       1259    16633 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    218            �           1259    16785     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    214                       1259    16694 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    224                       1259    16695 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    224            "           1259    16798 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    235            %           1259    16797 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    235            &           1259    16809     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    237            /           1259    16857 ,   socialaccount_socialaccount_user_id_8146e70c    INDEX     w   CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);
 @   DROP INDEX public.socialaccount_socialaccount_user_id_8146e70c;
       public            postgres    false    239            6           1259    16871 .   socialaccount_socialapp_sites_site_id_2579dee5    INDEX     {   CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);
 B   DROP INDEX public.socialaccount_socialapp_sites_site_id_2579dee5;
       public            postgres    false    243            7           1259    16870 3   socialaccount_socialapp_sites_socialapp_id_97fb6e7d    INDEX     �   CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);
 G   DROP INDEX public.socialaccount_socialapp_sites_socialapp_id_97fb6e7d;
       public            postgres    false    243            8           1259    16882 -   socialaccount_socialtoken_account_id_951f210e    INDEX     y   CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);
 A   DROP INDEX public.socialaccount_socialtoken_account_id_951f210e;
       public            postgres    false    245            9           1259    16883 )   socialaccount_socialtoken_app_id_636a42d7    INDEX     q   CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);
 =   DROP INDEX public.socialaccount_socialtoken_app_id_636a42d7;
       public            postgres    false    245            E           2606    16655 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    214    3060    220            F           2606    16662 U   account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
       public          postgres    false    220    3080    222            I           2606    16759 =   app_orderitem app_orderitem_order_id_41257a1b_fk_app_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_order_id_41257a1b_fk_app_order_id FOREIGN KEY (order_id) REFERENCES public.app_order(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.app_orderitem DROP CONSTRAINT app_orderitem_order_id_41257a1b_fk_app_order_id;
       public          postgres    false    3095    228    230            J           2606    16778 A   app_orderitem app_orderitem_product_id_5f40ddb0_fk_app_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.app_orderitem
    ADD CONSTRAINT app_orderitem_product_id_5f40ddb0_fk_app_product_id FOREIGN KEY (product_id) REFERENCES public.app_product(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.app_orderitem DROP CONSTRAINT app_orderitem_product_id_5f40ddb0_fk_app_product_id;
       public          postgres    false    234    230    3105            K           2606    16765 K   app_orderitemextras app_orderitemextras_extras_id_f8750fc7_fk_app_extras_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT app_orderitemextras_extras_id_f8750fc7_fk_app_extras_id FOREIGN KEY (extras_id) REFERENCES public.app_extras(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.app_orderitemextras DROP CONSTRAINT app_orderitemextras_extras_id_f8750fc7_fk_app_extras_id;
       public          postgres    false    226    3093    232            L           2606    16770 Q   app_orderitemextras app_orderitemextras_orderItem_id_946f9db9_fk_app_orderitem_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.app_orderitemextras
    ADD CONSTRAINT "app_orderitemextras_orderItem_id_946f9db9_fk_app_orderitem_id" FOREIGN KEY ("orderItem_id") REFERENCES public.app_orderitem(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.app_orderitemextras DROP CONSTRAINT "app_orderitemextras_orderItem_id_946f9db9_fk_app_orderitem_id";
       public          postgres    false    3098    232    230            @           2606    16597 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    212    3047    208            ?           2606    16592 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    212    3052    210            >           2606    16583 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3042    208    206            B           2606    16612 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3052    210    216            A           2606    16607 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    214    3060    216            D           2606    16626 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3047    208    218            C           2606    16621 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3060    218    214            G           2606    16684 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    224    206    3042            H           2606    16689 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    214    3060    224            P           2606    16872 O   socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc;
       public          postgres    false    239    3116    245            Q           2606    16877 K   socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc;
       public          postgres    false    241    245    3121            O           2606    16863 P   socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si;
       public          postgres    false    3114    237    243            N           2606    16858 U   socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc;
       public          postgres    false    243    241    3121            M           2606    16852 X   socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id;
       public          postgres    false    239    214    3060            �      x������ � �      �      x������ � �      �   �  x����j�@����d����[����J���u,�Hfm����[_�#[��-��1���4D |L)��:��Uo�	`��T��ڹ���DJ��hF��}h��d*rBDkH
3� d�٥���5���;�����h�2���_���V�B+�B��*	��C�7��4"��R����.-�r~ӦfWoγ�	�=Ҁ��R���9vq~W����G�V�Կ��������;� �&������V��+E�Ƞ��g.�~������aR�9���ZPp��}�
k�qcMn���w?�6I����<�|��*e�m�����*��;�,,b_�7�Ǽ~[�I
���c���b���"�,ϗ��#%���/�5��ئ$�,�m�%�Wh�vh�8W��%�6�e�<u}�+��&��a����2姦+�WZePO�6�_��������P�8���V?m�<'9��s$�,���]*R�EP��i�X�:/w%K�4�O~�_?�nR.R�J�1t���Q��܅uc1߯�����m��}����������6���T��PR�i���K.b^�m��\��o��@_�7i���3��rI=�|{�u�����\j*�E�~D-��á.��ޅq�_�l6����a      �   �   x���;�1���WL���c&I箝 �	�u��(���q�X8�i>�`�μ��)�,^a�����h
��u�頍ljۘ�V3hK�p�o%��{sX�2R����̇"�S��U_��^�c5��m�٠��M���ޚ�E�y^z�N�`H�k<ROKJ,,�_�y>msl�!Kj�j4I��x׻��۽��B�;2e�      �      x�eNA�0;ۯ�*��l�O�lR'!�T8���t ��-;vҡ�I>E���L�@*JsJ^��ѝ'���;�FW����u�
���*({������V�w��ވ"D�����8L���`u<z�+�Z%�      �   /   x���  ���3�i˰��哋�M��p՘�M��d;OoI��B       �     x��Z�N�H�><�\R-D���]��V6K�V[U�&ΐ�p<��.*ϳϰW����L�;�$�	ҹ�9ߜ����-���ý�В�'�F<?Sɲ���>�C��_�)�9x��:��;�3��$]�	�8$�$�)G?|'� |�=���*yN%�Kɋt���:��V����ӂg���4pɱ�q�w7��W7���%���KL��WE�R
�/鈋�CO�"�UY
2�?�3���Tv��Q�|1��)�"/NH��_��	�3�?���C�}�|#|NsZfmQC��Bk�MU�U>o���6�b���X���ހ�lY0r�&/�f�1��П-�c*&nF'��oO�XfW��*bV<�)KO�G�$��
�D�H�i.l�\@��S�Ӕ��n��N�vf��z��9S��y%���:����AC�r'����|@����c2(M�6��V9�Iwt<AC��&+� Pz�MD^2L�~�x>��3kt;�!�ܰ���4gp%y�a*����L�xn�P�E�޿���q��v۸��
�Z߿�R���c�|w��ʕ�#�?�rl|��{(jd��/��Í�����9x�?��Z3��Q��#�s������8�j�J���3Ħau4�6�&T�\��`Vޫ�V*}@��#�jU9�u�$+���t�2�%�QN�TʳYN�|H�< ��=��-s�<ŵ�
�G儏f�K[�-��Ro[(�l@��~5�|�1e���.�`�RAz"���J�וpu�]���6����0Ҽ���h�R9����en���P��SkB�P����x�A�;�����rr|�~e"���ܫ���.~�e���6�]@��|�'-�к����t�)�"$*�5�WN���wU�W��*�3ei�>r$	ؑRJ�u��khg������^�@�Y��hbc�;d��!��	t.r��R3��CŨ�k�"@�_h��Yd���^�Y3�
 �XVC�ڶ�d�ڛ���ȅ�̙�}���,t;�DI��<�*XB%]��1�^���h.8-]_e7��h�u�]��1ޖSk����-Y��[l�ֆ!��ތg�<�q�m6m"ڦ�a�j�P������q�J��ݦ��x�ʊ|kCb�¾��ǘ���'m>Ƕ#�L]��Β��p{�qÜ	�6�s''7L��k��Z�nfnzyI��Sf7?7�x�"��K�@vu�a��ϝ��nL=�r��vS�o ݃���-n���p�n��E޵�6(r��|�8�����m��ڂ˛������a��M��F_Co����mZ�����Ԫ�I�W��.���t �*�o��7���<7�e��q�k����P~Ӑ%��s�$��&w��p�=鿡/�n����/�� ����4o6��U�)�?�)���0ue��F`}�z-`�M�� v254�W��
r�:�8����k��8W�v��Կ�U:DgN�q"'���l�xR�~<*%56�%�m5B��&`��\��b�`,"��@�U��{ʛ_�J��W�*׺��������Q�z��Z7BU�p��[o�� cg�cs�%���V-���X�xp�z�����]��(i}P})��{V_�����c�b��<����J�+>�����yX}��*���>Aͪ��aW��g�߉���gI:kbv۲>����n�{'�����ޯoW�(H�WWl��ei�#l�H��⍤�"��2���ۆ�X�E�A.EJq�ҁ��"�!�e;�P�stt�?k�&�      �      x������ � �      �      x������ � �      �   �  x�}�M��0���)|�"�ֽ� ��S�Il�N۹}e�I��Β�����3߻g��n�}�̆�|g���_�����ꞟ��`��"���>l�-� ���
�7���yX㺎����o�Z�S �l#�)
�e��w�.?��5�"��]�9:G_�8���H�V.�^반2�?�+e}<�� T�:X��k�q(�M����`�Py������+p�����/\�Ce8t�r?=7�/��5�pk߱�j�FC�W=���O�:�U,w�:@?5pe���jff��S}�]a���K$�������pw�K[�]^U'�n-����!���߶t��_�����H�'�TwG�$:<"����r�V�T�N����#�F�Q��L)�=��;�"�c�0α�}Ö��N$�'����Ks �����K ��t�.׆���ܶ���Iٜg�4
)۳@B�s��'f^�۫ߌ��|\�J���="N͋��-"N����"FLˣ����g�8x�&��J�N��)���TB�$r�R̗$����9.�n���\�1䁭�c�T)i���*�hJ\_�|��Cj!O�:�c�/�������|�.n�ZM�QAo���>���"1�G	�ZP���}���f�m]�%�
�f5gI�H��E�1���4���&I�M��jE��e���D�T�P��'c�ʇ��]B��� ��f��n�j      �   �   x�3�,H�NI3�/�H425S142 ���Ԕ��D7�@��ԐBm���̠_sG�� ��0�ĜP7Ǥ�B��䀨�����|[N##] R02�22�2��36766��60�,�L�H�K)J�䄱��^r~.P��#+cc+=CSK3c�	\1z\\\ �x1'      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�m�]�B!�����X���}!�J<PҖDw/bN�$��~3e:.�T`�K,&\�kv�%'��7o�"�*n��4
�@�E/��s��a�ڵ/�hQ:xW+��ƹ'�ƻ�S�� ����3i��O�!W�м!���s+1�4���F�-�^�$;{��=(��yeAH��v�Hǟ��-��C�'�`{�      �   C  x����n�0���S�~�h<��Y*Y����)��}�5&@��Jn|��3gRT�����wc ���Go���+��%В�3E�8aa���X���,����0u�	����Y�nEh\k}cZ�m�]��j���Y�[��{� G�Y�R�4M�$k�3�6|9�:���1�
bfȝAwF�[E:��؋�>����,��,Uؾ܀@
K��n����0��l�Q�p&g�m�hl�`z7�~�&f��QɸT�E6���1OMT(�e���c�����>[*Ytc�[Fc�8�˧ަ��gI���!�QD2�s���p��̶C%��A䵔/����0�91n�`Z7���HJW��p�Н>K�H�Ir#�;��B	��T1��'��Tz��b�񙝤��e%�.Y[���L�������$�bUz��E���Z�ע���n�:�[��B����5)�p�vj��}�Y
�/ٺ9p�[�!�BRN~k�L�3jIAg1_��N�\�-F(99��,M�U���������1���H����[��d�̔�b�\Y�W!� E����UI1�N	����|:���J��      �   {  x��Xێ�H}���y_M)3m.���.����o�_ _��.���7�B�z�k���j�`ٙ'N�8�0ٌ�����v4����LՍrH�
��/�h#6g��P�h}+���hͩV�֘��$g���)�C�g��ˡQ������]�pݖ��HM~�I�%����1����ݼ�]�;c��4,���2װ�.QT�vki����a���t��+�hK���Z�!]��k�W��^�M�`5�"];���h̴.�y�ȉ�i�[�$	�I����hh��(����P��w�0fQa'�n� {�l��;Ԙp1�h�uh���J��1��#�:��qXp�J��!n=d9��MT�y�0d����~Rn�e����#H�[�����	�K���r��YY�N{ܮo�6$�6�������:��]�6���C��-���ĕ&]�0O����>;x�����6�U�9����������\F�!�;�t�ҿ�����[���a%	�3�O�����B����}����)��SC`U"��N껼�%w{�1�e�����>�t����������=��N��/|wRC~��/�f���s�
��Qa��v�y����������05�X����,�j2��~-����s���\.��L��5�U��s�[yS7�uݰ$ԵS�J�֓��J�j���y�/ː��:Bwr��+l%����F�x���1�u'�~��\��Z�7�lV�~!����wSs��Q�X{��8Q]��ŷo_"�w4���߈t��-�o��!����� -�Gu�|�Jy�� RHY`Ҵ��$P�/��SX��|}���X�@��5�,[c��z�1+<D�f�I_H�o{��ƣ�R���n^y>seZ��/x��C��^+�J��s�<��~[�=��f���N��oҏ�ez��e�1{G/�
jA�%x�og��R_M�&{�S��D���_����k���:��>�P/P5�H��|�O���9����"��/^a�͋~�E-�V�^�+]�I�s�[��	���[��1Ԧ#=�b}���:w���`]5�]}��=�'�iE��?����3��5v|��~ң���Q>�{�I
��_ X���H�7u ���'�E���佃�5�k��'�h�3�/z�/1��O�k�7=��P��;_֡�y�U\��\_�	�������,�"Z���zb�?멧ӵ􎞔��
�dV�5�ϳ�yw�}}��	%�u.znb��̺���̙���?�-���z���b�Y���:t&ps����aN�ؗ�|=�����+�O�c�����_��X�/�B�G�`F1���MF��E_{�q�~�O���B۾�u��sb�?	��Q��,�U������b;EO�\j�݆�E����z�6z=�T�-fư������.�3[_�>yA��f���:�m]�km����"tB|8�}��� �"r�Q���1��2��t����1���(���xt+�aU=Ϣr|O�A�xl�%26U��1��CP�J��wf�/��=*������t����'�{d!4O|��~��h�wg�_���5��H�w4�����_���.3�zg��Ih��\���:�x?�o�_�!�?�W�����<��uc�l�{����5�ܯ�\�����3���%S�@���p��Ц�4�5�O��Q���Dw�4)=)O�ID�E��@]��2��]�E��H�MT&��H�.m�J���̟�_�
%JuC�,^P���3J�)��:����������$�#�+�@�|{���hE8.�p�'�'���M� jKQ>�C�`l\B�F�6����\�)J���yr�Tq����9M��::W�]A�c+�	� l�t<��H6�ynNm�l��@�5�X�q���˖��G߮�#�V;�(#U!Dp���-��6D�4ص����j[D�����{�N�b�f8TdU܍y�kʒ���Ԏv�a.+�ːg���!_L��i6O�s�x+(6�,g��3`o��ӈ�������r�/�o�"翄F�dp3$C28���qy�����pS�E |������W�t+�nd(�K�T\HRQJ���OJ�煼��_�]q'�"t���$IpWy��T�٣\��J���dP�_^{�A�D���#	�u����_����ܫ      �      x�3�L�H�-�I�K��Efs��qqq �<	�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     