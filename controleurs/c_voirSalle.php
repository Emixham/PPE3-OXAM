<?php
initPanier();
$action = $_REQUEST['action'];
switch($action)
{
	case 'voirCategories':
	{
  		$lesCategories = $pdo->getLesCategories();
		include("vues/v_voircategories.php");
  		break;
	}
	case 'voirSalle' :
	{
		$lesCategories = $pdo->getLesCategories();
		include("vues/v_voircategories.php");
  		$categorie = $_REQUEST['categorie'];
		$lesSalles = $pdo->getLesProduitsDeCategorie($categorie);
		include("vues/v_voirsalle.php");
		break;
	}
?>