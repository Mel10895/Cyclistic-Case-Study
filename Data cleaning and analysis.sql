
CREATE TABLE tripdata
(
	ride_id nvarchar(255) NULL,
	rideable_type nvarchar(50) NULL,
	started_at datetime2 NULL,
	ended_at datetime2 NULL,
	member_casual nvarchar(50) NULL,
	day_of_week nvarchar(50) NULL,
	month nvarchar(50) NULL
) 

INSERT INTO tripdata SELECT * from Jan
INSERT INTO tripdata SELECT * FROM Feb;
INSERT INTO tripdata SELECT * FROM Mar;
INSERT INTO tripdata SELECT * FROM Apr;
INSERT INTO tripdata SELECT * FROM May;
INSERT INTO tripdata SELECT * FROM Jun;
INSERT INTO tripdata SELECT * FROM Jul;
INSERT INTO tripdata SELECT * FROM Aug;
INSERT INTO tripdata SELECT * FROM Sep;
INSERT INTO tripdata SELECT * FROM Oct;
INSERT INTO tripdata SELECT * FROM Nov;
INSERT INTO tripdata SELECT * FROM Dec;


select * from tripdata -- 5597025 rows


select *, 
datediff(minute, started_at, ended_at) as ride_length
into tripdata_cleaned 
from tripdata
where datediff(minute, started_at, ended_at) > 0
and datediff(hour, started_at, ended_at) < 24


select * from tripdata_cleaned -- 5512604 rows


select member_casual,
count(*) as total_rides,
avg(ride_length) as Avg_ride_length,
max(ride_length) as max_ride_length,
min(ride_length) as min_ride_length
from tripdata_cleaned
group by member_casual


select 
member_casual,
day_of_week,
COUNT(*) as total_rides,
AVG(ride_length) as avg_ride_minutes
FROM tripdata_cleaned
GROUP BY member_casual, day_of_week
ORDER BY member_casual,
         CASE day_of_week
            WHEN 'Monday' THEN 1
            WHEN 'Tuesday' THEN 2
            WHEN 'Wednesday' THEN 3
            WHEN 'Thursday' THEN 4
            WHEN 'Friday' THEN 5
            WHEN 'Saturday' THEN 6
            WHEN 'Sunday' THEN 7
         END;
   
SELECT 
member_casual, 
month,
COUNT(*) as total_rides,
AVG(ride_length) as avg_ride_minutes
FROM tripdata_cleaned
GROUP BY member_casual, month
ORDER BY member_casual,
         CASE month
            WHEN 'January' THEN 1
            WHEN 'February' THEN 2
            WHEN 'March' THEN 3
            WHEN 'April' THEN 4
            WHEN 'May' THEN 5
            WHEN 'June' THEN 6
            WHEN 'July' THEN 7
			WHEN 'August' THEN 8
			WHEN 'September' THEN 9
			WHEN 'October' THEN 10
			WHEN 'November' THEN 11
			WHEN 'December' THEN 12
         END;


select member_casual,
count(*) as total_rides,
rideable_type
from tripdata_cleaned
group by member_casual, rideable_type
order by member_casual, rideable_type desc

