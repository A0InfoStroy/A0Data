SELECT 
  [A0Proj].Mark AS [Шифр проекта],
  [OSTitle].Shifr AS [Шфир ОС],
  [LSTitle].Shifr AS [Шифр ЛС], 
  [LSStringTitle].Basing AS [Обоснование строки ЛС],
  [LSStringTitle].LSName AS [Наименование строки ЛС],
  [LSStrTotal].PZ
FROM [LSStringTitle]
	-- Итоги строки ЛС
	JOIN [LSStrTotal] ON [LSStringTitle].ProjID = [LSStrTotal].ProjID 
	  AND [LSStringTitle].LSTitleID = [LSStrTotal].LSTitleID 
	  AND [LSStringTitle].LSStrTotalID = [LSStrTotal].LSTID
	-- ЛС
	JOIN [LSTitle] ON [LSTitle].ProjID = [LSStringTitle].ProjID
		AND [LSTitle].LSTitleID = [LSStringTitle].LSTitleID
	-- ОС
	JOIN [OSTitle] ON [LSTitle].ProjID = [OSTitle].ProjID 
		AND [LSTitle].OSID = [OSTitle].OSTitleID	
	-- Проект
	JOIN [A0Proj] ON [LSTitle].ProjID = [A0Proj].ProjID
WHERE [A0Proj].ProjId = 253 -- ИД проекта
  AND [LSTitle].ActLSID = 0 -- Только ЛС

