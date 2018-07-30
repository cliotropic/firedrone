# firedrone
Proof of concept project for using drones for emergency services.

## Project layout:

* **/data_model**: details about the data model, including an entity-relationship diagram and the SQL to generate the database.

## Data Model documentation:

* An Asset is a device like a quadcopter or truck--- in our simplest case, Crazy Flie. An asset has an ID, name (crazy-flie), make, model, serial-number, event timestamp, and type (for instance, "drone").
  * An asset can have many sensors.
    * A sensor has an ID, Name, description, and version. It also has a minimum and maximum (labeled as _min_temperature_ and _max_temperature_ in the current version, though this will change.)
    * Some sensors are mounted to drones. Other sensors are standalone assets at fixed locations (like smoke detectors in buildings.)
  * Each asset has a location that includes the x-, y-, z- coordinates and the attributes like yoke, yaw, and pitch. For a drone, these are point-in-time details.
* An Observation Type is the variable like Pressure, Heat, Humidity which the sensor is going to detect.
  * Each Observation Type has a Unit of Measurement like kilojoules or meters or degrees.
  * An Observation includes Observation type, its value, the location of the observation (X, Y, Z), and the timestamp when the  observation was taken. Observation also includes the sensor ID.
