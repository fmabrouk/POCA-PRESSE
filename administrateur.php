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
        .stat{
            background-color: orange;
            border: 1px solid black;
            padding: 3px; 
            margin: 3px ;
            text-align: left;
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

                    <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/pigiste.php>pigiste</a></li>
                   <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/comite_red.php>comite_red</a></li>
                   <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/maquetiste.php>maquetiste</a></li>
                   <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php>déconnexion</a></li>
                </ul>
            </nav>

        </aside>

        <main>
            <section id="1">
            <div class="stat">
            <?php
                     include "connexion.inc.php";
                    $results = $cnx->query("SELECT * FROM vue1 natural join acteurs ");
                    echo "<h3>  les meilleurs pigistes de savoir vendre</h3><ul>";
                    foreach ($results as $line){?>
                        <p><?php echo $line['prenom'],"\t",$line['prenom'],"avec" ,$line['nb_arct']," articles <br>" ?></p>
                    <?php } ?>
            </div>
            </section>
            

            <section id="2">
            <div class="stat">
            <?php
               $results = $cnx->query("SELECT * FROM vue3 natural join acteurs");
                    echo "<h3> les meilleurs maquetiste de savoir vendre</h3><ul>";
                    foreach ($results as $line){?>
                        <p><?php echo $line['nom'],"\t",$line['prenom'],"avec" ,$line['nb_maq']," maquettes <br>" ?></p>
                    <?php } ?>
            </div>
            </section>

            <section id="3">
                  
            <div class="stat">
            <?php

               $results = $cnx->query(" SELECT titre,count(code) from contient natural join rubrique group by titre order by count DESC LIMIT 3 ");
                    echo "<h3> les rubriques les plus utilisé dans savoir vendre</h3><ul>";
                    foreach ($results as $line){?>
                        <p><?php echo $line['titre'] ?></p>
                    <?php } ?>
                    </div>
            </section>

           
            
        </main>
        



    </div>


    <footer>
        <p> Projet de bases de données "presse" 2021 - &copy; réaliser par MABROUK Fayez et KOUAKOU Konan   </p>
    </footer>
</body>
</html>