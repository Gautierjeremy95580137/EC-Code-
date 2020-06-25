<?php ob_start(); ?>

<div class="row">
	<div class="col-md-4 offset-md-8">

    </div>
</div>

<div class="media-detail">
  <div class="video">
    <div>
		<iframe width="560" height="315" src=<?=$row['movie_url']?> frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
  </div>
  <?php
		echo '<div class="title">'.$row['title'].'</div>';
  ?>
  <div class="detail">
	<?php
	// Display duration in xxhxx format and release date in dd/mm/yyyy format  
	$r = explode("-",$row['release_date']);
	$release = $r[2]."/".$r[1]."/".$r[0];
	$d = explode(":",$row['duration']);
	$dur = $d[0]."h".$d[1];
	$desc=$row['type']." sortie le ". $row['release_date']."d'une durée de ".$dur; 
	?>
	<span class="list"><?=$row['type']?> sortie le <?=$release?> d'une durée de <?=$dur;?> </span><br>
	<span class="list">Genre:</span> <?=$row2['1'];?><br>
	<span class="list">Résumé:</span> <?=$row['summary'];?><br>
	<span class="list">statut:</span> <?=$row['status'];?><br>
  </div>
</div>


<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>
