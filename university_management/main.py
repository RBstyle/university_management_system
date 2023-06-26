from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool

from config.config import MY_DSN_STRING
from university_management import queries

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
    return await queries.students_list(app.state.pool)


@app.post("/students/")
async def post_students(student: queries.BaseStudent):
    """Add a new student"""
    return await queries.add_student(pool=app.state.pool, student=student)


@app.get("/students/{student_id}")
async def get_student(student_id: int):
    """Get a student by ID"""
    return await queries.get_student(pool=app.state.pool, student_id=student_id)


@app.put("/students/{student_id}")
async def put_student(student_id: int, student: queries.BaseStudent):
    """Edit student information"""
    return await queries.put_student(
        pool=app.state.pool, student_id=student_id, student=student
    )


@app.delete("/students/{student_id}")
async def delete_student(student_id: int):
    """Delete a student"""
    return await queries.delete_student(pool=app.state.pool, student_id=student_id)


@app.get("/teachers/")
async def get_teachers():
    return await queries.teachers_list(app.state.pool)


@app.post("/courses/")
async def post_course(course: queries.BaseCourse):
    return await queries.add_course(pool=app.state.pool, course=course)


@app.get("/courses/{course_id}")
async def get_course(course_id: int):
    return await queries.get_course_by_id(pool=app.state.pool, course_id=course_id)


@app.get("/courses/{course_id}/students")
async def get_students_by_course(course_id: int):
    return await queries.students_by_course_list(
        pool=app.state.pool, course_id=course_id
    )


@app.post("/grades/")
async def post_grade(grade: queries.BaseGrade):
    return await queries.add_grade(pool=app.state.pool, grade=grade)


@app.put("/grades/{grade_id}")
async def put_grade(grade_id: int, grade: queries.BaseGrade):
    return await queries.put_grade(pool=app.state.pool, grade_id=grade_id, grade=grade)
