-- Выбрать всех студентов, обучающихся на курсе "Математика".

SELECT students.* FROM courses INNER JOIN students ON name = 'математика' WHERE student = full_name;

-- Удалить задание для самостоятельной работы, которое было создано более года назад.

DELETE FROM independent_tasks WHERE created_at < NOW() - INTERVAL '1year';

-- Добавить новый семестр в учебный год.

INSERT INTO semesters (semester, academic_yaer) VALUES ('3', '2023');

-- Выбрать всех преподавателей, которые преподают в здании №3.

SELECT DISTINCT teachers.* FROM courses INNER JOIN teachers ON classroom IN (SELECT id FROM classrooms WHERE building = '3') WHERE teacher = full_name;

-- Обновить оценку студента по курсу.

UPDATE courses SET grade = 3 WHERE name = 'course2' AND student = 'student2';
