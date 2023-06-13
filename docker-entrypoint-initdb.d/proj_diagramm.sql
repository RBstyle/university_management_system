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
  "group_name" varchar,
  "course" varchar,
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
  "full_name" varchar,
  "group" varchar,
  "created_at" timestamp
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

ALTER TABLE "courses" ADD FOREIGN KEY ("department") REFERENCES "departments" ("department_name");

ALTER TABLE "departments" ADD FOREIGN KEY ("facult") REFERENCES "faculties" ("facult_name");

ALTER TABLE "exams" ADD FOREIGN KEY ("classroom") REFERENCES "classrooms" ("class_number");

ALTER TABLE "exams" ADD FOREIGN KEY ("buliding") REFERENCES "buildings" ("address");

ALTER TABLE "exams" ADD FOREIGN KEY ("teacher") REFERENCES "teachers" ("full_name");

ALTER TABLE "exams" ADD FOREIGN KEY ("student") REFERENCES "students" ("full_name");

ALTER TABLE "exams" ADD FOREIGN KEY ("grade") REFERENCES "grades" ("grade");

ALTER TABLE "groups" ADD FOREIGN KEY ("course") REFERENCES "courses" ("course_name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("classroom") REFERENCES "classrooms" ("class_number");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("buliding") REFERENCES "buildings" ("address");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("teacher") REFERENCES "teachers" ("full_name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("student") REFERENCES "students" ("full_name");

ALTER TABLE "independent_tasks" ADD FOREIGN KEY ("grade") REFERENCES "grades" ("grade");

ALTER TABLE "schedules" ADD FOREIGN KEY ("semester") REFERENCES "semesters" ("semester");

ALTER TABLE "schedules" ADD FOREIGN KEY ("group") REFERENCES "groups" ("group_name");

ALTER TABLE "schedules" ADD FOREIGN KEY ("exam") REFERENCES "exams" ("subject");

ALTER TABLE "semesters" ADD FOREIGN KEY ("training_program") REFERENCES "training_programs" ("training_program");

ALTER TABLE "students" ADD FOREIGN KEY ("group") REFERENCES "groups" ("group_name");

ALTER TABLE "training_programs" ADD FOREIGN KEY ("curriculum") REFERENCES "curriculums" ("curriculum_name");
