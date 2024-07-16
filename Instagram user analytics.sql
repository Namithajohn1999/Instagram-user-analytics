USE ig_clone;
select * from users
order by created_at asc limit 5;

select id, username from users
where id not in(
select distinct user_id from photos
where user_id is not null);

create view totallikes_table as
(with like_table as
 (select  photo_id,count(user_id) as total_likes 
from likes 
group by photo_id)
select user_id, photo_id,image_url, total_likes
from photos inner join like_table
on photos.id=like_table.photo_id
order by total_likes desc limit 1);
select user_id,username,photo_id,image_url, total_likes
from users inner join totallikes_table
on users.id=totallikes_table.user_id;

with tag_table as
(select count(photo_id) as numberof_tags, tag_id
from photo_tags
group by tag_id)
select tag_id,tag_name,numberof_tags
from tags inner join tag_table
on tags.id=tag_table.tag_id
order by numberof_tags desc limit 5;

select count(id) as total_userReg ,dayname(created_at) as weekday
from users
group by dayname(created_at) ;
select avg(total_posts)
from(
select user_id,count(id) as total_posts
from photos
group by user_id) as avg_post;


 select count(id) as  totausers from users;
SELECT 
    COUNT(id) / 100 AS totalphotosbytotaluser
FROM
    photos; 
select avg(total_posts) as avg_posts_per_user
from(
select user_id,count(id) as total_posts
from photos
group by user_id) as avg_post;



select avg(total_posts)
from(
select user_id,count(id) as total_posts
from photos
group by user_id) as avg_post;

select count(id) as  totausers from users;
SELECT 
    COUNT(id) / 100 AS totalphotosbytotaluser
FROM
    photos; 
    select id, username from users
where id not in(
select distinct user_id from photos
where user_id is not null);
select count(id) from photos;
create view totallikes_user as
(select user_id,count(photo_id) as user_likes
from likes
group by user_id
having user_likes=257 );

select user_id, username, user_likes
from totallikes_user  left join users
on totallikes_user.user_id=users.id;



