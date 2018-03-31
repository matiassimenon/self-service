import mysql.connector
from utilities import handle_request
import authentication.credentials as db_credentials

mysql_cnx = mysql.connector.connect(**db_credentials.config)

cursor = mysql_cnx.cursor(dictionary=True)

sql_query_get_requests = "SELECT T.template_name, T.os, T.os_version, T.talend_version, T.talend_component, T.jdk_version, T.jdk_update, T.tomcat_version, R.username, U.region, U.firstname , R.request_uuid " \
            "FROM self_service_db.TEMPLATE T " \
            "INNER JOIN self_service_db.REQUEST R ON R.template_uuid = T.template_uuid " \
            "INNER JOIN self_service_db.USER U ON R.username = U.username " \
            "WHERE R.request_status='pending' "

cursor.execute(sql_query_get_requests)
for request in cursor:
    # print(request)
    handle_request.handle_request(request)












