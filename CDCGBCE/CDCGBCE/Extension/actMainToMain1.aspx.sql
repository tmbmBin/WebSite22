
FROM actMain M

	INNER JOIN
	(
		SELECT *,
			(SELECT SUM(acvMoney) + ISNULL(SUM(acvAdjustMoney), 0) AS acvMoney_Out
				FROM actVisa1 V1	--簽證已再簽
--					INNER JOIN actMain1 M1 ON M1.acmYear = V1.acmYear AND M1.acmNo = ISNULL(V1.acmNoPrv,V1.acmNo) AND M1.acmNo1 = V1.acmNo1
--						AND (CASE WHEN M1.acmPassFlag = '1' THEN M1.acmPassDate ELSE M1.acmDate END) <= '2009/06/30' AND M1.acmPassFlag = '1'	--[再簽日期過濾條件]
				WHERE (acmYear = V.acmYear) AND (acmNo = V.acmNo) AND (acvNo = V.acvNo)) AS acvMoney_Out_V1
		FROM actVisa V

	) V ON M.acmYear = V.acmYear AND M.acmNo = V.acmNo
		AND M.acmYear = @acmYear
		AND {D_actWordNum}	--[可再簽過濾條件]
--		AND (CASE WHEN M.acmPassFlag = '1' THEN M.acmPassDate ELSE M.acmDate END) <= '2009/06/30' AND M.acmPassFlag = '1' --[簽證日期過濾條件]
		AND V.acvMoney_Out_V1 <> V.acvMoney
		AND NOT EXISTS (SELECT * FROM actVisa2 AS V2 WHERE (acmYear = V.acmYear) AND (acmNo = V.acmNo) AND (acvNo = V.acvNo) AND (acmNo1 = 0) AND (acvNo1 = 0))
		AND NOT EXISTS (SELECT * FROM actPayVisa AS PV WHERE (acmYear = V.acmYear) AND (acmNo = V.acmNo) AND (acvNo = V.acvNo) AND (acmNo1 = 0) AND (acvNo1 = 0) AND (acmNo2 = 0) AND (acvNo2 = 0))

--	RIGHT OUTER JOIN
	INNER JOIN
	(
		actMain ZM INNER JOIN actVisa ZV ON ZM.acmYear = ZV.acmYear AND ZM.acmNo = ZV.acmNo
			AND NOT EXISTS (SELECT * FROM actVisa1 V1 WHERE (acmYear = ZV.acmYear) AND (acmNo = ZV.acmNo))
			AND NOT EXISTS (SELECT * FROM actVisa2 V2 WHERE (acmYear = ZV.acmYear) AND (acmNo = ZV.acmNo))
			AND NOT EXISTS (SELECT * FROM actPayVisa PV WHERE (acmYear = ZV.acmYear) AND (acmNo = ZV.acmNo))
--			AND ZM.acmWordNum = ISNULL(ZM.acmSourWordNum,ZM.acmWordNum)	--不可為加簽
			AND ZM.acmYear = @acmYear
			AND {S_actWordNum}	--[簽證過濾條件]

	) ON ZV.acmYear = V.acmYear
		AND ZV.acmNo <> V.acmNo
		AND ISNULL(ZV.acvOutlayYear, V.acvOutlayYear) = ISNULL(V.acvOutlayYear, ZV.acvOutlayYear)
		AND ZV.acvPlanCode LIKE ISNULL(V.acvPlanCode, '') + '%' AND ZV.acvOutlayCode LIKE ISNULL(V.acvOutlayCode, '') + '%'
		AND ZV.acvBizCode LIKE ISNULL(V.acvBizCode, '') + '%' AND ZV.acvBgtSourceCode LIKE ISNULL(V.acvBgtSourceCode, '%')
		AND ZV.acvAccKind LIKE ISNULL(V.acvAccKind, '%')
		AND ZV.acvMoney <= (V.acvMoney - ISNULL(V.acvMoney_Out_V1, 0))

		AND (
				SELECT SUM(Z.acvMoney) FROM actVisa Z WHERE Z.acmYear = ZV.acmYear AND Z.acmNo = ZV.acmNo
					AND ISNULL(Z.acvOutlayYear,V.acvOutlayYear) = ISNULL(V.acvOutlayYear,Z.acvOutlayYear)
					AND Z.acvPlanCode LIKE ISNULL(V.acvPlanCode,'')+'%'
					AND Z.acvOutlayCode LIKE ISNULL(V.acvOutlayCode,'')+'%'
					AND Z.acvBizCode LIKE ISNULL(V.acvBizCode,'')+'%'
					AND Z.acvBgtSourceCode LIKE ISNULL(V.acvBgtSourceCode,'%')
					AND Z.acvAccKind LIKE ISNULL(V.acvAccKind,'%')
			)
			<=
			(
				(
					SELECT SUM(Z.acvMoney) FROM actVisa Z JOIN actMain ZP ON Z.acmYear=ZP.acmYear AND Z.acmNo=ZP.acmNo
					WHERE Z.acmYear=V.acmYear
						AND ISNULL(ZP.acmTopWordNum,ISNULL(ZP.acmSourWordNum,ZP.acmWordNum))=ISNULL(M.acmTopWordNum,ISNULL(M.acmSourWordNum,M.acmWordNum))
--						AND Z.acmNo=V.acmNo
						AND ISNULL(Z.acvOutlayYear,V.acvOutlayYear) = ISNULL(V.acvOutlayYear,Z.acvOutlayYear)
						AND Z.acvPlanCode LIKE ISNULL(V.acvPlanCode,'')+'%'
						AND Z.acvOutlayCode LIKE ISNULL(V.acvOutlayCode,'')+'%'
						AND Z.acvBizCode LIKE ISNULL(V.acvBizCode,'')+'%'
						AND Z.acvBgtSourceCode LIKE ISNULL(V.acvBgtSourceCode,'%')
						AND Z.acvAccKind LIKE ISNULL(V.acvAccKind,'%')
				)
				- ISNULL(
					(
						SELECT SUM(Z1.acvMoney)+ISNULL(SUM(Z1.acvAdjustMoney),0) FROM actVisa Z
							JOIN actMain ZP ON Z.acmYear=ZP.acmYear AND Z.acmNo=ZP.acmNo
							JOIN  actVisa1 Z1 ON  Z1.acmYear=Z.acmYear And Z1.acmNo=Z.acmNo And Z1.acvNo=Z.acvNo
						WHERE Z.acmYear=V.acmYear
							AND ISNULL(ZP.acmTopWordNum,ISNULL(ZP.acmSourWordNum,ZP.acmWordNum))=ISNULL(M.acmTopWordNum,ISNULL(M.acmSourWordNum,M.acmWordNum))
--							AND Z.acmNo=V.acmNo
							AND ISNULL(Z.acvOutlayYear,V.acvOutlayYear) = ISNULL(V.acvOutlayYear,Z.acvOutlayYear)
							AND Z.acvPlanCode LIKE ISNULL(V.acvPlanCode,'')+'%'
							AND Z.acvOutlayCode LIKE ISNULL(V.acvOutlayCode,'')+'%'
							AND Z.acvBizCode LIKE ISNULL(V.acvBizCode,'')+'%'
							AND Z.acvBgtSourceCode LIKE ISNULL(V.acvBgtSourceCode,'%')
							AND Z.acvAccKind LIKE ISNULL(V.acvAccKind,'%')
					)
				, 0)
			)
