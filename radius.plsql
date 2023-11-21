// Write a PL/SQL code block to calculate the area of a circle for a value of radius varying from 5 to 9. Store the radius and the 
corresponding values of calculated area in an empty table named areas, consisting of two columns, radius and area.

CREATE TABLE CALCULATE(Radius NUMBER, Area NUMBER);

SQL>  DECLARE
  2   radius_var number;
  3   area_var number;
  4   pi constant number:=3.14;
  5   BEGIN
  6   radius_var:=&radius_var;
  7   area_var:=pi*radius_var*radius_var;
  8   dbms_output.put_line('Area of circle for radius '||radius_var||':'||area_var);
  9   INSERT INTO CALCULATE VALUES(radius_var, area_var);
 10   COMMIT;
 11   END;
 12   /
Enter value for radius_var: 5
old   6:  radius_var:=&radius_var;
new   6:  radius_var:=5;

PL/SQL procedure successfully completed.

SQL>  DECLARE
  2   radius_var number;
  3   area_var number;
  4   pi constant number:=3.14;
  5   BEGIN
  6   radius_var:=&radius_var;
  7   area_var:=pi*radius_var*radius_var;
  8   dbms_output.put_line('Area of circle for radius '||radius_var||':'||area_var);
  9   INSERT INTO CALCULATE VALUES(radius_var, area_var);
 10   COMMIT;
 11   END;
 12   /
Enter value for radius_var: 6
old   6:  radius_var:=&radius_var;
new   6:  radius_var:=6;

PL/SQL procedure successfully completed.

SQL>  DECLARE
  2   radius_var number;
  3   area_var number;
  4   pi constant number:=3.14;
  5   BEGIN
  6   radius_var:=&radius_var;
  7   area_var:=pi*radius_var*radius_var;
  8   dbms_output.put_line('Area of circle for radius '||radius_var||':'||area_var);
  9   INSERT INTO CALCULATE VALUES(radius_var, area_var);
 10   COMMIT;
 11   END;
 12   /
Enter value for radius_var: 7
old   6:  radius_var:=&radius_var;
new   6:  radius_var:=7;

PL/SQL procedure successfully completed.

SQL>  DECLARE
  2   radius_var number;
  3   area_var number;
  4   pi constant number:=3.14;
  5   BEGIN
  6   radius_var:=&radius_var;
  7   area_var:=pi*radius_var*radius_var;
  8   dbms_output.put_line('Area of circle for radius '||radius_var||':'||area_var);
  9   INSERT INTO CALCULATE VALUES(radius_var, area_var);
 10   COMMIT;
 11   END;
 12   /
Enter value for radius_var: 8
old   6:  radius_var:=&radius_var;
new   6:  radius_var:=8;

PL/SQL procedure successfully completed.

SQL>  DECLARE
  2   radius_var number;
  3   area_var number;
  4   pi constant number:=3.14;
  5   BEGIN
  6   radius_var:=&radius_var;
  7   area_var:=pi*radius_var*radius_var;
  8   dbms_output.put_line('Area of circle for radius '||radius_var||':'||area_var);
  9   INSERT INTO CALCULATE VALUES(radius_var, area_var);
 10   COMMIT;
 11   END;
 12   /
Enter value for radius_var: 9
old   6:  radius_var:=&radius_var;
new   6:  radius_var:=9;

PL/SQL procedure successfully completed.

SQL> SELECT* FROM CALCULATE;

    RADIUS       AREA
---------- ----------
         
         5       78.5
         6     113.04
         7     153.86
         8     200.96
         9     254.34
