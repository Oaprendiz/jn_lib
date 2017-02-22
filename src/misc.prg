#include "error.ch"

FUNCTION GenError( xArg, cSubSystem )
LOCAL oError := ErrorNew()
oError:description := hb_langErrMsg( EG_DATATYPE )
oError:gencode := EG_DATATYPE
oError:severity := ES_ERROR
oError:cansubstitute := .T.
oError:subsystem := cSubSystem
oError:subcode := 0
oError:args := { xArg }
RETURN oError
