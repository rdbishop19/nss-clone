DROP TABLE IF EXISTS students
DROP TABLE IF EXISTS instructors
DROP TABLE IF EXISTS cohorts
DROP TABLE IF EXISTS exercises
DROP TABLE IF EXISTS languages
DROP TABLE IF EXISTS student_roster
DROP TABLE IF EXISTS instructor_roster
DROP TABLE IF EXISTS assignments

CREATE TABLE `students` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `firstName` TEXT NOT NULL,
  `lastName` TEXT NOT NULL,
  `slackHandle` TEXT,
  `cohortId` INTEGER,
  FOREIGN KEY (`cohortId`) REFERENCES `cohorts` (`id`)
);

CREATE TABLE `instructors` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `firstName` TEXT NOT NULL,
  `lastName` TEXT NOT NULL,
  `slackHandle` TEXT,
  `speciality` TEXT
);

CREATE TABLE `cohorts` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL
);

CREATE TABLE `exercises` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `language` INTEGER,
  FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
);

CREATE TABLE `languages` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL
);

CREATE TABLE `student_roster` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `studentId` INTEGER NOT NULL,
  `cohortId` INTEGER NOT NULL,
  FOREIGN KEY (`cohortId`) REFERENCES `cohorts` (`id`),
  FOREIGN KEY (`studentId`) REFERENCES `students` (`id`)
);

CREATE TABLE `instructor_roster` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `instructorId` INTEGER NOT NULL,
  `cohortId` INTEGER NOT NULL,
  FOREIGN KEY (`cohortId`) REFERENCES `cohorts` (`id`),
  FOREIGN KEY (`instructorId`) REFERENCES `instructors` (`id`)
);

CREATE TABLE `assignments` (
  `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `studentId` INTEGER NOT NULL,
  `exerciseId` INTEGER NOT NULL,
  FOREIGN KEY (`exerciseId`) REFERENCES `exercises` (`id`),
  FOREIGN KEY (`studentId`) REFERENCES `students` (`id`)
);



