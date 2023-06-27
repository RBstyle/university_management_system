--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg110+1)

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
-- Name: buildings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.buildings (
    id integer NOT NULL,
    address character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.buildings OWNER TO admin;

--
-- Name: buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.buildings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.buildings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.classrooms (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    class_number integer NOT NULL,
    building character varying
);


ALTER TABLE public.classrooms OWNER TO admin;

--
-- Name: classrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.classrooms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    name character varying NOT NULL,
    teacher character varying,
    student character varying,
    grade integer
);


ALTER TABLE public.courses OWNER TO admin;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.courses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: curriculums; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.curriculums (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    name character varying NOT NULL,
    course character varying,
    semester integer,
    course_duration integer
);


ALTER TABLE public.curriculums OWNER TO admin;

--
-- Name: curriculums_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.curriculums ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.curriculums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying NOT NULL,
    facult character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.departments OWNER TO admin;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.departments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: exams; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.exams (
    id integer NOT NULL,
    course character varying,
    classroom integer,
    student character varying,
    grade integer,
    exam_datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.exams OWNER TO admin;

--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.exams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: faculties; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.faculties OWNER TO admin;

--
-- Name: faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.faculties ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.faculties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: grades; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    grade integer NOT NULL
);


ALTER TABLE public.grades OWNER TO admin;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.grades ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    department character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.groups OWNER TO admin;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.groups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: independent_tasks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.independent_tasks (
    id integer NOT NULL,
    independent_task character varying NOT NULL,
    course character varying,
    student character varying,
    grade integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.independent_tasks OWNER TO admin;

--
-- Name: independent_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.independent_tasks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.independent_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schedules (
    id integer NOT NULL,
    schedule character varying NOT NULL,
    semester integer,
    exam integer,
    course character varying,
    group_name character varying,
    classroom integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.schedules OWNER TO admin;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.schedules ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: semesters; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.semesters (
    id integer NOT NULL,
    semester integer NOT NULL,
    academic_yaer character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.semesters OWNER TO admin;

--
-- Name: semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.semesters ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.semesters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: students; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.students (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    group_name character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.students OWNER TO admin;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.teachers OWNER TO admin;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.teachers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: training_programs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.training_programs (
    id integer NOT NULL,
    name character varying NOT NULL,
    course integer,
    independent_tasks character varying,
    exam integer
);


ALTER TABLE public.training_programs OWNER TO admin;

--
-- Name: training_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

ALTER TABLE public.training_programs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.training_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.buildings (id, address, created_at) FROM stdin;
\.


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.classrooms (id, created_at, class_number, building) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, created_at, name, teacher, student, grade) FROM stdin;
1	2023-06-27 06:15:45.694667	course1	teacher1	student2	\N
2	2023-06-27 06:16:09.466605	course2	teacher2	student3	4
\.


--
-- Data for Name: curriculums; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.curriculums (id, created_at, name, course, semester, course_duration) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.departments (id, name, facult, created_at) FROM stdin;
1	department1	facult1	2023-06-27 06:09:53.553422
4	department2	facult2	2023-06-27 06:11:39.213943
5	department3	facult3	2023-06-27 06:11:51.734502
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.exams (id, course, classroom, student, grade, exam_datetime, created_at) FROM stdin;
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.faculties (id, name, created_at) FROM stdin;
1	facult1	2023-06-27 06:09:16.220995
3	facult3	2023-06-27 06:09:33.155512
2	facult2	2023-06-27 06:09:24.959901
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.grades (id, grade) FROM stdin;
1	4
2	5
4	3
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.groups (id, name, department, created_at) FROM stdin;
1	001	department1	2023-06-27 06:12:09.417282
2	002	department2	2023-06-27 06:12:14.730925
3	003	department3	2023-06-27 06:12:26.111949
\.


--
-- Data for Name: independent_tasks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.independent_tasks (id, independent_task, course, student, grade, created_at) FROM stdin;
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schedules (id, schedule, semester, exam, course, group_name, classroom, created_at) FROM stdin;
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.semesters (id, semester, academic_yaer, created_at) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.students (id, full_name, group_name, created_at) FROM stdin;
2	student2	001	2023-06-27 06:14:03.592969
3	student3	002	2023-06-27 06:14:15.335943
4	student4	002	2023-06-27 06:14:20.352693
1	student1 edited	003	2023-06-27 06:13:49.685984
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.teachers (id, full_name, created_at) FROM stdin;
1	teacher1	2023-06-27 06:13:06.69524
2	teacher2	2023-06-27 06:13:11.875547
\.


--
-- Data for Name: training_programs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.training_programs (id, name, course, independent_tasks, exam) FROM stdin;
\.


--
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.buildings_id_seq', 1, false);


--
-- Name: classrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.classrooms_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.courses_id_seq', 2, true);


--
-- Name: curriculums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.curriculums_id_seq', 1, false);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.departments_id_seq', 5, true);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.exams_id_seq', 1, false);


--
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.faculties_id_seq', 3, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.grades_id_seq', 4, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.groups_id_seq', 3, true);


--
-- Name: independent_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.independent_tasks_id_seq', 1, false);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.semesters_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.students_id_seq', 4, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.teachers_id_seq', 2, true);


--
-- Name: training_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.training_programs_id_seq', 1, false);


--
-- Name: buildings buildings_address_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_address_key UNIQUE (address);


--
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (id);


--
-- Name: classrooms classrooms_class_number_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_class_number_key UNIQUE (class_number);


--
-- Name: classrooms classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);


--
-- Name: courses courses_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_name_key UNIQUE (name);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: curriculums curriculums_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT curriculums_name_key UNIQUE (name);


--
-- Name: curriculums curriculums_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT curriculums_pkey PRIMARY KEY (id);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- Name: faculties faculties_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_name_key UNIQUE (name);


--
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- Name: grades grades_grade_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_grade_key UNIQUE (grade);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: independent_tasks independent_tasks_independent_task_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_independent_task_key UNIQUE (independent_task);


--
-- Name: independent_tasks independent_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_schedule_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_schedule_key UNIQUE (schedule);


--
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: semesters semesters_semester_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_semester_key UNIQUE (semester);


--
-- Name: students students_full_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_full_name_key UNIQUE (full_name);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_full_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_full_name_key UNIQUE (full_name);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: training_programs training_programs_independent_tasks_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.training_programs
    ADD CONSTRAINT training_programs_independent_tasks_key UNIQUE (independent_tasks);


--
-- Name: training_programs training_programs_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.training_programs
    ADD CONSTRAINT training_programs_name_key UNIQUE (name);


--
-- Name: training_programs training_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.training_programs
    ADD CONSTRAINT training_programs_pkey PRIMARY KEY (id);


--
-- Name: classrooms classrooms_building_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_building_fkey FOREIGN KEY (building) REFERENCES public.buildings(address) ON DELETE CASCADE;


--
-- Name: courses courses_grade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_grade_fkey FOREIGN KEY (grade) REFERENCES public.grades(grade) ON DELETE CASCADE;


--
-- Name: courses courses_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_student_fkey FOREIGN KEY (student) REFERENCES public.students(full_name) ON DELETE CASCADE;


--
-- Name: courses courses_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_teacher_fkey FOREIGN KEY (teacher) REFERENCES public.teachers(full_name) ON DELETE CASCADE;


--
-- Name: curriculums curriculums_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT curriculums_course_fkey FOREIGN KEY (course) REFERENCES public.courses(name) ON DELETE CASCADE;


--
-- Name: curriculums curriculums_semester_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT curriculums_semester_fkey FOREIGN KEY (semester) REFERENCES public.semesters(id) ON DELETE CASCADE;


--
-- Name: departments departments_facult_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_facult_fkey FOREIGN KEY (facult) REFERENCES public.faculties(name) ON DELETE CASCADE;


--
-- Name: exams exams_classroom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_classroom_fkey FOREIGN KEY (classroom) REFERENCES public.classrooms(class_number) ON DELETE CASCADE;


--
-- Name: exams exams_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_course_fkey FOREIGN KEY (course) REFERENCES public.courses(name) ON DELETE CASCADE;


--
-- Name: exams exams_grade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_grade_fkey FOREIGN KEY (grade) REFERENCES public.grades(grade) ON DELETE CASCADE;


--
-- Name: exams exams_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_student_fkey FOREIGN KEY (student) REFERENCES public.students(full_name) ON DELETE CASCADE;


--
-- Name: groups groups_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_department_fkey FOREIGN KEY (department) REFERENCES public.departments(name) ON DELETE CASCADE;


--
-- Name: independent_tasks independent_tasks_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_course_fkey FOREIGN KEY (course) REFERENCES public.courses(name) ON DELETE CASCADE;


--
-- Name: independent_tasks independent_tasks_grade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_grade_fkey FOREIGN KEY (grade) REFERENCES public.grades(grade) ON DELETE CASCADE;


--
-- Name: independent_tasks independent_tasks_independent_task_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_independent_task_fkey FOREIGN KEY (independent_task) REFERENCES public.training_programs(independent_tasks) ON DELETE CASCADE;


--
-- Name: independent_tasks independent_tasks_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.independent_tasks
    ADD CONSTRAINT independent_tasks_student_fkey FOREIGN KEY (student) REFERENCES public.students(full_name) ON DELETE CASCADE;


--
-- Name: schedules schedules_classroom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_classroom_fkey FOREIGN KEY (classroom) REFERENCES public.classrooms(class_number) ON DELETE CASCADE;


--
-- Name: schedules schedules_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_course_fkey FOREIGN KEY (course) REFERENCES public.courses(name) ON DELETE CASCADE;


--
-- Name: schedules schedules_exam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_exam_fkey FOREIGN KEY (exam) REFERENCES public.exams(id) ON DELETE CASCADE;


--
-- Name: schedules schedules_group_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_group_name_fkey FOREIGN KEY (group_name) REFERENCES public.groups(name) ON DELETE CASCADE;


--
-- Name: schedules schedules_semester_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_semester_fkey FOREIGN KEY (semester) REFERENCES public.semesters(id) ON DELETE CASCADE;


--
-- Name: students students_group_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_group_name_fkey FOREIGN KEY (group_name) REFERENCES public.groups(name) ON DELETE CASCADE;


--
-- Name: training_programs training_programs_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.training_programs
    ADD CONSTRAINT training_programs_course_fkey FOREIGN KEY (course) REFERENCES public.courses(id) ON DELETE CASCADE;


--
-- Name: training_programs training_programs_exam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.training_programs
    ADD CONSTRAINT training_programs_exam_fkey FOREIGN KEY (exam) REFERENCES public.exams(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

