#include "error.ch"
#include "hbclass.ch"

CLASS Vec
DATA aItems				   INIT {}
METHOD New( ... )
METHOD Len( )			   INLINE LEN(::aItems)
METHOD Plus( xArg ) 	   OPERATOR "+"
METHOD Array( xArg ) 	OPERATOR "[]"
METHOD X( xArg ) SETGET
METHOD Y( xArg ) SETGET
METHOD Z( xArg ) SETGET
METHOD W( xArg ) SETGET
METHOD toString( nLen, nDec )
//ERROR HANDLER OnError()
ENDCLASS


METHOD New( ... ) CLASS Vec
LOCAL n, nLen, aItems
aItems := HB_AParams()
nLen := LEN(aItems)
IF nLen == 0
   ::aItems := { 0, 0, 0, 0 }
ELSE
   IF nLen == 1 .and. HB_ISARRAY(aItems[1])
      ::aItems := ACLONE(aItems[1])
      nLen := ::Len()
      FOR n := 1 TO nLen
         IF !HB_ISNUMERIC( ::aItems[n] )
            Eval( ErrorBlock(), GenError( HB_AParams(), "JN_LIB-VEC", EG_DATATYPE, , "NEW") )
         ENDIF
      NEXT
   ELSEIF nLen == 1 .and. HB_ISOBJECT(aItems[1]) .and. aItems[1]:className() = "VEC"
      ::aItems := ACLONE(aItems[1]:aItems)
   ELSEIF HB_ISARRAY(aItems)
      ::aItems := ACLONE(aItems)
      nLen := ::Len()
      FOR n := 1 TO nLen
         IF !HB_ISNUMERIC( ::aItems[n] )
            Eval( ErrorBlock(), GenError( HB_AParams(), "JN_LIB-VEC", EG_DATATYPE, , "NEW") )
         ENDIF
      NEXT
   ELSE
      Eval( ErrorBlock(), GenError( HB_AParams(), "JN_LIB-VEC", EG_DATATYPE, , "NEW") )
   ENDIF
ENDIF
RETURN Self

METHOD Plus( xArg ) CLASS Vec

RETURN xArg

METHOD Array( nPos, xArg ) CLASS Vec
LOCAL nLen := LEN(HB_AParams())
IF nLen == 0
   Eval( ErrorBlock(), GenError( nLen, "JN_LIB-VEC", EG_BOUND, 1067, "INDEX") )
ELSE
   IF nLen == 1      //    ARRACCESS
      IF nPos > ::Len()
         Eval( ErrorBlock(), GenError( nPos, "JN_LIB-VEC", EG_ARRACCESS, 1068, "INDEX") )
      ELSEIF nPos < 0 .and. nPos + ::Len() <= 0
         Eval( ErrorBlock(), GenError( nPos, "JN_LIB-VEC", EG_ARRACCESS, 1068, "INDEX") )
      ELSEIF nPos < 0
         nPos += ::Len()
      ENDIF
   ELSE              //    ARRASSIGN
      IF nPos > ::Len()
         Eval( ErrorBlock(), GenError( nPos, "JN_LIB-VEC", EG_ARRASSIGN, 1069, "INDEX") )
      ELSEIF nPos <= 0 .and. nPos + ::Len() <= 0
         Eval( ErrorBlock(), GenError( nPos, "JN_LIB-VEC", EG_ARRASSIGN, 1069, "INDEX") )
      ELSEIF nPos < 0
         nPos += ::Len()
      ENDIF
      IF HB_ISNUMERIC( xArg )
         ::aItems[nPos] := xArg
      ELSEIF HB_ISARRAY(xArg)
         IF nPos >= LEN(xArg)
            Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "INDEX") )
         ELSEIF HB_ISNUMERIC(xArg[nPos])
            ::aItems[nPos] := xArg[nPos]
         ELSE
            Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "INDEX") )
         ENDIF
      ELSEIF HB_ISOBJECT(xArg) .and. xArg:className() = "VEC"
         IF nPos >= xArg:Len()
            Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "INDEX") )
         ELSEIF HB_ISNUMERIC(xArg:aItems[nPos])
            ::aItems[nPos] := xArg:aItems[nPos]
         ELSE
            Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "INDEX") )
         ENDIF
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "INDEX") )
      ENDIF
   ENDIF
ENDIF
RETURN ::aItems[nPos]

METHOD toString( nLen, nDec ) CLASS Vec
LOCAL nPos, cStr := "Vec("
AEVAL( ::aItems, { | c1 | cStr += str( c1, nLen, nDec ) + ", " } )
IF (nPos := RAT(", ", cStr)) != 0
   cStr = SUBSTR(cStr, 1, nPos - 1)
ENDIF
RETURN cStr + " )"

METHOD X( xArg ) CLASS Vec
IF ::Len() >= 1 .AND. LEN(HB_AParams()) > 0
   IF HB_ISNUMERIC( xArg )
      ::aItems[1] := xArg
   ELSEIF HB_ISARRAY(xArg)
      IF LEN(xArg) < 1
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "X") )
      ELSEIF HB_ISNUMERIC(xArg[1])
         ::aItems[1] := xArg[1]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "X") )
      ENDIF
   ELSEIF HB_ISOBJECT(xArg) .and. xArg:className() = "VEC"
      IF xArg:Len() < 1
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "X") )
      ELSEIF HB_ISNUMERIC(xArg:aItems[1])
         ::aItems[1] := xArg:aItems[1]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "X") )
      ENDIF
   ELSE
      Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "X") )
   ENDIF
