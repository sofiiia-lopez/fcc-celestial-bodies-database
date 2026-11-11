--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(50) NOT NULL,
    atomic_number integer NOT NULL,
    is_noble_gas boolean NOT NULL
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO freecodecamp;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    discovery_year integer
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    spectral_type character varying(10)
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'Hydrogen', 1, false);
INSERT INTO public.element VALUES (2, 'Helium', 2, true);
INSERT INTO public.element VALUES (3, 'Lithium', 3, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.50, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 13000, 28.00, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23.00, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Spiral', 13200, 17.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, true, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, true, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198, true, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 533, true, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 561, true, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 763, true, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 2574, true, 1655);
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 135, false, 1848);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 734, true, 1671);
INSERT INTO public.moon VALUES (16, 'Phoebe', 6, 106, false, 1899);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 235, true, 1948);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 578, true, 1851);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 584, true, 1851);
INSERT INTO public.moon VALUES (20, 'Titania', 7, 788, true, 1787);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 91.69, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 41.40, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 0.00, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 78.34, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 628.73, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 1275.00, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 2724.00, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4351.00, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 4.24, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, 4.24, false, true);
INSERT INTO public.planet VALUES (11, 'Sirius b', 3, 8.60, false, true);
INSERT INTO public.planet VALUES (12, 'Vega b', 5, 25.04, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 'G2V');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, true, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, true, 'A1V');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, true, 'M1-M2');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, true, 'A0V');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, true, 'B8Ia');


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.element_element_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: element element_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_atomic_number_key UNIQUE (atomic_number);


--
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


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

