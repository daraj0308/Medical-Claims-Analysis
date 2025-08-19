CREATE TABLE claims_header (
  ClaimID INT PRIMARY KEY,
  MemberID VARCHAR(16),
  ProviderID VARCHAR(16),
  ClaimType VARCHAR(16),
  PlaceOfService VARCHAR(32),
  DateOfService DATE,
  Billed DECIMAL(10,2),
  Allowed DECIMAL(10,2),
  Paid DECIMAL(10,2),
  DeniedFlag BOOLEAN,
  DenialCode VARCHAR(8),
  DX1 VARCHAR(10)
);
