CREATE DATABASE Social_Media;
USE Social_Media;
CREATE TABLE Users
(
    user_id VARCHAR(4) PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(50),
    join_date DATE,
    country VARCHAR(50),
    bio TEXT
);
CREATE TABLE Posts
(
    post_id VARCHAR(5) PRIMARY KEY,
    user_id VARCHAR(4),
    content TEXT,
    timestamp DATETIME,
    likes_count INT,
    comments_count INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Comments
(
    comment_id VARCHAR(5) PRIMARY KEY,
    post_id VARCHAR(5),
    user_id VARCHAR(4),
    content TEXT,
    timestamp DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Friendships
(
    friendship_id VARCHAR(5) PRIMARY KEY,
    user_id1 VARCHAR(4),
    user_id2 VARCHAR(4),
    status VARCHAR(30),
    created_at DATE,
    FOREIGN KEY (user_id1) REFERENCES Users(user_id),
    FOREIGN KEY (user_id2) REFERENCES Users(user_id)
);
CREATE TABLE UserInterests
(
    interest_id VARCHAR(5) PRIMARY KEY,
    user_id VARCHAR(4),
    interest VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);