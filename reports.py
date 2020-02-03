import sqlite3

class StudentExerciseReports():

    """Methods for reports on Student Exercises."""

    def __init__(self):
        self.db_path = "/Users/RDB/workspace/python/sql/nss-clone/nss.db"

    def all_students(self):

        """Retrieve all students with the cohort name."""

        with sqlite3.connect(self.db_path) as conn:
            db_cursor = conn.cursor()

            db_cursor.execute("""
                SELECT
                    s.firstName,
                    s.lastName,
                    s.slackHandle,
                    c.name
                FROM students s
                JOIN cohorts c on c.id = s.cohortId
                ORDER BY s.cohortId            
            """)

            all_students = db_cursor.fetchall()

            for student in all_students:
                print(f'{student[0]} {student[1]} is in {student[3]}.')

reports = StudentExerciseReports()
reports.all_students()