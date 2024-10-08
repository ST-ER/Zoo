PGDMP  &    .                |            Zoo    16.1    16.1 q    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    90220    Zoo    DATABASE     y   CREATE DATABASE "Zoo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Zoo";
                postgres    false            �            1255    90497    update_arrival_quantity()    FUNCTION       CREATE FUNCTION public.update_arrival_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Обновляем поле Quantity в таблице AnimalArrival, подсчитывая уникальные AnimalCode в AnimalArrivalDetails
    UPDATE AnimalArrival
    SET Quantity = (SELECT COUNT(DISTINCT AnimalCode) 
                    FROM AnimalArrivalDetails 
                    WHERE ArrivalNumber = NEW.ArrivalNumber)
    WHERE Number = NEW.ArrivalNumber;
    
    RETURN NEW;
END;
$$;
 0   DROP FUNCTION public.update_arrival_quantity();
       public          postgres    false            �            1255    90499    update_departure_quantity()    FUNCTION       CREATE FUNCTION public.update_departure_quantity() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Обновляем поле Quantity в таблице AnimalDeparture, подсчитывая уникальные AnimalCode в AnimalDepartureDetails
    UPDATE AnimalDeparture
    SET Quantity = (SELECT COUNT(DISTINCT AnimalCode) 
                    FROM AnimalDepartureDetails 
                    WHERE DepartureNumber = NEW.DepartureNumber)
    WHERE Number = NEW.DepartureNumber;
    
    RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.update_departure_quantity();
       public          postgres    false            �            1259    90427    animalarrival    TABLE     �   CREATE TABLE public.animalarrival (
    number integer NOT NULL,
    date date NOT NULL,
    organization character varying(255),
    zoocode integer,
    animalspeciescode integer,
    quantity integer,
    price numeric(10,2),
    cost numeric(10,2)
);
 !   DROP TABLE public.animalarrival;
       public         heap    postgres    false            �            1259    90426    animalarrival_number_seq    SEQUENCE     �   CREATE SEQUENCE public.animalarrival_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.animalarrival_number_seq;
       public          postgres    false    234            D           0    0    animalarrival_number_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.animalarrival_number_seq OWNED BY public.animalarrival.number;
          public          postgres    false    233            �            1259    90443    animalarrivaldetails    TABLE     r   CREATE TABLE public.animalarrivaldetails (
    arrivalnumber integer NOT NULL,
    animalcode integer NOT NULL
);
 (   DROP TABLE public.animalarrivaldetails;
       public         heap    postgres    false            �            1259    90466    animaldeparture    TABLE     �   CREATE TABLE public.animaldeparture (
    number integer NOT NULL,
    date date NOT NULL,
    organization character varying(255),
    animalspeciescode integer,
    departurereasoncode integer,
    quantity integer,
    price numeric(10,2)
);
 #   DROP TABLE public.animaldeparture;
       public         heap    postgres    false            �            1259    90465    animaldeparture_number_seq    SEQUENCE     �   CREATE SEQUENCE public.animaldeparture_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.animaldeparture_number_seq;
       public          postgres    false    239            E           0    0    animaldeparture_number_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.animaldeparture_number_seq OWNED BY public.animaldeparture.number;
          public          postgres    false    238            �            1259    90482    animaldeparturedetails    TABLE     v   CREATE TABLE public.animaldeparturedetails (
    departurenumber integer NOT NULL,
    animalcode integer NOT NULL
);
 *   DROP TABLE public.animaldeparturedetails;
       public         heap    postgres    false            �            1259    90235    animals    TABLE     �  CREATE TABLE public.animals (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    gender character varying(10),
    speciescode integer,
    arrivaldate date,
    birthdate date,
    price numeric(10,2),
    additionalinfo text,
    CONSTRAINT animals_gender_check CHECK (((gender)::text = ANY (ARRAY[('Самец'::character varying)::text, ('Самка'::character varying)::text])))
);
    DROP TABLE public.animals;
       public         heap    postgres    false            �            1259    90241    animals_code_seq    SEQUENCE     �   CREATE SEQUENCE public.animals_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.animals_code_seq;
       public          postgres    false    215            F           0    0    animals_code_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.animals_code_seq OWNED BY public.animals.code;
          public          postgres    false    216            �            1259    90242    animalspecies    TABLE     ^  CREATE TABLE public.animalspecies (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    familycode integer,
    mass numeric(10,2),
    bodylength numeric(10,2),
    height numeric(10,2),
    movementspeed numeric(10,2),
    wingspan numeric(10,2),
    habitatarea character varying(255),
    comments text,
    image integer
);
 !   DROP TABLE public.animalspecies;
       public         heap    postgres    false            �            1259    90247    animalspecies_code_seq    SEQUENCE     �   CREATE SEQUENCE public.animalspecies_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.animalspecies_code_seq;
       public          postgres    false    217            G           0    0    animalspecies_code_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.animalspecies_code_seq OWNED BY public.animalspecies.code;
          public          postgres    false    218            �            1259    90248    cities    TABLE     }   CREATE TABLE public.cities (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    countrycode integer
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    90251    cities_code_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cities_code_seq;
       public          postgres    false    219            H           0    0    cities_code_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cities_code_seq OWNED BY public.cities.code;
          public          postgres    false    220            �            1259    90252    classes    TABLE     e   CREATE TABLE public.classes (
    code integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.classes;
       public         heap    postgres    false            �            1259    90255    classes_code_seq    SEQUENCE     �   CREATE SEQUENCE public.classes_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.classes_code_seq;
       public          postgres    false    221            I           0    0    classes_code_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.classes_code_seq OWNED BY public.classes.code;
          public          postgres    false    222            �            1259    90256 	   countries    TABLE     g   CREATE TABLE public.countries (
    code integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    90259    countries_code_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.countries_code_seq;
       public          postgres    false    223            J           0    0    countries_code_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.countries_code_seq OWNED BY public.countries.code;
          public          postgres    false    224            �            1259    90459    departurereasons    TABLE     n   CREATE TABLE public.departurereasons (
    code integer NOT NULL,
    name character varying(255) NOT NULL
);
 $   DROP TABLE public.departurereasons;
       public         heap    postgres    false            �            1259    90458    departurereasons_code_seq    SEQUENCE     �   CREATE SEQUENCE public.departurereasons_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.departurereasons_code_seq;
       public          postgres    false    237            K           0    0    departurereasons_code_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.departurereasons_code_seq OWNED BY public.departurereasons.code;
          public          postgres    false    236            �            1259    90264    families    TABLE     }   CREATE TABLE public.families (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    ordercode integer
);
    DROP TABLE public.families;
       public         heap    postgres    false            �            1259    90267    families_code_seq    SEQUENCE     �   CREATE SEQUENCE public.families_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.families_code_seq;
       public          postgres    false    225            L           0    0    families_code_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.families_code_seq OWNED BY public.families.code;
          public          postgres    false    226            �            1259    90268    files    TABLE     H   CREATE TABLE public.files (
    code integer NOT NULL,
    file text
);
    DROP TABLE public.files;
       public         heap    postgres    false            �            1259    90273    files_code_seq    SEQUENCE     �   CREATE SEQUENCE public.files_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.files_code_seq;
       public          postgres    false    227            M           0    0    files_code_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.files_code_seq OWNED BY public.files.code;
          public          postgres    false    228            �            1259    90274    orders    TABLE     {   CREATE TABLE public.orders (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    classcode integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    90277    orders_code_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.orders_code_seq;
       public          postgres    false    229            N           0    0    orders_code_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.orders_code_seq OWNED BY public.orders.code;
          public          postgres    false    230            �            1259    90278    zoos    TABLE     x   CREATE TABLE public.zoos (
    code integer NOT NULL,
    name character varying(255) NOT NULL,
    citycode integer
);
    DROP TABLE public.zoos;
       public         heap    postgres    false            �            1259    90281    zoos_code_seq    SEQUENCE     �   CREATE SEQUENCE public.zoos_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.zoos_code_seq;
       public          postgres    false    231            O           0    0    zoos_code_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.zoos_code_seq OWNED BY public.zoos.code;
          public          postgres    false    232            d           2604    90430    animalarrival number    DEFAULT     |   ALTER TABLE ONLY public.animalarrival ALTER COLUMN number SET DEFAULT nextval('public.animalarrival_number_seq'::regclass);
 C   ALTER TABLE public.animalarrival ALTER COLUMN number DROP DEFAULT;
       public          postgres    false    234    233    234            f           2604    90469    animaldeparture number    DEFAULT     �   ALTER TABLE ONLY public.animaldeparture ALTER COLUMN number SET DEFAULT nextval('public.animaldeparture_number_seq'::regclass);
 E   ALTER TABLE public.animaldeparture ALTER COLUMN number DROP DEFAULT;
       public          postgres    false    239    238    239            [           2604    90282    animals code    DEFAULT     l   ALTER TABLE ONLY public.animals ALTER COLUMN code SET DEFAULT nextval('public.animals_code_seq'::regclass);
 ;   ALTER TABLE public.animals ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    216    215            \           2604    90283    animalspecies code    DEFAULT     x   ALTER TABLE ONLY public.animalspecies ALTER COLUMN code SET DEFAULT nextval('public.animalspecies_code_seq'::regclass);
 A   ALTER TABLE public.animalspecies ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    218    217            ]           2604    90284    cities code    DEFAULT     j   ALTER TABLE ONLY public.cities ALTER COLUMN code SET DEFAULT nextval('public.cities_code_seq'::regclass);
 :   ALTER TABLE public.cities ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    220    219            ^           2604    90285    classes code    DEFAULT     l   ALTER TABLE ONLY public.classes ALTER COLUMN code SET DEFAULT nextval('public.classes_code_seq'::regclass);
 ;   ALTER TABLE public.classes ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    222    221            _           2604    90286    countries code    DEFAULT     p   ALTER TABLE ONLY public.countries ALTER COLUMN code SET DEFAULT nextval('public.countries_code_seq'::regclass);
 =   ALTER TABLE public.countries ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    224    223            e           2604    90462    departurereasons code    DEFAULT     ~   ALTER TABLE ONLY public.departurereasons ALTER COLUMN code SET DEFAULT nextval('public.departurereasons_code_seq'::regclass);
 D   ALTER TABLE public.departurereasons ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    237    236    237            `           2604    90288    families code    DEFAULT     n   ALTER TABLE ONLY public.families ALTER COLUMN code SET DEFAULT nextval('public.families_code_seq'::regclass);
 <   ALTER TABLE public.families ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    226    225            a           2604    90289 
   files code    DEFAULT     h   ALTER TABLE ONLY public.files ALTER COLUMN code SET DEFAULT nextval('public.files_code_seq'::regclass);
 9   ALTER TABLE public.files ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    228    227            b           2604    90290    orders code    DEFAULT     j   ALTER TABLE ONLY public.orders ALTER COLUMN code SET DEFAULT nextval('public.orders_code_seq'::regclass);
 :   ALTER TABLE public.orders ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    230    229            c           2604    90291 	   zoos code    DEFAULT     f   ALTER TABLE ONLY public.zoos ALTER COLUMN code SET DEFAULT nextval('public.zoos_code_seq'::regclass);
 8   ALTER TABLE public.zoos ALTER COLUMN code DROP DEFAULT;
       public          postgres    false    232    231            7          0    90427    animalarrival 
   TABLE DATA           v   COPY public.animalarrival (number, date, organization, zoocode, animalspeciescode, quantity, price, cost) FROM stdin;
    public          postgres    false    234   6�       8          0    90443    animalarrivaldetails 
   TABLE DATA           I   COPY public.animalarrivaldetails (arrivalnumber, animalcode) FROM stdin;
    public          postgres    false    235   S�       <          0    90466    animaldeparture 
   TABLE DATA           ~   COPY public.animaldeparture (number, date, organization, animalspeciescode, departurereasoncode, quantity, price) FROM stdin;
    public          postgres    false    239   p�       =          0    90482    animaldeparturedetails 
   TABLE DATA           M   COPY public.animaldeparturedetails (departurenumber, animalcode) FROM stdin;
    public          postgres    false    240   ��       $          0    90235    animals 
   TABLE DATA           q   COPY public.animals (code, name, gender, speciescode, arrivaldate, birthdate, price, additionalinfo) FROM stdin;
    public          postgres    false    215   ��       &          0    90242    animalspecies 
   TABLE DATA           �   COPY public.animalspecies (code, name, familycode, mass, bodylength, height, movementspeed, wingspan, habitatarea, comments, image) FROM stdin;
    public          postgres    false    217   B�       (          0    90248    cities 
   TABLE DATA           9   COPY public.cities (code, name, countrycode) FROM stdin;
    public          postgres    false    219   �       *          0    90252    classes 
   TABLE DATA           -   COPY public.classes (code, name) FROM stdin;
    public          postgres    false    221   ��       ,          0    90256 	   countries 
   TABLE DATA           /   COPY public.countries (code, name) FROM stdin;
    public          postgres    false    223   ܑ       :          0    90459    departurereasons 
   TABLE DATA           6   COPY public.departurereasons (code, name) FROM stdin;
    public          postgres    false    237   ��       .          0    90264    families 
   TABLE DATA           9   COPY public.families (code, name, ordercode) FROM stdin;
    public          postgres    false    225   "�       0          0    90268    files 
   TABLE DATA           +   COPY public.files (code, file) FROM stdin;
    public          postgres    false    227   H�       2          0    90274    orders 
   TABLE DATA           7   COPY public.orders (code, name, classcode) FROM stdin;
    public          postgres    false    229   ��       4          0    90278    zoos 
   TABLE DATA           4   COPY public.zoos (code, name, citycode) FROM stdin;
    public          postgres    false    231   ��       P           0    0    animalarrival_number_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.animalarrival_number_seq', 1, false);
          public          postgres    false    233            Q           0    0    animaldeparture_number_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.animaldeparture_number_seq', 1, false);
          public          postgres    false    238            R           0    0    animals_code_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.animals_code_seq', 30, true);
          public          postgres    false    216            S           0    0    animalspecies_code_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.animalspecies_code_seq', 30, true);
          public          postgres    false    218            T           0    0    cities_code_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cities_code_seq', 15, true);
          public          postgres    false    220            U           0    0    classes_code_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.classes_code_seq', 15, true);
          public          postgres    false    222            V           0    0    countries_code_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.countries_code_seq', 15, true);
          public          postgres    false    224            W           0    0    departurereasons_code_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.departurereasons_code_seq', 15, true);
          public          postgres    false    236            X           0    0    families_code_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.families_code_seq', 15, true);
          public          postgres    false    226            Y           0    0    files_code_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.files_code_seq', 15, true);
          public          postgres    false    228            Z           0    0    orders_code_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.orders_code_seq', 15, true);
          public          postgres    false    230            [           0    0    zoos_code_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.zoos_code_seq', 15, true);
          public          postgres    false    232            {           2606    90432     animalarrival animalarrival_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.animalarrival
    ADD CONSTRAINT animalarrival_pkey PRIMARY KEY (number);
 J   ALTER TABLE ONLY public.animalarrival DROP CONSTRAINT animalarrival_pkey;
       public            postgres    false    234            }           2606    90447 .   animalarrivaldetails animalarrivaldetails_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.animalarrivaldetails
    ADD CONSTRAINT animalarrivaldetails_pkey PRIMARY KEY (arrivalnumber, animalcode);
 X   ALTER TABLE ONLY public.animalarrivaldetails DROP CONSTRAINT animalarrivaldetails_pkey;
       public            postgres    false    235    235            �           2606    90471 $   animaldeparture animaldeparture_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.animaldeparture
    ADD CONSTRAINT animaldeparture_pkey PRIMARY KEY (number);
 N   ALTER TABLE ONLY public.animaldeparture DROP CONSTRAINT animaldeparture_pkey;
       public            postgres    false    239            �           2606    90486 2   animaldeparturedetails animaldeparturedetails_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.animaldeparturedetails
    ADD CONSTRAINT animaldeparturedetails_pkey PRIMARY KEY (departurenumber, animalcode);
 \   ALTER TABLE ONLY public.animaldeparturedetails DROP CONSTRAINT animaldeparturedetails_pkey;
       public            postgres    false    240    240            i           2606    90301    animals animals_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (code);
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public            postgres    false    215            k           2606    90303     animalspecies animalspecies_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.animalspecies
    ADD CONSTRAINT animalspecies_pkey PRIMARY KEY (code);
 J   ALTER TABLE ONLY public.animalspecies DROP CONSTRAINT animalspecies_pkey;
       public            postgres    false    217            m           2606    90305    cities cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (code);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    219            o           2606    90307    classes classes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (code);
 >   ALTER TABLE ONLY public.classes DROP CONSTRAINT classes_pkey;
       public            postgres    false    221            q           2606    90309    countries countries_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (code);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    223                       2606    90464 &   departurereasons departurereasons_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.departurereasons
    ADD CONSTRAINT departurereasons_pkey PRIMARY KEY (code);
 P   ALTER TABLE ONLY public.departurereasons DROP CONSTRAINT departurereasons_pkey;
       public            postgres    false    237            s           2606    90313    families families_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_pkey PRIMARY KEY (code);
 @   ALTER TABLE ONLY public.families DROP CONSTRAINT families_pkey;
       public            postgres    false    225            u           2606    90315    files files_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (code);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    227            w           2606    90317    orders orders_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (code);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    229            y           2606    90319    zoos zoos_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.zoos
    ADD CONSTRAINT zoos_pkey PRIMARY KEY (code);
 8   ALTER TABLE ONLY public.zoos DROP CONSTRAINT zoos_pkey;
       public            postgres    false    231            �           2620    90498 5   animalarrivaldetails trg_animal_arrival_insert_delete    TRIGGER     �   CREATE TRIGGER trg_animal_arrival_insert_delete AFTER INSERT OR DELETE ON public.animalarrivaldetails FOR EACH ROW EXECUTE FUNCTION public.update_arrival_quantity();
 N   DROP TRIGGER trg_animal_arrival_insert_delete ON public.animalarrivaldetails;
       public          postgres    false    241    235            �           2620    90500 9   animaldeparturedetails trg_animal_departure_insert_delete    TRIGGER     �   CREATE TRIGGER trg_animal_departure_insert_delete AFTER INSERT OR DELETE ON public.animaldeparturedetails FOR EACH ROW EXECUTE FUNCTION public.update_departure_quantity();
 R   DROP TRIGGER trg_animal_departure_insert_delete ON public.animaldeparturedetails;
       public          postgres    false    240    242            �           2606    90438 2   animalarrival animalarrival_animalspeciescode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalarrival
    ADD CONSTRAINT animalarrival_animalspeciescode_fkey FOREIGN KEY (animalspeciescode) REFERENCES public.animalspecies(code);
 \   ALTER TABLE ONLY public.animalarrival DROP CONSTRAINT animalarrival_animalspeciescode_fkey;
       public          postgres    false    4715    234    217            �           2606    90433 (   animalarrival animalarrival_zoocode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalarrival
    ADD CONSTRAINT animalarrival_zoocode_fkey FOREIGN KEY (zoocode) REFERENCES public.zoos(code);
 R   ALTER TABLE ONLY public.animalarrival DROP CONSTRAINT animalarrival_zoocode_fkey;
       public          postgres    false    234    4729    231            �           2606    90453 9   animalarrivaldetails animalarrivaldetails_animalcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalarrivaldetails
    ADD CONSTRAINT animalarrivaldetails_animalcode_fkey FOREIGN KEY (animalcode) REFERENCES public.animals(code) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.animalarrivaldetails DROP CONSTRAINT animalarrivaldetails_animalcode_fkey;
       public          postgres    false    4713    235    215            �           2606    90448 <   animalarrivaldetails animalarrivaldetails_arrivalnumber_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalarrivaldetails
    ADD CONSTRAINT animalarrivaldetails_arrivalnumber_fkey FOREIGN KEY (arrivalnumber) REFERENCES public.animalarrival(number) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.animalarrivaldetails DROP CONSTRAINT animalarrivaldetails_arrivalnumber_fkey;
       public          postgres    false    4731    235    234            �           2606    90472 6   animaldeparture animaldeparture_animalspeciescode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animaldeparture
    ADD CONSTRAINT animaldeparture_animalspeciescode_fkey FOREIGN KEY (animalspeciescode) REFERENCES public.animalspecies(code);
 `   ALTER TABLE ONLY public.animaldeparture DROP CONSTRAINT animaldeparture_animalspeciescode_fkey;
       public          postgres    false    239    4715    217            �           2606    90477 8   animaldeparture animaldeparture_departurereasoncode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animaldeparture
    ADD CONSTRAINT animaldeparture_departurereasoncode_fkey FOREIGN KEY (departurereasoncode) REFERENCES public.departurereasons(code);
 b   ALTER TABLE ONLY public.animaldeparture DROP CONSTRAINT animaldeparture_departurereasoncode_fkey;
       public          postgres    false    4735    239    237            �           2606    90492 =   animaldeparturedetails animaldeparturedetails_animalcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animaldeparturedetails
    ADD CONSTRAINT animaldeparturedetails_animalcode_fkey FOREIGN KEY (animalcode) REFERENCES public.animals(code) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.animaldeparturedetails DROP CONSTRAINT animaldeparturedetails_animalcode_fkey;
       public          postgres    false    240    4713    215            �           2606    90487 B   animaldeparturedetails animaldeparturedetails_departurenumber_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animaldeparturedetails
    ADD CONSTRAINT animaldeparturedetails_departurenumber_fkey FOREIGN KEY (departurenumber) REFERENCES public.animaldeparture(number) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.animaldeparturedetails DROP CONSTRAINT animaldeparturedetails_departurenumber_fkey;
       public          postgres    false    239    4737    240            �           2606    90360     animals animals_speciescode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_speciescode_fkey FOREIGN KEY (speciescode) REFERENCES public.animalspecies(code);
 J   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_speciescode_fkey;
       public          postgres    false    217    4715    215            �           2606    90365 +   animalspecies animalspecies_familycode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalspecies
    ADD CONSTRAINT animalspecies_familycode_fkey FOREIGN KEY (familycode) REFERENCES public.families(code);
 U   ALTER TABLE ONLY public.animalspecies DROP CONSTRAINT animalspecies_familycode_fkey;
       public          postgres    false    225    217    4723            �           2606    90370 &   animalspecies animalspecies_image_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animalspecies
    ADD CONSTRAINT animalspecies_image_fkey FOREIGN KEY (image) REFERENCES public.files(code);
 P   ALTER TABLE ONLY public.animalspecies DROP CONSTRAINT animalspecies_image_fkey;
       public          postgres    false    227    217    4725            �           2606    90375    cities cities_countrycode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countrycode_fkey FOREIGN KEY (countrycode) REFERENCES public.countries(code);
 H   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_countrycode_fkey;
       public          postgres    false    223    219    4721            �           2606    90380     families families_ordercode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.families
    ADD CONSTRAINT families_ordercode_fkey FOREIGN KEY (ordercode) REFERENCES public.orders(code);
 J   ALTER TABLE ONLY public.families DROP CONSTRAINT families_ordercode_fkey;
       public          postgres    false    4727    225    229            �           2606    90385    orders orders_classcode_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_classcode_fkey FOREIGN KEY (classcode) REFERENCES public.classes(code);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_classcode_fkey;
       public          postgres    false    221    229    4719            �           2606    90390    zoos zoos_citycode_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.zoos
    ADD CONSTRAINT zoos_citycode_fkey FOREIGN KEY (citycode) REFERENCES public.cities(code);
 A   ALTER TABLE ONLY public.zoos DROP CONSTRAINT zoos_citycode_fkey;
       public          postgres    false    4717    231    219            7      x������ � �      8      x������ � �      <      x������ � �      =      x������ � �      $   �  x��TYn�0��N�0 )ɖ����q�H�6Џ�h�@�);2�z���F}3�RYNRx�dq޼ehG��QMk?U�Ŗ��Rّr�9m����Ԧ�[Ƙ3c��jiAKZ�[ڥ�X����������
�=���k�;Vt�?�)�nG�L�L;�h�6cm�ʋe)��uJ{��R�o��� �؍�jS�L� f���<f7�״Ii��*��/�Ns.D;F�}�����A�ϩd����A�Re����6(���c$�l�OR:pB��ee�b�� }�**8�;��5z�E {�*-v�~�o�X1 XE�-��S8N���\��㯄���h�8�莟c�# �Gܺ �<�X������׉�@�͇">(SjYr�3u�GW��Fii)Ba<p�����\�W�s8+
YG�2L˖+@��?H�?;M1�'H1�W'��W� gȲ�*����)��q�!�������g]ŋ`<*�,*Vi0�/}[z��,F'�b�6�'��S�~�;�p�������p���q�2T��ut��n"�8��ש�5���~�8��?� ��w�^i9]B��}� ���_ÆW;�N2��~a�]�C��9���-�p�,e��9~w�$�_���      &   �  x��UQnA�����hfv��K�9�4iD$�V���j�J�g!6�
��ٳ4>"������c\��/C�K��5"G�mZK��g�63KGo��p��Ѓ���<
�_���!���8��o�_-��~h�-�w�ˉ���.yJ���f[a��,hy�������gk@�r���_݉M��8��ƵI"�hF	e#𰂔�A~��[.P�:���>�-NK^�B&�F�V5D�H�q�+d��)�1������}6+���U��i��R㭒�LcD>P ��pb9pV���b�k�,�)��xG|#�����U�ڪ�&��R�K��ne�xO�U�@�r��b���D�i�ٚ˷8y�����Wu�#7>!��/���6�
+bԟ��Q�t���^�]ԌFK�A�>�U��(�k�S���)����k�) ��?J�:�gʳ��[v ��!�nWV�F�5��r?#��=��w��kA��12Br�p���|C���s�l=�Z�������9k|k?��}�wZ�s��đ��G�x��p�qDs�������Q�	��
�����
��H^6�mͭ�v���c}����6QUA����[뢺��Q�t3�ߑ�5Ź�h���'JpJN����A�Q�}��9���HM����i��T6[�(��hK��bk&�op;�Ge���6����0�9jc��L�:      (   �   x�%PIN1<W�e��,Y��c�� rA����0$~C�G���宭Km�I1m5�[=�5���S���M��@�2D]�N[�]�]��h�E#:.����
��2�{F�`����V\����X���kޤ!��9͠�L;�3Z}�����ҋg2���4/}J{]���khm�ҽ���ji^������~�J�%!�-��݌�?`ܚ�      *   �   x�mPIAA\w��	D���a|�"�"���74C�+Ի���J��u�9��#�@�>rY��Vv$��dfk{��HX'��H3��m,�!G%�[Ze_�'�޶hHr�T�W9nx鰝�D�=X �`;)(���U��ł�D���6w�`��d.c&���D�ir��K�Q?I?�ZR���k�Ţ�|�y���j��'����p�/�-[k��m��      ,   �   x�5�=�P���0��?w�0�+�
1���F�V�B��n��Z�v�9����G(�Z�.Ht(�#C�ɑ��d�cʗ�W|�pk�D�C������L�ү�1��~971���`��֨�|#ݞ��N��Ξq�mc�n�~��<6OI�b�s+��ə:�O�<�ּPڏ���i��      :   u  x�uR[N�@�Ξb�)�u�&�E�*B�.��	ݦy\a|#��"T�(?�=���&�@�Z2�e��K�e"9J���o���+5�*��Gők��z{>�M5�xG��(���Q���V
��L�p�o�R��'�$;Q;Y��_r�<Q�O|F� ��?*���%'T�jOҒB5��*E���)7���q����	�K͏,��N��-�N��&�'�%�[�'�^�x͍�n�jKY��*�I.��%x1DĭT��R���΂K���7TLL������q��Uyo�!FCe�SV�Ɲ���-c���-G���ew<��]:>�s y��_�<������-t토豤�\���ge������s�De�m      .     x�}�]N�@���S��Nҿ�p���?(H � B�' ��h�^a|#&� /���J���[�	�q���1M�8����AM/�S��j2�-j�:M��mS����&j3
^=�[5���@G�':�x�svϧ�*�u܂����'�vG:l}��N�g�؞�P�I'Z$��[��X���|��L���&j&x���������o��1k��X_-�KǇ��Jɕ�ݵ�b��>��Җm9Q�ڐ��_E_�����c|} e��ezy��_<c+      0   C  x�����U1�k�A��.���!$���x����\�S�I��������O//��������n��}�?�������u}��8Ų��h{�w��m�j�U&�x}�o�vܿ�z���=�%w͝0@��`��l亂y�tjb��i���.�4I�Y�����:��n�9b���a: ����ɜMVNY&(�K��B<pmٚ�0i�]�Hr��h1�>���
��Lf���r�$}u`"|�에�1�?Y
�6�H�>K1i!k�؛�u<��0�t9�D�lsE.� �Z2��n��s@���@tF���MC��|ǽt�D��t�9{l�6�*祹Xg5<C�K�9j�5�;}q�q�\)�.+�&�RZi8��%֨�so,�Tp���Ԓ
��XC_�b�`hN�x��2�m  B��ڗ&�� ���U۩vx�9��À4C7F=�=z��)�V�|�1�R�r��V<:s�O���5��#Q��R�A*��rXc8G]�Dn=Z�<R4�آ�LR#dV�4�����j9�)����l�C���d>����j���{hٿl�<�;g���OOO� $��}      2   �   x�mPKn�P\ۧ�/	��a��@BP�XD,�.>��
�1/��R��g��s���!����i �Fa3�m��@(����ن$	�(I,���wv�O���b��#�@e�cJ�l)ѯ+ǡ��6����G1Ԏ�9����PH�]�/��S=Rפ�-q��Mq�YK��ve1.=�|,�a�/��wmu��~Ok�7y��\1oYD��Syrc�}�����      4   �   x�}QINA<ۯ�@�,Y��c2��ȉ�@���a�L���p@i&�n��*�,��V�!�{l��0��3�H8#�£�[K8����w��9o�8'��zfIkC8G�\��4J�}����.Ц%�Kx��8F<�J1h�Շ���75��p4�i4ʡ�8�>�)ː�WF�-���E�A�d>���d��H2�<��tn�ۜI�R$�7�e��x+��T���K�����
�Z��*��kf�	�d�     