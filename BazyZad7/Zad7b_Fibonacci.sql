WITH fib (k, n) AS
(
	SELECT 0,1
	UNION ALL
	SELECT n, k+n
	FROM fib
	WHERE n<10
)

SELECT k as fiboncci
FROM fib
OPTION (MAXRECURSION 0);