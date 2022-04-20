templates = { 
    "create": 
    {
    "header": "CREATE TABLE MX3.{table}_EXT (\n{fields}\n)",
    "body": """
ORGANIZATION EXTERNAL (
TYPE ORACLE_LOADER
DEFAULT DIRECTORY {folder}
ACCESS PARAMETERS (
RECORDS DELIMITED BY NEWLINE
BADFILE CRR_LOGS:'{table}_EXT_%a_%p.bad'
LOGFILE CRR_LOGS:'{table}_EXT_%a_%p.log'
SKIP 1
FIELDS TERMINATED BY ';'
MISSING FIELD VALUES ARE NULL (
{fields}
)
)""",
    "footer": """
  LOCATION ('{csv}')
)
PARALLEL
REJECT LIMIT UNLIMITED;"""
    }, 
    "insert":
    {
    "header": """CREATE OR REPLACE PROCEDURE UPDATE_{table} IS
T1 PLS_INTEGER;
BEGIN
T1 := DBMS_UTILITY.GET_TIME;
INSERT INTO MX3.{table}{ext}
(
TIMESTAMP, 
M_IDENTITY,
{fields}
)""",
    "body":"""
SELECT
0,
0,
{fields} """,
    "footer": """from MX3.{table}_EXT;
DBMS_OUTPUT.PUT_LINE(  '{table}: ' || SQL%ROWCOUNT || ' rows inserted in ' || (DBMS_UTILITY.GET_TIME - T1)/100 || ' seconds');
END;
"""
    }
}


