SELECT ile.[Item No_] AS no_item, ile.[Posting Date] AS posting_date, ile.[Document No_] AS document_no, 
ile.[Location Code] AS location_code, ile.[Document Date] AS document_date, 
ile.[External Document No_] AS external_document_no, ile.[No_ Series] AS no_series, 
ile.[Lot No_] AS lot_no, ssl.[No_] AS no, ssl.[Sell-to Customer No_] AS no_customer, 
ssh.[Bill-to Name] AS rumah_sakit, ssh.[Bill-to Address] AS alamat, ssh.[Bill-to City] AS city, 
ssh.[Order No_] AS order_no, ssl.[Location Code] AS location_code_1, ssl.[Description] AS description, 
ssl.[Quantity] AS quantity, ssl.[Unit of Measure] AS uom

FROM dbo."PT_ SINAR RODA UTAMA$Item Ledger Entry" AS ile

LEFT JOIN dbo."PT_ SINAR RODA UTAMA$Sales Shipment Header" AS ssh
ON ile.[External Document No_] = ssh.[No_]

LEFT JOIN dbo."PT_ SINAR RODA UTAMA$Sales Shipment Line" AS ssl
ON ssh.[No_] = ssl.[Document No_]

WHERE ile.[Document No_] LIKE '%IJS%'
AND ssl.[Quantity] > 0

ORDER BY ile.[Document No_]