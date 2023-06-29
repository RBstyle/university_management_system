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

--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.buildings (id, address, created_at) FROM stdin;
1	3	2023-06-27 15:40:07.966072
2	23	2023-06-27 15:40:07.966072
\.


--
-- Data for Name: classrooms; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.classrooms (id, created_at, class_number, building) FROM stdin;
1	2023-06-27 15:40:07.974717	1	3
2	2023-06-27 15:40:07.974717	2	3
34	2023-06-29 08:21:35.414337	1	23
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.faculties (id, name, created_at) FROM stdin;
1	facult1	2023-06-27 15:40:07.985939
2	facult3	2023-06-27 15:40:07.985939
3	facult2	2023-06-27 15:40:07.985939
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.departments (id, name, facult, created_at) FROM stdin;
1	department1	facult1	2023-06-27 15:40:07.997044
2	department2	facult2	2023-06-27 15:40:07.997044
3	department3	facult3	2023-06-27 15:40:07.997044
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.grades (id, grade, created_at) FROM stdin;
1	4	2023-06-28 10:00:33.891514
2	5	2023-06-28 10:00:33.891514
3	3	2023-06-28 10:00:33.891514
34	2	2023-06-28 10:00:55.628346
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.groups (id, name, department, created_at) FROM stdin;
1	001	department1	2023-06-27 15:40:08.019194
2	002	department2	2023-06-27 15:40:08.019194
3	003	department3	2023-06-27 15:40:08.019194
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.students (id, full_name, group_name, created_at) FROM stdin;
1	student2	001	2023-06-27 15:40:08.030374
2	student3	001	2023-06-27 15:40:08.030374
3	student4	002	2023-06-27 15:40:08.030374
4	student1 edited	001	2023-06-27 15:40:08.030374
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.teachers (id, full_name, created_at) FROM stdin;
1	teacher1	2023-06-27 15:40:08.041371
2	teacher2	2023-06-27 15:40:08.041371
34	teacher3	2023-06-29 08:23:12.376225
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, created_at, name, teacher, student, grade, classroom) FROM stdin;
2	2023-06-27 15:40:08.052467	course2	teacher2	student3	4	1
1	2023-06-27 15:40:08.052467	course1	teacher1	student2	4	34
34	2023-06-29 07:59:30.132784	course2	teacher3	student2	5	2
35	2023-06-29 08:31:17.408975	математика	teacher1	student2	3	1
36	2023-06-29 08:32:08.532641	математика	teacher1	student3	4	1
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.semesters (id, semester, academic_yaer, created_at) FROM stdin;
1	2	2023	2023-06-29 08:26:11.053457
3	1	2023	2023-06-29 08:26:52.614827
\.


--
-- Data for Name: curriculums; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.curriculums (id, created_at, name, courses, semester, course_duration) FROM stdin;
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.exams (id, course, classroom, student, grade, exam_datetime, created_at) FROM stdin;
\.


--
-- Data for Name: independent_tasks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.independent_tasks (id, independent_task, student, grade, created_at) FROM stdin;
1	task1	student2	3	2023-06-29 08:27:54.757617
4	task3	student3	5	2023-06-29 08:28:31.424636
5	task2	student3	5	2021-06-29 08:29:26.02224
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schedules (id, schedule, semester, exam, course, group_name, classroom, created_at) FROM stdin;
\.


--
-- Data for Name: training_programs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.training_programs (id, name, course, independent_tasks, exam, created_at) FROM stdin;
\.


--
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.buildings_id_seq', 33, true);


--
-- Name: classrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.classrooms_id_seq', 34, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.courses_id_seq', 36, true);


--
-- Name: curriculums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.curriculums_id_seq', 1, false);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.departments_id_seq', 33, true);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.exams_id_seq', 1, false);


--
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.faculties_id_seq', 33, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.grades_id_seq', 34, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.groups_id_seq', 33, true);


--
-- Name: independent_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.independent_tasks_id_seq', 5, true);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.semesters_id_seq', 3, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.students_id_seq', 33, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.teachers_id_seq', 34, true);


--
-- Name: training_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.training_programs_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

