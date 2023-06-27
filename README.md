# university_management_system



# TODO [0/10] План выполнения
- [x] Структура базы данных
- [x] ER диаграмма https://dbdiagram.io/d/6495d77d02bd1c4a5efaac17
- [x] SQL скрипт
- [ ] Краткое описание каждой сущности и ее свойств
- [x] [0/5] Реализация запросов
  - [x] Выбрать всех студентов, обучающихся на курсе "Математика".

        SELECT student FROM courses WHERE name = 'math';

  - [x] Удалить задание для самостоятельной работы, которое было создано более года назад.

        DELETE FROM independent_tasks WHERE created_at < current_timestamp - INTERVAL '1year';

  - [x] Добавить новый семестр в учебный год.

        INSERT INTO "semesters" ("semester", "academic_yaer", "created_at") VALUES ('2', '2023', now());
  
  - [x] Выбрать всех преподавателей, которые преподают в здании №3.

        SELECT teacher FROM courses WHERE classroom IN(SELECT id FROM classrooms WHERE building = '3');

  - [x] Обновить оценку студента по курсу.

        UPDATE "courses" SET "grade" = '4' WHERE "id" = '2';

- [x] Каркас FastAPI приложения
- [x] Соединение FastAPI приложения с БД
- [x] [10/10] Реализация API
  - [x] POST /students - создать нового студента.
  - [x] GET /students/{student_id} - получить информацию о студенте по его id.
  - [x] PUT /students/{student_id} - обновить информацию о студенте по его id.
  - [x] DELETE /students/{student_id} - удалить студента по его id.
  - [x] GET /teachers - получить список всех преподавателей.
  - [x] POST /courses - создать новый курс.
  - [x] GET /courses/{course_id} - получить информацию о курсе по его id.
  - [x] GET /courses/{course_id}/students - получить список всех студентов на курсе.
  - [x] POST /grades - создать новую оценку для студента по курсу.
  - [x] PUT /grades/{grade_id} - обновить оценку студента по курсу.
- [ ] Загрузить на GitHub
- [ ] [0/3] README.md
  - [ ] Описание проекта
  - [ ] Инструкции по установке и запуску вашего приложения
  - [ ] Инструкции по использованию API (swagger?)



#  **University management system**

*This is a system that takes into account students, teachers, courses, groups, university departments, grades and other data.*

## Install:
<div class="termy">

```console
$ Git clone <link>
$ cd university_management_system
$ docker build . && docker compose run -d
```

</div>

## Interactive API documentation and exploration web user interfaces:

<http://127.0.0.1:8000/docs>



