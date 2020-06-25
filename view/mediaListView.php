<?php ob_start(); ?>

<div class="row">
	<div class="col-md-4 offset-md-8">
        <form method="get">
            <div class="form-group has-btn">
                <input type="search" id="search" name="title" value="<?= $search; ?>" class="form-control"
                       placeholder="Rechercher un film ou une série">
                <button type="submit" class="btn btn-block bg-red">Valider</button>
            </div>
        </form>
    </div>
</div>

<div class="media-list">
    <?php foreach( $medias as $media ): ?>
        <a class="item" href="index.php?media=<?= $media['id']; ?>">
            <div class="video">
                <div>
					<iframe width="560" height="315" src=<?=$media['trailer_url']?> frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
			<?php
			// Change title color  for 'serie' type *******************
			// add titleserie in media.css ****************************	
				if ($media['type'] == 'serie')
					{echo '<div class="titleserie">'.$media['title'].'</div>';} 
				else 
					{echo '<div class="title">'.$media['title'].'</div>';}  
				$d=explode(":",$media['duration']);
				echo "&nbsp;&nbsp;&nbsp;  Durée: ".$d[0]."h".$d[1];
			?>
			</a>
    <?php endforeach; ?>
</div>


<?php $content = ob_get_clean(); ?>

<?php require('dashboard.php'); ?>
