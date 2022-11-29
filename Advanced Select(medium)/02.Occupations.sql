/* Doctor  Professor  Singer  Actor
1. Jenny    Ashley    Meera   Jane 
2. Samantha Christeen Priya   Julia
3. NULL     Ketty     NULL    Maria
*/
WITH A AS(
SELECT *,
    ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS ROW_N
FROM OCCUPATIONS
    )
SELECT MIN(B.Doc_Name) AS Doctor_names, MIN(B.Prof_Name) AS Prof_Names, MIN(B.Sing_Name) AS Sing_Names, MIN(B.Act_Name) AS Act_Names FROM( 
    SELECT
    CASE WHEN Occupation='Doctor' THEN Name END AS Doc_Name,
    CASE WHEN Occupation='Professor' THEN Name END AS Prof_Name,
    CASE WHEN Occupation='Singer' THEN Name END AS Sing_Name,
    CASE WHEN Occupation='Actor' THEN Name END AS Act_Name,
    ROW_N
    FROM A
    ) AS B
GROUP BY ROW_N
;