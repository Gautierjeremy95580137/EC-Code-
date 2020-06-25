<?php

require_once( 'model/media.php' );
/***************************
* ----- LOAD All media PAGE -----
***************************/

function mediaPage() {
  $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
  $medias = Media::filterMedias( $search );
  require('view/mediaListView.php');
}

/***************************
* ----- LOAD serie PAGE -----
***************************/

function seriePage() {
  $search = isset( $_GET['title'] ) ? $_GET['title'] : null;
 // echo "serie";
  $medias = Media::filterSeries( $search );
  require('view/mediaListView.php');
}

/***************************
* ----- Load / display details -----
***************************/
function mediadetailPage($idmedia) {
    // Open database connection
	$conn = init_sqli();
	$result = mysqli_query($conn, 'SELECT * FROM media WHERE id = "'.$idmedia.'"');
	$row = mysqli_fetch_array($result, MYSQLI_BOTH);
	$result2 = mysqli_query($conn, 'SELECT * FROM genre WHERE id = "'.$row['genre_id'].'"');
	$row2 = mysqli_fetch_array($result2, MYSQLI_BOTH);
	mysqli_close($conn);

	require('view/mediaDetailView.php');
}
