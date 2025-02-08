-- Enable the uuid-ossp extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create the "Users" table
CREATE TABLE Users (
  user_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL
);

-- Create the "Students" table
CREATE TABLE Students (
  student_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES Users(user_id),
  group_id UUID NOT NULL
);

-- Create the "Teachers" table
CREATE TABLE Teachers (
  teacher_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES Users(user_id)
);

-- Create the "Groups" table
CREATE TABLE Groups (
  group_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  group_name VARCHAR(255) NOT NULL
);

-- Create the "Subjects" table
CREATE TABLE Subjects (
  subject_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  subject_name VARCHAR(255) NOT NULL
);

-- Create the "Assignments" table
CREATE TABLE Assignments (
  assignment_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  subject_id UUID REFERENCES Subjects(subject_id),
  teacher_id UUID REFERENCES Teachers(teacher_id),
  deadline DATE NOT NULL
);

-- Create the "StudentAssignments" table
CREATE TABLE StudentAssignments (
  student_assignment_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  student_id UUID REFERENCES Students(student_id),
  assignment_id UUID REFERENCES Assignments(assignment_id)
);

-- Create the "TeacherGroups" table
CREATE TABLE TeacherGroups (
  teacher_group_id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  teacher_id UUID REFERENCES Teachers(teacher_id),
  group_id UUID REFERENCES Groups(group_id)
);