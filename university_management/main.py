from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool

from config.config import MY_DSN_STRING
from university_management import queries, swagger_vars

app = FastAPI(
    title="Система управления университетом",
    description=swagger_vars.description,
    version="0.0.1",
    openapi_tags=swagger_vars.tags_metadata,
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
    """Получить список всех студентов"""
    return await queries.students_list(app.state.pool)


@app.post("/students/", tags=["students"])
async def post_student(student: queries.BaseStudent):
    """Добавить нового студента"""
    return await queries.add_student(pool=app.state.pool, student=student)


@app.get("/students/{student_id}", tags=["students"])
async def get_student(student_id: int):
    """Получить информацию о студенте по ID"""
    return await queries.get_student(pool=app.state.pool, student_id=student_id)


@app.put("/students/{student_id}", tags=["students"])
async def put_student(student_id: int, student: queries.BaseStudent):
    """Редактировать информацию о студенте"""
    return await queries.put_student(
        pool=app.state.pool, student_id=student_id, student=student
    )


@app.delete("/students/{student_id}", tags=["students"])
async def delete_student(student_id: int):
    """Удалить студента"""
    return await queries.delete_student(pool=app.state.pool, student_id=student_id)


@app.get("/teachers/", tags=["teachers"])
async def get_teachers():
    """Получить списко всех преподавателей"""
    return await queries.teachers_list(app.state.pool)


@app.post("/courses/", tags=["courses"])
async def post_course(course: queries.BaseCourse):
    """Добавить новый курс(предмет)"""
    return await queries.add_course(pool=app.state.pool, course=course)


@app.get("/courses/{course_id}", tags=["courses"])
async def get_course(course_id: int):
    """Получить курс(предмет) по ID"""
    return await queries.get_course_by_id(pool=app.state.pool, course_id=course_id)


@app.get("/courses/{course_id}/students", tags=["courses"])
async def get_students_by_course(course_id: int):
    """Получить список всех студентов, обучающихся по курсу(предмету)"""
    return await queries.students_by_course_list(
        pool=app.state.pool, course_id=course_id
    )


@app.post("/grades/", tags=["grades"])
async def post_grade(grade: queries.BaseGrade):
    """Добавить новую оценку"""
    return await queries.add_grade(pool=app.state.pool, grade=grade)


@app.put("/grades/{grade_id}", tags=["grades"])
async def put_grade(grade_id: int, grade: queries.BaseGrade):
    """Редактировать оценку"""
    return await queries.put_grade(pool=app.state.pool, grade_id=grade_id, grade=grade)
