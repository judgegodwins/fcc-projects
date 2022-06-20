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
-- Name: anon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.anon (
    anon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    rating NUMERIC(3, 2)
);


ALTER TABLE public.anon OWNER TO freecodecamp;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL UNIQUE,
    number_of_stars integer,
    brightness integer,
    rating numeric(3,2),
    description text,
    contains_sun boolean,
    contains_heat boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL UNIQUE,
    rating numeric(3,2),
    description text,
    emits_heat boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL UNIQUE,
    rating numeric(3,2),
    description text,
    emits_heat boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL UNIQUE,
    brightness integer,
    rating numeric(3,2),
    description text,
    emits_heat boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: anon id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--


--
-- Name: galaxy id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: anon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 5, 4.90, 'Its milky', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100000, 5, 4.90, 'Its andromeda', true, true);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 100000, 5, 4.90, 'Its like a cloud', true, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 100000, 5, 4.90, 'Its blue cloud', false, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 100000, 5, 4.90, 'Its cloudy', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 100000, 5, 4.90, 'Its cloudy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth moon', 4.90, 'Beautiful, no life', true, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 4.90, 'Beautiful, no life', true, 4);
INSERT INTO public.moon VALUES (3, 'Europa', 4.90, 'Beautiful, no life', true, 4);
INSERT INTO public.moon VALUES (4, 'Jupiter Moon', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.moon VALUES (5, 'Mars Moon', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.moon VALUES (6, 'Mercury Moon', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.moon VALUES (7, 'Star 7', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (8, 'Star 8', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (9, 'Star 9', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (10, 'Star 10', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (11, 'Star 11', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (12, 'Star 12', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (13, 'Star 13', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (14, 'Star 14', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (15, 'Star 15', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (16, 'Star 16', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (17, 'Star 17', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (18, 'Star 18', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (19, 'Star 19', 4.80, NULL, true, 1);
INSERT INTO public.moon VALUES (20, 'Star 20', 4.80, NULL, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4.90, 'It sustains life and contains sea and land', true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (3, 'Pluto', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (5, 'Mars', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (6, 'Mercury', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (9, 'Planet 9', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (10, 'Planet 10', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (11, 'Planet 11', 4.50, 'Beautiful, no life', true, 2);
INSERT INTO public.planet VALUES (12, 'Planet 12', 4.50, 'Beautiful, no life', true, 2);



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 100000, 4.90, 'Its bright', true, 1);
INSERT INTO public.star VALUES (2, 'Aldebaran', 100000, 4.90, 'Its bright', true, 1);
INSERT INTO public.star VALUES (3, 'Arcturus', 100000, 4.90, 'Its orange', true, 1);
INSERT INTO public.star VALUES (4, 'Deneb', 100000, 4.90, NULL, true, 1);
INSERT INTO public.star VALUES (5, 'Antares', 90000, 4.80, NULL, true, 1);
INSERT INTO public.star VALUES (6, 'Achernar', 90000, 4.80, NULL, true, 1);


INSERT INTO public.anon(name, rating) VALUES ('A', 4.6), ('B', 4.7), ('C', 4.8);

--
-- Name: anon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: anon anon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--


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
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

