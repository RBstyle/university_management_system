CREATE TABLE "classrooms" (
  "id" integer PRIMARY KEY,
  "class_number" integer UNIQUE NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "courses" (
  "id" integer PRIMARY KEY,
  "course_name" varchar,
  "department" varchar,
  "created_at" timestamp
);

CREATE TABLE "curriculums" (
  "id" integer PRIMARY KEY,
  "curriculum_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "departments" (
  "id" integer PRIMARY KEY,
  "department_name" varchar,
  "facult" varchar,
  "created_at" timestamp
);

CREATE TABLE "exams" (
  "id" integer PRIMARY KEY,
  "subject" varchar,
  "classroom" integer,
  "buliding" varchar,
  "teacher" varchar,
  "student" varchar,
  "grade" integer,
  "created_at" timestamp
);

CREATE TABLE "faculties" (
  "id" integer PRIMARY KEY,
  "facult_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "grades" (
  "id" integer PRIMARY KEY,
  "grade" integer,
  "created_at" timestamp
);

CREATE TABLE "groups" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "students" integer,
  "created_at" timestamp
);

CREATE TABLE "independent_tasks" (
  "id" integer PRIMARY KEY,
  "independent_task" varchar,
  "classroom" integer,
  "buliding" varchar,
  "teacher" varchar,
  "student" varchar,
  "grade" integer,
  "created_at" timestamp
);

CREATE TABLE "schedules" (
  "id" integer PRIMARY KEY,
  "schedule" varchar,
  "semester" integer,
  "group" varchar,
  "exam" varchar,
  "created_at" timestamp
);

CREATE TABLE "semesters" (
  "id" integer PRIMARY KEY,
  "semester" integer,
  "training_program" varchar,
  "created_at" timestamp
);

CREATE TABLE "students" (
  "id" integer PRIMARY KEY,
  "full_name" varchar
);

CREATE TABLE "buildings" (
  "id" integer PRIMARY KEY,
  "address" varchar,
  "created_at" timestamp
);

CREATE TABLE "teachers" (
  "id" integer PRIMARY KEY,
  "full_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "training_programs" (
  "id" integer PRIMARY KEY,
  "training_program" varchar,
  "curriculum" varchar,
  "created_at" timestamp
);



ALTER TABLE "students" ADD FOREIGN KEY ("group") REFERENCES "groups" ("name");