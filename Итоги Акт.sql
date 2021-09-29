SELECT 
  [A0Proj].Mark AS [Шифр проекта],
  [OSTitle].Shifr AS [Шфир ОС],
  [LSTitle].Shifr AS [Шифр ЛС], 
  [ActTitle].Shifr AS [Шифр Акт], 
  [ActTotal].Estimate_S AS [9 Сметная стоимость строительные], 
  [ActTotal].Estimate_M AS [9 Сметная стоимость монтажные],  
  [ActTotal].Estimate_E AS [9 Сметная стоимость оборудование], 
  [ActTotal].Estimate_O AS [9 Сметная стоимость прочие]
FROM [LSTitle] AS [ActTitle]
	-- Итоги акта по составляющим
	LEFT JOIN [LSTotal] AS [ActTotal] ON [ActTitle].ProjID = [ActTotal].ProjID 
		AND [ActTitle].LSTitleID = [ActTotal].LSTitleID
		AND [ActTitle].LSAllTotalID = [ActTotal].LSTotalID
	-- Порядок актов
	LEFT JOIN [LSOrder] AS [ActOrder] ON [ActTitle].ProjID = [ActOrder].ProjID 
		AND [ActTitle].OSID = [ActOrder].OSTitleID
		AND [ActTitle].LSTitleID = [ActOrder].LSTitleID
	-- Бизнес стадии
	LEFT JOIN [BusinessOper] ON [BusinessOper].busOpID = [ActTitle].BusOpID
	-- ЛС
	JOIN [LSTitle] ON [LSTitle].ProjID = [ActTitle].ProjID
		AND [LSTitle].OSID = [ActTitle].OSID
		AND [LSTitle].LSTitleID = [ActTitle].ActLSID
	-- Порядок ЛС
	LEFT JOIN [LSOrder] ON [LSTitle].ProjID = [LSOrder].ProjID 
		AND [LSTitle].OSID = [LSOrder].OSTitleID
		AND [LSTitle].LSTitleID = [LSOrder].LSTitleID
	-- ОС
	JOIN [OSTitle] ON [LSTitle].ProjID = [OSTitle].ProjID 
		AND [LSTitle].OSID = [OSTitle].OSTitleID
	-- Порядок ОС
	LEFT JOIN [OSOrder] ON  [OSTitle].ProjID = [OSOrder].ProjID 
		AND [OSTitle].OSTitleID = [OSOrder].OSTitleID
	-- Проект
	JOIN [A0Proj] ON [LSTitle].ProjID = [A0Proj].ProjID
	-- Порядок Проектов
	LEFT JOIN [ProjOrder] ON [A0Proj].ProjID = [ProjOrder].ProjID 
WHERE [ActTitle].SmDUse IN (1) -- Тип данных актов
  AND [LSTitle].SmDUse IN (0) -- Тип данных ЛС
  AND [LSTitle].IncludeKind = 0 -- Режим включения Локальной сметы в итоги Объектной сметы ('' = 0, 'И')
  AND [OSTitle].IncludeInTotals = 1 -- Включать ОС в итоги проекта
  AND [A0Proj].IncludeInTotals = 1 -- Включать Проект в итоги комплекса
  AND [A0Proj].ProjId = 253 -- ИД проекта
  --AND [A0Proj].GUID =  -- GUID проекта

-- Тип данных SmDUse
--'ЛС' = 0, 'Акт', 'Затраты',
    --'Акт-затрата', 'ЛС как ОС', 'ПИР',
    --'Акт на остатки',
    --'Прогноз', 'Остаток прогноза',
    --'Сверхнормативный расход ресурсов',
    --'Утвержденная', 'Неутвержденная',
    --'Предварительная', 'Укрупненная', 'Калькуляция',
    --'Акт план PM', 'Акт факт PM'

