SELECT 
  [A0Proj].Mark AS [���� �������],
  [SSRTotal].Estimate_S AS [��� ������� ��������� ���(�������) ������������], 
  [SSRTotal].Estimate_M AS [��� ������� ��������� ���(�������) ���������], 
  [SSRTotal].Estimate_E AS [��� ������� ��������� ���(�������) ������������], 
  [SSRTotal].Estimate_O AS [��� ������� ��������� ���(�������) ������]
FROM [A0Proj]
	-- ����� �� ������������
	LEFT JOIN [SSRTotal] ON SSRTotal.ProjID = [A0Proj].ProjID 
		AND [A0Proj].TotalID = [A0Proj].TotalID
	-- ������� ��������
	LEFT JOIN [ProjOrder] ON [A0Proj].ProjID = [ProjOrder].ProjID 
WHERE [A0Proj].IncludeInTotals = 1 -- �������� ������ � ����� ��������� (0, 1)
  AND [A0Proj].ProjId = 221 -- �� �������
  --AND [A0Proj].GUID =  -- GUID �������


