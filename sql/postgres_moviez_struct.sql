--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

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
-- TOC entry 6 (class 2615 OID 16533)
-- Name: moviez; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA moviez;


ALTER SCHEMA moviez OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16534)
-- Name: acteurs; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.acteurs (
    id integer NOT NULL,
    nomacteur character varying(30),
    prenomacteur character varying(20),
    sexe character(1),
    codepays character varying(3)
);


ALTER TABLE moviez.acteurs OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16537)
-- Name: acteurs_id_seq; Type: SEQUENCE; Schema: moviez; Owner: postgres
--

CREATE SEQUENCE moviez.acteurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE moviez.acteurs_id_seq OWNER TO postgres;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 217
-- Name: acteurs_id_seq; Type: SEQUENCE OWNED BY; Schema: moviez; Owner: postgres
--

ALTER SEQUENCE moviez.acteurs_id_seq OWNED BY moviez.acteurs.id;


--
-- TOC entry 218 (class 1259 OID 16538)
-- Name: classificationsfilms; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.classificationsfilms (
    idfilm character varying(20) NOT NULL,
    codegenre character varying(6) NOT NULL
);


ALTER TABLE moviez.classificationsfilms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16541)
-- Name: clients; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.clients (
    numeroclient integer NOT NULL,
    nomclient character varying(30),
    prenomclient character varying(20),
    titre character varying(12),
    adresse1 character varying(50),
    adresse2 character varying(50),
    codeville integer DEFAULT 0,
    telephone character varying(25),
    dateadhesion date,
    dateexpiration date
);


ALTER TABLE moviez.clients OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16545)
-- Name: clients_numeroclient_seq; Type: SEQUENCE; Schema: moviez; Owner: postgres
--

CREATE SEQUENCE moviez.clients_numeroclient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE moviez.clients_numeroclient_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 220
-- Name: clients_numeroclient_seq; Type: SEQUENCE OWNED BY; Schema: moviez; Owner: postgres
--

ALTER SEQUENCE moviez.clients_numeroclient_seq OWNED BY moviez.clients.numeroclient;


--
-- TOC entry 221 (class 1259 OID 16546)
-- Name: films; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.films (
    id character varying(20) NOT NULL,
    titre character varying(50),
    producteur character varying(50),
    codepays character varying(3),
    annee integer DEFAULT 0,
    duree integer DEFAULT 0,
    resume text,
    affiche character varying(200),
    note numeric(10,2)
);


ALTER TABLE moviez.films OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16553)
-- Name: genres; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.genres (
    codegenre character varying(6) NOT NULL,
    libellegenre character varying(50)
);


ALTER TABLE moviez.genres OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16556)
-- Name: locations; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.locations (
    idvideo integer DEFAULT 0 NOT NULL,
    numeroclient integer DEFAULT 0 NOT NULL,
    datelocation date DEFAULT CURRENT_DATE NOT NULL,
    dateretour date,
    tarif numeric(10,2) DEFAULT 0,
    retourvalide boolean DEFAULT false
);


ALTER TABLE moviez.locations OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16564)
-- Name: pays; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.pays (
    codepays character varying(3) NOT NULL,
    pays character varying(255)
);


ALTER TABLE moviez.pays OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16567)
-- Name: realisateurs; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.realisateurs (
    id integer NOT NULL,
    nomrealisateur character varying(30),
    prenomrealisateur character varying(20),
    codepays character varying(20)
);


ALTER TABLE moviez.realisateurs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16570)
-- Name: realisateurs_id_seq; Type: SEQUENCE; Schema: moviez; Owner: postgres
--

CREATE SEQUENCE moviez.realisateurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE moviez.realisateurs_id_seq OWNER TO postgres;

--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 226
-- Name: realisateurs_id_seq; Type: SEQUENCE OWNED BY; Schema: moviez; Owner: postgres
--

ALTER SEQUENCE moviez.realisateurs_id_seq OWNED BY moviez.realisateurs.id;


--
-- TOC entry 227 (class 1259 OID 16571)
-- Name: realisations; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.realisations (
    idfilm character varying(20) NOT NULL,
    idrealisateur integer DEFAULT 0 NOT NULL
);


ALTER TABLE moviez.realisations OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16575)
-- Name: roles; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.roles (
    idfilm character varying(20) NOT NULL,
    idacteur integer DEFAULT 0 NOT NULL,
    role character varying(50)
);


ALTER TABLE moviez.roles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16579)
-- Name: supports; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.supports (
    codesupport character varying(5) NOT NULL,
    intitule character varying(100)
);


