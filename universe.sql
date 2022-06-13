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
    diameter_kpc numeric(6,2),
    distance_kpc integer,
    discovered integer,
    constellation character varying(30),
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    morphological_scheme text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km numeric,
    semi_major_axis_km integer,
    orbital_period_h numeric,
    is_spherical boolean,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    eccentricity numeric,
    orbital_period_days numeric,
    discovered character varying(30),
    surface_temperature_k integer,
    has_life boolean,
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
-- Name: spectral_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spectral_class (
    spectral_class_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_color text
);


ALTER TABLE public.spectral_class OWNER TO freecodecamp;

--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spectral_class_spectral_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectral_class_spectral_class_id_seq OWNER TO freecodecamp;

--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spectral_class_spectral_class_id_seq OWNED BY public.spectral_class.spectral_class_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_m numeric,
    distance_from_earth numeric,
    temperature_k integer,
    galaxy_id integer NOT NULL,
    spectral_class_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spectral_class spectral_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class ALTER COLUMN spectral_class_id SET DEFAULT nextval('public.spectral_class_spectral_class_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 30.00, 0, 1610, 'sagittarius', 1);
INSERT INTO public.galaxy VALUES (2, 'canis major_dwarf', 1.50, 8, 2003, 'canis major', 2);
INSERT INTO public.galaxy VALUES (3, 'sagittarius dwarf', 2.60, 20, 1994, 'sagittarius', 3);
INSERT INTO public.galaxy VALUES (4, 'seque 1', 0.06, 23, 2007, 'leo', 4);
INSERT INTO public.galaxy VALUES (5, 'triangulum 2', 0.07, 30, 2015, 'triangulum', 4);
INSERT INTO public.galaxy VALUES (6, 'reticulum', NULL, 30, 2015, 'reticulum', 4);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'habble');
INSERT INTO public.galaxy_type VALUES (2, 'irregular', 'habble');
INSERT INTO public.galaxy_type VALUES (3, 'elliptical', 'habble');
INSERT INTO public.galaxy_type VALUES (4, 'barred spiral', 'habble');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'phobos', 22.2, 9377, 7.66, false, 4);
INSERT INTO public.moon VALUES (2, 'deimos', 12.6, 23410, 30.35, false, 4);
INSERT INTO public.moon VALUES (3, 'io', 3643.2, 421800, 37, true, 5);
INSERT INTO public.moon VALUES (4, 'europa', 3121.6, 671100, 84, true, 5);
INSERT INTO public.moon VALUES (5, 'ganimede', 5268.2, 1070400, 151, true, 5);
INSERT INTO public.moon VALUES (38, 'callisto', 4820.6, 1882700, 456, true, 5);
INSERT INTO public.moon VALUES (39, 'moon', 3474, 384399, 655.58, true, 3);
INSERT INTO public.moon VALUES (40, 'pan', 28.2, 133584, 14.3, false, 6);
INSERT INTO public.moon VALUES (41, 'atlas', 30.2, 137670, 14.7, false, 6);
INSERT INTO public.moon VALUES (42, 'pandora', 81.4, 141720, 15.2, true, 6);
INSERT INTO public.moon VALUES (43, 'mimas', 396.4, 185404, 22.7, true, 6);
INSERT INTO public.moon VALUES (44, 'cordelia', 40, 49770, 8.6, false, 7);
INSERT INTO public.moon VALUES (45, 'ophelia', 43, 53790, 9.3, false, 7);
INSERT INTO public.moon VALUES (46, 'bianca', 51, 59770, 10.2, true, 7);
INSERT INTO public.moon VALUES (47, 'cressida', 80, 61780, 11.5, true, 7);
INSERT INTO public.moon VALUES (48, 'naiad', 60.4, 48224, 7.1, false, 8);
INSERT INTO public.moon VALUES (49, 'thaiassa', 81.4, 50074, 7.4, false, 8);
INSERT INTO public.moon VALUES (50, 'despira', 156, 52528, 8.2, false, 8);
INSERT INTO public.moon VALUES (51, 'leda', 21.5, 11146400, 5781, false, 5);
INSERT INTO public.moon VALUES (52, 'elara', 79.9, 11712300, 6216, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 0.205, 87.966, 'prehistorical', 440, false, 8);
INSERT INTO public.planet VALUES (2, 'venus', 0.007, 224.701, 'prehistorical', 730, false, 8);
INSERT INTO public.planet VALUES (3, 'earth', 0.017, 365.26, 'prehistorical', 287, true, 8);
INSERT INTO public.planet VALUES (4, 'mars', 0.093, 686.97, 'prehistorical', 227, false, 8);
INSERT INTO public.planet VALUES (5, 'jupiter', 0.048, 4332.99, 'prehistorical', 152, false, 8);
INSERT INTO public.planet VALUES (6, 'saturn', 0.054, 10759.22, 'prehistorical', 134, false, 8);
INSERT INTO public.planet VALUES (7, 'uranus', 0.047, 30688.5, '1781', 76, false, 8);
INSERT INTO public.planet VALUES (8, 'neptune', 0.008, 60182, '1846', 73, false, 8);
INSERT INTO public.planet VALUES (9, 'hd16404b', 0.24, 606.4, '2010', NULL, false, 10);
INSERT INTO public.planet VALUES (10, 'hats36', 0.105, 4.175, '2017', NULL, false, 10);
INSERT INTO public.planet VALUES (11, 'leonisb', 0.14, 429, '2009', NULL, false, 13);
INSERT INTO public.planet VALUES (12, 'gliese436b', 0.152, 2.643, '2004', 712, false, 13);


--
-- Data for Name: spectral_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spectral_class VALUES (1, 'O', 'BLUE');
INSERT INTO public.spectral_class VALUES (2, 'B', 'BLUE-WHITE');
INSERT INTO public.spectral_class VALUES (3, 'A', 'WHITE');
INSERT INTO public.spectral_class VALUES (4, 'F', 'YELLOW-WHITE');
INSERT INTO public.spectral_class VALUES (5, 'G', 'YELLOW');
INSERT INTO public.spectral_class VALUES (6, 'K', 'ORANGE');
INSERT INTO public.spectral_class VALUES (7, 'M', 'RED');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (8, 'sun', 1, NULL, 5772, 1, 5);
INSERT INTO public.star VALUES (9, 'adhara', 12.6, 132, 22900, 2, 2);
INSERT INTO public.star VALUES (10, 'sirius b', 1.018, 2.67, 25000, 2, 2);
INSERT INTO public.star VALUES (11, 'rukbat', 2.95, 55.7, 12387, 3, 2);
INSERT INTO public.star VALUES (12, 'alnasl', 5.8, 29.7, 4760, 3, 6);
INSERT INTO public.star VALUES (13, 'regulus', 3.8, 24.23, 3242, 4, 7);
INSERT INTO public.star VALUES (14, 'denebola', 1.78, 11, 8500, 4, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 52, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spectral_class_spectral_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spectral_class_spectral_class_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_type_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: spectral_class spectral_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class
    ADD CONSTRAINT spectral_class_name_key UNIQUE (name);


--
-- Name: spectral_class spectral_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spectral_class
    ADD CONSTRAINT spectral_class_pkey PRIMARY KEY (spectral_class_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: planet planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: star star_spectral_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_spectral_class_id_fkey FOREIGN KEY (spectral_class_id) REFERENCES public.spectral_class(spectral_class_id);


--
-- PostgreSQL database dump complete
--

