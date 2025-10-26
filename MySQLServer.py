import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password'
        )
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS your_db")
        print("Database created successfully or already exists.")
    except mysql.connector.Error as err:
        print(f"MySQL Error: {err}")
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

def create_table():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password',
            database='your_db'
        )
        cursor = connection.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS students (
                id INT AUTO_INCREMENT PRIMARY KEY,
                name VARCHAR(100),
                age INT
            )
        """)
        print("Table created successfully or already exists.")
    except mysql.connector.Error as err:
        print(f"MySQL Table Error: {err}")
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

def insert_student(name, age):
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password',
            database='your_db'
        )
        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO students (name, age) VALUES (%s, %s)",
            (name, age)
        )
        connection.commit()
        print(f"Student {name} added successfully!")
    except mysql.connector.Error as err:
        print(f"MySQL Insert Error: {err}")
    finally:
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

def main():
    create_database()
    create_table()
    # Example insertion
    insert_student("Alice", 20)
    insert_student("Bob", 22)
    print("All operations completed successfully. ✅")

if __name__ == "__main__":
    main()
