
-- Update User Information
/*
data to be updated:
*/
UPDATE ACCOUNTS
SET NAME = 'New Name',
    USERNAME = 'username_new',
    PROFILE_PHOTO_URL = 'url_of_photo',
    UPDATED_AT = SYSTIMESTAMP
WHERE ACCOUNT_ID = :user_id
  AND ACCOUNT_TYPE = 'USER';

--Fetch the Latest Post from a User
SELECT *
FROM POSTS
WHERE USER_ID = :user_id
ORDER BY CREATED_AT DESC
FETCH FIRST 1 ROWS ONLY;


-- Filter Businesses Within 50 KM of a User
/* need to user the Haversine Formula, you can call directly as option 1 or build a function then call it.*/
-- option 1
SELECT B.*, 
       (6371 * ACOS(
           COS(RADIANS(:user_lat)) *
           COS(RADIANS(B.LOCATION_LAT)) *
           COS(RADIANS(B.LOCATION_LNG) - RADIANS(:user_lng)) +
           SIN(RADIANS(:user_lat)) *
           SIN(RADIANS(B.LOCATION_LAT))
       )) AS DISTANCE_KM
FROM BUSINESSES B
HAVING (6371 * ACOS(
           COS(RADIANS(:user_lat)) *
           COS(RADIANS(B.LOCATION_LAT)) *
           COS(RADIANS(B.LOCATION_LNG) - RADIANS(:user_lng)) +
           SIN(RADIANS(:user_lat)) *
           SIN(RADIANS(B.LOCATION_LAT))
       )) <= 50;


-- Option 2 build a function. Then call the function. Better option?
-- One person writes then everyone else can call. Better. Simpler code maintaince easier to read.

CREATE OR REPLACE FUNCTION HAVERSINE_DISTANCE(
  lat1 NUMBER,
  lon1 NUMBER,
  lat2 NUMBER,
  lon2 NUMBER
) RETURN NUMBER DETERMINISTIC IS
  earth_radius_km CONSTANT NUMBER := 6371;
  pi CONSTANT NUMBER := 3.141592653589793;
  delta_lat_rad NUMBER;
  delta_lon_rad NUMBER;
  a NUMBER;
BEGIN
  delta_lat_rad := (lat2 - lat1) * pi / 180;
  delta_lon_rad := (lon2 - lon1) * pi / 180;

  a := SIN(delta_lat_rad / 2) * SIN(delta_lat_rad / 2) +
       COS(lat1 * pi / 180) * COS(lat2 * pi / 180) *
       SIN(delta_lon_rad / 2) * SIN(delta_lon_rad / 2);

  RETURN earth_radius_km * 2 * ATAN2(SQRT(a), SQRT(1 - a));
END;
/


SELECT *
FROM (
  SELECT B.*, HAVERSINE_DISTANCE(:USER_LAT, :USER_LNG, B.LOCATION_LAT, B.LOCATION_LNG) AS DISTANCE_KM
  FROM BUSINESSES B
) 
WHERE DISTANCE_KM <= 50;