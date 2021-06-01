import mysql.connector

null = None

try:
    connection = mysql.connector.connect(
        host = 'localhost',
        database = 'asdf_db',
        user = 'root',
        password = 'rootroot123'
    )

    query_format = """INSERT INTO places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity)
                        VALUES (%s, %s, %s, %s, %s, %s)"""

    cursor = connection.cursor()

    for i in {1,2,3,4,5}:
        for j in range(1,21):
            if j in range(1,6):
                capacity = 1
            elif j in range(6,11):
                capacity = 2
            elif j in range(11, 16):
                capacity = 3
            else:
                capacity = 4
            for c in {'N','S','E','W'}:
                if c == 'N':
                    c_id = 7
                elif c == 'S':
                    c_id = 8
                elif c == 'E':
                    c_id = 9
                else:
                    c_id = 10
                desc = str(i) + "{0:0=2d}".format(j) + c
                data = (desc, 'SERVICE', str(i+1), str(c_id), str(2), str(capacity))
                cursor.execute(query_format, data)
                connection.commit()

    print("all inserts done")


except mysql.connector.Error as error:
    print("Failed to insert record into MySQL table {}".format(error))

finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("done")
