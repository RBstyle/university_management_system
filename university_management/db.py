import databases
import ormar
import sqlalchemy
from typing import Optional, List

from university_management.config import settings

database = databases.Database(settings.db_url)
metadata = sqlalchemy.MetaData()


class BaseMeta(ormar.ModelMeta):
    metadata = metadata
    database = database


class Student(ormar.Model):
    class Meta(BaseMeta):
        tablename = "students"

    id: int = ormar.Integer(primary_key=True)
    full_name: str = ormar.String(max_length=128, unique=True, nullable=False)


class Group(ormar.Model):
    class Meta(BaseMeta):
        tablename = "groups"

    id: int = ormar.Integer(primary_key=True)
    name: str = ormar.String(max_length=100)
    students: Optional[List[Student]] = ormar.ForeignKey(Student)


engine = sqlalchemy.create_engine(settings.db_url)
metadata.create_all(engine)
