SELECT CASE
WHEN (A+B)<=C OR (A+C)<=B OR (B+C)<=A THEN 'Not A Triangle'
WHEN A=B AND B=C THEN 'Equilateral'
WHEN (A=B AND B<>C) OR (B=C AND C<>A) OR (A=C AND C<>B) THEN 'Isosceles'
ELSE 'Scalene'
END
FROM TRIANGLES
;
/*
WHEN A=B=C IS NOT AN AVAILABLE CONDITION
*/