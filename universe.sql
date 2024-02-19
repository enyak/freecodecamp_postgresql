--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: kim
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    parent integer,
    name character varying(30) NOT NULL,
    class character varying(30),
    description text,
    size_in_km integer,
    age_in_millions_of_years integer,
    distance_from_parent_star_in_au numeric,
    still_exists boolean,
    has_life boolean
);


ALTER TABLE public.asteroid OWNER TO kim;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO kim;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    class character varying(30),
    description text,
    size_in_ly integer,
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric,
    still_exitsts boolean,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO kim;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO kim;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    parent integer,
    name character varying(30) NOT NULL,
    class character varying(30),
    description text,
    size_in_km integer,
    age_in_millions_of_years integer,
    distance_from_parent_planet_in_km numeric,
    still_exists boolean,
    has_life boolean
);


ALTER TABLE public.moon OWNER TO kim;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO kim;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    parent integer,
    name character varying(30) NOT NULL,
    class character varying(30),
    description text,
    size_in_km integer,
    age_in_millions_of_years integer,
    distance_from_parent_star_in_au numeric,
    still_exists boolean,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO kim;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO kim;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: kim
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    parent integer,
    name character varying(30) NOT NULL,
    class character varying(30),
    description text,
    size_in_km integer,
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric,
    still_exists boolean,
    has_companion boolean
);


ALTER TABLE public.star OWNER TO kim;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: kim
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO kim;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kim
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: kim
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: kim
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: kim
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: kim
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: kim
--



--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kim
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_parent_fkey FOREIGN KEY (parent) REFERENCES public.star(star_id);


--
-- Name: moon moon_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_fkey FOREIGN KEY (parent) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_parent_fkey FOREIGN KEY (parent) REFERENCES public.star(star_id);


--
-- Name: star star_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kim
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_parent_fkey FOREIGN KEY (parent) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

