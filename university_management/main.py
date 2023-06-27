from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool

from config.config import MY_DSN_STRING
from university_management import queries

tags_metadata = [
    {
        "name": "students",
        "description": "Operations with students.",
    },
    {
        "name": "teachers",
        "description": "Operations with teachers.",
    },
    {
        "name": "courses",
        "description": "Operations with courses.",
    },
    {
        "name": "grades",
        "description": "Operations with grades.",
    },
]

description = """
This is a system that takes into account students, teachers, courses, groups, university departments, grades and other data.


## students

You will be able to:

* **Get a list of students**
* **Add new student**
* **Get student by ID**
* **Edit student information**
* **Delete student**


## teachers

You can get a list of teachers.


## courses

You will be able to:

* **Add new course**
* **Get course by ID**
* **Get a list of all students in the course**

## grades

You will be able to:

* **Add new grade**
* **Edit grade**

"""
app = FastAPI(
    title="University management system",
    description=description,
    version="0.0.1",
)


@app.on_event("startup")
def open_pool():
    """create database connection pool"""
    app.state.pool = AsyncConnectionPool(MY_DSN_STRING, max_size=500)


@app.on_event("shutdown")
async def close_pool():
    """close database connection pool"""
    await app.state.pool.close()


@app.get("/", tags=["students"])
async def index():
    """Get a list of students"""
    return await queries.students_list(app.state.pool)


@app.post("/students/", tags=["students"])
async def post_student(student: queries.BaseStudent):
    """Add a new student"""
    return await queries.add_student(pool=app.state.pool, student=student)


@app.get("/students/{student_id}", tags=["students"])
async def get_student(student_id: int):
    """Get a student by ID"""
    return await queries.get_student(pool=app.state.pool, student_id=student_id)


@app.put("/students/{student_id}", tags=["students"])
async def put_student(student_id: int, student: queries.BaseStudent):
    """Edit student information"""
    return await queries.put_student(
        pool=app.state.pool, student_id=student_id, student=student
    )


@app.delete("/students/{student_id}", tags=["students"])
async def delete_student(student_id: int):
    """Delete student"""
    return await queries.delete_student(pool=app.state.pool, student_id=student_id)


@app.get("/teachers/", tags=["teachers"])
async def get_teachers():
    """Get a list of teachers"""
    return await queries.teachers_list(app.state.pool)


@app.post("/courses/", tags=["courses"])
async def post_course(course: queries.BaseCourse):
    """Add new course"""
    return await queries.add_course(pool=app.state.pool, course=course)


@app.get("/courses/{course_id}", tags=["courses"])
async def get_course(course_id: int):
    """Get course by ID"""
    return await queries.get_course_by_id(pool=app.state.pool, course_id=course_id)


@app.get("/courses/{course_id}/students", tags=["courses"])
async def get_students_by_course(course_id: int):
    """Get a list of all students in the course"""
    return await queries.students_by_course_list(
        pool=app.state.pool, course_id=course_id
    )


@app.post("/grades/", tags=["grades"])
async def post_grade(grade: queries.BaseGrade):
    """Add new grade"""
    return await queries.add_grade(pool=app.state.pool, grade=grade)


@app.put("/grades/{grade_id}", tags=["grades"])
async def put_grade(grade_id: int, grade: queries.BaseGrade):
    """Edit grade"""
    return await queries.put_grade(pool=app.state.pool, grade_id=grade_id, grade=grade)
