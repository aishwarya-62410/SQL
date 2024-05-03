CREATE DATABASE social_media;

use social_media;

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    date_joined DATE
);

-- Create Posts table
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Comments table
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    comment_date DATE,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Likes table
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    like_date DATE,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Followers table
CREATE TABLE Followers (
    follower_id INT PRIMARY KEY,
    follower_user_id INT,
    following_user_id INT,
    follow_date DATE,
    FOREIGN KEY (follower_user_id) REFERENCES Users(user_id),
    FOREIGN KEY (following_user_id) REFERENCES Users(user_id)
);

-- Instert data in Users table.
INSERT INTO Users (user_id, username, email, date_joined)
VALUES
    (1, 'rahul62', 'rahul@gmail.com', '2023-01-01'),
    (2, 'sanju26', 'sanju@gmail.com', '2023-02-15'),
    (3, 'reebha59', 'reebha@gmail.com', '2023-03-20'),
    (4, 'suman43', 'suman@gmail.com', '2023-04-10'),
    (5, 'shubham23', 'shubham@gmail.com', '2023-05-05'),
    (6, 'silpi1997', 'silpi@gmail.com', '2023-06-12'),
    (7, 'vidushi09', 'vidushi@gmail.com', '2023-07-18'),
    (8, 'manisha45', 'manisha@gmail.com', '2023-08-23'),
    (9, 'chahak56', 'chahak@gmail.com', '2023-09-30'),
    (10, 'preeti78', 'preeti@gmail.com', '2023-10-05'),
    (11, 'kriti90', 'kriti@gmail.com', '2023-11-11'),
    (12, 'aurav45', 'aurav@gmail.com', '2023-12-14'),
    (13, 'kaushal23', 'kaushal@gmail.com', '2024-01-20'),
    (14, 'gunjan45', 'gunjan@gmail.com', '2024-02-25'),
    (15, 'saurav56', 'saurav@gmail.com', '2024-03-30'),
    (16, 'sima12', 'sima@gmail.com', '2024-04-05'),
    (17, 'mamta87', 'mamta@gmail.com', '2024-05-10'),
    (18, 'ritu12', 'ritu@gmail.com', '2024-06-15'),
    (19, 'kriti23', 'kriti@gmail.com', '2024-07-20'),
    (20, 'rahul45', 'rahul@gmail.com', '2024-08-25');

-- Instert data in post table.
INSERT INTO Posts (post_id, user_id, content, post_date)
VALUES
    (1, 1, 'Excited to join this social network!', '2023-01-02'),
    (2, 2, 'Just posted my first photo!', '2023-02-16'),
    (3, 3, 'Feeling inspired today.', '2023-03-21'),
    (4, 4, 'Happy Friday everyone!', '2023-04-11'),
    (5, 5, 'Enjoying the weekend vibes.', '2023-05-06'),
    (6, 1, 'Loving the weather today!', '2023-06-15'),
    (7, 2, 'New recipe alert!', '2023-07-20'),
    (8, 3, 'Excited for my upcoming trip!', '2023-08-25'),
    (9, 4, 'Movie night with friends!', '2023-09-30'),
    (10, 5, 'Reflecting on the week.', '2023-10-05'),
    (11, 1, 'Ready for the holidays!', '2023-11-10'),
    (12, 2, 'Exploring new hobbies.', '2023-12-15'),
    (13, 3, 'Productivity tips for the week.', '2024-01-20'),
    (14, 4, 'Fitness journey update.', '2024-02-25'),
    (15, 5, 'Weekend getaway adventures.', '2024-03-30'),
    (16, 1, 'Trying out new restaurants.', '2024-04-05'),
    (17, 2, 'Book recommendations.', '2024-05-10'),
    (18, 3, 'DIY home improvement projects.', '2024-06-15'),
    (19, 4, 'Music festival memories.', '2024-07-20'),
    (20, 5, 'Reflecting on personal growth.', '2024-08-25');

