-- Итоги ОС
SELECT 
  [A0Proj].Mark AS [Шифр проекта],
  [OSTitle].Shifr AS [Шифр ОС],
  [OSTitle].OSName AS [Наименование ОС],
  [OSTotal].Estimate_S AS [ОС Сметная стоимость ОС строительные], 
  [OSTotal].Estimate_M AS [ОС Сметная стоимость ОС монтажные], 
  [OSTotal].Estimate_E AS [ОС Сметная стоимость ОС оборудование], 
  [OSTotal].Estimate_O AS [ОС Сметная стоимость ОС прочие]
FROM [OSTitle]
	-- Проект
	JOIN [A0Proj] ON [OSTitle].ProjID = [A0Proj].ProjId
	-- Итоги по составляющим
	LEFT JOIN [OSTotal] ON [OSTotal].ProjID = [OSTitle].ProjID 
		AND [OSTotal].OSTotalID = [OSTitle].AllTotalID
WHERE [A0Proj].IncludeInTotals = 1 -- Включать Проект в итоги комплекса (0, 1)
	AND [OSTitle].IncludeInTotals = 1 -- Включать ОС в итоги Проекта (0, 1)
	AND [OSTitle].ProjID = 221 -- ИД проекта	 
  --AND [OSTitle].GUID =  -- GUID ОС