<?php
ini_set('soap.wsdl_cache_enabled',0);  // uniquement en phase de dev


class C_MON_SERVEUR{
   
   public function Donne_list()
	{ 

      $pdo = new pdo("sqlsrv:Server=DESKTOP-KVG156O\SQLEXPRESS;Database=PPE3", "laptop", "1234");
      $sql = "SELECT SUM(Total - donner) AS prix_total
FROM LIGNE_DE_FRAIS
GROUP BY NOM union select ID_MISSION FROM MISSION";
      $select=$pdo->query($sql);
	   $resultat = $select->fetch();
	   return $resultat; 
   }


  
   


}

 $mon_serveur = new soapserver('http://127.0.0.1/PPE_3/resources/views/api_soap/services.wsdl');  
 $mon_serveur->setclass('c_mon_serveur');
 $mon_serveur->handle();
 ?> 
 