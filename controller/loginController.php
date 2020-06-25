<?php

session_start();

require_once( 'model/user.php' );

/****************************
* ----- LOAD LOGIN PAGE -----
****************************/

function loginPage() {

  $user     = new stdClass();
  $user->id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;
  if( !$user->id ):
    require('view/auth/loginView.php');
  else:
    require('view/homeView.php');
  endif;

}

/***************************
* ----- LOGIN FUNCTION -----
***************************/

function login( $post ) {
	// function with parameters from loginPage()
  $data           = new stdClass();
  $data->email    = $post['email'];
  $data->password = $post['password'];
  $user           = new User( $data );
  $userData       = $user->getUserByEmail();
  $error_msg      = "Email ou mot de passe incorrect";

  if( $userData && sizeof( $userData ) != 0 ):
    if( $user->getPassword() == $userData['password'] ):
		// *********************************************************
		// Check if user account is validated
		// *********************************************************
		$email = $post['email'];
		// $cle = $_post['cle']; // value does not exist for now
		$cle="toto";
		$db = init_db();
		$actif=0;
		$clebdd=0;
		// Get key value in DB
		$stmt = $db->prepare("SELECT * FROM user WHERE email = '".$email."'");
		if($stmt->execute(array(':email' => $email)) && $row = $stmt->fetch())
			{
				$clebdd = $row['cle'];    // Get key
				$actif = $row['Validation']; // $actif will be st to 0 or 1
			}
		// The email md5 code validation is not functional on this server 
		// ============================================================
		// For testing new users the $actif value is set to 1 
		// $actif =1; // ==============================================
		// Test $actif with the value stored in the DB
		if($actif == '1') 
			{
				echo "Votre compte est déjà actif !";
				      // Set session
				$_SESSION['user_id'] = $userData['id'];

				header( 'location: index.php ');
			}
		else // Not yet activated 
		{
		if($cle == $clebdd) // key compairison   
			{
				// the key value match the key in the DB   => actif set to 1
				$stmt = $db->prepare("UPDATE user SET actif = 1 WHERE email = '".$email."'");
				$stmt->bindParam(':email', $email);
				$stmt->execute();
			}
		else 	// If $cle <> cle stored in DB => error 
			{
				$error_msg  = "Erreur ! votre compte n'est pas encore activé...";
			}
		}
	// ****************************************************************
	// End of check user account validation
	// ***************************************************************

    endif;
  endif;

  require('view/auth/loginView.php');
}

/****************************
* ----- LOGOUT FUNCTION -----
****************************/

function logout() {
  $_SESSION = array();
  session_destroy();

  header( 'location: index.php' );
}


function profil() {

    require('view/profil.php');


}

