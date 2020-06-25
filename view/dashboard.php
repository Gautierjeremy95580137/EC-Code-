<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Cod'Flix</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <link href="public/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="public/lib/font-awesome/css/all.min.css" rel="stylesheet" />

    <link href="public/css/partials/partials.css" rel="stylesheet" />
    <link href="public/css/layout/layout.css" rel="stylesheet" />
	<script language="javascript">
	$.ajaxSetup({ cache:false }); 
	
	$(document).ready(function()
		{
		//	$('#sidebarCollapse').hide();$("#reglagesbtn").hide();$("#readallbtn").hide();$("#sql").hide();
		//	$('#Choixcoupbtn').show();$("#scenariobtn").show();$("#aleatoirebtn").show();
			$("#sidebarCollapse").on("click", function() { alert("toggle");  });
		}
		
	</script>	
  </head>


  <body>
  
    <script src="public/lib/jquery/js/jquery-3.5.0.min"></script>
    <script src="public/lib/bootstrap/js/bootstrap.min.js"></script>

      <div class="wrapper d-flex align-items-stretch">
      <nav id="sidebar">
        <h2 class="title">Bienvenue</h2>
        <div class="sidebar-menu">
          <ul>
            <li class="active"><a href="/CodFlix/">Médias</a>
			<li><a href="index.php?action=profil">Mon profil</a></li>
            <li><a href="index.php?action=contact">Nous contacter</a></li>
            <li><a href="index.php?action=logout">Me déconnecter</a></li>
          </ul>
        </div>
      </nav>

        <!-- Page Content  -->
      <div id="content">
        <div class="header">
          <h2 class="title">Cod<span>'Flix</span></h2>
          <div class="toggle-menu d-block d-md-none">
				<button type="button" id="sidebarCollapse" class="btn btn-primary"> 
              <i class="fas fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
          </div>
        </div>
        <div class="content p-4">
          <?= $content; ?>
        </div>
        <footer>Copyright Cod'Flix</footer>
      </div>
    </div>


    <script src="public/js/script.js"></script>
  </body>

</html>
