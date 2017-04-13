USE CDCGBCE_990810
--找出符合[設備及投資]的用途別且標餘款(調整數)大於 0 的資料
--DECLARE @OutlayCode VARCHAR(50)
--DECLARE @acmYear SMALLINT
--DECLARE @acmNo INT
--DECLARE @acmNo1 SMALLINT
--DECLARE @acmNo2 SMALLINT
--SET @OutlayCode = '03'
--SET @acmYear = 99
--SET @acmNo = 55
--SET @acmNo1 = 0
--SET @acmNo2 = 1

SELECT 
	(SELECT TOP 1 acmWordNum FROM actMain WHERE acmYear=@acmYear AND acmNo=@acmNo) AS acmWordNum
	,v2.acmYear, v2.acmNo, v2.acvNo, v2.acmNo1, v2.acvNo1,v2.acmNo2, v2.acvNo2
	,ISNULL(ISNULL(v2.acvBgtYear,v1.acvBgtYear),v.acvBgtYear) AS acvBgtYear
	, ISNULL(ISNULL(v2.acvBgtMonth,v1.acvBgtMonth),v.acvBgtMonth)AS acvBgtMonth
	, ISNULL(ISNULL(v2.acvPlanCode,v1.acvPlanCode),v.acvPlanCode) AS acvPlanCode
	, ISNULL(ISNULL(v2.acvOutlayYear,v1.acvOutlayYear),v.acvOutlayYear) AS acvOutlayYear
	, ISNULL(ISNULL(v2.acvOutlayCode,v1.acvOutlayCode),v.acvOutlayCode) AS acvOutlayCode
	, ISNULL(ISNULL(v2.acvBgtSourceCode,v1.acvBgtSourceCode),v.acvBgtSourceCode) AS acvBgtSourceCode
	, ISNULL(ISNULL(v2.acvAccKind,v1.acvAccKind),v.acvAccKind) AS acvAccKind
	, ISNULL(ISNULL(v2.acvBizCode,v1.acvBizCode),v.acvBizCode) AS acvBizCode
	, v2.acvPrePayFlag, v2.acvVisaMoney, v2.acvMoney, v2.acvMemo, v2.acvFinalKind, v2.acvFinalDate
	, v2.acvAdjustMoney, v2.inspect, v2.acvPassAdjustMoney
	, v2.acmNoPrv, v2.acvPassMoney, v2.acvBgtKindSet
	, ISNULL(ISNULL(v2.acvBgtDepCode,v1.acvBgtDepCode),v.acvBgtDepCode) AS acvBgtDepCode
	, v2.acvCostKind, v2.acvNextYearFlag, v2.acvPlanCateCode
FROM actMain2 m2 INNER JOIN actVisa2 v2
ON m2.acmYear=v2.acmYear 
AND m2.acmNo = ISNULL(ISNULL(v2.acmNoPrv,v2.acmNo),m2.acmNo)
	LEFT JOIN bgtBudget bgt
	ON bgt.bgtYear=@acmYear 
	AND v2.acmYear = bgt.acmYear 
	AND v2.acmNo= bgt.acmNo 
	AND v2.acvNo=bgt.acvNo 
	AND v2.acmNo1= bgt.acmNo1 
	AND v2.acvNo1=bgt.acvNo1 
	AND v2.acmNo2= bgt.acmNo2 
	AND v2.acvNo2=bgt.acvNo2
	LEFT JOIN actVisa1 v1 
	ON v2.acmYear = v1.acmYear 
	AND v2.acmNo = v1.acmNo 
	AND v2.acmNo1 = v1.acmNo1
	AND v2.acvNo = v1.acvNo
	AND v2.acvNo1 = v1.acvNo1
	LEFT JOIN actVisa v
	ON v2.acmYear = v.acmYear
	AND v2.acmNo = v.acmNo 
	AND v2.acvNo = v.acvNo
WHERE m2.acmYear = @acmYear AND m2.acmNo=@acmNo
AND m2.acmNo1 = @acmNo1
AND m2.acmNo2 = @acmNo2
AND v2.acvOutlayCode LIKE @OutlayCode+'%'
AND v2.acvAdjustMoney > 0
AND bgt.bgtNo IS NULL