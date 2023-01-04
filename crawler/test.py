import mysql.connector
from mysql.connector import Error
import os

try:
    if not os.path.exists('/.dockerenv'):
        localhost='localhost'
        database='database'
        user='root'
        password='aaaa'
    else:
        localhost=os.environ.get('localhost')
        database=os.environ.get('database')
        user=os.environ.get('user')
        password=os.environ.get('password')

    connection = mysql.connector.connect(host=localhost,
                                         database=database,
                                         user=user,
                                         password=password)
    if connection.is_connected():
        db_Info = connection.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = connection.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")