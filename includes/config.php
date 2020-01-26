<?php
	ob_start();					//it creates the buffer that will store all output after it is called
	session_start();

	$timezone = date_default_timezone_set("Indian/Maldives");

	$con = mysqli_connect("localhost", "root", "", "slotify");

	if(mysqli_connect_errno()) {
		echo "Failed to connect: " . mysqli_connect_errno();
	}
?>