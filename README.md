# firedrone
Proof of concept project for using drones for emergency services.

## Project layout:

* **/data_model**: details about the data model, including an entity-relationship diagram and the SQL to generate the database.

## Data Model documentation:

* An Asset/platform is the device like quadcopter or truck, In our case, Crazy Flie. An asset has an ID, name (crazy-flie), make, model, serial-number and its type (for instance, drone).
  * An asset can have many sensors.
    * A sensor has an ID, Name, description and version.
  * Each asset will have a location that would include the x-, y-, z- coordinates and the attributes like pitch, yaw.
* An Observation Type is the variable like Pressure, Heat, Humidity which the sensor is going to detect.
  * Each Observation Type would have a Unit of measurement like kilojoules or meters or degrees.
  * An Observation would include Observation type, its value and the timestamp when observation was taken. Observation would also include the sensor ID and location id.
