#  **Система управления университетом**

### *Это система, где учитываются студенты, преподаватели, курсы, группы, отделения университета, оценки и другие соответствующие данные.*

---
## Сиситема содержит следующие сущности:
<br>
Таблицы:

1. `students` - Студенты, обучающиеся в университете
   - ***full_name*** - Полное имя студента
   - ***group_name*** - Название группы, в которой учится студент (связь с таблицей `groups`)
2. `teachers` - Преподавтели
   - ***full_name*** - Полное имя преподавателя
3. `courses` - Курсы(предметы)
   - ***name*** - Название курса(предмета)
   - ***teacher*** - Пераодаватель,который ведет данный предмет (связь с таблицей `teachers`)
   - ***student*** - Студент (связь с таблицей `students`)
   - ***grade*** - Оценка студента по курсу(предмету)
   - ***classroom*** - Аудитория, в которой преподается данный крус
4. `groups` - Учебные группы
    - ***name*** - Название учебной группы
    - ***department*** - Отделение, к которому относится группа
5. `departments` - Отделение(специализация)
      - ***name*** -Название отделения(специализации)
      - ***facult***  - Факультет, к которому относится отделение(специализация)
6. `grades` - Оценки
    - ***grade*** - Оценка
7. `schedules` - Расписания
   - ***schedule*** - Название единицы расписания
   - ***semester*** - Семестр
   - ***exam*** - Эказамен
   - ***course*** - Курс(предмет)
   - ***group_name*** - Название группы
   - ***classroom*** - Аудитория    
8. `buildings` - Здания
   - ***address*** - Номер здания
9.  `classrooms` - Аудитории
    - ***class_number*** - Номер аудитории
    - ***building*** - Номер здания, в котором находится аудитория
10. `semesters` - Семестры
    - ***semester*** - Семестр
    - **academic_yaer** - Учебный год
11. `faculties` - Факультеты
    - ***name*** - Название факультета
12. `exams` - Экзамены
    - ***course*** - Куср(пердмет)
    - ***classroom*** - Аудитория
    - ***student*** - Студент
    - ***grade*** - Оценка
    - ***exam_datetime*** - Дата и время экзамена
13. `independent_tasks` - Задания для самостоятельной работы
    - ***independent_task*** - Задание
    - ***student*** - Студент
    - ***grade*** - Оценка
14. `training_programs` - Программы курса
    - ***name*** - Название программы
    - ***course*** - Курс(предмет)
    - ***independent_tasks*** - Индивидуальные занятия
    - ***exam*** - Экзамен
15. `curriculums` - Учебные планы
    - ***name*** - Название учебного плана
    - ***courses*** - Предметы
    - ***semester*** - Семестр
    - ***course_duration*** - Продолжительность куса

Все таблицы имеют слудющие поля:
  - `id` - ID объекта
  - `created_at` - время создания записи

<br>
<br>
---

## Установка:
<div class="termy">

```console
$ git clone <link>
$ cd university_management_system
$ docker build -t unversity_management_system . && docker compose up
```

</div>

## Интерактивная документация API.

### Swagger

<http://127.0.0.1:8000/docs>

###    Redoc

<http://127.0.0.1:8000/redoc>


## Реализация запрсосв (содержатся в test_queries.sql)

 Выбрать всех студентов, обучающихся на курсе "Математика".

      SELECT students.* FROM courses INNER JOIN students ON name = 'математика' WHERE student = full_name;

Удалить задание для самостоятельной работы, которое было создано более года назад.

      DELETE FROM independent_tasks WHERE created_at < NOW() - INTERVAL '1year';

Добавить новый семестр в учебный год.

      INSERT INTO semesters (semester, academic_yaer) VALUES ('3', '2023');

Выбрать всех преподавателей, которые преподают в здании №3.

      SELECT DISTINCT teachers.* FROM courses INNER JOIN teachers ON classroom IN (SELECT id FROM classrooms WHERE building = '3') WHERE teacher = full_name;

Обновить оценку студента по курсу.

      UPDATE courses SET grade = 3 WHERE name = 'course2' AND student = 'student2';
