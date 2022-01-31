SELECT
  [A0Proj].Mark AS [Шифр проекта],
  [OSTitle].Shifr AS [Шфир ОС],
  [LSTitle].Shifr AS [Шифр ЛС], 
  [ActTitle].Shifr AS [Шифр Акт], 
  [ActStringTitle].Basing AS [Обоснование строки Акта],
  [ActStringTitle].LSName AS [Наименование строки Акта],
  [ActStrTotal].PZ
FROM [LSStringTitle] AS [ActStringTitle] 
   -- Заголовок акта
    JOIN [LSTitle] AS [ActTitle] ON [ActTitle].ProjID = [ActStringTitle].ProjID 
	  AND [ActTitle].LSTitleID = [ActStringTitle].LSTitleID
	-- Итоги строки акта
	JOIN [LSStrTotal] AS [ActStrTotal] ON [ActStringTitle].ProjID = [ActStrTotal].ProjID 
	  AND [ActStringTitle].LSTitleID = [ActStrTotal].LSTitleID 
	  AND [ActStringTitle].LSStrTotalID = [ActStrTotal].LSTID
	-- ЛС
	JOIN [LSTitle] ON [LSTitle].ProjID = [ActTitle].ProjID
		AND [LSTitle].OSID = [ActTitle].OSID
		AND [LSTitle].LSTitleID = [ActTitle].ActLSID
	-- ОС
	JOIN [OSTitle] ON [LSTitle].ProjID = [OSTitle].ProjID 
		AND [LSTitle].OSID = [OSTitle].OSTitleID	
	-- Проект
	JOIN [A0Proj] ON [LSTitle].ProjID = [A0Proj].ProjID
WHERE [A0Proj].ProjId = 253 -- ИД проекта
	AND [ActTitle].ActLSID > 0 -- Только акты


