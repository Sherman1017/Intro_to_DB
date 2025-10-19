#!/usr/bin/python3
"""
A Python script to insert sample data into the 'books' table.
"""

import MySQLdb
from MySQLdb import Error

connection = None

try:
    connection = MySQLdb.connect(
        host="localhost",
        user="root",
        passwd="root",
        database="alx_book_store"
    )
    cursor = connection.cursor()

    # Insert sample data
    insert_query = """
    INSERT INTO books (title, author, price)
    VALUES
        ('Think and Grow Rich', 'Napoleon Hill', 12.99),
        ('Rich Dad Poor Dad', 'Robert Kiyosaki', 15.50),
        ('The Alchemist', 'Paulo Coelho', 10.75);
    """
    cursor.execute(insert_query)
    connection.commit()
    print("✅ Sample data inserted into 'books' table!")

except Error as e:
    print(f"❌ Error: {e}")

finally:
    if connection is not None:
        cursor.close()
        connection.close()



