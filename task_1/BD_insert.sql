-- Заполнение таблицы Users
INSERT INTO Users (username, password, role)
SELECT 'user' || generate_series, 'password', 'role' FROM generate_series(1, 100);

-- Заполнение таблицы Students
INSERT INTO Students (user_id, group_id)
SELECT user_id, generate_uuid() FROM Users;

-- Заполнение таблицы Teachers
INSERT INTO Teachers (user_id)
SELECT user_id FROM Users WHERE role = 'role';

-- Заполнение таблицы Groups
INSERT INTO Groups (group_name)
SELECT 'group' || generate_series FROM generate_series(1, 10);

-- Заполнение таблицы Subjects
INSERT INTO Subjects (subject_name)
SELECT 'subject' || generate_series FROM generate_series(1, 10);

-- Заполнение таблицы Assignments
INSERT INTO Assignments (subject_id, teacher_id, deadline)
SELECT subject_id, teacher_id, current_date + generate_series * INTERVAL '1 day'
FROM generate_series(1, 100) gs
JOIN Subjects ON gs <= 10
JOIN Teachers ON gs <= 10;

-- Заполнение таблицы StudentAssignments
INSERT INTO StudentAssignments (student_id, assignment_id)
SELECT student_id, assignment_id FROM generate_series(1, 100) gs
JOIN Students ON gs <= 10
JOIN Assignments ON gs <= 10;

-- Заполнение таблицы TeacherGroups
INSERT INTO TeacherGroups (teacher_id, group_id)
SELECT teacher_id, group_id FROM generate_series(1, 100) gs
JOIN Teachers ON gs <= 10
JOIN Groups ON gs <= 10;
