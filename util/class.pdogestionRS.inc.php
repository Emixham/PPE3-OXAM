<?php

class PdogestionRS
{   		
      	private static $serveur='mysql:host=localhost';
      	private static $bdd='dbname=gestionRS';   		
      	private static $user='root' ;    		
      	private static $mdp='' ;	
		private static $monPdo;
		private static $monPdogestionRS = null;
				
	private function __construct()
	{
    		PdogestionRS::$monPdo = new PDO(PdogestionRS::$serveur.';'.PdogestionRS::$bdd, PdogestionRS::$user, PdogestionRS::$mdp); 
			PdogestionRS::$monPdo->query("SET CHARACTER SET utf8");
	}
	public function _destruct(){
		PdogestionRS::$monPdo = null;
	}

	public  static function getPdogestionRS()
	{
		if(PdogestionRS::$monPdogestionRS == null)
		{
			PdogestionRS::$monPdogestionRS= new PdogestionRS();
		}
		return PdogestionRS::$monPdogestionRS;  
	}
	
	public function getLesCategories()
	{
		$req = "select * from categorie";
		$res = PdogestionRS::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

		public function getLaCategorie($id)
	{
		$req = "select * from categorie where id='$id'";
		$res = PdogestionRS::$monPdo->query($req);
		$lesLignes = $res->fetch();
		return $lesLignes;
	}
	public function getLesSalles()
	{
		$req = "select * from salle";
		$res = PdogestionRS::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}

		public function getLaSalle($id)
	{
		$req = "select * from salle where id='$id'";
		$res = PdogestionRS::$monPdo->query($req);
		$lesLignes = $res->fetch();
		return $lesLignes;
	}



}