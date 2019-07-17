<?php 	
    $kategori		= $_GET['kategori'];	
	$waktu			= $_GET['waktu'];	
	
	$connection = mysqli_connect("localhost","root","","db_beratbadan");
	// Check connection
	if (mysqli_connect_errno()){echo "Failed to connect to MySQL: " . mysqli_connect_error();}
	// Setup Query
		$query = "SELECT * FROM makanan WHERE kategori = '".$kategori."'";
	if ($waktu != "ALL"){
		$query = "SELECT * FROM makanan WHERE kategori = '".$kategori."' AND jam_ideal = '".$waktu."'";
	}
	$query_mysql = mysqli_query($connection,$query)or die(mysql_error());
	//Gettin Data
	
	$response = array();
	while($data = mysqli_fetch_array($query_mysql)){
		$h['nama_makanan'] = $data["nama_makanan"];
		$h['kategori'] = $data["kategori"];
		$h['jam_ideal'] = $data["jam_ideal"];
		array_push($response, $h);
	} 
		//Close Connection 
	mysqli_close($connection);
	echo json_encode($response);
	
?>