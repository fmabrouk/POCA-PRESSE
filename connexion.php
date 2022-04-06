<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="description de la page"/>
        <meta name="keywords" content="mots-clé1, mots-clé2, ..."/>
        <meta name="robots" content="index,follow" />
        
        
 <style>
     body {
			background-color:rgb(153,204,255); 
			font-family:Verdana,Helvetica,Arial,sans-serif;
        }
    div{
        text-align: center;
    }
    
 </style>
    </head>

    <body>
        <div>
        <h1>POKA PRESSE</h1>
        
        <img src="magazines-800x445.jpg" alt="image d'accueil">
        <section >
            <h2>connexion</h2>
            <br><br>
            <form action="siteweb.php" method="POST" >
                Membre <select name="membre" required>
                    <option value="" selected="selected">-- membre --</option>
                    <option value="maqt">maquettiste</option>
                    <option value="pgst">pigiste</option>
                    <option value="cmdre">comité de rédaction </option>
                    <option value="adms">administrateur</option>
                    </select>
                    <br><br>
                    <span>Entrez votre matricule et votre mot de passe.</span><br><br>
                <label >matricule:</label><br>
                <input type="text"name="matricule" required><br>

                <label >mot de passe:</label><br>
                <input type="password"  name="motpasse" required><br><br>
                <button type="submit">Valider</button><br>
                <br/>
                <span><a href="password.html">Mot de passe oublié ?</a></span>
                <br />
                <span><a href="creation_compte.php">Créer un compte</a></span>
            </form>
        </section>
        </div>
        


    </body>
</html>