import mysql.connector
from utilities import handle_request
import authentication.credentials as db_credentials
import time

while True:
    try:
        mysql_cnx = mysql.connector.connect(**db_credentials.config)

        cursor = mysql_cnx.cursor(dictionary=True)

        sql_query_get_talend_requests = "SELECT T.template_name, T.template_uuid, TT.os, TT.os_version, \
                                            TT.talend_version, TT.talend_component, TT.jdk_version, TT.jdk_update, \
                                            TT.tomcat_version, U.region, U.firstname, R.username, R.request_uuid \
                                        FROM self_service_db.TEMPLATE T \
                                        INNER JOIN self_service_db.TALEND_TEMPLATE TT ON T.template_uuid = TT.template_uuid \
                                        INNER JOIN self_service_db.REQUEST R ON R.template_uuid = T.template_uuid  \
                                        INNER JOIN self_service_db.USER U ON R.username = U.username \
                                        WHERE R.request_status = 'pending';"

        sql_query_get_db_requests = "SELECT T.template_name, T.template_uuid, DT.os, DT.os_version, DT.db, \
                                            DT.db_version, U.region, U.firstname, R.username, R.request_uuid \
                                      FROM self_service_db.TEMPLATE T \
                                      INNER JOIN self_service_db.DB_TEMPLATE DT ON T.template_uuid = DT.template_uuid \
                                      INNER JOIN self_service_db.REQUEST R ON R.template_uuid = T.template_uuid \
                                      INNER JOIN self_service_db.USER U ON R.username = U.username \
                                      WHERE R.request_status = 'pending';"

    except mysql_cnx.Error as e:
        print(e)

    cursor.execute(sql_query_get_db_requests)
    for request in cursor:
        handle_request.handle_db_request(request)
        # time.sleep(60)

    cursor.execute(sql_query_get_talend_requests)
    for request in cursor:
        handle_request.handle_tal_request(request)
        # time.sleep(60)

    mysql_cnx.close()
    time.sleep(2)




