from fastapi import FastAPI
from university_management.db import database, Student, Group

app = FastAPI()


@app.get("/")
async def read_root():
    return await Student.objects.all()


@app.on_event("startup")
async def startup():
    if not database.is_connected:
        await database.connect()
    # create a dummy entry
    await Student.objects.get_or_create(full_name="test user")
    stud = await Student.objects.get(full_name="test user")
    await Group.objects.get_or_create(name="test group", students=stud)


@app.on_event("shutdown")
async def shutdown():
    if database.is_connected:
        await database.disconnect()
