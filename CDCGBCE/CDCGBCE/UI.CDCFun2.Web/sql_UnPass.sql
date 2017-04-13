
Select Distinct

* 
,(SELECT dptName FROM codDepartName WHERE dptCode=acmWorkUnitNo) AS [執行單位]
,acmWordNum+'-'+cast(acmNo1 AS VARCHAR)+'-'+cast(acpPayNo AS varchar)+'-'+cast(acpPayNo1 as varchar) AS [動支編號]
,(SELECT TOP 1 sysOrgName FROM basBaseData) AS orgName
From 


(

----===↓↓↓取未報支完畢(不區分審核狀態)=======================================================================================

Select Distinct 
'未報支完畢' As DataKind, 
 V.acmYear, V.acmNo
, IsNull(V1.acmNo1,0) As acmNo1
, IsNull(V2.acmNo2,0) As acmNo2
, 0 As acpPayYear
, 0 As acpPayNo
, 0 As acpPayNo1


, ISNULL(V1.acvBgtDepCode, V.acvBgtDepCode) As acvBgtDepCode
, ISNULL(M1.acmWorkUnitNo, M.acmWorkUnitNo) As acmWorkUnitNo

, M.acmWordNum
, IsNull(IsNull(M2.acmMemo, M1.acmMemo), M.acmMemo) As acmMemo
, IsNull(IsNull(M2.acmMoney, M1.acmMoney), M.acmMoney) As acmMoney
--, IsNull(ISNULL(V2.acvMoney, V1.acvMoney), V.acvMoney) As acmMoney
, 0 As acvAdjustMoney

, IsNull(ISNULL(V2.acvAccKind, V1.acvAccKind), V.acvAccKind) As acvAccKind
, V.acvBgtSourceCode, V.acvBizCode
, IsNull(ISNULL(V2.acvOutlayYear, V1.acvOutlayYear), V.acvOutlayYear) As acvOutlayYear
, IsNull(ISNULL(V2.acvPlanCode, V1.acvPlanCode), V.acvPlanCode) As acvPlanCode
, IsNull(ISNULL(V2.acvOutlayCode, V1.acvOutlayCode), V.acvOutlayCode) As acvOutlayCode



, IsNull((Select SUM(IsNull(PV.acvMoney,0) + IsNull(PV.acvAdjustMoney,0)) From actPayVisa PV
Where PV.acmYear=V.acmYear And PV.acmNo =V.acmNo And PV.acvNo=V.acvNo
And PV.acmNo1=ISNULL(V1.acmNo1,0)And PV.acvNo1=ISNULL(V1.acvNo1,0)
And PV.acmNo2=ISNULL(V2.acmNo2,0)And PV.acvNo2=ISNULL(V2.acvNo2,0)
),0) As TotalPay
, IsNull(ISNULL(V2.acvMoney, V1.acvMoney), V.acvMoney) - IsNull((Select SUM(IsNull(PV.acvMoney,0) + IsNull(PV.acvAdjustMoney,0)) From actPayVisa PV
Where PV.acmYear=V.acmYear And PV.acmNo =V.acmNo And PV.acvNo=V.acvNo
And PV.acmNo1=ISNULL(V1.acmNo1,0)And PV.acvNo1=ISNULL(V1.acvNo1,0)
And PV.acmNo2=ISNULL(V2.acmNo2,0)And PV.acvNo2=ISNULL(V2.acvNo2,0)
) ,0) As TotalUnPay
, (Case When Not M2.acmYear Is Null And ISNULL(M2.acmPassFlag, '0') <>'1'
		Then '決標未審'  
		When Not M1.acmYear Is Null And ISNULL(M1.acmPassFlag, '0') <>'1'
		Then '再簽未審' 
		When Not M.acmYear Is Null And ISNULL(M.acmPassFlag, '0') <>'1'
		Then '請示未審' 
		Else 
		''
	End
	)  As 審核狀態
,  '' As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From 
(Select * From actVisa V Where V.acmYear=@acmYear)V
Left Join 
actVisa1 V1 On V1.acmYear= V.acmYear And V1.acmNo=V.acmNo And V1.acvNo=V.acvNo
Left Join actVisa2 V2 On V2.acmYear=ISNULL(V1.acmYear, V.acmYear)
And V2.acmNo=ISNULL(V1.acmNo, V.acmNo)
And V2.acvNo=ISNULL(V1.acvNo, V.acvNo)
And V2.acmNo1=ISNULL(V1.acmNo1,0)
And V2.acvNo1=ISNULL(V1.acvNo1,0)
Left Join actMain M on M.acmYear=V.acmYear And M.acmNo=ISNULL(ISNULL(ISNULL(V2.acmNoPrv, V1.acmNoPrv), V.acmNoPrv), V.acmNo) 
Left Join actMain1 M1 on M1.acmYear=V.acmYear And M1.acmNo= ISNULL(V1.acmNoPrv, V1.acmNo) And M1.acmNo1=V1.acmNo1 
Left Join actMain2 M2 on M2.acmYear=V.acmYear And M2.acmNo= ISNULL(V2.acmNoPrv, V2.acmNo) And M2.acmNo1=V2.acmNo1  And M2.acmNo2=V2.acmNo2
Where  IsNull(ISNULL(V2.acvMoney, V1.acvMoney), V.acvMoney) - IsNull((Select SUM(IsNull(PV.acvMoney,0) + IsNull(PV.acvAdjustMoney,0)) From actPayVisa PV
Where PV.acmYear=V.acmYear And PV.acmNo =V.acmNo And PV.acvNo=V.acvNo
And PV.acmNo1=ISNULL(V1.acmNo1,0)And PV.acvNo1=ISNULL(V1.acvNo1,0)
And PV.acmNo2=ISNULL(V2.acmNo2,0)And PV.acvNo2=ISNULL(V2.acvNo2,0)
) ,0) >0 
----===↑↑↑取未報支完畢(不區分審核狀態)=======================================================================================
 Union
 
 --===↓↓↓取請示未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

Select  Distinct 
'請示' As DataKind, 
IsNull(M.acmYear, V.acmYear) As acmYear
, IsNull(M.acmNo, V.acmNo) As acmNo
, 0 As acmNo1
, 0 As acmNo2
, 0 As acpPayYear
, 0 As acpPayNo
, 0 As acpPayNo1

, V.acvBgtDepCode 
, M.acmWorkUnitNo 

, M.acmWordNum
, M.acmMemo, M.acmMoney
, 0 As acvAdjustMoney

, V.acvAccKind, V.acvBgtSourceCode, V.acvBizCode
,  V.acvOutlayYear
,  V.acvOutlayCode
,V.acvOutlayCode


, Null As TotalPay
, Null As TotalUnPay
, (Case When Not M.acmYear Is Null 
			And Not V.acmYear Is Null 
			And ISNULL(M.acmPassFlag, '0')<>'1' 
		Then '資料未審' 
		Else '' End
	 ) As 審核狀態
, (Case When M.acmYear Is Null Then '有明細資料無主檔'
		When V.acmYear Is Null Then '無明細資料有主檔'
		Else
			''
		End
		) As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From actVisa V 
Full Join actMain M On M.acmYear=V.acmYear And M.acmNo=V.acmNo
Where IsNull(M.acmYear, V.acmYear) =@acmYear  
And (ISNULL(M.acmPassFlag, '0')<>'1' Or M.acmNo Is Null Or V.acmNo Is Null)


--===↑↑↑取請示未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

union

 --===↓↓↓取再簽請示未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

Select Distinct 
'再簽' As DataKind, 
IsNull(M1.acmYear, V1.acmYear) As acmYear
, IsNull(M1.acmNo, V1.acmNo) As acmNo
, ISNULL(M1.acmNo1, V1.acmNo1) As acmNo1
, 0 As acmNo2
, 0 As acpPayYear
, 0 As acpPayNo
, 0 As acpPayNo1
, ISNULL(V1.acvBgtDepCode, V.acvBgtDepCode) As acvBgtDepCode
, ISNULL(M1.acmWorkUnitNo, M.acmWorkUnitNo) As acmWorkUnitNo

, M.acmWordNum
, M1.acmMemo, M1.acmMoney
, ISNULL(V1.acvAdjustMoney, 0) As acvAdjustMoney

, IsNull(V1.acvAccKind, V.acvAccKind) As acvAccKind
, V.acvBgtSourceCode, V.acvBizCode
, IsNull(V1.acvOutlayYear, V.acvOutlayYear) As acvOutlayYear
, IsNull(V1.acvPlanCode, V.acvPlanCode) As acvPlanCode
, IsNull(V1.acvOutlayCode, V.acvOutlayCode) As acvOutlayCode
 
, Null As TotalPay
, Null As TotalUnPay
, (Case When Not M1.acmYear Is Null 
			And Not V1.acmYear Is Null 
			And ISNULL(M1.acmPassFlag, '0')<>'1' 
		Then '資料未審' 
		Else '' End
	 ) As 審核狀態
, (Case When M1.acmYear Is Null Then '有明細資料無主檔'
		When V1.acmYear Is Null Then '無明細資料有主檔'
		Else
			''
		End
		) As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From actVisa1 V1 
Full Join actMain1 M1 On M1.acmYear=V1.acmYear And M1.acmNo=IsNull(V1.acmNoPrv, V1.acmNo) And M1.acmNo1=V1.acmNo1
Left Join actMain M On M.acmYear= ISNULL(M1.acmYear, V1.acmNo) And M.acmNo=ISNULL(M1.acmNo, IsNull(V1.acmNoPrv, V1.acmNo))
Left Join actVisa V On V.acmYear= V1.acmYear And V.acmNo=V1.acmNo And V.acvNo=V1.acvNo
Where IsNull(M1.acmYear, V1.acmYear) =@acmYear  
And (ISNULL(M1.acmPassFlag, '0')<>'1' Or M1.acmNo Is Null Or V1.acmNo Is Null)


--===↑↑↑取再簽請示未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

union

 --===↓↓↓取決標未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

Select Distinct 
'決標' As DataKind, 
IsNull(M2.acmYear, V2.acmYear) As acmYear
, IsNull(M2.acmNo, V2.acmNo) As acmNo
, ISNULL(M2.acmNo1, V2.acmNo1) As acmNo1
, ISNULL(M2.acmNo2, V2.acmNo2) As acmNo2
, 0 As acpPayYear
, 0 As acpPayNo
, 0 As acpPayNo1

, ISNULL(V1.acvBgtDepCode, V.acvBgtDepCode) As acvBgtDepCode
, ISNULL(M1.acmWorkUnitNo, M.acmWorkUnitNo) As acmWorkUnitNo

, M.acmWordNum
, M2.acmMemo, M2.acmMoney
, ISNULL(V2.acvAdjustMoney, 0) As acvAdjustMoney

, IsNull(ISNULL(V2.acvAccKind, V1.acvAccKind), V.acvAccKind) As acvAccKind
, V.acvBgtSourceCode, V.acvBizCode
, IsNull(ISNULL(V2.acvOutlayYear, V1.acvOutlayYear), V.acvOutlayYear) As acvOutlayYear
, IsNull(ISNULL(V2.acvPlanCode, V1.acvPlanCode), V.acvPlanCode) As acvPlanCode
, IsNull(ISNULL(V2.acvOutlayCode, V1.acvOutlayCode), V.acvOutlayCode) As acvOutlayCode


--, V.acvNo
--, 0 As acmNo1, 0 As acvNo1
--, 0 As acmNo2, 0 As acvNo2
--, V.acvAccKind, V.acvBgtSourceCode, V.acvBizCode
--, V.acvOutlayYear, V.acvPlanCode
--, V.acvOutlayCode
--, V.acvMoney
, Null As TotalPay
, Null As TotalUnPay
, (Case When Not M2.acmYear Is Null 
			And Not V2.acmYear Is Null 
			And ISNULL(M2.acmPassFlag, '0')<>'1' 
		Then '資料未審' 
		Else '' End
	 ) As 審核狀態
, (Case When M2.acmYear Is Null Then '有明細資料無主檔'
		When V2.acmYear Is Null Then '無明細資料有主檔'
		Else
			''
		End
		) As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From actVisa2 V2 
Full Join actMain2 M2 On M2.acmYear=V2.acmYear And M2.acmNo=IsNull(V2.acmNoPrv, V2.acmNo)And M2.acmNo1=V2.acmNo1 And M2.acmNo2=V2.acmNo2
Left Join actVisa1 V1 On V1.acmYear= V2.acmYear And V1.acmNo=V2.acmNo And V1.acvNo=V2.acvNo
And V1.acmNo1=V2.acmNo1 And V1.acvNo1=V2.acvNo1

Left Join actMain M On M.acmYear= ISNULL(M2.acmYear, V2.acmNo) And M.acmNo=ISNULL(M2.acmNo, IsNull(V2.acmNoPrv, V2.acmNo))
Left Join actMain1 M1 On M1.acmYear= ISNULL(M2.acmYear, V2.acmNo) And M1.acmNo=ISNULL(M2.acmNo, IsNull(V2.acmNoPrv, V2.acmNo))

Left Join actVisa V On V.acmYear= V2.acmYear And V.acmNo=V2.acmNo And V.acvNo=V2.acvNo

Where IsNull(M2.acmYear, V2.acmYear) =@acmYear  
And (ISNULL(M2.acmPassFlag, '0')<>'1' Or M2.acmNo Is Null Or V2.acmNo Is Null)


--===↑↑↑取決標未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

union


 --===↓↓↓取報支未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

Select Distinct 
'報支' As DataKind, 
IsNull(P.acmYear, PV.acmYear) As acmYear
, IsNull(P.acmNo, PV.acmNo) As acmNo
, ISNULL(P.acmNo1, PV.acmNo1) As acmNo1
, ISNULL(PV.acmNo2,0) As acmNo2
, ISNULL(IsNull(P.acpPayYear, PV.acpPayYear),0) As acpPayYear
, ISNULL(IsNull(P.acpPayNo, PV.acpPayNo),0) As acpPayNo
, 0 As acpPayNo1
, PV.acvBgtDepCode
, ISNULL(M1.acmWorkUnitNo, M.acmWorkUnitNo) As acmWorkUnitNo

, M.acmWordNum
, P.acpMemo, P.acpMoney
, ISNULL(PV.acvAdjustMoney, 0) As acvAdjustMoney

, PV.acvAccKind, PV.acvBgtSourceCode, PV.acvBizCode
, PV.acvOutlayYear
, PV.acvPlanCode
, PV.acvOutlayCode


--, V.acvNo
--, 0 As acmNo1, 0 As acvNo1
--, 0 As acmNo2, 0 As acvNo2
--, V.acvAccKind, V.acvBgtSourceCode, V.acvBizCode
--, V.acvOutlayYear, V.acvPlanCode
--, V.acvOutlayCode
--, V.acvMoney
, Null As TotalPay
, Null As TotalUnPay
, (Case When Not P.acmYear Is Null 
			And Not PV.acmYear Is Null 
			And ISNULL(P.acpPassFlag, '0')<>'1' 
		Then '資料未審' 
		Else '' End
	 ) As 審核狀態
, (Case When P.acmYear Is Null Then '有明細資料無主檔'
		When PV.acmYear Is Null Then '無明細資料有主檔'
		Else
			''
		End
		) As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From actPayVisa PV 
Full Join actPay P On P.acmYear=PV.acmYear And P.acmNo=IsNull(PV.acmNoPrv, PV.acmNo )And P.acpPayYear=PV.acpPayYear And P.acpPayNo=PV.acpPayNo
Left Join actMain M On M.acmYear= ISNULL(P.acmYear, PV.acmYear) And M.acmNo=ISNULL(P.acmNo, IsNull(PV.acmNoPrv, PV.acmNo))
Left Join actMain1 M1 on M1.acmYear=PV.acmYear And M1.acmNo= ISNULL(P.acmNo, IsNull(PV.acmNoPrv, PV.acmNo)) And M1.acmNo1=PV.acmNo1 

Where IsNull(P.acmYear, PV.acmYear) =@acmYear  
And (ISNULL(P.acpPassFlag, '0')<>'1' Or P.acmNo Is Null Or PV.acmNo Is Null)


--===↑↑↑取報支未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

union

 --===↓↓↓取轉正未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================

Select Distinct 
'轉正' As DataKind, 
IsNull(P1.acmYear, PV1.acmYear) As acmYear
, IsNull(P1.acmNo, PV1.acmNo) As acmNo
, ISNULL(PV1.acmNo1,0) As acmNo1
, ISNULL(PV1.acmNo2,0) As acmNo2
, ISNULL(IsNull(P1.acpPayYear, PV1.acpPayYear),0) As acpPayYear
, ISNULL(IsNull(P1.acpPayNo, PV1.acpPayNo),0) As acpPayNo
, ISNULL(ISNULL(P1.acpPayNo1,PV1.acpPayNo1),0) As acpPayNo1
, PV.acvBgtDepCode
, ISNULL(M1.acmWorkUnitNo, M.acmWorkUnitNo) As acmWorkUnitNo
, M.acmWordNum
, P1.acpMemo, P1.acpMoney
, ISNULL(PV1.acvAdjustMoney, 0) As acvAdjustMoney


, ISNULL(PV1.acvAccKind,PV.acvAccKind) As acvAccKind
, PV.acvBgtSourceCode, PV.acvBizCode
, ISNULL(PV1.acvOutlayYear,PV.acvOutlayYear) As acvOutlayYear
, ISNULL(PV1.acvPlanCode,PV.acvPlanCode) As acvPlanCode
, ISNULL(PV1.acvOutlayCode,PV.acvOutlayCode) As acvOutlayCode


--, V.acvNo
--, 0 As acmNo1, 0 As acvNo1
--, 0 As acmNo2, 0 As acvNo2
--, V.acvAccKind, V.acvBgtSourceCode, V.acvBizCode
--, V.acvOutlayYear, V.acvPlanCode
--, V.acvOutlayCode
--, V.acvMoney
, Null As TotalPay
, Null As TotalUnPay
, (Case When Not P1.acmYear Is Null 
			And Not PV1.acmYear Is Null 
			And ISNULL(P1.acpPassFlag, '0')<>'1' 
		Then '資料未審' 
		Else '' End
	 ) As 審核狀態
, (Case When P1.acmYear Is Null Then '有明細資料無主檔'
		When PV1.acmYear Is Null Then '無明細資料有主檔'
		Else
			''
		End
		) As 資料狀況
, M.acmWorkUserNo
, CAST((YEAR(M.acmDate)-1911) AS varchar)+'/'+cast(month(M.acmDate) as varchar)+'/'+cast(day(M.acmDate) as varchar) AS acmDate
From actPayVisa1 PV1 
Full Join actPay1 P1 On P1.acmYear=PV1.acmYear And P1.acmNo=IsNull(PV1.acmNoPrv, PV1.acmNo )And P1.acpPayYear=PV1.acpPayYear And P1.acpPayNo=PV1.acpPayNo And P1.acpPayNo1=PV1.acpPayNo1
Left Join actMain M On M.acmYear= ISNULL(P1.acmYear, PV1.acmYear) And M.acmNo=ISNULL(P1.acmNo, IsNull(PV1.acmNoPrv, PV1.acmNo))
Left Join actMain1 M1 on M1.acmYear=IsNull(P1.acmYear, PV1.acmYear) And M1.acmNo= ISNULL(P1.acmNo,ISNULL(PV1.acmNoPrv, PV1.acmNo)) And M1.acmNo1=PV1.acmNo1 
Left Join actPayVisa PV On PV.acmYear=PV1.acmYear And PV.acmNo=PV1.acmNo And PV.acvNo=PV1.acvNo 
And PV.acmNo1=PV1.acmNo1 And PV.acvNo1=PV1.acvNo1 
And PV.acmNo2=PV1.acmNo2 And PV.acvNo2=PV1.acvNo2 
And PV.acpPayYear=PV1.acpPayYear And PV.acpPayNo=PV1.acpPayNo And PV.acvSubNo=PV.acvSubNo



Where IsNull(P1.acmYear, PV1.acmYear) =@acmYear  
And (ISNULL(P1.acpPassFlag, '0')<>'1' Or P1.acmNo Is Null Or PV1.acmNo Is Null)


--===↑↑↑取轉正未審核資料，或是資料異常(有主檔沒明細，或是有明細但沒主檔)=======================================================================================


) DS 
WHERE acmYear=@acmYear
  AND ISNULL(acvBgtSourceCode,'')=ISNULL(@acvBgtSourceCode,ISNULL(acvBgtSourceCode,''))
  AND ISNULL(acvAccKind,'')=ISNULL(@acvAccKind,ISNULL(acvAccKind,''))
  AND ISNULL(acvBgtDepCode,'')=ISNULL(@acvBgtDepCode,ISNULL(acvBgtDepCode,''))
  AND isnull(acmWorkUnitNo,'')=isnull(@acmWorkUnitNo,ISNULL(acmWorkUnitNo,''))
  AND isnull(acmWordNum,'')=isnull(@acmWordNum,ISNULL(acmWordNum,''))
  AND isnull(acmWorkUserNo,'')=isnull(@acmWorkUserNo,ISNULL(acmWorkUserNo,''))
  AND isnull(acvPlanCode,'') Like isnull(@acvPlanCode,'')+'%'
  AND isnull(acvOutlayCode,'') Like isnull(@acvOutlayCode,'')+'%'
  AND isnull(acmMemo,'') LIKE '%'+isnull(@acmMemo,ISNULL(acmMemo,''))+'%'
  AND isnull(DataKind,'')=isnull(@DataKind,ISNULL(DataKind,''))



