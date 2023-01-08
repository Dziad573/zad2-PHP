<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pokoje</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header id="baner1">
        <h2>WYNAJEM POKOI</h2>
    </header>
    <nav id="menu1"><a href="index.html">POKOJE</a></nav>
    <nav id="menu2"><a href="cennik.php">CENNIK</a></nav>
    <nav id="menu3"><a href="kalkulator.html">KALKULATOR</a></nav>

    <div id="baner2"></div>

    <div id="blok-lewy"></div>
    <div id="blok-srodek">
        <h1>Cennik</h1>
        <?php
            $host = 'localhost';
            $user = 'root';
            $pass = '';
            $db = 'wynajem';
            $conn = mysqli_connect($host, $user, $pass, $db);
            mysqli_select_db($conn, $db);
            $q = "SELECT * FROM pokoje";
            $res = mysqli_query($conn, $q);
echo<<<TX
    <table>
TX;
            while($row = mysqli_fetch_row($res)){
                echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><tr>";
            };
echo<<<TX
    </table>
TX;
            mysqli_close($conn); 
        ?>
    </div>
    <div id="blok-prawy"></div>

    <footer><p>Stronę opracował: 00000000000000</p></footer>
</body>
</html>