ALTER TABLE moviez.supports OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16582)
-- Name: videos; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.videos (
    id integer NOT NULL,
    idfilm character varying(20),
    duree integer DEFAULT 0,
    codesupport character varying(5),
    langue character varying(3),
    dateachat date,
    commentaires character varying(200)
);


ALTER TABLE moviez.videos OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16586)
-- Name: videos_id_seq; Type: SEQUENCE; Schema: moviez; Owner: postgres
--

CREATE SEQUENCE moviez.videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE moviez.videos_id_seq OWNER TO postgres;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 231
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: moviez; Owner: postgres
--

ALTER SEQUENCE moviez.videos_id_seq OWNED BY moviez.videos.id;


--
-- TOC entry 232 (class 1259 OID 16587)
-- Name: villes; Type: TABLE; Schema: moviez; Owner: postgres
--

CREATE TABLE moviez.villes (
    codeville integer NOT NULL,
    nomville character varying(40),
    codepostal character varying(5)
);


ALTER TABLE moviez.villes OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16590)
-- Name: villes_codeville_seq; Type: SEQUENCE; Schema: moviez; Owner: postgres
--

CREATE SEQUENCE moviez.villes_codeville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE moviez.villes_codeville_seq OWNER TO postgres;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 233
-- Name: villes_codeville_seq; Type: SEQUENCE OWNED BY; Schema: moviez; Owner: postgres
--

ALTER SEQUENCE moviez.villes_codeville_seq OWNED BY moviez.villes.codeville;


--
-- TOC entry 3256 (class 2604 OID 16591)
-- Name: acteurs id; Type: DEFAULT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.acteurs ALTER COLUMN id SET DEFAULT nextval('moviez.acteurs_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16592)
-- Name: clients numeroclient; Type: DEFAULT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.clients ALTER COLUMN numeroclient SET DEFAULT nextval('moviez.clients_numeroclient_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 16593)
-- Name: realisateurs id; Type: DEFAULT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisateurs ALTER COLUMN id SET DEFAULT nextval('moviez.realisateurs_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16594)
-- Name: videos id; Type: DEFAULT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.videos ALTER COLUMN id SET DEFAULT nextval('moviez.videos_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16595)
-- Name: villes codeville; Type: DEFAULT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.villes ALTER COLUMN codeville SET DEFAULT nextval('moviez.villes_codeville_seq'::regclass);


--
-- TOC entry 3273 (class 2606 OID 16597)
-- Name: acteurs acteurs_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.acteurs
    ADD CONSTRAINT acteurs_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 16599)
-- Name: classificationsfilms classificationsfilms_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.classificationsfilms
    ADD CONSTRAINT classificationsfilms_pkey PRIMARY KEY (idfilm, codegenre);


--
-- TOC entry 3282 (class 2606 OID 16601)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (numeroclient);


--
-- TOC entry 3287 (class 2606 OID 16603)
-- Name: films films_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 16605)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (codegenre);


--
-- TOC entry 3296 (class 2606 OID 16607)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (idvideo, numeroclient, datelocation);


--
-- TOC entry 3298 (class 2606 OID 16609)
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (codepays);


--
-- TOC entry 3301 (class 2606 OID 16611)
-- Name: realisateurs realisateurs_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisateurs
    ADD CONSTRAINT realisateurs_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16613)
-- Name: realisations realisations_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisations
    ADD CONSTRAINT realisations_pkey PRIMARY KEY (idfilm, idrealisateur);


--
-- TOC entry 3313 (class 2606 OID 16615)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (idfilm, idacteur);


--
-- TOC entry 3316 (class 2606 OID 16617)
-- Name: supports supports_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.supports
    ADD CONSTRAINT supports_pkey PRIMARY KEY (codesupport);


--
-- TOC entry 3323 (class 2606 OID 16619)
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16621)
-- Name: villes villes_pkey; Type: CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.villes
    ADD CONSTRAINT villes_pkey PRIMARY KEY (codeville);


--
-- TOC entry 3274 (class 1259 OID 16622)
-- Name: ix_acteurs_numero_realisateur; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_acteurs_numero_realisateur ON moviez.acteurs USING btree (id);


--
-- TOC entry 3277 (class 1259 OID 16623)
-- Name: ix_classificationsfilms__films_films_genres; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_classificationsfilms__films_films_genres ON moviez.classificationsfilms USING btree (idfilm);


