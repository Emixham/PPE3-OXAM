<h2>Connexion</h2>

<form method="POST" action="index.php?uc=administrer&action=confirmer">
	<p>
	<label for="nom">Login :</label>
		<input id="nom" type="text" name="nom" value="" size="50">
	</p>
	<p>
	<label for="mdp">Mot de passe :</label>
		<input id="mdp" type="text" name="mdp" value="" size="50">
    </p>
        <input type="submit" value="Valider" name="valider">
        <input type="reset" value="Annuler" name="annuler"> 
</form>