ENDIF
RETURN ::aItems[1]

METHOD Y( xArg ) CLASS Vec
IF ::Len() >= 2 .AND. LEN(HB_AParams()) > 0
   IF HB_ISNUMERIC( xArg )
      ::aItems[2] := xArg
   ELSEIF HB_ISARRAY(xArg)
      IF LEN(xArg) < 2
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Y") )
      ELSEIF HB_ISNUMERIC(xArg[2])
         ::aItems[2] := xArg[2]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Y") )
      ENDIF
   ELSEIF HB_ISOBJECT(xArg) .and. xArg:className() = "VEC"
      IF xArg:Len() < 2
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Y") )
      ELSEIF HB_ISNUMERIC(xArg:aItems[2])
         ::aItems[2] := xArg:aItems[2]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Y") )
      ENDIF
   ELSE
      Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Y") )
   ENDIF
ENDIF
RETURN ::aItems[2]

METHOD Z( xArg ) CLASS Vec
IF ::Len() >= 3 .AND. LEN(HB_AParams()) > 0
   IF HB_ISNUMERIC( xArg )
      ::aItems[3] := xArg
   ELSEIF HB_ISARRAY(xArg)
      IF LEN(xArg) < 3
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Z") )
      ELSEIF HB_ISNUMERIC(xArg[3])
         ::aItems[3] := xArg[3]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Z") )
      ENDIF
   ELSEIF HB_ISOBJECT(xArg) .and. xArg:className() = "VEC"
      IF xArg:Len() < 3
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Z") )
      ELSEIF HB_ISNUMERIC(xArg:aItems[3])
         ::aItems[3] := xArg:aItems[3]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Z") )
      ENDIF
   ELSE
      Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "Z") )
   ENDIF
ENDIF
RETURN ::aItems[3]

METHOD W( xArg ) CLASS Vec
IF ::Len() >= 4 .AND. LEN(HB_AParams()) > 0
   IF HB_ISNUMERIC( xArg )
      ::aItems[4] := xArg
   ELSEIF HB_ISARRAY(xArg)
      IF LEN(xArg) < 4
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "W") )
      ELSEIF HB_ISNUMERIC(xArg[4])
         ::aItems[4] := xArg[4]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "W") )
      ENDIF
   ELSEIF HB_ISOBJECT(xArg) .and. xArg:className() = "VEC"
      IF xArg:Len() < 4
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "W") )
      ELSEIF HB_ISNUMERIC(xArg:aItems[4])
         ::aItems[4] := xArg:aItems[4]
      ELSE
         Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "W") )
      ENDIF
   ELSE
      Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", EG_DATATYPE, , "W") )
   ENDIF
ENDIF
RETURN ::aItems[4]


/*
METHOD WvgActiveXControl:OnError()
#if 0
   hb_traceLog( "HI: " + hb_ValToStr( __GetMessage() ) + " : " + hb_ntos( Len( hb_AParams() ) ) )
#endif
RETURN hb_ExecFromArray( ::oOLE, __GetMessage(), hb_AParams() )

METHOD OnError( uParam ) CLASS HBTable
LOCAL cMsg := __GetMessage()
LOCAL nPos
LOCAL oErr
IF uParam != NIL .AND. hb_LeftEq( cMsg, "_" )
   cMsg := SubStr( cMsg, 2 )
ENDIF
IF ( nPos := ( ::Alias )->( FieldPos( cMsg ) ) ) == 0
   oErr := ErrorNew()
   oErr:Args          := { Self, cMsg, uParam }
   oErr:CanDefault    := .F.
   oErr:CanRetry      := .F.
   oErr:CanSubstitute := .T.
   oErr:Description   := "Invalid class member"
   oErr:GenCode       := EG_NOVARMETHOD
   oErr:Operation     := "HBTable:" + cMsg
   oErr:Severity      := ES_ERROR
   oErr:SubCode       := -1
   oErr:SubSystem     := "HBTable"
RETURN Eval( ErrorBlock(), oErr )
ENDIF
RETURN ( ::Alias )->( iif( uParam == NIL, FieldGet( nPos ), FieldPut( nPos, uParam ) ) )

METHOD OnError() CLASS HCustomWindow
LOCAL cMsg := __GetMessage()
LOCAL oError
LOCAL aControls := ::aControls, oItem
FOR EACH oItem IN aControls
   IF !Empty( oItem:objname ) .AND. oItem:objname == cMsg
      RETURN oItem
   ENDIF
NEXT
FOR EACH oItem IN HTimer():aTimers
   IF !Empty( oItem:objname ) .AND. oItem:objname == cMsg .AND. hwg_Isptreq( ::handle,oItem:oParent:handle )
      RETURN oItem
   ENDIF
NEXT
oError := ErrorNew()
oError:severity    := ES_ERROR
oError:genCode     := EG_LIMIT
oError:subSystem   := "HCUSTOMWINDOW"
oError:subCode     := 0
oError:description := "Invalid class member"
oError:canRetry    := .F.
oError:canDefault  := .F.
oError:fileName    := ""
oError:osCode      := 0
Eval( ErrorBlock(), oError )
__errInHandler()
RETURN NIL
*/

