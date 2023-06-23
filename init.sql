CREATE TABLE "classrooms" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "created_at" timestamp,
  "class_number" integer UNIQUE NOT NULL,
  "building" varchar
);

CREATE TABLE "courses" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "created_at" timestamp,
  "name" varchar UNIQUE NOT NULL,
  "teacher" varchar,
  "student" varchar,
  "grade" integer
);

CREATE TABLE "curriculums" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "created_at" timestamp,
  "name" varchar UNIQUE NOT NULL,
  "course" varchar,
  "semester" integer,
  "course_duration" integer
);

CREATE TABLE "departments" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" varchar UNIQUE NOT NULL,
  "facult" varchar,
  "created_at" timestamp
);

CREATE TABLE "exams" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "course" varchar,
  "classroom" integer,
  "student" varchar,
  "grade" integer,
  "exam_datetime" timestamp,
  "created_at" timestamp
);

CREATE TABLE "faculties" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" varchar UNIQUE NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "grades" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "grade" integer UNIQUE NOT NULL
);

CREATE TABLE "groups" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" varchar UNIQUE NOT NULL,
  "department" varchar,
  "created_at" timestamp
);

CREATE TABLE "independent_tasks" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "independent_task" varchar UNIQUE NOT NULL,
  "course" varchar,
  "student" varchar,
  "grade" integer,
  "created_at" timestamp
);

CREATE TABLE "schedules" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "schedule" varchar UNIQUE NOT NULL,
  "semester" integer,
  "exam" integer,
  "course" varchar,
  "group_name" varchar,
  "classroom" integer,
  "created_at" timestamp
);

CREATE TABLE "semesters" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "semester" integer UNIQUE NOT NULL,
  "academic_yaer" varchar,
  "created_at" timestamp
);

CREATE TABLE "students" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "full_name" varchar UNIQUE NOT NULL,
  "group_name" varchar,
  "created_at" timestamp
);

CREATE TABLE "buildings" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "address" varchar UNIQUE NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "teachers" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "full_name" varchar UNIQUE NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "training_programs" (
  "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  "name" varchar UNIQUE NOT NULL,
  "course" integer,
  "independent_tasks" varchar UNIQUE,
  "exam" integer
);

ALTER TABLE "classrooms" ADD FOREIGN KEY ("building") REFERENCES "buildings" ("address");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher") REFERENCES "teachers" ("full_name");

ALTER TABLE "courses" ADD FOREIGN KEY ("student") REFERENCES "students" ("full_name");

ALTER TABLE "courses" ADD FOREIGN KEY ("grade") REFERENCES "grades" ("grade");

ALTER TABLE "curriculums" ADD FOREIGN KEY ("course") REFERENCES "courses" ("name");

ALTER TABLE "curriculums" ADD FOREIGN KEY ("semester") REFERENCES "semesters" ("id");

ALTER TABLE "departments" ADD FOREIGN KEY ("facult") REFERENCES "faculties" ("name");

ALTER TABLE "exams" ADD FOREIGN KEY ("course") REFERENCES "courses" ("name");

ALTER TABLE "exams" ADD FOREIGN KEY ("classroom") REFERENCES "classrooms" ("class_number");

ALTER TABLE "exams" ADD FOREIGN KEY ("student") REFERENCES "students" ("full_name");

ALTER TABLE "exams" ADD FOREIGN KEY ("grade") REFERENCES "grades" ("grade");

ALTER TABLE "groups" ADD FOREIGN KEY ("department") REFERENCES "departments" ("name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("course") REFERENCES "courses" ("name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("student") REFERENCES "students" ("full_name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("grade") REFERENCES "grades" ("grade");

ALTER TABLE "schedules" ADD FOREIGN KEY ("semester") REFERENCES "semesters" ("id");

ALTER TABLE "schedules" ADD FOREIGN KEY ("exam") REFERENCES "exams" ("id");

ALTER TABLE "schedules" ADD FOREIGN KEY ("course") REFERENCES "courses" ("name");

ALTER TABLE "schedules" ADD FOREIGN KEY ("group_name") REFERENCES "groups" ("name");

ALTER TABLE "schedules" ADD FOREIGN KEY ("classroom") REFERENCES "classrooms" ("class_number");

ALTER TABLE "students" ADD FOREIGN KEY ("group_name") REFERENCES "groups" ("name");

ALTER TABLE "training_programs" ADD FOREIGN KEY ("course") REFERENCES "courses" ("id");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("independent_task") REFERENCES "training_programs" ("independent_tasks");

ALTER TABLE "training_programs" ADD FOREIGN KEY ("exam") REFERENCES "exams" ("id");
