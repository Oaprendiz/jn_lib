#include "error.ch"
#include "hbclass.ch"

CLASS Vec
DATA aItems				   INIT {}
METHOD New( ... )
METHOD Len( )			   INLINE LEN(::aItems)
METHOD Plus( xArg ) 	   OPERATOR "+"
METHOD Array( xArg ) 		OPERATOR "[]"
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
      nLen := LEN(::aItems)
      FOR n := 1 TO nLen
         IF !HB_ISNUMERIC( ::aItems[n] )
            Eval( ErrorBlock(), GenError( HB_AParams(), "JN_LIB-VEC", EG_DATATYPE, , "NEW") )
         ENDIF
      NEXT
   ELSEIF nLen == 1 .and. HB_ISOBJECT(aItems[1]) .and. aItems[1]:className() = "VEC"
      ::aItems := ACLONE(aItems[1]:aItems)
   ELSEIF HB_ISARRAY(aItems)
      ::aItems := ACLONE(aItems)
      nLen := LEN(::aItems)
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
RETURN ::aItems[nPos]

METHOD toString( nLen, nDec ) CLASS Vec
LOCAL nPos, cStr := "Vec("
AEVAL( ::aItems, { | c1 | cStr += str( c1, nLen, nDec ) + ", " } )
IF (nPos := RAT(", ", cStr)) != 0
   cStr = SUBSTR(cStr, 1, nPos - 1)
ENDIF
RETURN cStr + " )"

METHOD X( xArg ) CLASS Vec
IF ::Len() > 0
   IF xArg != Nil
      ::aItems[1] := xArg
   ENDIF
ELSE
   Eval( ErrorBlock(), GenError( xArg, "JN_LIB-VEC", nCode, nSubCode, cOperator ) )
ENDIF
RETURN ::aItems[1]

METHOD Y( xArg ) CLASS Vec
IF xArg != Nil .and. ::Len() > 1
	::aItems[2] := xArg
ENDIF
RETURN ::aItems[2]

METHOD Z( xArg ) CLASS Vec
IF xArg != Nil .and. ::Len() > 2
	::aItems[3] := xArg
ENDIF
RETURN ::aItems[3]

METHOD W( xArg ) CLASS Vec
IF xArg != Nil .and. ::Len() > 3
	::aItems[4] := xArg
ENDIF
RETURN ::aItems[4]

/*
METHOD normalize( xArg ) CLASS Money
LOCAL nValue
IF IsPoint( xArg )
   nValue := xArg
ELSEIF HB_ISARRAY( xArg )
   nValue := xArg
ELSE
   nValue := Eval( ErrorBlock(), GenError( xArg ) )
ENDIF
RETURN nValue

STATIC FUNCTION IsPoint( xArg )
RETURN HB_ISOBJECT( xArg ) .AND. xArg:className() = "POINT"
*/

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

