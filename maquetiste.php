<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="description de la page"/>
    <meta name="keywords" content="mots-clé1, mots-clé2, ..."/>
    <meta name="robots" content="index,follow" />
    <link rel="stylesheet" href="./style.css"> 
    <title>POKA PRESSE</title>
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
            <section id="maquettes">
                <h2>Maquettes</h2>
                <?php
                    include "connexion.inc.php";
                    $results = $cnx->query("SELECT * FROM maquette natural join acteurs");
                    foreach ($results as $line) {?>
                        <p><?php echo  "maquette \t",$line['num_maq'] ,"\t créé le ", $line['date_de_création'],"\t par  \t " ,$line['nom'],"\t",$line['prenom'] ?></p>
                    <?php } ?>
            </section>
            <section id="maquette_publiée">
            <span></span>    
            <h2>Maquette_publiée</h2>
            <?php
                    
                    $results = $cnx->query("SELECT * FROM maquette natural join acteurs where code is not null ");
                    foreach ($results as $line) {?>
                        <p><?php echo  "maquette \t",$line['num_maq'] ,"\t créé le ", $line['date_de_création'],"\t par \t" ,$line['nom'],"\t",$line['prenom'] ?></p>
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