/*
Created: 7/26/2018
Modified: 7/30/2018
Model: Oracle 12c Release 2
Database: Oracle 12c Release 2
*/


-- Create tables section -------------------------------------------------

-- Table Sensor

CREATE TABLE "Sensor"(
  "Sensor_Id" Integer DEFAULT 40 NOT NULL,
  "Sensor_Name" NVarchar2(60),
  "Sensor_Version" NVarchar2(50),
  "Description" NVarchar2(80),
  "Asset_Id" Integer DEFAULT 50,
  "Min_Value" Integer,
  "Max_Value" Integer
)
/

-- Create indexes for table Sensor

CREATE INDEX "IX_Relationship3" ON "Sensor" ("Asset_Id")
/

-- Add keys for table Sensor

ALTER TABLE "Sensor" ADD CONSTRAINT "Key1" PRIMARY KEY ("Sensor_Id")
/

-- Table Location

CREATE TABLE "Location"(
  "Location_Id" Integer DEFAULT 50 NOT NULL,
  "Coordinate_X" Float(126),
  "Coordinate_Y" Float(126),
  "Coordinate_Z" Float(126),
  "Yoke" NVarchar2(30),
  "Yaw" NVarchar2(30),
  "Pitch" NVarchar2(30),
  "Timestamp" Timestamp(6),
  "Asset_Id" Integer DEFAULT 50
)
/

-- Create indexes for table Location

CREATE INDEX "IX_Relationship1" ON "Location" ("Asset_Id")
/

-- Add keys for table Location

ALTER TABLE "Location" ADD CONSTRAINT "Key2" PRIMARY KEY ("Location_Id")
/

-- Table Observation

CREATE TABLE "Observation"(
  "Observation_Id" Integer DEFAULT 50 NOT NULL,
  "Value" NVarchar2(50),
  "Created_Timestamp" Timestamp(6),
  "ObservationType_Id" Integer DEFAULT 50,
  "Observation_location_X" Float(126),
  "Observation_location_Y" Float(126),
  "Observation_location_Z" Float(126),
  "Sensor_Id" Integer DEFAULT 40
)
/

-- Create indexes for table Observation

CREATE INDEX "IX_Relationship5" ON "Observation" ("ObservationType_Id")
/

CREATE INDEX "IX_Relationship4" ON "Observation" ("Sensor_Id")
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

-- Table Asset

CREATE TABLE "Asset"(
  "Asset_Id" Integer DEFAULT 50 NOT NULL,
  "Asset_Type" NVarchar2(60),
  "Asset_Name" NVarchar2(60),
  "% of battery present" Float(126),
  "Make" NVarchar2(60),
  "Model" NVarchar2(60),
  "Serial_Number" NVarchar2(60),
  "Event_Timestamp" Timestamp(6)
)
/

-- Add keys for table Asset

ALTER TABLE "Asset" ADD CONSTRAINT "Key6" PRIMARY KEY ("Asset_Id")
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "Observation" ADD CONSTRAINT "Type of Observation" FOREIGN KEY ("ObservationType_Id") REFERENCES "Observation_Type" ("ObservationType_Id")
/


ALTER TABLE "Observation_Type" ADD CONSTRAINT "UOM of Observation Type" FOREIGN KEY ("UOM_Id") REFERENCES "UnitOfMeasure" ("UOM_Id")
/


ALTER TABLE "Location" ADD CONSTRAINT "Location of Asset" FOREIGN KEY ("Asset_Id") REFERENCES "Asset" ("Asset_Id")
/


ALTER TABLE "Sensor" ADD CONSTRAINT "Sensors mounted on Asset" FOREIGN KEY ("Asset_Id") REFERENCES "Asset" ("Asset_Id")
/


ALTER TABLE "Observation" ADD CONSTRAINT "Observation Collected by Sensor" FOREIGN KEY ("Sensor_Id") REFERENCES "Sensor" ("Sensor_Id")
/





