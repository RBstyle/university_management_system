from typing import Optional
from uuid import UUID

from fastapi_views import ViewRouter
from fastapi_views.views.viewsets import AsyncAPIViewSet

from university_management.schema import StudentSchema


items = {}


class MyViewSet(AsyncAPIViewSet):
    api_component_name = "Student"
    serializer = StudentSchema

    async def list(self):
        return list(items.values())

    async def create(self, item: StudentSchema) -> StudentSchema:
        items[item.id] = item
        return item

    async def retrieve(self, id: UUID) -> Optional[StudentSchema]:
        return items.get(id)

    async def update(self, item: StudentSchema):
        items[item.id] = item

    async def destroy(self, id: UUID) -> None:
        items.pop(id, None)


router = ViewRouter(prefix="/items")
router.register_view(MyViewSet)
