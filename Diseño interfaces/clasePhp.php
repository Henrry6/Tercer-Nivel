<html>
<head>
<title> Conectarse a Base de datos</title>
</head>
<body>
<?php
function conectarse()
{
	if (!($link=mysqli_connect('localhost','root','')))
	{
		echo "Error conectando a la base de datos.";
		exit();
	}
	if (!mysqli_select_db($link,'basecurso'))
	{
		echo "Error seleccionando la base de datos.";
		exit();
	}
	return $link;
}
conectarse();
echo "Coneccion con la base de datos conseguida<br>";
?>
</body>
</html>