/*
http://courses.cs.washington.edu/courses/cse143/17wi/homework/ass2/StdDraw.java
http://www.javamex.com/tutorials/graphics/bufferedimage.shtml
http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/awt/Color.java
*/

//#include "hwgui.ch"
//#include "hbclass.ch"

function main()

Set( _SET_DATEFORMAT, "yyyy-mm-dd" )
hb_cdpSelect( "UTF8" )
SetMode( 40, 100 )

//Eval( ErrorBlock(), GenError( "X", "TESTE VEC" ) )
A := Vec():New(1, 2, 3)
? a:toString( 2, 0 )
B := Vec():New("1", "2", "3")
? b:toString( 2, 0 )
c := vec():new(0)
? c:Y


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
