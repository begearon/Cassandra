CREATE FUNCTION myMin(current int, candidate int) CALLED ON NULL INPUT RETURNS int LANGUAGE java AS 'if (current == null) return candidate; else return Math.min(current, candidate);' ;

CREATE AGGREGATE aggMin(int) SFUNC myMin STYPE int INITCOND null;

CREATE INDEX ON bibliography (authors);
 
SELECT aggMin ( year ) FROM bibliography WHERE authors CONTAINS 'Manoj Kumar';