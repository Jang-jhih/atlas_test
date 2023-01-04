# from pyhive import hive
# conn = hive.Connection(host="localhost", port=1000, username="hive")

# cursor = conn.cursor()
# cursor.execute("SELECT cool_stuff FROM hive_table")
# for result in cursor.fetchall():
#     use_result(result)
  
# import pandas as pd
# df = pd.read_sql("SELECT cool_stuff FROM hive_table", conn)



from pyhive import hive

conn = hive.Connection(host="localhost", port=10000, username="hive")
cursor = conn.cursor()

print(cursor.execute("SHOW DATABASES"))
print(cursor.execute("CREATE DATABASE IF NOT EXISTS userdb"))

conn.close()