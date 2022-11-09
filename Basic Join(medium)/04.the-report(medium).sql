SELECT
    CASE WHEN g.Grade < 8 THEN NULL ELSE s.Name END 'Name',
    g.Grade,
    s.Marks
FROM 
    Students s 
    INNER JOIN Grades g
        ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY  
    2 DESC, 1, 3
;
/*
題目解析:
1.三個欄位
2.年級大於8者，優先依年級降排，次來以名字字首昇排
3.年級小於8者，名字部分以NULL呈現(此時以名字字首排序失去意義)，優先按年級降排，次要依分數昇排
#a.選好資料欄位將名字統一更改，依照數字區間JOIN兩表，按年紀降排,名字昇排(<8年級名字統一後失去效用),分數昇排
*/