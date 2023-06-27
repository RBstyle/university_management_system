from psycopg_pool import AsyncConnectionPool
from pydantic import BaseModel, Field
from datetime import datetime
from psycopg.rows import class_row


class BaseStudent(BaseModel):
    full_name: str
    group_name: str


class Student(BaseStudent):
    id: int


class BaseTeacher(BaseModel):
    full_name: str


class Teacher(BaseTeacher):
    id: int


class BaseGrade(BaseModel):
    grade: int


class Grade(BaseGrade):
    id: int


class BaseCourse(BaseModel):
    name: str
    teacher: str
    student: str
    grade: int | None = None


class Course(BaseCourse):
    id: int


async def students_list(pool: AsyncConnectionPool):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return rows


async def add_student(pool: AsyncConnectionPool, student: Student):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(BaseStudent)) as cur:
            await cur.execute(
                "INSERT INTO students (full_name, group_name) VALUES ('{name}', '{group_name}')".format(
                    name=student.full_name,
                    group_name=student.group_name,
                )
            )
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return rows


async def get_student(pool: AsyncConnectionPool, student_id: int):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute(
                "SELECT * FROM students WHERE id = {student_id}".format(
                    student_id=student_id
                )
            )
            rows = await cur.fetchone()
            return rows


async def put_student(pool: AsyncConnectionPool, student_id: int, student: Student):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(BaseStudent)) as cur:
            await cur.execute(
                "UPDATE students SET full_name = '{full_name}', group_name = '{group_name}' WHERE id = {student_id}".format(
                    full_name=student.full_name,
                    group_name=student.group_name,
                    student_id=student_id,
                )
            )
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return rows


async def delete_student(pool: AsyncConnectionPool, student_id: int):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute(
                "DELETE FROM students WHERE id = {student_id}".format(
                    student_id=student_id
                )
            )
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return rows


async def teachers_list(pool: AsyncConnectionPool):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Teacher)) as cur:
            await cur.execute("SELECT * FROM teachers")
            rows = await cur.fetchall()
            return rows


async def add_course(pool: AsyncConnectionPool, course: Course):
    """Didn`t work"""
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(BaseCourse)) as cur:
            await cur.execute(
                "INSERT INTO courses (name, teacher, student, grade) VALUES ('{name}', '{teacher}', '{student}', {grade})".format(
                    name=course.name,
                    teacher=course.teacher,
                    student=course.student,
                    grade=course.grade if course.grade else "null",
                )
            )
            await cur.execute("SELECT * FROM courses")
            rows = await cur.fetchall()
            return rows


async def get_course_by_id(pool: AsyncConnectionPool, course_id: int):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Course)) as cur:
            await cur.execute(
                "SELECT * FROM courses WHERE id = {course_id}".format(
                    course_id=course_id
                )
            )
            rows = await cur.fetchone()
            return rows


async def students_by_course_list(pool: AsyncConnectionPool, course_id: int):
    async with pool.connection() as conn:
        async with conn.cursor() as cur:
            await cur.execute(
                "SELECT student FROM courses WHERE id = {course_id}".format(
                    course_id=course_id
                )
            )
            rows = await cur.fetchall()
            return rows


async def add_grade(pool: AsyncConnectionPool, grade: Grade):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(BaseGrade)) as cur:
            await cur.execute(
                "INSERT INTO grades (grade) VALUES ({grade})".format(
                    grade=grade.grade,
                )
            )
            await cur.execute("SELECT * FROM grades")
            rows = await cur.fetchall()
            return rows


async def put_grade(pool: AsyncConnectionPool, grade_id: int, grade: Grade):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(BaseGrade)) as cur:
            await cur.execute(
                "UPDATE grades SET grade = {grade} WHERE id = {grade_id}".format(
                    grade=grade.grade,
                    grade_id=grade_id,
                )
            )
            await cur.execute("SELECT * FROM grades")
            rows = await cur.fetchall()
            return rows
