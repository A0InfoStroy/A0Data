-- ����� ��
SELECT 
  [A0Proj].Mark AS [���� �������],
  [OSTitle].Shifr AS [���� ��],
  [OSTitle].OSName AS [������������ ��],
  [OSTotal].Estimate_S AS [�� ������� ��������� �� ������������], 
  [OSTotal].Estimate_M AS [�� ������� ��������� �� ���������], 
  [OSTotal].Estimate_E AS [�� ������� ��������� �� ������������], 
  [OSTotal].Estimate_O AS [�� ������� ��������� �� ������]
FROM [OSTitle]
	-- ������
	JOIN [A0Proj] ON [OSTitle].ProjID = [A0Proj].ProjId
	-- ����� �� ������������
	LEFT JOIN [OSTotal] ON [OSTotal].ProjID = [OSTitle].ProjID 
		AND [OSTotal].OSTotalID = [OSTitle].AllTotalID
WHERE [A0Proj].IncludeInTotals = 1 -- �������� ������ � ����� ��������� (0, 1)
	AND [OSTitle].IncludeInTotals = 1 -- �������� �� � ����� ������� (0, 1)
	AND [OSTitle].ProjID = 221 -- �� �������	 
  --AND [OSTitle].GUID =  -- GUID ��