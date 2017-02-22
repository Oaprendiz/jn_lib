//#include "hwgui.ch"
//#include "hbclass.ch"

function main()

Set( _SET_DATEFORMAT, "yyyy-mm-dd" )
hb_cdpSelect( "UTF8" )
A := Vec():New(1, 2, 3)
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


//hwg_writelog( valtype(HBCharacter()) )
//hwg_writelog( HBCharacter():classname() )
//hwg_writelog( valtype(HB_DumpVar( HBCharacter():classSel(), .t. ) ) )
//hwg_writelog( HB_DumpVar( cImageDir:classSel(), .t. , 3 ) ) 
//hwg_writelog( HB_DumpVar( HBCharacter():classSel() ) )

oObject := HBCharacter():new()
cMsg := nil
//hwg_writelog(oObject:SUPER():classname())
//hwg_writelog(HB_DumpVar(oObject, .t.))

   aMessages := oObject:classSel()
   ASort( aMessages,,, {| x, y | PadR( x, 64 ) <= PadR( y, 64 ) } )
   aMethods := {}

//hwg_writelog( HB_DumpVar( aMessages, .t. ) )
//hwg_writelog( HB_DumpVar( aMethods ) )

   FOR EACH cMsg IN aMessages
      IF Left( cMsg, 1 ) == "_" .AND. ;
         hb_AScan( aMessages, cMsgAcc := SubStr( cMsg, 2 ),,, .T. ) != 0
         xValue := __dbgSENDMSG( 0, oObject, cMsgAcc )   //__dbgObjGetValue( oObject, cMsgAcc )
         AAdd( aItems, { cMsgAcc, xValue, .T. } )
         AAdd( aAllNames, cMsgAcc )
      ELSEIF hb_AScan( aMessages, "_" + cMsg,,, .T. ) == 0
         AAdd( aMethods, cMsg )
      ENDIF
   NEXT

//hwg_writelog( HB_DumpVar( aMessages, .t. ) )
//hwg_writelog( HB_DumpVar( aMethods ) )

   FOR EACH cMsg IN aMethods
      AAdd( aItems, { Lower( cMsg ), "Method", .F. } )
      AAdd( aAllNames, cMsg )
   NEXT

//hwg_writelog("FINAL")
//hwg_writelog( HB_DumpVar( aItems, .t. ) )
//hwg_writelog( HB_DumpVar( aAllNames, .t. ) )
   
return nil
/*
http://courses.cs.washington.edu/courses/cse143/17wi/homework/ass2/StdDraw.java
http://www.javamex.com/tutorials/graphics/bufferedimage.shtml
http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/awt/Color.java
*/
