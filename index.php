<?php

require_once( 'controller/homeController.php' );
require_once( 'controller/loginController.php' );
require_once( 'controller/signupController.php' );
require_once( 'controller/mediaController.php' );

/**************************
* ----- HANDLE ACTION -----
***************************/
if ( isset( $_GET['media'] ) ):
	mediadetailPage($_GET['media']);
endif;

if ( isset( $_GET['action'] ) ):

  switch( $_GET['action']):

    case 'login':
		
      if ( !empty( $_POST ) ) login( $_POST );
      else loginPage();

    break;

    case 'signup':
      signupPage();
    break;
	
    case 'contact': // to contact page
      contact();
    break;

    case 'profil': // to profil page
	   profil();
    break;
	
	case 'DeleteAcc': // to Delete account page
	   deleteacc();
    break;

	case 'changeE': // to change email page
	   changee();
    break;	

	case 'changeMDP': // to change password page
	   changemdp();
    break;	
	
	case 'inscription':
	   newuser();
    break;

    case 'logout':
      logout();
    break;

  endswitch;

else:

  $user_id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;

  if( $user_id ):
    mediaPage();
  else:
    homePage();
  endif;

endif;
