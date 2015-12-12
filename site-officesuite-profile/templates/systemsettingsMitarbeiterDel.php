<?php include("./head.inc");  ?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li><a href="<?php echo $pages->get("/settings/")->url ; ?>">Daten</a></li>
				<?php				
				$systempages = $pages->get("/settings/")->children("include=hidden"); 		
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
<div class="row">
  <div class="span12">
		<hr />
		<?php 
$choosen = $sanitizer->text($input->get->choosen);

// check if the form was submitted
if($input->post->submit) {

// if no errors, delete the page
  if(!$error) {
  		$name = $sanitizer->pageName($input->post->delpage);
		if(strlen($name)) {
  			$p = $users->get("id=$name");
  			if($p->id) $p->delete();
  			$success = true;  
			
			}		
		}
	}
 if(!$success) { 
  if($error) {
        echo $error_message; 
	 }
  ?>
  <h3 class='alert alert-danger'>Achtung Sie löschen einen Mitarbeiter</h3>
<form action="./" method="post" id="submitform" class="">
  	<input type="hidden" name="delpage" id="delpage" value="<?php echo $choosen; ?>"  /> 	
	<input type="submit" name="submit" value="Mitarbeiter löschen" class="btn btn-primary" />
</form>
<?php }  else {
  echo $success_message."<a href='$homepage->url/settings/' title='zurück' class='btn'>Zurück</a> "; 
 } ?>
</div>
</div>
<?php include ("./foot.inc"); ?>