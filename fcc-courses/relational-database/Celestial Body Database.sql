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
-- Name: author; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.author (
    name character varying(20) NOT NULL,
    github character varying(40),
    linkedin character varying(40),
    author_id integer NOT NULL
);


ALTER TABLE public.author OWNER TO freecodecamp;

--
-- Name: author_author_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_author_id_seq OWNER TO freecodecamp;

--
-- Name: author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.author_author_id_seq OWNED BY public.author.author_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age_in_million_of_years numeric(4,1),
    has_life boolean,
    galaxy_type character varying(20)
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
    name character varying(20) NOT NULL,
    planet_id integer,
    distance_to_planet integer,
    is_spherical boolean
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
    name character varying(20) NOT NULL,
    moons integer,
    description text,
    has_moons boolean,
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
    name character varying(20) NOT NULL,
    planets_in_system integer,
    has_planets boolean,
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
-- Name: author author_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.author ALTER COLUMN author_id SET DEFAULT nextval('public.author_author_id_seq'::regclass);


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
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.author VALUES ('Asterki', NULL, NULL, 1);
INSERT INTO public.author VALUES ('Asterki', NULL, NULL, 2);
INSERT INTO public.author VALUES ('Asterki', NULL, NULL, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.4, true, 'Globular Cluster');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 13.8, false, 'Spherical');
INSERT INTO public.galaxy VALUES (3, 'NGC 2865', 13.8, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Milky way 2', 13.8, false, 'Spherical');
INSERT INTO public.galaxy VALUES (5, 'NGC 2325', 13.8, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'NGC 290', 13.8, false, 'Spherical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 67000, true);
INSERT INTO public.moon VALUES (2, 'Moon 2?', 3, 675000, false);
INSERT INTO public.moon VALUES (3, 'Deismos', 4, 45000, true);
INSERT INTO public.moon VALUES (4, 'Phobos', 4, 85000, true);
INSERT INTO public.moon VALUES (5, 'Moon 1', 2, 45000, true);
INSERT INTO public.moon VALUES (6, 'Moon 2', 2, 45000, true);
INSERT INTO public.moon VALUES (7, 'Moon 3', 2, 45000, true);
INSERT INTO public.moon VALUES (8, 'Moon 4', 2, 45000, true);
INSERT INTO public.moon VALUES (9, 'Moon 5', 2, 45000, true);
INSERT INTO public.moon VALUES (10, 'Moon 6', 2, 45000, true);
INSERT INTO public.moon VALUES (11, 'Moon 7', 2, 45000, true);
INSERT INTO public.moon VALUES (12, 'Moon 8', 2, 45000, true);
INSERT INTO public.moon VALUES (13, 'Moon 9', 2, 45000, true);
INSERT INTO public.moon VALUES (14, 'Moon 10', 2, 45000, true);
INSERT INTO public.moon VALUES (15, 'Moon 11', 2, 45000, true);
INSERT INTO public.moon VALUES (16, 'Moon 12', 2, 45000, true);
INSERT INTO public.moon VALUES (17, 'Moon 13', 2, 45000, true);
INSERT INTO public.moon VALUES (18, 'Moon 14', 2, 45000, true);
INSERT INTO public.moon VALUES (19, 'Moon 15', 2, 45000, true);
INSERT INTO public.moon VALUES (20, 'Moon 16', 2, 45000, true);
INSERT INTO public.moon VALUES (21, 'Moon 17', 2, 45000, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'First planet of the solar system', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'It is really bright', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Where we live', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Known as the red planet', true, 1);
INSERT INTO public.planet VALUES (5, 'Planet 1', 0, 'Planet 1 desc', false, 1);
INSERT INTO public.planet VALUES (6, 'Planet 2', 0, 'Planet 2 desc', false, 1);
INSERT INTO public.planet VALUES (7, 'Planet 3', 0, 'Planet 3 desc', false, 1);
INSERT INTO public.planet VALUES (8, 'Planet 4', 0, 'Planet 4 desc', false, 1);
INSERT INTO public.planet VALUES (9, 'Planet 5', 0, 'Planet 455 desc', false, 1);
INSERT INTO public.planet VALUES (10, 'Planet 6', 0, 'Planet 6 desc', false, 1);
INSERT INTO public.planet VALUES (11, 'Planet 7', 0, 'Planet 7 desc', false, 1);
INSERT INTO public.planet VALUES (12, 'Planet 8', 0, 'Planet 8 desc', false, 1);
INSERT INTO public.planet VALUES (13, 'Planet 9', 0, 'Planet 9 desc', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, true, 1);
INSERT INTO public.star VALUES (2, 'Rigel', 2, true, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centaury', 2, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri B', 2, true, 1);
INSERT INTO public.star VALUES (5, 'Random Sun 1', 4, false, 1);
INSERT INTO public.star VALUES (6, 'Random sun 2', 2, true, 1);
INSERT INTO public.star VALUES (7, 'Random Sun 3', 4, false, 1);


--
-- Name: author_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.author_author_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (author_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: author uq_author_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT uq_author_id UNIQUE (author_id);


--
-- Name: galaxy uq_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon uq_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_id UNIQUE (moon_id);


--
-- Name: planet uq_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_id UNIQUE (planet_id);


--
-- Name: star uq_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_id UNIQUE (star_id);


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

