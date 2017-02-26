/*
http://courses.cs.washington.edu/courses/cse143/17wi/homework/ass2/StdDraw.java
http://www.javamex.com/tutorials/graphics/bufferedimage.shtml
http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/awt/Color.java
http://harbour.edu.pl/clipper/pt/ng21f19.html
*/

//#include "hwgui.ch"
//#include "hbclass.ch"

function main()
LOCAL A, B, C, D, E, F, G

Set( _SET_DATEFORMAT, "yyyy-mm-dd" )
hb_cdpSelect( "UTF8" )
SetMode( 40, 100 )

//Eval( ErrorBlock(), GenError( "X", "TESTE VEC" ) )
A := Vec():New()
B := Vec():New(1,1,1,1,1)
C := Vec():New({2,2,2,2})
D := Vec():New(C)
//? C:__OPARRAYINDEX()
//? C[10]
//? c[-10]
? 1, c[-1]
? 2, a[1] := 3
? 3, (a[1] := {4,4,4,4})
? 4, a[1]
? 5, (a[1] := c)
? 6, (a[1] := B)
//? 7, a[1] := "B"

? 8, c[1] := 5
? 9, c:x
altd()

? 10, C:X := 10


inkey(0)

E := vec():New("x")


? a:toString( 2, 0 )
altd()
abs("X")
B := Vec():New("1", "2", "3")
? b:toString( 2, 0 )
c := Vec():New(a)
? b[3]
? b[10]

? b:g


/*
B := Vec():New(3, 2, 1)

hwg_writelog( a:toString( 2, 0 ))
hwg_writelog( HB_DumpVar( A ) )
hwg_writelog( b:toString( 2, 0 ))
hwg_writelog( HB_DumpVar( B ) )
hwg_writelog( HB_DumpVar( B:len() ) )
hwg_writelog( HB_DumpVar( B[3] ) )
hwg_writelog( HB_DumpVar( B:x ) )
b:x := 100
hwg_writelog( HB_DumpVar( B[1] ) )
*/
wait "Uma tecla para continuar"
return nil



