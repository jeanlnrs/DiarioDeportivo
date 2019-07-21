<?PHP
include("Conexion.php");
if(array_key_exists ('enviar', $_POST)){
	$peso   = round($_REQUEST['consultarpeso'],1);
	$altura = round($_REQUEST['consultaraltura'],1);
	$imc=round($peso/($altura*2),1);
	
	if(isset($_POST['consultarpeso']) && !empty($_POST['consultarpeso']) &&
	isset($_POST['consultaraltura']) && !empty($_POST['consultaraltura']))
{
	$con=mysql_connect($host,$user,$pw)or die ("Problemas al conectar la bd");
	mysql_select_db($db,$con) or die("problemas al conectase a la bd");
	$insertar="CALL sp_insertar_datos(?,?,?)";
	mysql_query("CALL sp_insertar_datos(".$peso.",".$altura.",".$imc.");",$con);
	echo "</br></br><center>Su indice de masa corporal es de: $imc </center></br>";
}else{
	echo "problemas al insertar datos ";
}
}
?>