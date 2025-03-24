## ________________________________##
## Name: Mustafa Assem Mubarak
## Part 1:
SELECT * from fifa limit 5; # to show first 5 rows from the dataset and make sure data is uploaded properly
# now, let's answer Q1: How many players are there in the dataset? ans: 15,766
select count(distinct name) as total_playes from fifa ;

# Q2: How many nationalities do these players belong to? ans: 161
select count(distinct nationality) as count_nationality from fifa;

# Q3: Which nationality has the highest number of players?ans: England
# what are the top 3 nationalities by no of players? ans: Eng, Germany, spain
select nationality, count(name) as count_player from fifa group by nationality order by count_player desc limit 1;
select nationality, count(name) as count_player from fifa group by nationality order by count_player desc limit 3;

# Q4: What is the total wage given to all players? ans: 160,073,000
# What’s the average? ans: 9618.0376
# standard deviation? ans: 22262.850062074485

select sum(wage) as total_wages from fifa;
select avg(wage) as avg_wages from fifa;
select stddev(wage) as stddeb_wages from fifa;

# Q5: Which player has the highest wage? ans: Messi/565000
# Who has the lowest ? ans: G. Nugent/1000

Select name, wage from fifa order by wage desc limit 1;
Select name, wage from fifa order by wage asc limit 1;

# Q6: The player having the best overall rating? L. Messi
# Worst overall rating? G. Nugent

select name , overall from fifa order by overall desc limit 1;
select name , overall from fifa order by overall asc limit 1;

# Q7:Club having the highest total of overall rating? Real Madrid/2582
# Highest Average of overall rating? Juventus/82.2800

select club, sum(overall) as total_overll from fifa group by club 
order by total_overll desc limit 1; 
select club, avg(overall) as avg_overll from fifa group by club 
order by avg_overll desc limit 1; 

# Q8: What are the top 5 clubs based on the
# average rating of theirplayers? Juventus/Napoli/Inter/Real Madrid/FC Barcelona

select club, avg(overall) as avg_overll from fifa group by club 
order by avg_overll desc limit 5; 

## Part2:
# Q1: What is the distribution of players whose 
# preferred foot is left vs right? left=3820 \ Right = 12823

select distinct "Preferred_Foot", count(name) as total_playes from fifa
group by  "Preferred_Foot";
select distinct preferred_foot as Fav_foot , count(*) from fifa
Group by Fav_foot;
-- seems to be the majority of players' foot preferred tend to be right__

# Q2: Which jersey number is the luckiest? ans: Jer.no 79
-- the jersey number that have highest avr rating, could be the lukiest -- 

Select avg(Overall) as avr_rating, Jersey_Number from fifa
group by Jersey_Number
order by avr_rating desc limit 1;

# Q3: What is the frequency distribution of nationalities
# among players whose club name starts with M?

select nationality, club, count(*) as cnt_players 
from fifa where fifa.club like "M%"
group by 1,2
order by cnt_players Desc;

# Q4: How many players have joined their
# respective clubs in the date range 20 May
# 2018 to 10 April 2019(both inclusive)?

SELECT COUNT(name) AS no_players
FROM fifa
WHERE STR_TO_DATE(Joined, '%d-%m-%Y') 
BETWEEN '2018-05-20' AND '2019-04-10';

# Q5: How many players have joined their
# respective clubs date wise?

select joined , count(name) as no_players from fifa 
group by joined
Order by str_to_date(joined,"%d,%m,%Y") asc;

# Q6: How many players have joined their respective clubs yearly?

select year(str_to_date(joined, "%d-%m-%Y")) as joined_year, club, count(name) as cnt_players
from fifa
group by 1,2
order by joined_year asc;
#-----------End---------------#