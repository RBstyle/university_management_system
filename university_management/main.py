from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool
import uvicorn

from config.config import MY_DSN_STRING
from university_management.queries import students_list, Student, add_student

app = FastAPI()

@app.on_event("startup")
def open_pool():
    """create database connection pool"""
    app.state.pool = AsyncConnectionPool(MY_DSN_STRING, max_size=500)

@app.on_event("shutdown")
async def close_pool():
    """close database connection pool"""
    await app.state.pool.close()

@app.get("/")
async def index():
    return await students_list(app.state.pool)

@app.post("/students/")
async def post_students(student: Student):
    return await add_student(pool=app.state.pool, student=student)

@app.get("/students/{student_id}")
async def get_student(student_id: int):
    return student_id

@app.put("/students/{student_id}")
async def put_student(student_id: int):
    return student_id

@app.delete("/students/{student_id}")
async def delete_student(student_id: int):
    return student_id

@app.get("/teachers/")
async def get_teachers():
    pass

@app.post("/courses/")
async def post_course():
    pass

@app.get("/courses/{course_id}")
async def get_course():
    pass

@app.get("/courses/{course_id}/students")
async def get_students_by_course():
    pass

@app.post("/grades/")
async def post_grade():
    pass

@app.put("/grades/{grade_id}")
async def put_grade():
    pass


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)