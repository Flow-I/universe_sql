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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(64),
    distance_from_earth numeric
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
    name character varying(64) NOT NULL,
    description text,
    distance_from_earth numeric,
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
    name character varying(64) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_type character varying(64),
    distance_from_earth numeric,
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
    name character varying(64) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Der größte Asteroid im Asteroidengürtel und gleichzeitig als Zwergplanet klassifiziert.', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Einer der massereichsten Asteroiden und das hellste von der Erde aus sichtbare Objekt im Asteroidengürtel.', 1);
INSERT INTO public.asteroid VALUES (3, 'Eros', 'Ein erdnaher, unregelmäßig geformter Asteroid, der als erster überhaupt von einer Raumsonde umkreist und betreten wurde.', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milchstraße', 'Unser Heimatgalaxy', 13, 'Balkenspiralgalaxie', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Die gröste und nächste große Nachbargalaxie der Milchstraße', 10, 'Spiralgalaxie', 2.5);
INSERT INTO public.galaxy VALUES (3, 'Große Magellansche Wolke', 'Eine helle, sternenreiche Satellitengalaxie der Milchstraße am Südhimmel', 13, 'Irreguläre Zwerggalaxie', 163000);
INSERT INTO public.galaxy VALUES (4, 'Kleine Magellansche Wolke', 'Der kleinere Begleiter der Großen Magellanschen Wolke', 13, 'Irreguläre Zwerggalaxie', 200000);
INSERT INTO public.galaxy VALUES (5, 'Dreiecksnebel', 'Das drittgrößte Mitglied unserer Lokalen Gruppe', 12, 'Spiralgalaxie', 3000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero-Galaxie', 'Berühmt für ihr dunkles Staubband und den extrem großen hellen Kern', 13, 'Linsenförmige Galaxie / Spiralgalaxie', 31000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mond', 'Der natürliche Satellit der Erde; prägt die Gezeiten und stabilisiert die Erdachse.', 0.0026, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', ' Der größere der beiden Marsmonde; ein unregelmäßiger, kartoffelförmiger eingefangener Asteroid.', 0.38, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Der kleinere Marsmond; er umkreist den Planeten auf einer sehr weiten und stabilen Bahn.', 0.38, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Der innerste der vier großen Galileischen Jupitermonde; der vulkanisch aktivste Körper im Sonnensystem.', 3.93, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Besitzen eine Eiskruste, unter der ein globaler Ozean aus flüssigem Wasser vermutet wird.', 3.93, 5);
INSERT INTO public.moon VALUES (6, 'Ganymed', 'Der größte Mond im gesamten Sonnensystem; er ist sogar größer als der Planet Merkur.', 3.93, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Ein unregelmäßig geformter, tiefroter Innenmond des Jupitersystems.', 3.93, 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Ein kleiner Saturnmond, der wegen seines riesigen Kraters optisch dem „Todesstern“ gleicht.', 8.01, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', ' Bekannt für seine aktiven Geysire am Südpol, die Wassereis aus einem subglazialen Ozean speien.', 8.01, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Ein eisiger Himmelskörper im Saturnsystem, der von einer gigantischen Schlucht durchzogen wird', 8.01, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Besteht primär aus Wassereis und zeigt auf einer Hemisphäre auffällige, helle Eis-Klippen.', 8.01, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Der zweitgrößte Saturnmond; besitzt eine stark kraterisierte Oberfläche und eine dünne Sauerstoff-Exosphäre.', 8.01, 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'Der zweitgrößte Mond des Sonnensystems; besitzt eine dichte Atmosphäre sowie Seen aus flüssigem Methan.', 8.01, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Ein kontrastreicher Mond mit einer pechschwarzen und einer schneeweißen Hemisphäre.', 8.01, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Der innerste der großen Uranusmonde; extrem zerklüftet mit den höchsten bekannten Klippen.', 17.3, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Der hellste und geologisch jüngste unter den großen klassischen Uranusmonden.', 17.3, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Der dunkelste unter den großen Uranusmonden; stark kraterisiert.', 17.3, 7);
INSERT INTO public.moon VALUES (19, 'Titania', 'Der größte Mond des Uranus; benannt nach der Elfenkönigin aus Shakespeares Sommernachtstraum.', 17.3, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 'Der größte Neptunmond; er besitzt eine rückläufige Umlaufbahn und aktive Stickstoff-Geysire.', 28.8, 8);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Der äußerste der Galileischen Monde; seine Oberfläche weist extrem viele Einschlagkrater auf.', 3.93, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Erde', 'Unser Heimatplanet; der einzige bekannte Himmelskörper mit flüssigem Wasser an der Oberfläche', true, true, 'Terrestrischer Planet', 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Der „Rote Planet“; besitzt eine dünne CO₂-Atmosphäre und riesige erloschene Vulkane.', false, true, 'Terrestrischer Planet', 0.000024, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Unser Nachbarplanet mit einer extrem dichten Treibhausatmosphäre und Oberflächentemperaturen von über 460 °C.', false, true, 'Terrestrischer Planet', 0.000011, 1);
INSERT INTO public.planet VALUES (4, 'Merkur', 'Der sonnennächste und kleinste Planet im Sonnensystem; besitzt fast keine Atmosphäre.', false, true, 'Terrestrischer Planet', 0.000015, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Der größte Planet des Sonnensystems; ein gigantischer Gasball mit dem berühmten Großen Roten Fleck.', false, true, 'Gasriese', 0.000088, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Bekannt für sein spektakuläres und weit ausgedehntes Ringsystem aus Eis und Gestein.', false, true, 'Gasriese', 0.00017, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ein Eisriese, dessen Rotationsachse fast parallel zu seiner Umlaufbahn liegt (er „rollt“ um die Sonne).', false, true, 'Eisriese', 0.00030, 1);
INSERT INTO public.planet VALUES (8, 'Neptun', 'Der äußerste bekannte Planet unseres Systems; geplagt von den stärksten Stürmen im Sonnensystem.', false, true, 'Eisriese', 0.00047, 1);
INSERT INTO public.planet VALUES (9, 'Beteigeuze b', 'Ein theoretischer, mathematisch simulierter Exoplanet in sicherem Abstand zum sterbenden Überriesen.', false, false, 'Gasriese (Hypothetisch)', 640, 2);
INSERT INTO public.planet VALUES (10, 'Beteigeuze c', 'Ein hypothetischer, extrem massereicher Planet auf einer weiten Umlaufbahn um den instabilen Riesenstern.', false, true, 'Super-Jupiter (Hypothetisch)', 640, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Der uns am nächsten gelegene Exoplanet überhaupt; er umkreist seinen Stern in der habitablen Zone.', false, true, 'Terrestrischer Planet', 4.2, 8);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri c', 'Ein kühler, weitaus größerer Begleiter im innersten Nachbarsystem der Erde.', false, true, 'Supererde / Mini-Neptun', 4.2, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sonne', 'Unser Heimatstern; ein gelber Zwergstern', true, 4, 0.0000158, 1);
INSERT INTO public.star VALUES (2, 'Beteigeuze', 'Ein roter Überriese, der kurz vor einer Supernova steht', true, 8, 640, 1);
INSERT INTO public.star VALUES (3, 'PA-99-N2', 'Einer der ersten Sterne, die in Andromeda per Mikrolinseneffekt nachgewiesen wurden', true, NULL, 2.5, 2);
INSERT INTO public.star VALUES (4, 'Sanduleak -69 202', 'Der blaue Überriese, der 1987 als die berühmte Supernova SN 1987A explodierte.', true, 20, 163000, 3);
INSERT INTO public.star VALUES (5, 'HD 5980', 'Ein extrem massereiches, instabiles Doppelsternsystem (Wolf-Rayet-Sterne)', true, 3, 200000, 4);
INSERT INTO public.star VALUES (6, 'M33 X-7 Secondary', 'Ein massereicher, blauer Riesenstern, der ein stellares Schwarzes Loch umkreist', false, 4, 3000000, 5);
INSERT INTO public.star VALUES (7, 'Sterne in M104', 'Einzelne Sterne können dort aufgrund der Distanz visuell nicht isoliert/benannt werden.', true, 13000, 31000000, 6);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'Der der Sonne nächstgelegene Stern; ein roter Zwergstern und Flare-Star', true, 4850, 4.24, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

