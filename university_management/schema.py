from fastapi_views import Serializer
from pydantic import Field
from datetime import datetime


class StudentSchema(Serializer):
    # id: int
    full_name: str
    group_name: str
    # created_at: datetime
