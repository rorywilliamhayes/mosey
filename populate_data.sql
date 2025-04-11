-- new accounts
INSERT INTO ACCOUNTS (ACCOUNT_TYPE, ACCOUNT_NAME, ACCOUNT_USERNAME, ACCOUNT_PHOTO_URL, ACCOUNT_BIO)
VALUES ('USER', 'Luke Skywalker', 'luke_skywalker', 'https://example.com/photos/luke.jpg', 'Food enthusiast from Tantooine.');

INSERT INTO ACCOUNTS (ACCOUNT_TYPE, ACCOUNT_NAME, ACCOUNT_USERNAME, ACCOUNT_PHOTO_URL, ACCOUNT_BIO)
VALUES ('USER', 'Han Solo', 'han_solo', 'https://example.com/photos/han.jpg', 'Loves exploring new cuisines.');

-- Insert sample businesses
INSERT INTO ACCOUNTS (ACCOUNT_TYPE, ACCOUNT_NAME, ACCOUNT_USERNAME, ACCOUNT_PHOTO_URL, ACCOUNT_BIO)
VALUES ('BUSINESS', 'Tatooine Cantina', 'tatooine_cantina', 'https://example.com/photos/cantina.jpg', 'Best food in tatooine.');

INSERT INTO ACCOUNTS (ACCOUNT_TYPE, ACCOUNT_NAME, ACCOUNT_USERNAME, ACCOUNT_PHOTO_URL, ACCOUNT_BIO)
VALUES ('BUSINESS', 'Dexter Jettster Diner', 'jettster_diner', 'https://example.com/photos/diner.jpg', 'Best food in coruscant.');


-- insert into users 
INSERT INTO USERS (ACCOUNT_ID, USER_LOCATION_LAT, USER_LOCATION_LNG)
VALUES (1, 51.8985, -8.4756); -- tatooine

INSERT INTO USERS (ACCOUNT_ID, USER_LOCATION_LAT, USER_LOCATION_LNG)
VALUES (2, 53.3498, -6.2603); -- coruscant

-- add into buiness
INSERT INTO BUSINESSES (ACCOUNT_ID, BUSINESS_ADDRESS, LOCATION_LAT, LOCATION_LNG, FOOD_TYPE, STAFF_RECOMMENDATIONS)
VALUES (3, 'tatooine', 51.8985, -8.4756, 'spice', 'Try the spice.');

INSERT INTO BUSINESSES (ACCOUNT_ID, BUSINESS_ADDRESS, LOCATION_LAT, LOCATION_LNG, FOOD_TYPE, STAFF_RECOMMENDATIONS)
VALUES (4, 'coruscant', 53.3498, -6.2603, 'Coruscant Cuisine', 'Our best cereal.');

-- add POSTS
-- Luke posts about tatooine
INSERT INTO POSTS (USER_ID, BUSINESS_ID, CAPTION)
VALUES (1, 3, 'my frienc shot a guy');
-- Han posts about diner
INSERT INTO POSTS (USER_ID, BUSINESS_ID, CAPTION)
VALUES (2, 4, 'Greasy diner');

--add POST_LIKES
-- Luke likes Han's post
INSERT INTO POST_LIKES (USER_ID, POST_ID)
VALUES (2, 1);
-- Han likes Luke's post
INSERT INTO POST_LIKES (USER_ID, POST_ID)
VALUES (1, 2);

-- add POST_RATINGS
-- Luke rates Han's post
INSERT INTO POST_RATINGS (USER_ID, POST_ID, RATING)
VALUES (2, 1, 8.5);
-- Han rates Luke's post
INSERT INTO POST_RATINGS (USER_ID, POST_ID, RATING)
VALUES (1, 2, 9.0);

-- add 
-- Image for Luke's post
INSERT INTO POST_IMAGES (POST_ID, POST_IMAGE_URL)
VALUES (1, 'https://example.com/images/luke_post.jpg');

-- Image for Han's post
INSERT INTO POST_IMAGES (POST_ID, POST_IMAGE_URL)
VALUES (2, 'https://example.com/images/han_post.jpg');

--COMMIT THE DATA TO BE ADDED.
COMMIT;