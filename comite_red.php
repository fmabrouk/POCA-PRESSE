<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="description de la page"/>
    <meta name="keywords" content="mots-clé1, mots-clé2, ..."/>
    <meta name="robots" content="index,follow" />
    <link rel="stylesheet" href="./style.css"> 
    <title>POKA PRESSE</title>
  <style>
       .dd{
        background-color: pink;
        border: 1px solid black;
        padding: 3px; 
        margin: 3px ;
    }
  </style>
</head>
<body>
    <header>
        <h1>  POKA PRESSE </h1>
    </header>

    <div id="centre">

        <aside>
            <nav>
                <h3>MENU</h3>
                <ul>
                <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php>déconnexion</a></li>                </ul>
            </nav>

        </aside>

        <main>
            <section id="a">
                <?php
            include "connexion.inc.php";

                function affiche_tab($mag,$date,$img,$results){ 
                    echo "<div class='dd'> numero  ",$mag, $date,"<br> <img src= $img> <span class='tt'>";
                    foreach($results as $lie){
                        if($lie['code']==$mag){
                        echo "article ",$lie['titre'],"<br> <p id='t'> de : ", $lie['nom'], "\t",$lie['prenom'],"</p><br>";
                        } 
                    }
                    echo "</span> </div>";
                    } 

                    $results = $cnx->query("SELECT distinct * FROM pigiste natural join acteurs  natural join article ");
                    $mag = $cnx->query("SELECT distinct * FROM num_magazine ");
                    $tab=array("businessman-g100f12a8a_1280.jpg","stock-g45e7a4a7a_1280.jpg","bitcoin-g97d141cb1_640.jpg","ecommerce-ge02940d9a_640.jpg");
                    $date=array();
                    $magazine=array();
                    foreach($mag as $zine) {
                        array_push($magazine,$zine['code']);
                        array_push($date,$zine['date_publication']);
                    }
                    for($i=0; $i<count($magazine)-1;$i++){
                        $results = $cnx->query("SELECT distinct * FROM pigiste natural join acteurs  natural join article ");
                        affiche_tab($magazine[$i],$date[$i],$tab[$i],$results);
                        

                    } ?>
            </section>
            

            <section id="b">
                <?php
            $results = $cnx->query(" SELECT * from rubrique");
                    echo "<h3> les rubriques de savoir vendre</h3><ul>";
                    foreach ($results as $line){?>
                        <p><?php echo "<li> ",$line['titre']," <li>"?></p>

                    <?php } echo"</lu>"; ?>
            </section>
        </main>
        



    </div>


    <footer>
        <p> Projet de bases de données "presse" 2021 - &copy; réaliser par MABROUK Fayez et KOUAKOU Konan   </p>
    </footer>
</body>
</html>