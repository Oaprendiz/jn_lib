#include "error.ch"
#include "common.ch"

FUNCTION GenError( xArg, cSubSystem, nCode, nSubCode, cOperator )
LOCAL oError := ErrorNew()
DEFAULT nCode TO 0
DEFAULT nSubCode TO 0
DEFAULT cOperator TO ProcName( 1 )

oError:Args := { xArg }
oError:Description   := hb_langErrMsg( nCode )
oError:GenCode 		:= nCode
oError:Operation     := cOperator
oError:Severity      := ES_ERROR
oError:CanSubstitute := .T.
oError:CanDefault    := .F.
oError:CanRetry      := .F.
oError:SubSystem     := cSubSystem
oError:SubCode       := nSubCode
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


