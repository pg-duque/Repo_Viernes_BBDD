--
-- PostgreSQL database dump
--

\restrict 5Bfii6bnxSHOKXdxIe5XHauuyAfTqM38Um7BgZvtbDnaJUUhxeSd2MFp9Yj6CKB

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-04-17 14:42:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 143943)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    alumno_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellidos character varying(150) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 143942)
-- Name: alumnos_alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumnos_alumno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alumnos_alumno_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 217
-- Name: alumnos_alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_alumno_id_seq OWNED BY public.alumnos.alumno_id;


--
-- TOC entry 220 (class 1259 OID 143952)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    curso_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    duracion numeric(10,2) NOT NULL,
    numero_asignaturas integer NOT NULL
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 143951)
-- Name: cursos_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_curso_id_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 219
-- Name: cursos_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_curso_id_seq OWNED BY public.cursos.curso_id;


--
-- TOC entry 222 (class 1259 OID 143959)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    inscripcion_id integer NOT NULL,
    alumno_id integer NOT NULL,
    curso_id integer NOT NULL,
    fecha_inscripcion date NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 143958)
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_inscripcion_id_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 221
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_inscripcion_id_seq OWNED BY public.inscripciones.inscripcion_id;


--
-- TOC entry 4752 (class 2604 OID 143946)
-- Name: alumnos alumno_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN alumno_id SET DEFAULT nextval('public.alumnos_alumno_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 143955)
-- Name: cursos curso_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN curso_id SET DEFAULT nextval('public.cursos_curso_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 143962)
-- Name: inscripciones inscripcion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN inscripcion_id SET DEFAULT nextval('public.inscripciones_inscripcion_id_seq'::regclass);


--
-- TOC entry 4911 (class 0 OID 143943)
-- Dependencies: 218
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (alumno_id, nombre, apellidos, email) FROM stdin;
1	Juan	Lopeo Locoja	juanlopeolocoja@gmail.com
2	Sara	García Dorado	sara1987@gmail.com
3	Pablo	Calzado Martín	pabloimg1561@gmail.com
4	Vicente	López López	vicentell@gmail.com
5	Lucas	Crabioto Mendez	lucascm@hotmail.com
6	Alva	Ginón Rosado	alvaginon@gmail.com
7	Rafa	Del Olmo Pisado	rafaolmopisado@gmail.com
\.


--
-- TOC entry 4913 (class 0 OID 143952)
-- Dependencies: 220
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (curso_id, nombre, duracion, numero_asignaturas) FROM stdin;
1	tecnologico	200.00	6
2	biosanitario	200.00	7
3	sociales	200.00	5
4	artes artisticas	200.00	4
5	artes plasticas	200.00	4
\.


--
-- TOC entry 4915 (class 0 OID 143959)
-- Dependencies: 222
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (inscripcion_id, alumno_id, curso_id, fecha_inscripcion) FROM stdin;
1	1	3	2005-11-10
2	2	3	2005-10-08
3	3	1	2011-10-08
4	4	4	2001-09-11
5	5	5	2004-10-14
6	6	2	2001-09-11
7	7	5	2004-10-13
\.


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 217
-- Name: alumnos_alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_alumno_id_seq', 7, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 219
-- Name: cursos_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_curso_id_seq', 5, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 221
-- Name: inscripciones_inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_inscripcion_id_seq', 7, true);


--
-- TOC entry 4756 (class 2606 OID 143950)
-- Name: alumnos alumnos_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_email_key UNIQUE (email);


--
-- TOC entry 4758 (class 2606 OID 143948)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (alumno_id);


--
-- TOC entry 4760 (class 2606 OID 143957)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (curso_id);


--
-- TOC entry 4762 (class 2606 OID 143964)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (inscripcion_id);


--
-- TOC entry 4763 (class 2606 OID 143965)
-- Name: inscripciones fk_inscripcion_alumno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fk_inscripcion_alumno FOREIGN KEY (alumno_id) REFERENCES public.alumnos(alumno_id);


--
-- TOC entry 4764 (class 2606 OID 143970)
-- Name: inscripciones fk_inscripcion_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT fk_inscripcion_curso FOREIGN KEY (curso_id) REFERENCES public.cursos(curso_id);


-- Completed on 2026-04-17 14:42:19

--
-- PostgreSQL database dump complete
--

\unrestrict 5Bfii6bnxSHOKXdxIe5XHauuyAfTqM38Um7BgZvtbDnaJUUhxeSd2MFp9Yj6CKB

