<?php 
	
	$tinggibadan 	= $_GET['tinggibadan']/100;
    $beratbadan		= $_GET['beratbadan'];
	

	
	$resultbmi = 0;
    $resultbmi = $beratbadan /($tinggibadan * $tinggibadan);
	$hasil ='';
    if ($resultbmi <= 18.5) {
        $hasil = "KURUS";
        } else if ($resultbmi > 18.5 AND $resultbmi<=24.9 ) {
        $hasil = "IDEAL";

        } else if ($resultbmi > 24.9 AND $resultbmi<=29.9) {
        $hasil = "GEMUK";

        } else if ($resultbmi > 30.0) {
        $hasil = "OBESITAS";
    }
	$json[] = array('bmi' => round($resultbmi,2),'hasil' => $hasil);
	echo json_encode($json);
	
?>