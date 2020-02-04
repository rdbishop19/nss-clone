import sqlite3
from student import Student

class StudentExerciseReports():

    """Methods for reports on Student Exercises."""

    def __init__(self):
        self.db_path = "/Users/RDB/workspace/python/sql/nss-clone/nss.db"

    def all_students(self):

        """Retrieve all students with the cohort name."""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Student(
                row[0], row[1], row[2], row[3]
            )
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
                print(student)

    def students_per_exercise(self):

        """Print which students are working on which exercises."""

        exercises = dict()

        with sqlite3.connect(self.db_path) as conn:
            db_cursor = conn.cursor()
        
            db_cursor.execute("""
                SELECT
                    firstName, 
                    lastName, 
                    e.name as 'Exercise', 
                    l.name as 'Language'
                FROM exercises e
                JOIN assignments a ON a.exerciseId = e.id
                JOIN students s ON s.id = a.studentId
                JOIN languages l ON l.id = e."language";    
            """)
        
            dataset = db_cursor.fetchall()

            for row in dataset:
                exercise_name = row[2]
                student_name = f'{row[0]} {row[1]}'

                if exercise_name not in exercises:
                    exercises[exercise_name] = []
                exercises[exercise_name].append(student_name)
            
            for exercise_name, students in exercises.items():
                print()
                print(exercise_name)
                print('-'*len(exercise_name))
                for student in students:
                    print(f'  * {student}')

if __name__ == "__main__":
    
    reports = StudentExerciseReports()
    # reports.all_students()
    reports.students_per_exercise()