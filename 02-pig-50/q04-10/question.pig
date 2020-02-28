--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los data_truck y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
data_truck = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') 
    AS (driverId:INT, 
        truckId:INT,
        eventTime:CHARARRAY,
        eventType:CHARARRAY,
        longitude:DOUBLE,
        latitude:DOUBLE,
        eventKey:CHARARRAY,
        correlationId:CHARARRAY,
        driverName:CHARARRAY,
        routeId:CHARARRAY,
        routeDate:CHARARRAY);
DUMP data_truck;

limitador = LIMIT data_truck 10;
DUMP limitador;

subset1 = FOREACH limitador GENERATE driverId, truckId, eventTime;
DUMP subset1;

ordenar_data_truck = ORDER subset1 BY driverId, truckId, eventTime;
DUMP ordenar_data_truck;

STORE ordenar_data_truck INTO 'output' using PigStorage(',');