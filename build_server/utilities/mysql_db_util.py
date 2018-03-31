import mysql.connector
from collections import OrderedDict


class MySqlConnection (object):
    __instance = None
    __host = None
    __user = None
    __password = None
    __database = None
    __session = None
    __connection = None

    # Constructor - creating an object
    def __new__(cls, *args, **kwargs):
        if not cls.__instance or not cls.__database:
            cls.__instance = super(MySqlConnection, cls).__new__(cls)
        return cls.__instance

    # Initializer - initializing an object, no return
    def __init__(self, host='localhost', user='root', password='', database=''):
        self.__host = host
        self.__user = user
        self.__password = password
        self.__database = database

    # Open a connection
    def __open(self):
        try:
            cnx = mysql.connector.connect(self.__host, self.__user, self.__password, self.__database)
            self.__connection = cnx
            self.__session = cnx.cursor()
        except mysql.connector .Error as e:
            print("Error %d: %s" % (e.args[0], e.args[1]))

    # Close a connection
    def __close(self):
        self.__session.close()
        self.__connection.close()

    # conditional_query = 'id_sub_team = %s '
    # select('customer_success', conditional_query, 'id_organization', 'id_team', id_sub_team='support')
    def select(self, table, conditional_query=None, *columns, **kwargs):
        query = 'SELECT '
        keys = columns
        values = tuple(kwargs.values())
        length_keys = len(keys) - 1

        for i, key in enumerate(keys):
            query += "`" + key + "`"
            if i < length_keys:
                query += ","

        query += 'FROM %s' % table

        if conditional_query:
            query += " WHERE %s" % conditional_query

        self.__open()
        self.__session.execute(query, values)
        number_rows = self.__session.rowcount
        number_columns = len(self.__session.description)

        if number_rows >= 1 and number_columns > 1:
            result = [item for item in self.__session.fetchall()]
        else:
            result = [item[0] for item in self.__session.fetchall()]
        self.__close()
        return result

    def select_requests(self):
        self.cursor(dictionary=True)

        sql_query = "SELECT template_name, os, os_version, talend_version, talend_component, jdk_version, jdk_update, tomcat_version " \
                    "FROM self_service_db.TEMPLATE T " \
                    "INNER JOIN self_service_db.REQUEST R ON R.template_uuid = T.template_uuid " \
                    "WHERE R.request_status='pending' "

        return self.cursor.execute(sql_query)

    def insert(self, table, *columns, **kwargs):
        values = None
        query = "INSERT INTO %s " % table
        if kwargs:
            keys = kwargs.keys()
            values = tuple(kwargs.values())
            query += "(" + ",".join(["`%s`"] * len(keys)) % tuple(keys) + ") VALUES (" + ",".join(
                ["%s"] * len(values)) + ")"
        elif columns:
            values = columns
            query += " VALUES(" + ",".join(["%s"] * len(values)) + ")"

        self.__open()
        self.__session.execute(query, values)
        self.__connection.commit()
        self.__close()
        return self.__session.lastrowid

    def update(self, table, conditional_query=None, *args, **kwargs):
        query = "UPDATE %s SET " % table
        keys = kwargs.keys()
        values = tuple(kwargs.values()) + tuple(args)
        l = len(keys) - 1
        for i, key in enumerate(keys):
            query += "`" + key + "` = %s"
            if i < l:
                query += ","

        query += " WHERE %s" % conditional_query

        self.__open()
        self.__session.execute(query, values)
        self.__connection.commit()

        # Obtain rows affected
        update_rows = self.__session.rowcount
        self.__close()
        return update_rows

    # sql_query = 'SELECT C.version FROM components C WHERE C.component_version = %s AND C.component_year = %s'
    # result = connect_mysql.select_advanced(sql_query, ('component_version', '7.0.1'), ('component_year', '2018'))
    def select_advanced(self, sql_query, *args):
        od = OrderedDict(args)
        query = sql_query
        values = tuple(od.values())
        self.__open()
        self.__session.execute(query, values)
        number_rows = self.__session.rowcount
        number_columns = len(self.__session.description)

        if number_rows >= 1 and number_columns > 1:
            result = [item for item in self.__session.fetchall()]
        else:
            result = [item[0] for item in self.__session.fetchall()]

        self.__close()
        return result
