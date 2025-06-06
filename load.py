from snowflake.connector.pandas_tools import pd_writer

# establishing connection to snowflake DataWarehouse
user = ''
password = ''
account = ''
database = ''
schema = ''
warehouse = ''
role = ''

engine = create_engine(
    f'snowflake://{user}:{password}@{account}/{database}/{schema}?warehouse={warehouse}&role={role}'
)

# uppercase columns to match the database schema
stops_and_times.columns = [col.upper() for col in stops_and_times.columns]
# uploading data to snowflake schema
stops_and_times.to_sql('stops_and_times', con = engine, index=False, if_exists='replace', method=pd_writer, chunksize=10000)

# uppercase columns to match the database schema
trips.columns = [col.upper() for col in trips.columns]
# uploading data to snowflake schema
trips.to_sql('trips', con = engine, index=False, if_exists='replace', method=pd_writer, chunksize=10000)

# uppercase columns to match the database schema
routes.columns = [col.upper() for col in routes.columns]
# uploading data to snowflake schema
routes.to_sql('routes', con = engine, index=False, if_exists='replace', method=pd_writer, chunksize=10000)

# uppercase columns to match the database schema
shapes.columns = [col.upper() for col in shapes.columns]
# uploading data to snowflake schema
shapes.to_sql('shapes', con = engine, index=False, if_exists='replace', method=pd_writer, chunksize=10000)

# uppercase columns to match the database schema
calendar.columns = [col.upper() for col in calendar.columns]
# uploading data to snowflake schema
calendar.to_sql('calendar', con = engine, index=False, if_exists='replace', method=pd_writer, chunksize=10000)