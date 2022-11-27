WITH 

tbl_num_challenges as(
SELECT h.hacker_id, h.name, COUNT(challenge_id) as num_challenges
FROM Hackers h
JOIN Challenges c on h.hacker_id = c.hacker_id
GROUP BY 1, 2   
), 

tbl_count_challenges as (
SELECT num_challenges, COUNT(num_challenges) as count_challenges
FROM tbl_num_challenges
GROUP BY num_challenges
)

SELECT tnc.hacker_id, tnc.name, tnc.num_challenges
FROM tbl_num_challenges tnc 
JOIN tbl_count_challenges tcc ON tnc.num_challenges = tcc.num_challenges
WHERE tnc.num_challenges = (SELECT MAX(num_challenges) FROM tbl_num_challenges) OR tcc.count_challenges <= 1
ORDER BY tnc.num_challenges DESC, tnc.hacker_id
;
/*SELECT H.hacker_id, H.name, COUNT(C.challenge_id) as no_of_challenges
FROM Hackers H
JOIN Challenges C ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING no_of_challenges = (SELECT count(challenge_id) AS max_count FROM Challenges GROUP BY hacker_id ORDER BY max_count DESC LIMIT 1)
OR no_of_challenges NOT IN (SELECT t.cnt FROM (SELECT count(challenge_id) AS cnt FROM Challenges GROUP BY hacker_id) t GROUP BY t.cnt HAVING COUNT(t.cnt) != 1)
ORDER BY no_of_challenges DESC, H.hacker_id ASC
;
*/