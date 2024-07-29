USE Social_Media;
-- Query 1
SELECT u.user_id, COUNT(p.post_id) as post_count from Users u, Posts p where u.user_id = p.user_id group by u.user_id having COUNT(p.post_id)>5;

-- Query 2
WITH Top3_CountryCount as (SELECT u.country, COUNT(*) as user_count from Users u group by u.country order by user_count desc limit 3),	-- Finding the Top 3 countries with most users
CountryInterCount as (SELECT u.country, ui.interest, COUNT(*) as inter_count from Users u, UserInterests ui where u.user_id = ui.user_id group by u.country, ui.interest),	-- grouping the count of users by country and interest
Most_Comm_Inter as (SELECT c.country, ui.interest, ui.inter_count from Top3_CountryCount c, CountryInterCount ui
	where c.country = ui.country -- making new query using the country from top 3 country query and interest from query with both country and interest
    and ui.inter_count = (SELECT MAX(inter_count) from CountryInterCount where country = c.country) -- Finding most common interest by getting max of count of interests
)
SELECT * from Most_Comm_Inter;

-- Query 3
SELECT u1.username as User1, u2.username as User2, ui1.interest 
from Users u1, Friendships f1, Users u2, UserInterests ui1 -- Required tables implicitly joined
where u1.user_id = f1.user_id1 -- tables are joined for the user_id matching the user_id in the friendship table
and f1.user_id2 = u2.user_id -- and for the second user_id with the second user's id
and u1.user_id = ui1.user_id
and f1.status = 'accepted' -- checks for 1 user's acceptance
and exists
(select * from Friendships f2 where f2.user_id1 = f1.user_id2 and f2.user_id2 = f1.user_id1 and f2.status = 'accepted') -- checks for the second user's acceptance
and exists
(select * from UserInterests ui2 where ui2.user_id = u2.user_id and ui2.interest = ui1.interest); -- checks if the users have the same interest

-- Query 4
SELECT u.username, p.content as post_content, c.content as comment_content from Users u, Posts p, Comments c 
where u.user_id = p.user_id 
and p.post_id = c.post_id 
and u.user_id = c.user_id;

-- Query 5
DELIMITER $$
CREATE PROCEDURE PostStat(IN user_id VARCHAR(4))
BEGIN
	DECLARE avg_likes FLOAT;
    DECLARE avg_comments FLOAT;
    SELECT AVG(likes_count), AVG(comments_count) INTO avg_likes, avg_comments from Posts; -- Calculating overall average likes and comments
    SELECT p.post_id, p.content, p.likes_count, p.comments_count, avg_likes as overall_likes_avg, avg_comments as overall_comments_avg,
    (p.likes_count - avg_likes) as difference_likes, (p.comments_count - avg_comments) as difference_comments -- Finding difference of avg likes of post and overall average of likes
    from Posts p where p.user_id = user_id;
END $$
DELIMITER ;

CALL PostStat("U002")