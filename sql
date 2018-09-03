<!-- index.php - Bases Hacking Administration login Page -->

<html>

<head>
<div align="center"><h1>Bases Hacking Administration Zone</h1></div>
<title>Faille de type SQL Injection</title>
</head>

<body>
<img src="../images/penguinroot.gif">
<br><br>

<div align="center">
<form action="./auth.php" method="POST">
<table>
<tr>
<td>Login</td>
<td><input type="text" name="pseudo" maxlength="30"></td>
</tr>
<tr>
<td>Pass</td>
<td><input type="password" name="mdp" maxlength="30"></td>
</tr>
<tr><td colspan=2 align="center"><input type="submit" name="login" value="Login"></td></tr>
</table>
</form>
</div>
</body>

</html>



<?
// auth.php - Authentification des admins Bases Hacking

$login = $_POST["pseudo"];
$mdp = $_POST["mdp"];

if ($login != "" && $mdp != "") {

@mysql_connect("localhost", "serioushack", "mdpmysql") or die("Impossible de se connecter à la base de données");
@mysql_select_db("users") or die("Table inexistante");

$resultat = mysql_numrows(mysql_query("SELECT * from admin WHERE pseudo='$login' AND mdp='$mdp';"));

mysql_close();

if ($resultat == 1) echo "Authentification réussie, vous allez être redirigés immédiatement. <script>window.location='./admin.php'</script>"; 
else header("Location: ./");
} else header("Location: ./");

?>


<?
//admin.php - Bases Hacking Administration Panel

$headers = http_get_request_headers(); //On récupère les headers et on vérifie que l'user est passé par auth.php

if (!isset($headers["Referer"]) || $headers["Referer"] != "http://".$headers["Host"]."/hacking/admin/auth.php")
header("Location: ./");
?>

<html>

<head>
<div align="center"><h1>Bases Hacking Administration Zone</h1></div>
<title>Faille de type SQL Injection et Referrer Spoofing</title>
</head>

<body>
<img src="../images/penguinroot.gif">
<br><br>
[Message d'accueil]
</body>
</html>
