<?PHP
include("Conexion.php");
include("Insertar.php");
if(array_key_exists ('enviar', $_POST))
{
	$peso  = $_REQUEST['consultarpeso'];
	$altura=$_REQUEST['consultaraltura'];
	$imc=round(($peso/$altura*2),1);
	
	if(isset($_POST['consultarpeso']) && !empty($_POST['consultarpeso']) &&
	isset($_POST['consultaraltura']) && !empty($_POST['consultaraltura']))
{
	$con=mysql_connect($host,$user,$pw)or die ("Problemas al conectar la bd");
	mysql_select_db($db,$con) or die("problemas al conectase a la bd");
	
	$instruccion="CALL sp_listar_resultados()";
	$consulta = mysql_query($instruccion,$con);
	echo "<center><table>";  
	echo "<tr>";  
	echo "<th>Id</th>";  
	echo "<th>Peso</th>";  
	echo "<th>Estatura</th>";
	echo "<th>Imc</th>";	
	echo "</tr>";  
	
	while ($row = mysql_fetch_row($consulta))
	{   
    echo "<tr>";  
    echo "<td>$row[0]></td>";  
    echo "<td>$row[1]</td>";  
    echo "<td>$row[2]</td>";
    echo "<td>$row[3]</td>";	
    echo "</tr>";  
	}
	
}  
echo "</table></center>"; 
}
?>