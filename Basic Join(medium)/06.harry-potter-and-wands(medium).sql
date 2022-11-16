SELECT W.ID, P.AGE, W.COINS_NEEDED, W.POWER 
FROM WANDS AS W
JOIN WANDS_PROPERTY AS P
ON W.CODE = P.CODE
WHERE P.IS_EVIL = 0 AND W.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = P.AGE) 
ORDER BY W.POWER DESC, P.AGE DESC, W.COINS_NEEDED
;
/*
FIRST SELECT USER REQUIRED COLUMN. 
WHILE FILTER WITH WHERE CLAUSE, APPLY ADVANCE MIN CLAUSE WITH FULL SELECT AGAIN
COLUMN VALUE INSIDE X,Y NEEDS TO MATCH OUTSIDE COLUMN VALUE W,P
*/