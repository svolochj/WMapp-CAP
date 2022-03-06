INSERT INTO "WM_model_reg_Movement" (
    Action,
    Date,
    Document,
    ID,
    Item,
    LocationFrom_ID,
    LocationTo_ID,
    Product_ID,
    Quantity,
    UOM_ID
  )
VALUES
  (
    'Action:NVARCHAR(3)',
    'Date:TIMESTAMP_TEXT',
    'Document:NVARCHAR(36)',
    'ID:NVARCHAR(36)',
    'Item:NVARCHAR(36)',
    'LocationFrom_ID:NVARCHAR(36)',
    'LocationTo_ID:NVARCHAR(36)',
    'Product_ID:NVARCHAR(36)',
    'Quantity:DECIMAL(17, 3)',
    'UOM_ID:NVARCHAR(36)'
  );