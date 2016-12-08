

<html>
    <body>

    </body>
</html>

<?php
session_start();
require_once("util/fonctions.inc.php");
require_once("util/class.PdogestionRS.inc.php");
include("vues/v_entete.php") ;
include("vues/v_bandeau.php") ;

if(!isset($_REQUEST['uc']))
     $uc = 'accueil';
else
	$uc = $_REQUEST['uc'];

$pdo = PdogestionRS::getPdogestionRS();
switch($uc)
{
	case 'accueil':
		{include("vues/v_accueil.php");
	break;}
	case 'connexion' :
		{ include("controleurs/c_connexion.php");
	break; }
	case 'voirSalle' :
		{ include("controleurs/c_voirSalle.php");
	break; }
	case 'reserverSalle' :
	  { include("controleurs/c_reserverSalle.php");
	break;  }
	case 'contacter' :
	  { include("controleurs/c_contacter.php");
	break;  }
}
include("vues/v_pied.php") ;
?>     


