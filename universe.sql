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
-- Name: beings; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.beings (
    beings_id integer NOT NULL,
    name character varying(30) NOT NULL,
    can_fly boolean,
    planet_id integer
);


ALTER TABLE public.beings OWNER TO freecodecamp;

--
-- Name: beings_being_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.beings_being_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beings_being_id_seq OWNER TO freecodecamp;

--
-- Name: beings_being_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.beings_being_id_seq OWNED BY public.beings.beings_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    no_of_stars integer,
    age_in_billion_years numeric(5,2),
    description text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    discovered_by character varying(20),
    diameter_in_km integer
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
    no_of_moons integer,
    description text,
    has_living_beings boolean,
    has_water boolean,
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    color character varying(20),
    is_spherical boolean
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
-- Name: beings beings_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.beings ALTER COLUMN beings_id SET DEFAULT nextval('public.beings_being_id_seq'::regclass);


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
-- Data for Name: beings; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.beings VALUES (1, 'Human', false, 3);
INSERT INTO public.beings VALUES (2, 'alien', true, 4);
INSERT INTO public.beings VALUES (3, 'Navi', false, 11);
INSERT INTO public.beings VALUES (4, 'Mutant', true, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Butterfly Galaxy', 1000, 13.62, 'galaxy is so far away so no information');
INSERT INTO public.galaxy VALUES (3, 'Cart Wheel Galaxy', 200, 0.50, 'galaxy is so far away so no information');
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 1500, 12.40, 'galaxy is so far away so no information');
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', 2000, 10.00, 'galaxy is so far away so no information');
INSERT INTO public.galaxy VALUES (6, 'PinWheel Galaxy', 2000, 13.60, 'galaxy is so far away so no information');
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 2000, 13.60, 'where we all live including earth');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, 3476);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Hall', 23);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Hall', 13);
INSERT INTO public.moon VALUES (4, 'Amalthea', 4, 'Barnard', 200);
INSERT INTO public.moon VALUES (5, 'Thebe', 4, 'Voyager', 90);
INSERT INTO public.moon VALUES (6, 'LO', 4, 'Galileo', 3630);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 'Galileo', 3138);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, 'Galileo', 5262);
INSERT INTO public.moon VALUES (9, 'Callisto', 5, 'Galileio', 4800);
INSERT INTO public.moon VALUES (10, 'Himalia', 5, 'Perrine', 170);
INSERT INTO public.moon VALUES (11, 'Pan', 5, 'Voyager', 20);
INSERT INTO public.moon VALUES (12, 'Atlas', 5, 'Voyager', 40);
INSERT INTO public.moon VALUES (13, 'Janus', 5, 'Dollfus', 190);
INSERT INTO public.moon VALUES (14, 'Mimas', 5, 'Herschel', 394);
INSERT INTO public.moon VALUES (15, 'Enceladus', 6, 'Herschel', 502);
INSERT INTO public.moon VALUES (16, 'Tethys', 6, 'Cassini', 295);
INSERT INTO public.moon VALUES (17, 'Dione', 6, 'Cassini', 1120);
INSERT INTO public.moon VALUES (18, 'Puck', 6, 'Voyager', 170);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 'Lassell', 1190);
INSERT INTO public.moon VALUES (20, 'Larissa', 8, 'Voyager', 400);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'nearest to the sun', false, false, 1);
INSERT INTO public.planet VALUES (2, 'venus', 0, 'second nearest to the sun', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'where we live(humans)', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'scientist guess there are living are present here', true, true, 1);
INSERT INTO public.planet VALUES (9, 'titan', 2, 'where thanos born', true, true, NULL);
INSERT INTO public.planet VALUES (10, 'asgard', 2, 'thor lives here and its not fully considered to be a planet', true, true, NULL);
INSERT INTO public.planet VALUES (11, 'pandora', 2, 'where navi''s live', true, true, NULL);
INSERT INTO public.planet VALUES (12, 'Arrakis', 1, 'where dune movie happens', true, true, NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', 79, 'largest in solar system', false, false, NULL);
INSERT INTO public.planet VALUES (6, 'saturn', 82, 'wears dust ring', false, false, NULL);
INSERT INTO public.planet VALUES (7, 'uranus', 27, 'blue in color', false, false, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', 14, 'laste planet', false, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Stephenson', 1, 'white', false);
INSERT INTO public.star VALUES (3, 'UY', 1, 'white', false);
INSERT INTO public.star VALUES (4, 'VY', 1, 'white', false);
INSERT INTO public.star VALUES (5, 'betel', 1, 'white', false);
INSERT INTO public.star VALUES (6, 'antares', 1, 'white', false);
INSERT INTO public.star VALUES (1, 'Sun', 1, 'Orange', true);


--
-- Name: beings_being_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.beings_being_id_seq', 4, true);


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
-- Name: beings beings_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.beings
    ADD CONSTRAINT beings_name_key UNIQUE (name);


--
-- Name: beings beings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.beings
    ADD CONSTRAINT beings_pkey PRIMARY KEY (beings_id);


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
-- Name: beings beings_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.beings
    ADD CONSTRAINT beings_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

