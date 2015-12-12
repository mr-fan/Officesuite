<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li><a href="<?= $pages->get("/rechnungen/")->url ; ?>">Offene Vorgänge</a></li>
				<?php				
				$systempages = $pages->get("/rechnungen/system/functions/")->children("include=hidden")->not(!$page->headline); 		
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