-- Instert data in Comments table.
INSERT INTO Comments (comment_id, post_id, user_id, comment_text, comment_date)
VALUES
    (1, 1, 2, 'Welcome to the platform!', '2023-01-03'),
    (2, 2, 1, 'Great photo!', '2023-02-17'),
    (3, 3, 4, 'Keep up the good work!', '2023-03-22'),
    (4, 4, 3, 'Happy Friday to you too!', '2023-04-12'),
    (5, 2, 2, 'Have a fantastic weekend!', '2023-05-07'),
    (6, 3, 3, 'I love the weather too!', '2023-06-16'),
    (7, 4, 4, 'Can\'t wait to try it!', '2023-07-21'),
    (8, 5, 5, 'Where are you going?', '2023-08-26'),
    (9, 1, 1, 'Sounds fun!', '2023-10-01'),
    (10, 2, 2, 'Reflecting is important.', '2023-10-06'),
    (11, 3, 3, 'Holidays are the best!', '2023-11-11'),
    (12, 4, 4, 'What hobbies?', '2023-12-16'),
    (13, 5, 5, 'Share your tips!', '2024-01-21'),
    (14, 1, 1, 'Keep going!', '2024-02-26'),
    (15, 2, 2, 'Tell us more!', '2024-03-31'),
    (16, 3, 3, 'Any recommendations?', '2024-04-06'),
    (17, 4, 4, 'I need book ideas.', '2024-05-11'),
    (18, 5, 5, 'Show us your projects!', '2024-06-16'),
    (19, 1, 1, 'Share your memories!', '2024-07-21'),
    (20, 2, 2, 'Keep growing!', '2024-08-26');

-- Instert data in Likes table.
INSERT INTO Likes (like_id, post_id, user_id, like_date)
VALUES
    (1, 1, 3, '2023-01-04'),
    (2, 2, 4, '2023-02-18'),
    (3, 3, 5, '2023-03-23'),
    (4, 4, 1, '2023-04-13'),
    (5, 5, 3, '2023-05-08'),
    (6, 6, 2, '2023-06-17'),
    (7, 7, 1, '2023-07-22'),
    (8, 8, 5, '2023-08-27'),
    (9, 9, 4, '2023-09-16'),
    (10, 10, 3, '2023-10-21'),
    (11, 11, 2, '2023-11-26'),
    (12, 12, 1, '2023-12-31'),
    (13, 13, 5, '2024-01-11'),
    (14, 14, 4, '2024-02-15'),
    (15, 15, 3, '2024-03-20'),
    (16, 16, 2, '2024-04-25'),
    (17, 17, 1, '2024-05-30'),
    (18, 18, 5, '2024-06-04'),
    (19, 19, 4, '2024-07-09'),
    (20, 20, 3, '2024-08-14');

-- Instert data in Followers table.
INSERT INTO Followers (follower_id, follower_user_id, following_user_id, follow_date)
VALUES
    (1, 2, 1, '2023-01-05'),
    (2, 3, 2, '2023-02-19'),
    (3, 4, 3, '2023-03-24'),
    (4, 5, 4, '2023-04-14'),
    (5, 1, 5, '2023-05-09'),
    (6, 1, 3, '2023-06-01'),
    (7, 4, 2, '2023-07-08'),
    (8, 5, 3, '2023-08-12'),
    (9, 3, 4, '2023-09-15'),
    (10, 2, 4, '2023-10-20'),
    (11, 1, 2, '2023-11-25'),
    (12, 3, 5, '2023-12-30'),
    (13, 5, 1, '2024-01-10'),
    (14, 4, 1, '2024-02-14'),
    (15, 2, 5, '2024-03-19'),
    (16, 1, 4, '2024-04-24'),
    (17, 3, 1, '2024-05-29'),
    (18, 5, 2, '2024-06-03'),
    (19, 4, 5, '2024-07-08'),
    (20, 2, 3, '2024-08-13');
