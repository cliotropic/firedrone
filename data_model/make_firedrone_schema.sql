/*
Created: 7/26/2018
Modified: 7/26/2018
Model: Oracle 12c Release 2
Database: Oracle 12c Release 2
*/


-- Create tables section -------------------------------------------------

-- Table Asset

CREATE TABLE "Asset"(
  "Asset_Id" Integer DEFAULT 40 NOT NULL,
  "Asset_Name" NVarchar2(60),
  "Serial_Number" NVarchar2(50),
  "Make" NVarchar2(60),
  "Model" NVarchar2(50),
  "Device_Id" Integer DEFAULT 50
)
/

-- Create indexes for table Asset

CREATE INDEX "IX_Relationship9" ON "Asset" ("Device_Id")
/

-- Add keys for table Asset

ALTER TABLE "Asset" ADD CONSTRAINT "Key1" PRIMARY KEY ("Asset_Id")
/

-- Table Location

CREATE TABLE "Location"(
  "Location_Id" Integer DEFAULT 50 NOT NULL,
  "Coordinate_X" Float(126),
  "Coordinate_Y" Float(126),
  "Coordinate_Z" Float(126)
)
/

-- Add keys for table Location

ALTER TABLE "Location" ADD CONSTRAINT "Key2" PRIMARY KEY ("Location_Id")
/

-- Table Observation

CREATE TABLE "Observation"(
  "Observation_Id" Integer DEFAULT 50 NOT NULL,
  "Value" NVarchar2(50),
  "Event_Timestamp" Timestamp(6),
  "Created_Timestamp" Timestamp(6),
  "Asset_Id" Integer DEFAULT 40,
  "ObservationType_Id" Integer DEFAULT 50
)
/

-- Create indexes for table Observation

CREATE INDEX "IX_Relationship3" ON "Observation" ("Asset_Id")
/

CREATE INDEX "IX_Relationship5" ON "Observation" ("ObservationType_Id")
/

-- Add keys for table Observation

ALTER TABLE "Observation" ADD CONSTRAINT "Key3" PRIMARY KEY ("Observation_Id")
/

-- Table Observation_Type

CREATE TABLE "Observation_Type"(
  "ObservationType_Id" Integer DEFAULT 50 NOT NULL,
  "ObservationType_Name" NVarchar2(60),
  "UOM_Id" Integer DEFAULT 50
)
/

-- Create indexes for table Observation_Type

CREATE INDEX "IX_Relationship11" ON "Observation_Type" ("UOM_Id")
/

-- Add keys for table Observation_Type

ALTER TABLE "Observation_Type" ADD CONSTRAINT "Key4" PRIMARY KEY ("ObservationType_Id")
/

-- Table UnitOfMeasure

CREATE TABLE "UnitOfMeasure"(
  "UOM_Id" Integer DEFAULT 50 NOT NULL,
  "UOM_Name" NVarchar2(30)
)
/

-- Add keys for table UnitOfMeasure

ALTER TABLE "UnitOfMeasure" ADD CONSTRAINT "Key5" PRIMARY KEY ("UOM_Id")
/

-- Table Device

CREATE TABLE "Device"(
  "Device_Id" Integer DEFAULT 50 NOT NULL,
  "Roll" NVarchar2(30),
  "Pitch" NVarchar2(30),
  "Yaw" NVarchar2(30),
  "% of Battery Present" Float(126),
  "Location_Id" Integer DEFAULT 50,
  "Device_Type" NVarchar2(60)
)
/

-- Create indexes for table Device

CREATE INDEX "IX_Relationship10" ON "Device" ("Location_Id")
/

-- Add keys for table Device

ALTER TABLE "Device" ADD CONSTRAINT "Key6" PRIMARY KEY ("Device_Id")
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Observation" ADD CONSTRAINT "Asset Genrate Observation" FOREIGN KEY ("Asset_Id") REFERENCES "Asset" ("Asset_Id")
/


ALTER TABLE "Observation" ADD CONSTRAINT "Type of Observation" FOREIGN KEY ("ObservationType_Id") REFERENCES "Observation_Type" ("ObservationType_Id")
/


ALTER TABLE "Asset" ADD CONSTRAINT "Assets of Device" FOREIGN KEY ("Device_Id") REFERENCES "Device" ("Device_Id")
/


ALTER TABLE "Device" ADD CONSTRAINT "Location of Device" FOREIGN KEY ("Location_Id") REFERENCES "Location" ("Location_Id")
/


ALTER TABLE "Observation_Type" ADD CONSTRAINT "UOM of Observation Type" FOREIGN KEY ("UOM_Id") REFERENCES "UnitOfMeasure" ("UOM_Id")
/





