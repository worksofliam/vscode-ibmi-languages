**free
  // https://github.com/barrettotte/vscode-ibmi-languages/issues/54


  // Built in Global variables - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzgvars.htm
  Exec SQL
    CLIENT_HOST CLIENT_IPADDR CLIENT_PORT JOB_NAME PACKAGE_NAME PACKAGE_SCHEMA PACKAGE_VERSION 
    PROCESS_ID ROUTINE_SCHEMA ROUTINE_SPECIFIC_NAME ROUTINE_TYPE SERVER_MODE_JOB_NAME THREAD_ID
  ;


  // Built in functions - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzch2func.htm
  //    aggregate - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzcolfunc.htm
  //    table     - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafztblfunc.htm
  //    scalar    - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzscale.htm
  //
  // went with generic function regex => match identifier and open parenthesis
  Exec SQL
    select myfunc(somefield) into :myds.myField
    from SOMELIB/MYPF
    where 1=1
    limit 10
    order by 1 desc
    ;

  
  // reserved schema names - https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzresschem.htm
  // went with generic schema => identifier + (.|/) (object)?
  exec SQL
    QSYS2.  SYSCAT.  SYSFUN/  SYSIBM/  SYSIBMADM.  SYSPROC.  SYSPUBLIC/  SYSSTAT/  SYSTEM.
  ;
  exec sql
    select * from QSYS2.SYSPARTITIONSTAT where SYSTEM_TABLE_SCHEMA='BOLIB';
  
  exec sql
    select Mylib.myFunc(a.mfld) from MyOtherLib/mytable a;


  // reserved words => https://www.ibm.com/support/knowledgecenter/ssw_ibm_i_72/db2/rbafzwordsre.htm
  exec sql
    ABSENT ACCORDING ACCTNG ACTION ACTIVATE ADD ALIAS ALL ALLOCATE ALLOW ALTER AND ANY APPEND APPLNAME 
    ARRAY ARRAY_AGG AS ASC ASENSITIVE ASSOCIATE AT ATOMIC ATTRIBUTES AUTHORIZATION AUTONOMOUS  BEFORE 
    BEGIN BETWEEN BINARY BIND BIT BUFFERPOOL BY CACHE CALL CALLED CARDINALITY CASE CAST CCSID CHAR 
    CHARACTER CHECK CL CLOSE CLUSTER COLLECT COLLECTION COLUMN COMMENT COMMIT COMPACT COMPRESS CONCAT 
    CONCURRENT CONDITION CONNECT  CONNECT_BY_ROOT  CONNECTION  CONSTANT  CONSTRAINT CONTAINS CONTENT 
    CONTINUE COPY COUNT COUNT_BIG CREATE CREATEIN  CROSS CUBE CURRENT CURRENT_DATE CURRENT_PATH 
    CURRENT_SCHEMA CURRENT_SERVER CURRENT_TIME CURRENT_TIMESTAMP CURRENT_TIMEZONE CURRENT_USER CURSOR 
    CYCLE DATA DATABASE DATAPARTITIONNAME DATAPARTITIONNUM DATE DAY DAYS DBINFO DBPARTITIONNAME 
    DBPARTITIONNUM DB2GENERAL DB2GENRL DB2SQL DEACTIVATE DEALLOCATE DECLARE DEFAULT DEFAULTS DEFER DEFINE 
    DEFINITION DELETE DELETING  DENSERANK DENSE_RANK DESC DESCRIBE DESCRIPTOR DETERMINISTIC DIAGNOSTICS 
    DISABLE DISALLOW DISCONNECT DISTINCT DO DOCUMENT DOUBLE DROP DYNAMIC EACH ELSE ELSEIF EMPTY  ENABLE 
    ENCODING  ENCRYPTION END ENDING END-EXEC ENFORCED ERROR  ESCAPE EVERY EXCEPT EXCEPTION EXCLUDING 
    EXCLUSIVE EXECUTE EXISTS EXIT EXTEND EXTERNAL EXTRACT FENCED FETCH FIELDPROC FILE FINAL FOR FOREIGN 
    FORMAT  FREE FREEPAGE FROM FULL FUNCTION GBPCACHE GENERAL GENERATED GET GLOBAL GO GOTO GRANT GRAPHIC 
    GROUP HANDLER HASH HASHED_VALUE HAVING HINT HOLD HOUR HOURS ID IDENTITY IF IGNORE IMMEDIATE IMPLICITLY 
    IN INCLUDE INCLUDING INCLUSIVE INCREMENT INDEX INDEXBP INDICATOR INF INFINITY INHERIT INLINE  INNER 
    INOUT INSENSITIVE INSERT INSERTING  INTEGRITY INTERSECT INTO IS ISOLATION ITERATE JAVA JOIN JSON_ARRAY  
    JSON_ARRAYAGG  JSON_EXISTS  JSON_OBJECT  JSON_OBJECTAGG  JSON_QUERY  JSON_TABLE  JSON_VALUE  KEEP  KEY 
    LABEL LANGUAGE LATERAL LEAVE LEFT LEVEL2 LIKE LIMIT  LINKTYPE LISTAGG  LOCAL LOCALDATE LOCALTIME 
    LOCALTIMESTAMP LOCATION LOCATOR LOCK LOCKSIZE LOG LOGGED LONG LOOP MAINTAINED MASK  MATCHED MATERIALIZED 
    MAXVALUE MERGE MICROSECOND MICROSECONDS MINPCTUSED MINUTE MINUTES MINVALUE MIXED MODE MODIFIES MONTH 
    MONTHS NAMESPACE NAN NATIONAL NCHAR NCLOB NESTED  NEW NEW_TABLE NEXTVAL NO NOCACHE NOCYCLE NODENAME 
    NODENUMBER NOMAXVALUE NOMINVALUE NONE NOORDER NORMALIZED NOT NULL NULLS NVARCHAR OBID OF OFFSET  
    OLD OLD_TABLE OMIT  ON ONLY  OPEN OPTIMIZE OPTION OR ORDER ORDINALITY ORGANIZE OUT OUTER OVER OVERLAY  
    OVERRIDING PACKAGE PADDED PAGE PAGESIZE PARAMETER PART PARTITION PARTITIONED PARTITIONING PARTITIONS 
    PASSING PASSWORD PATH PCTFREE PERMISSION  PIECESIZE PIPE  PLAN POSITION PREPARE PREVVAL PRIMARY PRIOR  
    PRIQTY PRIVILEGES PROCEDURE PROGRAM PROGRAMID QUERY RANGE RANK RCDFMT READ READS RECOVERY REFERENCES 
    REFERENCING REFRESH REGEXP_LIKE  RELEASE RENAME REPEAT RESET RESIGNAL RESTART RESULT RESULT_SET_LOCATOR 
    RETURN RETURNING  RETURNS REVOKE RID RIGHT ROLLBACK ROLLUP ROUTINE ROW ROWNUMBER ROW_NUMBER ROWS RRN RUN 
    SAVEPOINT SBCS SCHEMA SCRATCHPAD SCROLL SEARCH SECOND SECONDS SECQTY SECURED  SELECT SENSITIVE SEQUENCE 
    SESSION SESSION_USER SET SIGNAL SIMPLE SKIP SNAN SOME SOURCE SPECIFIC SQL SQLID STACKED START STARTING 
    STATEMENT STATIC STOGROUP SUBSTRING SUMMARY SYNONYM SYSTEM_USER TABLE TABLESPACE TABLESPACES THEN THREADSAFE  
    TIME TIMESTAMP TO TRANSACTION TRANSFER  TRIGGER TRIM TRIM_ARRAY TRUNCATE  TYPE UNDO UNION UNIQUE UNIT 
    UNNEST UNTIL UPDATE UPDATING  URI USAGE USE USER USERID USING VALUE VALUES VARIABLE VARIANT VCAT VERSION 
    VIEW VOLATILE WAIT WHEN WHENEVER WHERE WHILE WITH WITHIN  WITHOUT WRAPPED  WRAPPER  WRITE WRKSTNNAME XMLAGG 
    XMLATTRIBUTES XMLCAST XMLCOMMENT XMLCONCAT XMLDOCUMENT XMLELEMENT XMLFOREST XMLGROUP XMLNAMESPACES XMLPARSE 
    XMLPI XMLROW XMLSERIALIZE XMLTABLE  XMLTEXT XMLVALIDATE XSLTRANSFORM XSROBJECT YEAR YEARS YES ZONE