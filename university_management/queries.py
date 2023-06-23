from psycopg_pool import AsyncConnectionPool
from pydantic import BaseModel
from datetime import datetime
from psycopg.rows import class_row


class Student(BaseModel):
    full_name: str
    group_name: str
        
async def students_list(pool: AsyncConnectionPool):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return {"students": rows}
        

async def add_student(pool: AsyncConnectionPool, student: Student):
    async with pool.connection() as conn:
        async with conn.cursor(row_factory=class_row(Student)) as cur:
            await cur.execute("INSERT INTO students (full_name, created_at, group_name) VALUES ('{name}', '{created}', '{group_name}')".format(
                name=student.full_name,
                created=datetime.now(),
                group_name=student.group_name                
                ))
            await cur.execute("SELECT * FROM students")
            rows = await cur.fetchall()
            return {"students": rows}