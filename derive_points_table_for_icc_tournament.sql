CREATE TABLE icc_world_cup
(
Team_1 varchar(20),
Team_2 varchar(20),
Winner varchar(20)
);
INSERT INTO icc_world_cup VALUES('India','SL','India');
INSERT INTO icc_world_cup VALUES('SL','Aus','Aus');
INSERT INTO icc_world_cup VALUES('SA','Eng','Eng');
INSERT INTO icc_world_cup VALUES('Eng','NZ','NZ');
INSERT INTO icc_world_cup VALUES('Aus','India','India');

SELECT team_name, count(1) as number_of_matches_played, sum(win_flag) as number_of_matches_won, count(1) - sum(win_flag) as no_of_losses
FROM (
SELECT team_1 as team_name, CASE WHEN team_1=winner THEN 1 ELSE 0 END as win_flag FROM icc_world_cup
UNION ALL
SELECT team_2 as team_name, CASE WHEN team_2=winner THEN 1 ELSE 0 END as win_flag FROM icc_world_cup) A
GROUP BY team_name ORDER BY number_of_matches_won DESC;