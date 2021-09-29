SELECT 
  [A0Proj].Mark AS [���� �������],
  [OSTitle].Shifr AS [���� ��],
  [LSTitle].Shifr AS [���� ��], 
  [ActTitle].Shifr AS [���� ���], 
  [ActTotal].Estimate_S AS [9 ������� ��������� ������������], 
  [ActTotal].Estimate_M AS [9 ������� ��������� ���������],  
  [ActTotal].Estimate_E AS [9 ������� ��������� ������������], 
  [ActTotal].Estimate_O AS [9 ������� ��������� ������]
FROM [LSTitle] AS [ActTitle]
	-- ����� ���� �� ������������
	LEFT JOIN [LSTotal] AS [ActTotal] ON [ActTitle].ProjID = [ActTotal].ProjID 
		AND [ActTitle].LSTitleID = [ActTotal].LSTitleID
		AND [ActTitle].LSAllTotalID = [ActTotal].LSTotalID
	-- ������� �����
	LEFT JOIN [LSOrder] AS [ActOrder] ON [ActTitle].ProjID = [ActOrder].ProjID 
		AND [ActTitle].OSID = [ActOrder].OSTitleID
		AND [ActTitle].LSTitleID = [ActOrder].LSTitleID
	-- ������ ������
	LEFT JOIN [BusinessOper] ON [BusinessOper].busOpID = [ActTitle].BusOpID
	-- ��
	JOIN [LSTitle] ON [LSTitle].ProjID = [ActTitle].ProjID
		AND [LSTitle].OSID = [ActTitle].OSID
		AND [LSTitle].LSTitleID = [ActTitle].ActLSID
	-- ������� ��
	LEFT JOIN [LSOrder] ON [LSTitle].ProjID = [LSOrder].ProjID 
		AND [LSTitle].OSID = [LSOrder].OSTitleID
		AND [LSTitle].LSTitleID = [LSOrder].LSTitleID
	-- ��
	JOIN [OSTitle] ON [LSTitle].ProjID = [OSTitle].ProjID 
		AND [LSTitle].OSID = [OSTitle].OSTitleID
	-- ������� ��
	LEFT JOIN [OSOrder] ON  [OSTitle].ProjID = [OSOrder].ProjID 
		AND [OSTitle].OSTitleID = [OSOrder].OSTitleID
	-- ������
	JOIN [A0Proj] ON [LSTitle].ProjID = [A0Proj].ProjID
	-- ������� ��������
	LEFT JOIN [ProjOrder] ON [A0Proj].ProjID = [ProjOrder].ProjID 
WHERE [ActTitle].SmDUse IN (1) -- ��� ������ �����
  AND [LSTitle].SmDUse IN (0) -- ��� ������ ��
  AND [LSTitle].IncludeKind = 0 -- ����� ��������� ��������� ����� � ����� ��������� ����� ('' = 0, '�')
  AND [OSTitle].IncludeInTotals = 1 -- �������� �� � ����� �������
  AND [A0Proj].IncludeInTotals = 1 -- �������� ������ � ����� ���������
  AND [A0Proj].ProjId = 253 -- �� �������
  --AND [A0Proj].GUID =  -- GUID �������

-- ��� ������ SmDUse
--'��' = 0, '���', '�������',
    --'���-�������', '�� ��� ��', '���',
    --'��� �� �������',
    --'�������', '������� ��������',
    --'���������������� ������ ��������',
    --'������������', '��������������',
    --'���������������', '�����������', '�����������',
    --'��� ���� PM', '��� ���� PM'

