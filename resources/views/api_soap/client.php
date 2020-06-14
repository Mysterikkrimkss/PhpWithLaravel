<?php

$Client_Soap= new SoapClient('http://127.0.0.1/PPE3/resources/views/api_soap/services.wsdl', array('trace' => 1));



  //$id = Auth::user()->id;

  $req = $Client_Soap->__soapCall('Donne_list', array ($id));
  echo '----------- Liste des Utilisateur  ---------------<br>';
   foreach($req as $test){
     echo "\r - $test \r ";
   };

 
 
/*