--
-- TOC entry 3278 (class 1259 OID 16624)
-- Name: ix_classificationsfilms__genres_films_genres; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_classificationsfilms__genres_films_genres ON moviez.classificationsfilms USING btree (codegenre);


--
-- TOC entry 3279 (class 1259 OID 16625)
-- Name: ix_classificationsfilms_code_genre; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_classificationsfilms_code_genre ON moviez.classificationsfilms USING btree (codegenre);


--
-- TOC entry 3280 (class 1259 OID 16626)
-- Name: ix_classificationsfilms_numero_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_classificationsfilms_numero_film ON moviez.classificationsfilms USING btree (idfilm);


--
-- TOC entry 3283 (class 1259 OID 16627)
-- Name: ix_clients__villes_clients; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_clients__villes_clients ON moviez.clients USING btree (codeville);


--
-- TOC entry 3284 (class 1259 OID 16628)
-- Name: ix_clients_code_ville; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_clients_code_ville ON moviez.clients USING btree (codeville);


--
-- TOC entry 3285 (class 1259 OID 16629)
-- Name: ix_clients_numero_famille; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_clients_numero_famille ON moviez.clients USING btree (numeroclient);


--
-- TOC entry 3288 (class 1259 OID 16630)
-- Name: ix_films_code_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_films_code_film ON moviez.films USING btree (id);


--
-- TOC entry 3289 (class 1259 OID 16631)
-- Name: ix_films_titre_du_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_films_titre_du_film ON moviez.films USING btree (titre);


--
-- TOC entry 3292 (class 1259 OID 16632)
-- Name: ix_genres_code_genre; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_genres_code_genre ON moviez.genres USING btree (codegenre);


--
-- TOC entry 3293 (class 1259 OID 16633)
-- Name: ix_locations__clients_locations; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_locations__clients_locations ON moviez.locations USING btree (numeroclient);


--
-- TOC entry 3294 (class 1259 OID 16634)
-- Name: ix_locations__videos_locations; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_locations__videos_locations ON moviez.locations USING btree (idvideo);


--
-- TOC entry 3299 (class 1259 OID 16635)
-- Name: ix_realisateurs_numero_realisateur; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_realisateurs_numero_realisateur ON moviez.realisateurs USING btree (id);


--
-- TOC entry 3302 (class 1259 OID 16636)
-- Name: ix_realisations__films_films_realisateurs; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_realisations__films_films_realisateurs ON moviez.realisations USING btree (idfilm);


--
-- TOC entry 3303 (class 1259 OID 16637)
-- Name: ix_realisations__realisateurs_films_realisateurs; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_realisations__realisateurs_films_realisateurs ON moviez.realisations USING btree (idrealisateur);


--
-- TOC entry 3304 (class 1259 OID 16638)
-- Name: ix_realisations_numero_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_realisations_numero_film ON moviez.realisations USING btree (idfilm);


--
-- TOC entry 3305 (class 1259 OID 16639)
-- Name: ix_realisations_numero_realisateur; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_realisations_numero_realisateur ON moviez.realisations USING btree (idrealisateur);


--
-- TOC entry 3308 (class 1259 OID 16640)
-- Name: ix_roles__acteurs_films_acteurs; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_roles__acteurs_films_acteurs ON moviez.roles USING btree (idacteur);


--
-- TOC entry 3309 (class 1259 OID 16641)
-- Name: ix_roles__films_films_acteurs; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_roles__films_films_acteurs ON moviez.roles USING btree (idfilm);


--
-- TOC entry 3310 (class 1259 OID 16642)
-- Name: ix_roles_numero_acteur; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_roles_numero_acteur ON moviez.roles USING btree (idacteur);


--
-- TOC entry 3311 (class 1259 OID 16643)
-- Name: ix_roles_numero_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_roles_numero_film ON moviez.roles USING btree (idfilm);


--
-- TOC entry 3314 (class 1259 OID 16644)
-- Name: ix_supports_code_support; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_supports_code_support ON moviez.supports USING btree (codesupport);


--
-- TOC entry 3317 (class 1259 OID 16645)
-- Name: ix_videos__films_videos; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_videos__films_videos ON moviez.videos USING btree (idfilm);


--
-- TOC entry 3318 (class 1259 OID 16646)
-- Name: ix_videos__supports_videos; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_videos__supports_videos ON moviez.videos USING btree (codesupport);


--
-- TOC entry 3319 (class 1259 OID 16647)
-- Name: ix_videos_code_support; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_videos_code_support ON moviez.videos USING btree (codesupport);


