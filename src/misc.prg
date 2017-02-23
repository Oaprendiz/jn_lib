#include "error.ch"

FUNCTION GenError( xArg, cSubSystem, nCode )
LOCAL oError := ErrorNew()

oError:Args := { xArg }
oError:Description   := hb_langErrMsg( nCode )
oError:GenCode 		:= nCode
oError:Operation     := ProcName( 1 )
//oError:Operation     := "+"   //cOperator
oError:Severity      := ES_ERROR
oError:CanSubstitute := .T.
oError:CanDefault    := .F.
oError:CanRetry      := .F.
oError:SubSystem     := "JN_LIB"      //cSubSystem
oError:SubCode       := 1001
RETURN oError

/*
   STATIC sc_hErrCode := { ;
      "==" => 1070, ;
      "="  => 1071, ;
      "!=" => 1072, ;
      "+"  => 1081, ;
      "-"  => 1082, ;
      "*"  => 1083, ;
      "/"  => 1084, ;
      "%"  => 1085, ;
      "++" => 1086, ;
      "--" => 1087, ;
      "^"  => 1088 }
*/
