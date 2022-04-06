<?php

include "connexion.inc.php";


$results = $cnx->query("SELECT matricule, motpass FROM acteurs");
if(isset($_POST['matricule'])){
    foreach ($results as $line) {
        if($line['matricule']==$_POST['matricule'] AND $line['motpass']==$_POST['motpasse'] ){
            $membre=$_POST["membre"];
            if(isset($_POST["membre"])){
                if($membre=="pgst"){
                header("location: https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/pigiste.php");
                Exit();
                }
                if($membre=="maqt"){
                    header("location: https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/maquetiste.php");
                    Exit();
                }
                if($membre=="cmdre"){
                    header("location: https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/comite_red.php");
                    Exit();
                }

                if($membre=="adms"){
                    header("location: https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/administrateur.php");
                    Exit();
                }
            } 
         }

    }
    header("location: https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php");
}


    

?>    
