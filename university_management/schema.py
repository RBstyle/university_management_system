from datetime import datetime

from pydantic import BaseModel


class BaseStudent(BaseModel):
    full_name: str
    group_name: str


class Student(BaseStudent):
    id: int
    created_at: datetime


class BaseTeacher(BaseModel):
    full_name: str


class Teacher(BaseTeacher):
    id: int
    created_at: datetime


class BaseGrade(BaseModel):
    grade: int


class Grade(BaseGrade):
    id: int
    created_at: datetime


class BaseCourse(BaseModel):
    name: str
    teacher: str
    student: str
    grade: int | None = None


class Course(BaseCourse):
    id: int
    created_at: datetime
