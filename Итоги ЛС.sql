SELECT 
  [A0Proj].Mark AS [���� �������],
  [OSTitle].Shifr AS [���� ��],
  [LSTitle].Shifr AS [���� ��], 
  [LSTotal].Estimate_S AS [9 ������� ��������� ������������], 
  [LSTotal].Estimate_M AS [9 ������� ��������� ���������], 
  [LSTotal].Estimate_E AS [9 ������� ��������� ������������],
  [LSTotal].Estimate_O AS [9 ������� ��������� ������]
FROM [LSTitle]
	-- ����� �� ������������
	LEFT JOIN [LSTotal] ON [LSTitle].ProjID = [LSTotal].ProjID 
		AND [LSTitle].LSTitleID = [LSTotal].LSTitleID
		AND [LSTitle].LSAllTotalID = [LSTotal].LSTotalID
	-- ����� ��������� � 2.10
	--LEFT JOIN [LSTotalView] ON [LSTitle].ProjID = [LSTotalView].ProjID 
		--AND [LSTitle].LSTitleID = [LSTotalView].LSTitleID 
		--AND [LSTitle].LSAllTotalID = [LSTotalView].LSTotalID
	-- ������� ��
	LEFT JOIN [LSOrder] ON [LSTitle].ProjID = [LSOrder].ProjID 
	    AND [LSTitle].OSID = [LSOrder].OSTitleID
		AND [LSTitle].LSTitleID = [LSOrder].LSTitleID
	-- ������ ������
	LEFT JOIN [BusinessOper] ON [BusinessOper].busOpID = [LSTitle].BusOpID
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
WHERE [LSTitle].SmDUse IN (0) -- ��� ������
  AND [LSTitle].IncludeKind = 0 -- ����� ��������� ��������� ����� � ����� ��������� ����� ('' = 0, '�')
  AND [OSTitle].IncludeInTotals = 1 -- �������� �� � ����� �������
  AND [A0Proj].IncludeInTotals = 1 -- �������� ������ � ����� ���������
  AND [A0Proj].ProjId = 221 -- �� �������
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

