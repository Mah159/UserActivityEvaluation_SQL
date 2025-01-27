-- Table details
-- 1. badges
-- ○ Tracks badges earned by users.
-- ○ Key Fields:
-- ■ id, user_id, name (badge name), date (earned date).
-- 2. comments
-- ○ Contains comments on posts.
-- ○ Key Fields:
-- ■ id, post_id, user_id, creation_date, text.
-- 3. post_history
-- ○ Tracks the history of edits, comments, and other changes made to posts.
-- ○ Key Fields:
-- ■ id, post_history_type_id, post_id, user_id, text, creation_date.
-- 4. post_links
-- ○ Links between related posts.
-- ○ Key Fields:
-- ■ id, post_id, related_post_id, link_type_id.
-- 5. posts
-- ○ Contains questions and answers.
-- ○ Key Fields:
-- ■ id, post_type_id (question or answer), creation_date, score, view_count, owner_user_id.
-- 6. tags
-- ○ Information about tags associated with posts.
-- ○ Key Fields:
-- ■ id, tag_name.
-- 7. users
-- ○ Details about Stack Overflow users.
-- ○ Key Fields:
-- ■ id, display_name, reputation, creation_date.
-- 8. votes
-- ○ Tracks voting activity on posts.
-- ○ Key Fields:
-- ■ id, post_id, vote_type_id, creation_date.

USE maheen_activity;
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    creation_date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);



-- 1. Loading and Exploring Data
-- ○ Explore the structure and first 10 rows of each table.
-- ○ Identify the total number of records in each table.

DESCRIBE badges;
SELECT * FROM badges LIMIT 10;
SELECT COUNT(*) AS total_records FROM badges;

DESCRIBE comments;
SELECT * FROM comments LIMIT 10;
SELECT COUNT(*) AS total_records FROM comments;

DESCRIBE post_history;
SELECT * FROM post_history LIMIT 10;
SELECT COUNT(*) AS total_records FROM post_history;

DESCRIBE post_links;
SELECT * FROM post_links LIMIT 10;
SELECT COUNT(*) AS total_records FROM post_links;

DESCRIBE posts_answers;
SELECT * FROM posts_answers LIMIT 10;
SELECT COUNT(*) AS total_records FROM posts_answers;

DESCRIBE posts;
SELECT * FROM posts LIMIT 10;
SELECT COUNT(*) AS total_records FROM posts;

DESCRIBE tags;
SELECT * FROM tags LIMIT 10;
SELECT COUNT(*) AS total_records FROM tags;

DESCRIBE users;
SELECT * FROM users LIMIT 10;
SELECT COUNT(*) AS total_records FROM users;

DESCRIBE votes;
SELECT * FROM votes LIMIT 10;
SELECT COUNT(*) AS total_records FROM votes;

-- 2. Filtering and Sorting
-- ○ Find all posts with a comment_count greater than 2 

-- SELECT *
-- FROM posts
-- WHERE comment_count > 2 ;


-- ○ Display comments made in 2012, sorted by creation_date (comments table).
SELECT *
FROM comments
WHERE YEAR(creation_date) = 2012
ORDER BY creation_date;

-- 3. Simple Aggregations
-- ○ Count the total number of badges (badges table).
SELECT COUNT(*) AS total_badges
FROM badges;


-- ○ Calculate the average score of posts grouped by post_type_id (posts table).
SELECT post_type_id, AVG(score) AS average_score
FROM posts
GROUP BY post_type_id;

-- Part 2: Joins
-- 1. Basic Joins
-- ○ Combine the post_history and posts tables to display the titles and corresponding changes.
SELECT p.id AS post_id, p.title, ph.text AS change_details, ph.creation_date
FROM posts p
JOIN post_history ph ON p.id = ph.post_id;

-- ○ Join the users table with badges to find the total badges earned by each user.
SELECT u.id AS user_id, u.display_name, COUNT(b.id) AS total_badges
FROM users u
LEFT JOIN badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY total_badges DESC;

-- 2. Multi-Table Joins
-- ○ Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users).
SELECT p.title AS post_title, c.text AS comment_text, u.display_name AS commenter_name
FROM posts p
JOIN comments c ON p.id = c.post_id
JOIN users u ON c.user_id = u.id;


-- ○ Combine post_links with posts to list related questions.
SELECT pl.post_id AS question_id, p1.title AS question_title, p2.id AS related_question_id, p2.title AS related_question_title
FROM post_links pl
JOIN posts p1 ON pl.post_id = p1.id
JOIN posts p2 ON pl.related_post_id = p2.id
WHERE p1.post_type_id = 1 AND p2.post_type_id = 1;

