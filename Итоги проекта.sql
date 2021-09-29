SELECT 
  [A0Proj].Mark AS [Шифр проекта],
  [SSRTotal].Estimate_S AS [ССР Сметная стоимость ССР(Проекта) строительные], 
  [SSRTotal].Estimate_M AS [ССР Сметная стоимость ССР(Проекта) монтажные], 
  [SSRTotal].Estimate_E AS [ССР Сметная стоимость ССР(Проекта) оборудование], 
  [SSRTotal].Estimate_O AS [ССР Сметная стоимость ССР(Проекта) прочие]
FROM [A0Proj]
	-- Итоги по составляющим
	LEFT JOIN [SSRTotal] ON SSRTotal.ProjID = [A0Proj].ProjID 
		AND [A0Proj].TotalID = [A0Proj].TotalID
	-- Порядок Проектов
	LEFT JOIN [ProjOrder] ON [A0Proj].ProjID = [ProjOrder].ProjID 
WHERE [A0Proj].IncludeInTotals = 1 -- Включать Проект в итоги комплекса (0, 1)
  AND [A0Proj].ProjId = 221 -- ИД проекта
  --AND [A0Proj].GUID =  -- GUID проекта


