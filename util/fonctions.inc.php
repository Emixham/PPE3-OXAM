<?php
function connexion()
{
	if(!isset($_SESSION['connexion']))
	{
		$_SESSION['connexion']= array();
	}
}

function ajouterUneConnexion($id)
{
		$_SESSION['connexion'][]= $id;
}

function deconnexion()
{
	unset($_SESSION['connexion']);
}
?>