<html lang="fr">
<head>
    <title>creation de compte</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="description de la page"/>
    <meta name="keywords" content="mots-clé1, mots-clé2, ..."/>
    <meta name="robots" content="index,follow" />
    
    <style>
        body {
               background-color:rgb(153,204,255); 
               font-family:Verdana,Helvetica,Arial,sans-serif;
           }
       
    </style>
    </head>
    <body>
        <h1>creer un compte</h1>
        <form action="creation_compte.php" method="POST">
            <label>sexe</label><br>
            <label >M</label>
            <input type="radio" name="sexe" value="1">
            <label >Mme</label>
            <input type="radio" name="sexe" value="2">
            <label >mlle</label>
            <input type="radio" name="sexe" value="3"><br><br>
            <label>matricule :</label><br>
            <input type="text" name="matricule" size="30" required/><br>
             <label>prénom :</label><br>
             <input type="text" name="prenom" size="30" required/><br>
             <label>nom :</label><br>
             <input type="text" name="nom" size="30" required/><br>
             <label>mail :</label><br>
             <input type="email" name="mail"  placeholder="Votre adresse mail" size="30" required/><br>
             <label>mot de passe:</label><br>
             <input type="password" name="motpasseun" size="30" required/><br>
             <label>Confirmer le mot de passe :</label><br>
             <input type="password" name="motpassede" size="30" required/><br><br>
             <input type="submit" value="Valider"/>
        </form>
        <br><a href=https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php> retournez a la page de connection</a>
        <?php
            include "connexion.inc.php";
            $results = $cnx->query("SELECT matricule FROM acteurs");
            $requete = 'UPDATE acteurs SET motpass = :motpasse WHERE matricule = :matricule';
            if(isset($_POST['matricule']) and isset( $_POST['motpasseun'])){
                if($_POST["motpasseun"]==$_POST["motpassede"]){
                    foreach ($results as $line) {
                        if($line['matricule']==$_POST["matricule"]){
                            if (!empty( $_POST['motpasseun'])) {
                                $insert = $cnx->prepare($requete);
                                $succes = $insert->execute(array('motpasse'=>$_POST['motpasseun'],'matricule'=>$_POST['matricule']));
                                echo $_POST['matricule'], $succes;
                                if ($succes){
                                    echo "votre compte a été creer";
                                    header("location:https://etudiant.u-pem.fr/~konan.kouakou/projet_bdd/connexion.php");
                                }
                                else{
                                    echo 'Erreur lors de l\'ajout de votre mot de passe !';
                                }   
                            }
                            else {
                                echo 'entre un mot de passe !';
                            }

                        }else{
                            echo "erreur sur le maticule";
                        }
                    }
                }
                else{
                    echo "comfimation mot de passe different ";
                }
            
            }   
            
        ?>
        


    </body>
</html>