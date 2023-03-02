--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    is_visible_to_naked_eye boolean,
    far_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    year_discovered integer NOT NULL,
    planet_id integer,
    is_visible_to_naked_eye boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebulae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebulae (
    nebulae_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    classification character varying(10) NOT NULL
);


ALTER TABLE public.nebulae OWNER TO freecodecamp;

--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulae_nebulae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulae_nebulae_id_seq OWNER TO freecodecamp;

--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulae_nebulae_id_seq OWNED BY public.nebulae.nebulae_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    diameter_in_km numeric(18,5) NOT NULL,
    has_moon boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    mk_classification character(1) NOT NULL,
    year_discovered integer NOT NULL,
    is_visible_to_naked_eye boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebulae nebulae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae ALTER COLUMN nebulae_id SET DEFAULT nextval('public.nebulae_nebulae_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Coma Pinwheel', 'spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Peekaboo', 'irregular', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'spiral', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', -10000000, 1, true);
INSERT INTO public.moon VALUES (2, 'Callisto', 1610, 3, true);
INSERT INTO public.moon VALUES (3, 'Ganimedes', 1610, 3, true);
INSERT INTO public.moon VALUES (4, 'Europa', 1610, 3, false);
INSERT INTO public.moon VALUES (5, 'Charon', 1978, 7, false);
INSERT INTO public.moon VALUES (6, 'Styx', 2012, 7, false);
INSERT INTO public.moon VALUES (7, 'Kerberos', 2011, 7, false);
INSERT INTO public.moon VALUES (8, 'Hydra', 2005, 7, false);
INSERT INTO public.moon VALUES (9, 'Umbriel', 1851, 5, false);
INSERT INTO public.moon VALUES (10, 'Ariel', 1851, 5, false);
INSERT INTO public.moon VALUES (11, 'Ophelia', 1986, 5, false);
INSERT INTO public.moon VALUES (12, 'Rosalind', 1986, 5, false);
INSERT INTO public.moon VALUES (13, 'Perdita', 1986, 5, false);
INSERT INTO public.moon VALUES (14, 'Enceladus', 1980, 4, false);
INSERT INTO public.moon VALUES (15, 'Titan', 1655, 4, false);
INSERT INTO public.moon VALUES (16, 'Phobos', 1877, 2, false);
INSERT INTO public.moon VALUES (17, 'Deimos', 1877, 2, false);
INSERT INTO public.moon VALUES (18, 'Hippocamp', 2004, 6, false);
INSERT INTO public.moon VALUES (19, 'Nereid', 1949, 6, false);
INSERT INTO public.moon VALUES (20, 'Proteus', 1949, 6, false);


--
-- Data for Name: nebulae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebulae VALUES (1, 'Witch Head', 'Reflection', 'B');
INSERT INTO public.nebulae VALUES (2, 'Heart', 'Emission', 'H');
INSERT INTO public.nebulae VALUES (3, 'Horsehead', 'Dark', 'K');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742.00000, true, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 6779.00000, true, NULL);
INSERT INTO public.planet VALUES (3, 'Jupter', 139820.00000, true, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 116460.00000, true, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 50724.00000, true, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 49244.00000, true, NULL);
INSERT INTO public.planet VALUES (7, 'Pluto', 2376.60000, true, NULL);
INSERT INTO public.planet VALUES (8, 'Venus', 12104.00000, false, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 4879.40000, false, NULL);
INSERT INTO public.planet VALUES (10, 'Eris', 2326.00000, false, NULL);
INSERT INTO public.planet VALUES (11, 'Makemake', 1434.00000, true, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', 1600.00000, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', -10000000, true, 6);
INSERT INTO public.star VALUES (2, 'Denebola', 'A', 1970, true, 6);
INSERT INTO public.star VALUES (3, 'Polaris', 'F', 1929, true, 6);
INSERT INTO public.star VALUES (4, 'Electra', 'E', 2000, true, 6);
INSERT INTO public.star VALUES (5, 'Alcione', 'P', 1875, true, 6);
INSERT INTO public.star VALUES (6, 'Libertas', 'M', 1812, true, 6);
INSERT INTO public.star VALUES (7, 'Talita', 'J', 2007, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulae_nebulae_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 42, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebulae nebulae_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_name_key UNIQUE (name);


--
-- Name: nebulae nebulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_pkey PRIMARY KEY (nebulae_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

