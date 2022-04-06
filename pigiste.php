<!DOCTYPE html>
<html lang="fr">
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
    #t{
        text-indent:0.05em;
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
                    
                   <li> <a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php>déconnexion</a></li>
                </ul>
            </nav>

        </aside>

        <main>
                     
            <section id="mes articles">
            <br><br>  
            <h2>articles</h2>
            <?php    include "connexion.inc.php";
                    $results = $cnx->query("SELECT * FROM article natural join acteurs ");
                    echo "<p> tout les articles de savoir vendre</p><ul>";
                    foreach ($results as $line){?>
                        <p><?php echo "<li>",$line['titre'],"</li> ecrie par ",$line['nom'], "\t",$line['prenom'],"<br>" ?></p>
                    <?php } ?>
                <span></span>
            </section>

            
        </main>
        



    </div>


    <footer>
        <p> Projet de bases de données "presse" 2021 - &copy; réaliser par MABROUK Fayez et KOUAKOU Konan   </p>
    </footer>
</body>
</html>