-- Part 3: Subqueries
-- 1. Single-Row Subqueries
-- ○ Find the user with the highest reputation (users table).
SELECT id AS user_id, display_name, reputation
FROM users
ORDER BY reputation DESC
LIMIT 1;

-- ○ Retrieve posts with the highest score in each post_type_id (posts table).
SELECT *
FROM posts p
WHERE score = (SELECT MAX(score) FROM posts WHERE post_type_id = p.post_type_id);

-- 2. Correlated Subqueries
-- ○ For each post, fetch the number of related posts from post_links.
SELECT p.id AS post_id, p.title, 
       (SELECT COUNT(*) FROM post_links pl WHERE pl.post_id = p.id) AS related_post_count
FROM posts p;



-- Part 4: Common Table Expressions (CTEs)
-- 1. Non-Recursive CTE
-- ○ Create a CTE to calculate the average score of posts by each user and use it to:
-- ■ List users with an average score above 50.
-- ■ Rank users based on their average post score.
WITH AverageScores AS (
    SELECT owner_user_id, AVG(score) AS avg_score
    FROM posts
    GROUP BY owner_user_id
)
SELECT u.display_name, a.avg_score
FROM AverageScores a
JOIN users u ON a.owner_user_id = u.id
WHERE a.avg_score > 50
ORDER BY a.avg_score DESC;

-- 2. Recursive CTE
-- ○ Simulate a hierarchy of linked posts using the post_links table.
WITH RECURSIVE PostHierarchy AS (
    SELECT pl.post_id, pl.related_post_id
    FROM post_links pl
    WHERE pl.post_id = 1 -- Replace with starting post ID
    UNION ALL
    SELECT ph.post_id, pl.related_post_id
    FROM PostHierarchy ph
    JOIN post_links pl ON ph.related_post_id = pl.post_id
)
SELECT * FROM PostHierarchy;


-- Part 5: Advanced Queries
-- 1. Window Functions
-- ○ Rank posts based on their score within each year (posts table).
SELECT id AS post_id, title, YEAR(creation_date) AS post_year, score,
       RANK() OVER (PARTITION BY YEAR(creation_date) ORDER BY score DESC) AS rank_by_year
FROM posts;

-- ○ Calculate the running total of badges earned by users (badges table).
SELECT * FROM badges;
SELECT * FROM users;
-- SELECT id, creation_date, 
--        SUM(1) OVER (PARTITION BY id ORDER BY creation_date) AS running_total_badges
-- FROM badges;

-- SELECT u.id, u.creation_date, 
-- SUM(1) OVER (PARTITION BY u.id ORDER BY u.creation_date) AS running_total_badges
-- FROM users u
-- JOIN  badges b
-- ON u.id = b.id;

-- ● Which users have contributed the most in terms of comments, edits, and votes?
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM votes;
SELECT * FROM users;
SELECT u.display_name,
    COUNT(DISTINCT c.id) AS total_comments,
    COUNT(DISTINCT ph.id) AS total_edits,
    COUNT(DISTINCT v.id) AS total_votes,
    (COUNT(DISTINCT c.id) + COUNT(DISTINCT ph.id) + COUNT(DISTINCT v.id)) AS total_contributions
FROM users u
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN post_history ph ON u.id = ph.user_id
LEFT JOIN votes v ON u.id = v.id
GROUP BY u.id
ORDER BY total_contributions DESC;

-- ● What types of badges are most commonly earned, and which users are the top earners?
SELECT name AS badge_name, COUNT(*) AS total_earned
FROM badges
GROUP BY name
ORDER BY total_earned DESC;

SELECT u.display_name, COUNT(b.id) AS total_badges
FROM users u
JOIN badges b ON u.id = b.user_id
GROUP BY u.id, u.display_name
ORDER BY total_badges DESC;

-- ● Which tags are associated with the highest-scoring posts?
SELECT * FROM tags;
SELECT * FROM posts;
SELECT t.id, t.tag_name, MAX(p.score) AS highest_score
FROM tags t
JOIN posts p ON t.id = p.id
GROUP BY t.id, t.tag_name
ORDER BY highest_score DESC;

-- ● How often are related questions linked, and what does this say about knowledge sharing?
SELECT COUNT(*) AS total_links, 
       AVG(related_post_id IS NOT NULL) AS avg_links_per_post
FROM post_links;