--
-- TOC entry 3320 (class 1259 OID 16648)
-- Name: ix_videos_numero_film; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_videos_numero_film ON moviez.videos USING btree (idfilm);


--
-- TOC entry 3321 (class 1259 OID 16649)
-- Name: ix_videos_numero_video; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_videos_numero_video ON moviez.videos USING btree (id);


--
-- TOC entry 3324 (class 1259 OID 16650)
-- Name: ix_villes_code_postal; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_villes_code_postal ON moviez.villes USING btree (codepostal);


--
-- TOC entry 3325 (class 1259 OID 16651)
-- Name: ix_villes_code_ville; Type: INDEX; Schema: moviez; Owner: postgres
--

CREATE INDEX ix_villes_code_ville ON moviez.villes USING btree (codeville);


--
-- TOC entry 3328 (class 2606 OID 16652)
-- Name: acteurs acteurs_codepays_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.acteurs
    ADD CONSTRAINT acteurs_codepays_fkey FOREIGN KEY (codepays) REFERENCES moviez.pays(codepays);


--
-- TOC entry 3329 (class 2606 OID 16657)
-- Name: classificationsfilms classificationsfilms_codegenre_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.classificationsfilms
    ADD CONSTRAINT classificationsfilms_codegenre_fkey FOREIGN KEY (codegenre) REFERENCES moviez.genres(codegenre) ON UPDATE CASCADE;


--
-- TOC entry 3330 (class 2606 OID 16662)
-- Name: classificationsfilms classificationsfilms_idfilm_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.classificationsfilms
    ADD CONSTRAINT classificationsfilms_idfilm_fkey FOREIGN KEY (idfilm) REFERENCES moviez.films(id) ON UPDATE CASCADE;


--
-- TOC entry 3331 (class 2606 OID 16667)
-- Name: clients clients_codeville_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.clients
    ADD CONSTRAINT clients_codeville_fkey FOREIGN KEY (codeville) REFERENCES moviez.villes(codeville) ON UPDATE CASCADE;


--
-- TOC entry 3332 (class 2606 OID 16672)
-- Name: films films_codepays_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.films
    ADD CONSTRAINT films_codepays_fkey FOREIGN KEY (codepays) REFERENCES moviez.pays(codepays);


--
-- TOC entry 3333 (class 2606 OID 16677)
-- Name: locations locations_idvideo_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.locations
    ADD CONSTRAINT locations_idvideo_fkey FOREIGN KEY (idvideo) REFERENCES moviez.videos(id) ON UPDATE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 16682)
-- Name: locations locations_numeroclient_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.locations
    ADD CONSTRAINT locations_numeroclient_fkey FOREIGN KEY (numeroclient) REFERENCES moviez.clients(numeroclient) ON UPDATE CASCADE;


--
-- TOC entry 3335 (class 2606 OID 16687)
-- Name: realisateurs realisateurs_codepays_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisateurs
    ADD CONSTRAINT realisateurs_codepays_fkey FOREIGN KEY (codepays) REFERENCES moviez.pays(codepays);


--
-- TOC entry 3336 (class 2606 OID 16692)
-- Name: realisations realisations_idfilm_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisations
    ADD CONSTRAINT realisations_idfilm_fkey FOREIGN KEY (idfilm) REFERENCES moviez.films(id) ON UPDATE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 16697)
-- Name: realisations realisations_idrealisateur_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.realisations
    ADD CONSTRAINT realisations_idrealisateur_fkey FOREIGN KEY (idrealisateur) REFERENCES moviez.realisateurs(id) ON UPDATE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 16702)
-- Name: roles roles_idacteur_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.roles
    ADD CONSTRAINT roles_idacteur_fkey FOREIGN KEY (idacteur) REFERENCES moviez.acteurs(id) ON UPDATE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 16707)
-- Name: roles roles_idfilm_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.roles
    ADD CONSTRAINT roles_idfilm_fkey FOREIGN KEY (idfilm) REFERENCES moviez.films(id) ON UPDATE CASCADE;


--
-- TOC entry 3340 (class 2606 OID 16712)
-- Name: videos videos_codesupport_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.videos
    ADD CONSTRAINT videos_codesupport_fkey FOREIGN KEY (codesupport) REFERENCES moviez.supports(codesupport) ON UPDATE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 16717)
-- Name: videos videos_idfilm_fkey; Type: FK CONSTRAINT; Schema: moviez; Owner: postgres
--

ALTER TABLE ONLY moviez.videos
    ADD CONSTRAINT videos_idfilm_fkey FOREIGN KEY (idfilm) REFERENCES moviez.films(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

