from psycopg_pool import AsyncConnectionPool
from pydantic import BaseModel, Field
from datetime import datetime
from psycopg.rows import class_row


class Student(BaseModel):
    # id: int
    full_name: str
    group_name: str
    # created_at: datetime = Field(default_factory=datetime.utcnow)

    class Config:
        default_readable_fields = {"full_neme", "group_name"}


async def students_list(pool: AsyncConnectionPool):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return rows


async def add_student(pool: AsyncConnectionPool, student: Student):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute(
                "INSERT INTO students (full_name, created_at, group_name) VALUES ('{name}', '{created}', '{group_name}')".format(
                    name=student.full_name,
                    created=datetime.now(),
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
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute(
                "UPDATE students SET full_name = '{full_name}', group_name = '{group_name}' WHERE id = {student_id}".format(
                    full_name=student.full_name,
                    group_name=student.group_name,
                    student_id=student_id,
                )
            )
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
