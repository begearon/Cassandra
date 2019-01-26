CREATE OR REPLACE FUNCTION countGroupState ( state map<text,int>, val text ) CALLED ON NULL INPUT RETURNS map<text,int> LANGUAGE java AS 
  'state.put(val, state.getOrDefault(val, 0) + 1); return state;'; 
  
CREATE OR REPLACE AGGREGATE countGroup(text) SFUNC countGroupState STYPE map<text,int> INITCOND {};

CREATE INDEX ON bibliography (year);

SELECT countGroup(type) FROM bibliography WHERE year = 1999;