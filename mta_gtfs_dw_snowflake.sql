
-- Create stops_and_times table
CREATE TABLE IF NOT EXISTS GTFS_MTA.stops_and_times(
    trip_id VARCHAR(100),
    stop_id INTEGER,
    arrival_time VARCHAR(50),
    departure_time VARCHAR(50),
    pickup_type INTEGER,
    drop_off_type INTEGER,
    timepoint INTEGER,
    stop_name varchar(100),
    stop_lat FLOAT,
    stop_lon FLOAT,
    stop_sequence INTEGER,
    travel_time FLOAT
);


-- Create trips table
CREATE TABLE IF NOT EXISTS GTFS_MTA.trips (
    trip_id varchar(100),
    route_id varchar(100),
    service_id varchar(100),
    trip_headsign varchar(100),
    direction_id integer,
    block_id integer,
    shape_id varchar(50)
);

-- Create routes table
CREATE TABLE IF NOT EXISTS GTFS_MTA.routes (
    route_id varchar(100),
    route_short_name varchar(100),
    route_long_name varchar(100),
    route_desc varchar(100),
    route_type integer,
    route_color varchar(50)
);

-- Create shapes table
CREATE TABLE IF NOT EXISTS GTFS_MTA.shapes (
    shape_id varchar(100),
    shape_pt_lat float,
    shape_pt_lon float,
    shape_pt_sequence integer
);

-- Create calendar table
CREATE TABLE IF NOT EXISTS GTFS_MTA.calendar (
    service_id varchar(100),
    start_date time,
    end_date time,
    service_schedule varchar(100)
);


-- fix arrival_time to make it follow the 24-hour format for correct time-series visualization

CREATE OR REPLACE VIEW GTFS_MTA.AVG_TRAVEL_TIME_HOURLY AS
SELECT ARRIVAL_TIME,
  CASE 
    WHEN TRY_TO_NUMBER(SPLIT_PART(ARRIVAL_TIME, ':', 1)) >= 24 THEN 
      LPAD(TO_VARCHAR(TRY_TO_NUMBER(SPLIT_PART(ARRIVAL_TIME, ':', 1)) - 24), 2, '0') || ':' ||
      SPLIT_PART(ARRIVAL_TIME, ':', 2) || ':' ||
      SPLIT_PART(ARRIVAL_TIME, ':', 3)
    ELSE
      ARRIVAL_TIME
  END AS FIXED_ARRIVAL_TIME
FROM GTFS_MTA.STOPS_AND_TIMES;
