SELECT 
  [A0Proj].Mark AS [Шифр проекта],
  [OSTitle].Shifr AS [Шфир ОС],
  [LSTitle].Shifr AS [Шифр ЛС], 
  [LSTotal].Estimate_S AS [9 Сметная стоимость строительные], 
  [LSTotal].Estimate_M AS [9 Сметная стоимость монтажные], 
  [LSTotal].Estimate_E AS [9 Сметная стоимость оборудование],
  [LSTotal].Estimate_O AS [9 Сметная стоимость прочие]
FROM [LSTitle]
	-- Итоги по составляющим
	LEFT JOIN [LSTotal] ON [LSTitle].ProjID = [LSTotal].ProjID 
		AND [LSTitle].LSTitleID = [LSTotal].LSTitleID
		AND [LSTitle].LSAllTotalID = [LSTotal].LSTotalID
	-- Итоги суммарные в 2.10
	--LEFT JOIN [LSTotalView] ON [LSTitle].ProjID = [LSTotalView].ProjID 
		--AND [LSTitle].LSTitleID = [LSTotalView].LSTitleID 
		--AND [LSTitle].LSAllTotalID = [LSTotalView].LSTotalID
	-- Порядок ЛС
	LEFT JOIN [LSOrder] ON [LSTitle].ProjID = [LSOrder].ProjID 
	    AND [LSTitle].OSID = [LSOrder].OSTitleID
		AND [LSTitle].LSTitleID = [LSOrder].LSTitleID
	-- Бизнес стадии
	LEFT JOIN [BusinessOper] ON [BusinessOper].busOpID = [LSTitle].BusOpID
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
WHERE [LSTitle].SmDUse IN (0) -- Тип данных
  AND [LSTitle].IncludeKind = 0 -- Режим включения Локальной сметы в итоги Объектной сметы ('' = 0, 'И')
  AND [OSTitle].IncludeInTotals = 1 -- Включать ОС в итоги проекта
  AND [A0Proj].IncludeInTotals = 1 -- Включать Проект в итоги комплекса
  AND [A0Proj].ProjId = 221 -- ИД проекта
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

