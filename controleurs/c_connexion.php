
<?php
$action = $_REQUEST['action'];
switch($action)
{
	case 'seconnecter':
	{
		if(!isset($_SESSION['id']))
			{
				include("vues/v_connexion.php");
			}
		else
			{
				include("vues/v_deconnexion.php");
			}


	break;
	}
	case 'connexion':
	{
		$nom =$_POST['nom'];
		$mdp =$_POST['mdp'];

		$resultat = $pdo ->seConnecter($nom,$mdp);
		if (!$resultat)
		{
		    $message="Nom de compte ou mot de passe incorect";
			include("vues/v_message.php");
		}
		else
		{
		    
		    $_SESSION['id'] = $resultat['id'];
		    $_SESSION['nom'] = $nom;
		    echo 'Vous êtes connecté !';
		    header('location: index.php?uc=voirProduits&action=voirCategories');

		}
	break;
	}
	case 'deconnexion':
	{
		$_SESSION = array();
		session_destroy();
		header('location: index.php');

	break;
	}
}







?>