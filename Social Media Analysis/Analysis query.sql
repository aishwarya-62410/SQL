-- 1. Retrieve all posts made by a specific user.

SELECT * FROM Posts WHERE user_id = 2;

-- 2. Count the total number of comments for a particular post.
SELECT COUNT(*) AS total_comments FROM Comments WHERE post_id = 2;

-- 3. List all users who liked a specific post.
SELECT u.username FROM Users u
JOIN Likes l ON u.user_id = l.user_id
WHERE l.post_id = 5;

-- 4. Retrieve the most recent post made by a user.
SELECT * FROM Posts WHERE user_id = 2 ORDER BY post_date DESC LIMIT 1;

-- 5. Find the total number of likes received by a specific post.

SELECT COUNT(*) AS total_likes FROM Likes WHERE post_id = 5;
SELECT COUNT(*) AS total_likes FROM Likes WHERE post_id = 2;

-- 6. Get the usernames of users who have commented on a specific post.
SELECT u.username FROM Users u
JOIN Comments c ON u.user_id = c.user_id
WHERE c.post_id =3;

-- 7. Retrieve posts made by users followed by a specific user.
SELECT p.* FROM Posts p
JOIN Users u ON p.user_id = u.user_id
JOIN Followers f ON u.user_id = f.following_user_id
WHERE f.follower_user_id = 2;

-- 8. List all users who have not made any posts.
SELECT * FROM Users WHERE user_id NOT IN (SELECT DISTINCT user_id FROM Posts);

-- 9. Count the number of likes given by a specific user.
SELECT COUNT(*) AS total_likes_given FROM Likes WHERE user_id = 3;

-- 10. Retrieve posts with more than 3 comments.
SELECT * FROM Posts WHERE post_id IN (SELECT post_id FROM Comments GROUP BY post_id HAVING COUNT(*) > 3);

-- 11. Find the user who has the highest number of followers.
SELECT u.user_id, u.username, COUNT(f.follower_id) AS follower_count
FROM Users u
LEFT JOIN Followers f ON u.user_id = f.following_user_id
GROUP BY u.user_id, u.username
ORDER BY follower_count DESC
LIMIT 1;

-- 12. Retrieve users who have liked all posts made by a specific user.
SELECT u.username FROM Users u
WHERE NOT EXISTS (
    SELECT * FROM Posts p
    WHERE NOT EXISTS (
        SELECT * FROM Likes l
        WHERE l.user_id = u.user_id AND l.post_id = p.post_id
    )
);

-- 13. Get the user who has the highest total number of likes on their posts.
SELECT u.user_id, u.username, COUNT(l.like_id) AS total_likes
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY u.user_id, u.username
ORDER BY total_likes DESC
LIMIT 1;

-- 14. Find users who have not received any likes on their posts.
SELECT u.username FROM Users u
LEFT JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
WHERE l.like_id IS NULL;

-- 15. Retrieve posts that have more comments than likes.
SELECT * FROM Posts
WHERE (SELECT COUNT(*) FROM Comments WHERE Comments.post_id = Posts.post_id)
      > (SELECT COUNT(*) FROM Likes WHERE Likes.post_id = Posts.post_id);

-- 16. Retrieve the usernames of users who have liked their own posts:
SELECT u.username
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
JOIN Likes l ON p.post_id = l.post_id
WHERE u.user_id = l.user_id;

-- 17. List users who have commented on posts made by users they are not following:
SELECT DISTINCT u.username
FROM Users u
JOIN Comments c ON u.user_id = c.user_id
JOIN Posts p ON c.post_id = p.post_id
LEFT JOIN Followers f ON u.user_id = f.following_user_id
WHERE f.follower_user_id IS NULL;

-- OR below once

SELECT DISTINCT c.user_id
FROM Comments c
JOIN Posts p ON c.post_id = p.post_id
JOIN Users u1 ON c.user_id = u1.user_id
JOIN Users u2 ON p.user_id = u2.user_id
LEFT JOIN Followers f ON u1.user_id = f.follower_user_id AND u2.user_id = f.following_user_id
WHERE f.follower_user_id IS NULL;


