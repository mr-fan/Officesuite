<?php 
	$coreFolder = $page->parent;
	$functionPathOn = ' ';
	if ($coreFolder->name == 'home') {
		$functionPath = $page->name;
		$functionPathOn = " class='active'";
	}
	elseif ($coreFolder->parent->parent->name == 'home') {
		$functionPath = $page->parent->parent->name;
	}
	else {
		$functionPath = $coreFolder->parent->parent->name;
	}

?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li<?= $functionPathOn ?>><a href="<?= $pages->get("/$functionPath/")->url ; ?>" >Übersicht</a></li>
				<?php				
				$systempages = $pages->get("/{$functionPath}/system/functions/")->children("include=hidden")->not(!$page->headline); 		
				foreach($systempages as $child) {
					$class = $child === $page ? " class='active'" : '';
					if (!$child->headline)
					{
						echo ' ';
					}
					else {
						echo "<li$class><a href='{$child->url}'>{$child->headline}</a></li>";	
					}
				}
			?>
			</ul>
		</div>
	</div>
</div>