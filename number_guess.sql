--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 351);
INSERT INTO public.games VALUES (2, 1, 357);
INSERT INTO public.games VALUES (3, 2, 904);
INSERT INTO public.games VALUES (4, 2, 558);
INSERT INTO public.games VALUES (5, 1, 807);
INSERT INTO public.games VALUES (6, 1, 973);
INSERT INTO public.games VALUES (7, 1, 909);
INSERT INTO public.games VALUES (8, 3, 8);
INSERT INTO public.games VALUES (9, 1, 8);
INSERT INTO public.games VALUES (10, 4, 326);
INSERT INTO public.games VALUES (11, 4, 368);
INSERT INTO public.games VALUES (12, 5, 462);
INSERT INTO public.games VALUES (13, 5, 395);
INSERT INTO public.games VALUES (14, 4, 400);
INSERT INTO public.games VALUES (15, 4, 445);
INSERT INTO public.games VALUES (16, 4, 134);
INSERT INTO public.games VALUES (17, 6, 12);
INSERT INTO public.games VALUES (18, 6, 9);
INSERT INTO public.games VALUES (19, 3, 17);
INSERT INTO public.games VALUES (20, 7, 12);
INSERT INTO public.games VALUES (21, 8, 362);
INSERT INTO public.games VALUES (22, 8, 959);
INSERT INTO public.games VALUES (23, 9, 215);
INSERT INTO public.games VALUES (24, 9, 476);
INSERT INTO public.games VALUES (25, 8, 465);
INSERT INTO public.games VALUES (26, 8, 869);
INSERT INTO public.games VALUES (27, 8, 355);
INSERT INTO public.games VALUES (28, 10, 956);
INSERT INTO public.games VALUES (29, 10, 265);
INSERT INTO public.games VALUES (30, 11, 359);
INSERT INTO public.games VALUES (31, 11, 709);
INSERT INTO public.games VALUES (32, 10, 156);
INSERT INTO public.games VALUES (33, 10, 287);
INSERT INTO public.games VALUES (34, 10, 579);
INSERT INTO public.games VALUES (35, 12, 61);
INSERT INTO public.games VALUES (36, 12, 75);
INSERT INTO public.games VALUES (37, 13, 79);
INSERT INTO public.games VALUES (38, 13, 82);
INSERT INTO public.games VALUES (39, 12, 633);
INSERT INTO public.games VALUES (40, 12, 293);
INSERT INTO public.games VALUES (41, 12, 472);
INSERT INTO public.games VALUES (42, 14, 893);
INSERT INTO public.games VALUES (43, 14, 295);
INSERT INTO public.games VALUES (44, 15, 221);
INSERT INTO public.games VALUES (45, 15, 205);
INSERT INTO public.games VALUES (46, 14, 180);
INSERT INTO public.games VALUES (47, 14, 277);
INSERT INTO public.games VALUES (48, 14, 802);
INSERT INTO public.games VALUES (49, 16, 248);
INSERT INTO public.games VALUES (50, 16, 614);
INSERT INTO public.games VALUES (51, 17, 439);
INSERT INTO public.games VALUES (52, 17, 471);
INSERT INTO public.games VALUES (53, 16, 265);
INSERT INTO public.games VALUES (54, 16, 188);
INSERT INTO public.games VALUES (55, 16, 458);
INSERT INTO public.games VALUES (56, 3, 9);
INSERT INTO public.games VALUES (57, 18, 596);
INSERT INTO public.games VALUES (58, 18, 102);
INSERT INTO public.games VALUES (59, 19, 110);
INSERT INTO public.games VALUES (60, 19, 622);
INSERT INTO public.games VALUES (61, 18, 657);
INSERT INTO public.games VALUES (62, 18, 300);
INSERT INTO public.games VALUES (63, 18, 743);
INSERT INTO public.games VALUES (64, 20, 9);
INSERT INTO public.games VALUES (65, 21, 12);
INSERT INTO public.games VALUES (66, 22, 146);
INSERT INTO public.games VALUES (67, 22, 643);
INSERT INTO public.games VALUES (68, 23, 375);
INSERT INTO public.games VALUES (69, 23, 689);
INSERT INTO public.games VALUES (70, 22, 946);
INSERT INTO public.games VALUES (71, 22, 937);
INSERT INTO public.games VALUES (72, 22, 506);
INSERT INTO public.games VALUES (73, 24, 824);
INSERT INTO public.games VALUES (74, 24, 197);
INSERT INTO public.games VALUES (75, 25, 954);
INSERT INTO public.games VALUES (76, 25, 541);
INSERT INTO public.games VALUES (77, 24, 228);
INSERT INTO public.games VALUES (78, 24, 186);
INSERT INTO public.games VALUES (79, 24, 329);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1743935122715');
INSERT INTO public.users VALUES (2, 'user_1743935122714');
INSERT INTO public.users VALUES (3, 'Jeremy');
INSERT INTO public.users VALUES (4, 'user_1743935348474');
INSERT INTO public.users VALUES (5, 'user_1743935348473');
INSERT INTO public.users VALUES (6, 'Cherry Mae');
INSERT INTO public.users VALUES (7, '10000');
INSERT INTO public.users VALUES (8, 'user_1743937081254');
INSERT INTO public.users VALUES (9, 'user_1743937081253');
INSERT INTO public.users VALUES (10, 'user_1743937160513');
INSERT INTO public.users VALUES (11, 'user_1743937160512');
INSERT INTO public.users VALUES (12, 'user_1743937211473');
INSERT INTO public.users VALUES (13, 'user_1743937211472');
INSERT INTO public.users VALUES (14, 'user_1743937245829');
INSERT INTO public.users VALUES (15, 'user_1743937245828');
INSERT INTO public.users VALUES (16, 'user_1743937773599');
INSERT INTO public.users VALUES (17, 'user_1743937773598');
INSERT INTO public.users VALUES (18, 'user_1743938685257');
INSERT INTO public.users VALUES (19, 'user_1743938685256');
INSERT INTO public.users VALUES (20, 'Raffy');
INSERT INTO public.users VALUES (21, 'Adams');
INSERT INTO public.users VALUES (22, 'user_1743938969149');
INSERT INTO public.users VALUES (23, 'user_1743938969148');
INSERT INTO public.users VALUES (24, 'user_1743939042096');
INSERT INTO public.users VALUES (25, 'user_1743939042095');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 79, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