-- ( As we got zero values so i'm going to insert some data )
-- Insert Users
INSERT INTO Users (user_id, username, email, date_joined)
VALUES
    (21, 'kamini29', 'kamini29@gmail.com', '2023-01-01'),
    (22, 'Rsihi32', 'Rsihi32@gmail.com', '2023-01-02');

-- Insert Posts
INSERT INTO Posts (post_id, user_id, content, post_date)
VALUES
    (21, 1, 'Kolar vibes', '2023-01-02'),
    (22, 2, 'Brigade tower', '2023-01-03');

-- Insert Followers
INSERT INTO Followers (follower_id, follower_user_id, following_user_id, follow_date)
VALUES
    (21, 1, 2, '2023-01-01'); -- user1 follows user2

-- Insert Comments (user2 comments on post by user1)
INSERT INTO Comments (comment_id, post_id, user_id, comment_text, comment_date)
VALUES
    (21, 1, 2, 'Comment on post by user1', '2023-01-05');


-- 18. Find posts that have more likes than the average number of likes for all posts:
SELECT p.*
FROM Posts p
JOIN (
    SELECT post_id, COUNT(*) AS likes_count
    FROM Likes
    GROUP BY post_id
) l ON p.post_id = l.post_id
WHERE l.likes_count > (
    SELECT AVG(likes_count)
    FROM (
        SELECT post_id, COUNT(*) AS likes_count
        FROM Likes
        GROUP BY post_id
    ) AS avg_likes
);

-- 19. Retrieve users who have made at least 2 comments on the same post:
SELECT DISTINCT u.username
FROM Users u
JOIN Comments c1 ON u.user_id = c1.user_id
JOIN Comments c2 ON c1.post_id = c2.post_id AND c1.comment_id <> c2.comment_id
WHERE c1.post_id = c2.post_id;

-- 20. List users who have liked posts made by users they are following:
SELECT DISTINCT u.username
FROM Users u
JOIN Likes l ON u.user_id = l.user_id
JOIN Posts p ON l.post_id = p.post_id
JOIN Followers f ON u.user_id = f.following_user_id
WHERE l.user_id = f.follower_user_id;

-- 21. Find users who have liked every post made by a specific user:
SELECT DISTINCT u.username
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
WHERE NOT EXISTS (
    SELECT p2.post_id
    FROM Posts p2
    WHERE p2.user_id = 2
    AND p2.post_id NOT IN (SELECT l2.post_id FROM Likes l2 WHERE l2.user_id = u.user_id)
);

-- OR
SELECT DISTINCT u.username
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
WHERE NOT EXISTS (
    SELECT p2.post_id
    FROM Posts p2
    WHERE p2.user_id = 2
    AND p2.post_id NOT IN (SELECT l2.post_id FROM Likes l2 WHERE l2.user_id = u.user_id)
);

-- 22. Retrieve posts with the highest number of comments for each user:
SELECT *
FROM (
    SELECT p.*, ROW_NUMBER() OVER(PARTITION BY p.user_id ORDER BY COUNT(c.comment_id) DESC) AS rn
    FROM Posts p
    JOIN Comments c ON p.post_id = c.post_id
    GROUP BY p.post_id, p.user_id
) AS ranked_posts
WHERE rn = 1;

-- 23. List users who have made comments on posts made by users they are following:
SELECT DISTINCT u.username
FROM Users u
JOIN Comments c ON u.user_id = c.user_id
JOIN Posts p ON c.post_id = p.post_id
JOIN Followers f ON u.user_id = f.following_user_id
WHERE p.user_id = f.follower_user_id;

-- 24. Retrieve the post with the highest number of likes:
SELECT p.*
FROM Posts p
JOIN (
    SELECT post_id, COUNT(*) AS likes_count
    FROM Likes
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
) AS top_post ON p.post_id = top_post.post_id;

-- 25. Retrieve the post with the highest number of likes along with number of likes

SELECT p.post_id, p.content AS post_content, COUNT(l.like_id) AS num_likes
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content
ORDER BY num_likes DESC
LIMIT 1;


-- 26. Find users who have not liked any posts:
SELECT u.username
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
WHERE l.like_id IS NULL;

















