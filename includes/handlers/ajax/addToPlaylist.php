<?php
include("../../config.php");


if(isset($_POST['playlistId']) && isset($_POST['songId'])) {
	$playlistId = $_POST['playlistId'];
	$songId = $_POST['songId'];

	$orderIdQuery = mysqli_query($con, "SELECT IFNULL(MAX(playlistOrder) + 1, 1)  as playlistOrder FROM playlistSongs WHERE playlistId='$playlistId'");
	$row = mysqli_fetch_array($orderIdQuery);
	$order = $row['playlistOrder'];
	$query = mysqli_query($con, "INSERT INTO playlistSongs VALUES(NULL, '$songId', '$playlistId', '$order')");

	$triggerAlert = mysqli_query($con, "SELECT songID FROM RecentlyAdded WHERE songID='$songId'");
	$idsong= mysqli_fetch_array($triggerAlert)["songID"];
	$songName = mysqli_query($con, "SELECT title FROM Songs WHERE id='$idsong'");
	$playlistName = mysqli_query($con, "SELECT name FROM playlists WHERE id='$playlistId'");
	echo "Added Song '".mysqli_fetch_array($songName)["title"]."' To '".mysqli_fetch_array($playlistName)["name"]."'";

}
else {
	echo "PlaylistId or songId was not passed into addToPlaylist.php";
}



?>