/*
 Overview -- Runtime Errors
------------------------------------------------------------------------------
 BASE Error Messages

 BASE/1001    Undefined function
 BASE/1002    Undefined alias
 BASE/1003    Undefined variable
 BASE/1004    No exported method
 BASE/1005    No exported variable
 BASE/1065    Argument error: &
 BASE/1066    Argument error: conditional
 BASE/1067    Argument error: array dimension
 BASE/1068    Argument error: array access
 BASE/1069    Argument error: array assign
 BASE/1070    Argument error: ==
 BASE/1071    Argument error: =
 BASE/1072    Argument error: <>
 BASE/1073    Argument error: <
 BASE/1074    Argument error: <=
 BASE/1075    Argument error: >
 BASE/1076    Argument error: >=
 BASE/1077    Argument error: .NOT.
 BASE/1078    Argument error: .AND.
 BASE/1079    Argument error: .OR.
 BASE/1080    Argument error: -
 BASE/1081    Argument error: +
 BASE/1082    Argument error: -
 BASE/1083    Argument error: *
 BASE/1084    Argument error: /
 BASE/1085    Argument error: %
 BASE/1086    Argument error: ++
 BASE/1087    Argument error: --
 BASE/1088    Argument error: ^
 BASE/1089    Argument error: ABS
 BASE/1090    Argument error: INT
 BASE/1091    Argument error: WORD
 BASE/1092    Argument error: MIN
 BASE/1093    Argument error: MAX
 BASE/1094    Argument error: ROUND
 BASE/1095    Argument error: LOG
 BASE/1096    Argument error: EXP
 BASE/1097    Argument error: SQRT
 BASE/1098    Argument error: VAL
 BASE/1099    Argument error: STR
 BASE/1100    Argument error: TRIM
 BASE/1101    Argument error: LTRIM
 BASE/1102    Argument error: UPPER
 BASE/1103    Argument error: LOWER
 BASE/1104    Argument error: CHR
 BASE/1105    Argument error: SPACE
 BASE/1106    Argument error: REPLICATE
 BASE/1107    Argument error: ASC
 BASE/1108    Argument error: AT
 BASE/1109    Argument error: $
 BASE/1110    Argument error: SUBSTR
 BASE/1111    Argument error: LEN
 BASE/1112    Argument error: YEAR
 BASE/1113    Argument error: MONTH
 BASE/1114    Argument error: DAY
 BASE/1115    Argument error: DOW
 BASE/1116    Argument error: CMONTH
 BASE/1117    Argument error: CDOW
 BASE/1118    Argument error: DTOC
 BASE/1119    Argument error: CTOD
 BASE/1120    Argument error: DTOS
 BASE/1121    Argument error: TYPE
 BASE/1122    Argument error: TRANSFORM
 BASE/1123    Argument error: AADD
 BASE/1124    Argument error: LEFT
 BASE/1131    Bound error: array dimension
 BASE/1132    Bound error: array access
 BASE/1133    Bound error: array assign
 BASE/1187    Bound error: AADD
 BASE/1209    String overflow: +
 BASE/1210    String overflow: -
 BASE/1233    String overflow: SPACE
 BASE/1234    String overflow: REPLICATE
 BASE/1340    Zero divisor: /
 BASE/1341    Zero divisor: %
 BASE/1449    Syntax error: &
 BASE/1513    Operation too complex: &
 BASE/2005    Open error (RESTORE command)
 BASE/2006    Create error (SAVE command)
 BASE/2011    Open error (TYPE command)
 BASE/2012    Open error (COPY FILE command)
 BASE/2016    Write error (COPY FILE command)                                .
 BASE/2017    Argument error (AEVAL() function)                              .
 BASE/2018    Open error (DISKSPACE() function)                              .
 BASE/2020    Argument error (SET() function)                                .
 BASE/5300    Memory low
------------------------------------------------------------------------------
 TERM Error Messages

 Print error
 TERM/2013    Create error (SET ALTERNATE command)
 TERM/2014    Create error (SET PRINTER command)
 TERM/2015    Open error (TO FILE clause)
------------------------------------------------------------------------------
 DBFNTX Error Messages

 DBFNTX/1001  Open error (.dbf)
 DBFNTX/1002  Open error (.dbt)
 DBFNTX/1003  Open error (index)
 DBFNTX/1004  Open error (creating .dbf)
 DBFNTX/1005  Open error (creating .dbt)
 DBFNTX/1006  Create error (creating index)
 DBFNTX/1010  Read error
 DBFNTX/1011  Write error
 DBFNTX/1012  Corruption detected
 DBFNTX/1020  Data type error
 DBFNTX/1020  Work area not indexed                                          .
 DBFNTX/1021  Data width error
 DBFNTX/1022  Lock required
 DBFNTX/1023  Exclusive required
 DBFNTX/1024  Append lock failed
 DBFNTX/1025  Write not allowed
 DBFNTX/1026  Data width error
 DBFNTX/1027  Limit exceeded
------------------------------------------------------------------------------
 DBFNDX Error Messages

 DBFNDX/1001  Open error (.dbf)
 DBFNDX/1002  Open error (.dbt)
 DBFNDX/1003  Open error (index)
 DBFNDX/1004  Open error (creating .dbf)
 DBFNDX/1005  Open error (creating .dbt)
 DBFNDX/1006  Create error (creating index)
 DBFNDX/1010  Read error
 DBFNDX/1011  Write error
 DBFNDX/1012  Corruption detected
 DBFNDX/1020  Data type error
 DBFNDX/1021  Data width error
 DBFNDX/1022  Lock required
 DBFNDX/1023  Exclusive required
 DBFNDX/1024  Append lock failed
 DBFNDX/1025  Write not allowed
 DBFNDX/1026  Data width error
 DBFNDX/1027  Limit exceeded
------------------------------------------------------------------------------
 DBCMD Error Messages                                                        .

 DBCMD/1001   Argument error                                                 .
 DBCMD/1003   Argument error                                                 .
 DBCMD/1004   Argument error                                                 .
 DBCMD/1005   Argument error                                                 .
 DBCMD/1006   Argument error                                                 .
 DBCMD/1007   Argument error                                                 .
 DBCMD/1008   Argument error                                                 .
 DBCMD/1009   Argument error                                                 .
 DBCMD/1010   Illegal characters in alias                                    .
 DBCMD/1011   Alias already in use                                           .
 DBCMD/1101   Syntax error                                                   .
 DBCMD/2001   Work area not in use                                           .
 DBCMD/2019   Argument error                                                 .
------------------------------------------------------------------------------
 Runtime Unrecoverable Error Messages                                        .

 24           Write error                                                    .
 331          String/array memory overflow                                   .
 332          String/array memory overflow                                   .
 415          Cannot open overlay file                                       .
 5302         Conventional memory exhausted                                  .
 5304         Conventional memory exhausted                                  .
 5306         Conventional memory exhausted                                  .
 5312         Conventional memory exhausted                                  .
*/
/*
BASE Error Messages

 BASE/1001    Undefined function
 BASE/1002    Undefined alias
 BASE/1003    Undefined variable
 BASE/1004    No exported method
 BASE/1005    No exported variable
 BASE/1026    Index key expression required
 BASE/1065    Argument error: &
 BASE/1066    Argument error: conditional
 BASE/1067    Argument error: array dimension
 BASE/1068    Argument error: array access
 BASE/1069    Argument error: array assign
 BASE/1070    Argument error: ==
 BASE/1071    Argument error: =
 BASE/1072    Argument error: <>
 BASE/1073    Argument error: <
 BASE/1074    Argument error: <=
 BASE/1075    Argument error: >
 BASE/1076    Argument error: >=
 BASE/1077    Argument error: .NOT.
 BASE/1078    Argument error: .AND.
 BASE/1079    Argument error: .OR.
 BASE/1080    Argument error: -
 BASE/1081    Argument error: +
 BASE/1082    Argument error: -
 BASE/1083    Argument error: *
 BASE/1084    Argument error: /
 BASE/1085    Argument error: %
 BASE/1086    Argument error: ++
 BASE/1087    Argument error: --
 BASE/1088    Argument error: ^^
 BASE/1089    Argument error: ABS
 BASE/1090    Argument error: INT
 BASE/1091    Argument error: WORD
 BASE/1092    Argument error: MIN
 BASE/1093    Argument error: MAX
 BASE/1094    Argument error: ROUND
 BASE/1095    Argument error: LOG
 BASE/1096    Argument error: EXP
 BASE/1097    Argument error: SQRT
 BASE/1098    Argument error: VAL
 BASE/1099    Argument error: STR
 BASE/1100    Argument error: TRIM
 BASE/1101    Argument error: LTRIM
 BASE/1102    Argument error: UPPER
 BASE/1103    Argument error: LOWER
 BASE/1104    Argument error: CHR
 BASE/1105    Argument error: SPACE
 BASE/1106    Argument error: REPLICATE
 BASE/1107    Argument error: ASC
 BASE/1108    Argument error: AT
 BASE/1109    Argument error: $
 BASE/1110    Argument error: SUBSTR
 BASE/1111    Argument error: LEN
 BASE/1112    Argument error: YEAR
 BASE/1113    Argument error: MONTH
 BASE/1114    Argument error: DAY
 BASE/1115    Argument error: DOW
 BASE/1116    Argument error: CMONTH
 BASE/1117    Argument error: CDOW
 BASE/1118    Argument error: DTOC
 BASE/1119    Argument error: CTOD
 BASE/1120    Argument error: DTOS
 BASE/1121    Argument error: TYPE
 BASE/1122    Argument error: TRANSFORM
 BASE/1123    Argument error: AADD
 BASE/1124    Argument error: LEFT
 BASE/1126    Argument Error: DATEFORMAT
 BASE/1131    Bound error: array dimension
 BASE/1132    Bound error: array access
 BASE/1133    Bound error: array assign
 BASE/1187    Bound error: AADD
 BASE/1209    String overflow: +
 BASE/1210    String overflow: -
 BASE/1233    String overflow: SPACE
 BASE/1234    String overflow: REPLICATE
 BASE/1340    Zero divisor: /
 BASE/1341    Zero divisor: %
 BASE/1449    Syntax error: &
 BASE/1513    Operation too complex: &
 BASE/2005    Open error (RESTORE command)
 BASE/2006    Create error (SAVE command)
 BASE/2011    Open error (TYPE command)
 BASE/2012    Open error (COPY FILE command)
 BASE/2016    Write error (COPY FILE command)
 BASE/2017    Argument error (AEVAL() function)
 BASE/2018    Open error (DISKSPACE() function)
 BASE/2020    Argument error (SET() function)
 BASE/2022    Argument error: ALLTRIM
 BASE/5300    Memory low
------------------------------------------------------------------------------
 TERM Error Messages

 TERM/0       Print error
 TERM/2013    Create error (SET ALTERNATE command)
 TERM/2014    Create error (SET PRINTER command)
 TERM/2015    Open error (TO FILE clause)
 TERM/2100    Write error: <SET ALTERNATE TO file name>
 TERM/2101    Write error: <SET PRINTER TO file name>
 TERM/2102    Write error: <_SET_EXTRAFILE file name>
------------------------------------------------------------------------------
 DBCMD Error Messages

 DBCMD/1001   Argument error: SEEK or DBSEEK
 DBCMD/1003   Argument error: GOTO or DBGOTO
 DBCMD/1004   Argument error: SET RELATION TO or DBSETRELAT
 DBCMD/1005   Argument error: USE or DBUSEAREA
 DBCMD/1006   Argument error: INDEX ON or DBCREATEINDEX
 DBCMD/1007   Argument error: SET ORDER TO or DBSETORDER
 DBCMD/1008   Argument error: SET INDEX TO or DBSETINDEX
 DBCMD/1009   Argument error: FIELDNAME
 DBCMD/1010   Illegal characters in alias
 DBCMD/1011   Alias already in use
 DBCMD/1013   Argument error
 DBCMD/1014   Invalid argument for DBCREATE()
 DBCMD/1015   Argument Error
 DBCMD/1021   Argument error: ORDBAGNAME
 DBCMD/1022   Argument error: ORDFOR
 DBCMD/1023   Argument error: ORDKEY
 DBCMD/1024   Argument error: ORDNAME
 DBCMD/1025   Argument error: ORDNUMBER
 DBCMD/1031   Argument error: DBFIELDINFO
 DBCMD/1032   Argument error: DBRECORDINFO
 DBCMD/1033   Argument error: DBORDERINFO
 DBCMD/1034   Argument error: DBINFO
 DBCMD/1101   Syntax error
 DBCMD/2001   Work area not in use
 DBCMD/2019   Argument error
------------------------------------------------------------------------------
 DBFCDX Error Messages

 DBFCDX/602   Index corruption detected
 DBFCDX/610   Argument error
 DBFCDX/611   Index key too long
 DBFCDX/612   Invalid key length
 DBFCDX/631   Non-compact index not supported
 DBFCDX/650   Can't find current key in index
 DBFCDX/1012  Corruption detected
 DBFCDX/1028  Create error
 DBFCDX/1050  Invalid TAG/ORDER
 DBFCDX/1051  Scope Type Mismatch
 DBFCDX/1052  Not Custom Built Index
 DBFCDX/1053  Index FOR condition didn't evaluate to a logical
 DBFCDX/1054  The type or length of the key doesn't match what's stored...
 DBFCDX/1055  DBF Signature Invalid
 DBFCDX/1056  Memo Type Invalid
 DBFCDX/1057  Memo Too Long
------------------------------------------------------------------------------
 DBFMDX Error Messages

 DBFMDX/1006  Exclusive required (creating index)
 DBFMDX/1028  Create error
 DBFMDX/1050  Invalid TAG/ORDER
------------------------------------------------------------------------------
 DBFNDX Error Messages

 DBFNDX/1001  Open error (.dbf)
 DBFNDX/1002  Open error (.dbt)
 DBFNDX/1003  Open error (index)
 DBFNDX/1004  Open error (creating .dbf)
 DBFNDX/1005  Open error (creating .dbt)
 DBFNDX/1006  Create error (creating index)
 DBFNDX/1010  Read error
 DBFNDX/1011  Write error
 DBFNDX/1012  Corruption detected
 DBFNDX/1020  Data type error
 DBFNDX/1021  Data width error
 DBFNDX/1022  Lock required
 DBFNDX/1023  Exclusive required
 DBFNDX/1024  Append lock failed
 DBFNDX/1025  Write not allowed
 DBFNDX/1026  Data width error
 DBFNDX/1027  Limit exceeded
------------------------------------------------------------------------------
 DBFNTX Error Messages

 DBFNTX/1001  Open error (.dbf)
 DBFNTX/1002  Open error (.dbt)
 DBFNTX/1003  Open error (index)
 DBFNTX/1004  Open error (creating .dbf)
 DBFNTX/1005  Open error (creating .dbt)
 DBFNTX/1006  Create error (creating index)
 DBFNTX/1010  Read error
 DBFNTX/1011  Write error
 DBFNTX/1012  Corruption detected
 DBFNTX/1015  Request for RDD improperly linked
 DBFNTX/1020  Data type error
 DBFNTX/1021  Data width error
 DBFNTX/1022  Lock required
 DBFNTX/1023  Exclusive required
 DBFNTX/1024  Append lock failed
 DBFNTX/1025  Write not allowed
 DBFNTX/1026  Data width error
 DBFNTX/1027  Limit exceeded
 DBFNTX/1035  Record lock timeout
 DBFNTX/1038  Lock failure
 DBFNTX/1201  Work area not indexed
 DBFNTX/1210  Corruption detected
------------------------------------------------------------------------------
 Runtime Unrecoverable Error Messages

 0            Error System Integrity Error
 1            Evaluation Stack Underflow
 2            Memory Error
 3            Memory Error
 4            Memory Error
 5            Memory Error
 6            Buffer Error
 7            Buffer Error
 8            Buffer Error
 9            Buffer Error
 10           Too Many Nested BEGIN SEQUENCE/END Blocks
 11           BEGIN SEQUENCE/END Integrity Error
 12           Evaluation stack underflow after BEGIN SEQUENCE/END
 14           SORT Error
 15           SORT Error
 16           Database Not Open
 17           NTX File Corrupted
 18           NTX File Corrupted
 19           NTX File Corrupted
 20           NDX File Key Type Error
 21           NDX File Key Type Error
 22           .NTX File Key Type Error
 24           Write error
 37           Too many symbols in symbol table
 92           SORT/INDEX ON Error
 331          String/array buffer/memory overflow
 332          String/array memory overflow
 335          String/Array invalid pointer
 336          String/Array memory overflow
 415          Cannot open overlay file
 416          Read error on overlay
 520          Attempt to get value for an invalid field type
 521          Replacement of field with invalid data type
 612          EVAL() given something other than codeblock
 650          Out of stack space
 666          C Function Attempt to Free Invalid Pointer
 667          Eval stack crashed
 668          EVAL STACK FAULT
 669          EVAL STACK FAULT
 670          Memory initialization error
 701          Unable to locate keyboard driver upon startup
 702          Keyboard driver I/O error upon startup
 703          Unable to locate display driver upon startup
 704          Screen display driver I/O error upon startup
 705          Unable to determine disk drivetype upon startup
 706          Disk drivetype I/O error upon startup
 715          Printer not ready
 773          Dynamic overlay system not linked in
 998          Missing function
 999          Attempt to execute invalid code
 1010         Read/write in index page failed
 1011         Read/write access in index page failed
 1020         Record not found
 1101         Maximum workareas exceeded
 1102         Requested RDD not linked
 1112         Read value larger than 64kb
 1201         No master index in use
 1210         Data and Index files out of sync
 1240         Index key evaluation error
 1242         Data type mismatch on key replacement
 1255         Damaged index header
 2155         Read error on index heading page
 4001         Number of METHODs exceeded
 4406         Temp file read error
 4412         Indexing miscalculation
 4414         Indexing miscalculation
 4424         Temp file creation error
 5302         Conventional memory exhausted
 5304         Conventional memory exhausted
 5305         VM Swap Space Exhausted
 5306         Conventional memory exhausted
 5311         VMM Unable to Create Swap File
 5312         VM Swap File Overallocated
 5313         VMM Write Error on Swap File
 5320         VMM IAMBS Manager Error
 5321         VMM system unable to free EMS page
 9001         Database RDD failed to load
 9002         RDD invalid or not linked
 9005         Unable to load database table
 9006         DBFNTX RDD index buffer access error
 9999         Invalid .EXE caused by RDD unavailable at startup
              VM Integrity failure
*/
