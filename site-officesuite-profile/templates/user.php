<?php include ("./head.inc"); 
$erstellt = date("d.m.Y",$page->created);
$modified = date("d.m.Y",$page->modified);
?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li><a href="<?php echo $pages->get("/settings/")->url ; ?>">Daten</a></li>
				<?php				
				$systempages = $pages->get("/settings/")->children("include=hidden"); 		
				foreach($systempages as $child) {
					$class = $child === $page ? " class='active'" : '';
					echo "<li$class><a href='{$child->url}'>{$child->headline}</a></li>";
				}
			?>
			</ul>
		</div>
		<hr />
	</div>
</div>
<?php 

$required_fields = array(
	'name' => $sanitizer->text($input->post->mitarbeitername),
	'vorname' => $sanitizer->text($input->post->mitarbeitervorname)
);

// check if the form was submitted
if($input->post->submit) {
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, update the page
  if(!$error) {  			
  			$p = $users->get("id=$page->id");
			$p->of(false); // turn off output formatting
    		// tmp upload folder for additional security
    		// possibly restrict access to this folder using htaccess:
    		// # RewriteRule ^.tmp_uploads(.*) - [F]
    		$upload_path = $config->paths->root . "tmp_uploads/";
    		// new wire upload
    		$u = new WireUpload('uploads');
    		$u->setMaxFiles(1);
    		$u->setOverwrite(true);
    		$u->setDestinationPath($upload_path);
    		$u->setValidExtensions(array('jpg', 'jpeg', 'gif', 'png'));
    		// execute upload and check for errors
    		$files = $u->execute();
    		if(!$u->getErrors()){
        	// add images upload
        	foreach($files as $filename) {
            	$p->image = $upload_path . $filename;
        	}
			$p->Name = $sanitizer->text($input->post->mitarbeitername) ; // Populate a field
			$p->Vorname = $sanitizer->text($input->post->mitarbeitervorname) ; // Populate a field
			$p->Strasse = $sanitizer->text($input->post->mitarbeiterstrasse) ; // Populate a field
			$p->Plz = $sanitizer->text($input->post->mitarbeiterplz) ; // Populate a field
			$p->Ort = $sanitizer->text($input->post->mitarbeiterort) ; // Populate a field
			$p->email = $sanitizer->text($input->post->mitarbeiteremail) ; // Populate a field
			$p->Telefon = $sanitizer->text($input->post->mitarbeitertelefon) ; // Populate a field
			if ($input->post->mitarbeiterpasswort)
			{
				$p->pass = $sanitizer->text($input->post->mitarbeiterpasswort) ; // Populate a field
			}	
			$delroles = $roles;
			foreach ($delroles as $delrole)
			{
				$p->removeRole($delrole);
			};
			$roles = $input->post->mitarbeiterrolle;
  			foreach ($roles as $role){
  				$p->addRole($sanitizer->text($role));
  			};		
			$p->save();	
			// remove all tmp files uploaded
        	foreach($files as $filename) unlink($upload_path . $filename);
			 } 
			 else {
        		// remove files
        		foreach($files as $filename) unlink($upload_path . $filename);
		 		// get the errors
        		foreach($u->getErrors() as $error) $message .= "<p class='error'>$error</p>";
    			}				
			$success = true; 
			$p->of(true);
		}
	}
	 if(!$success) {
	  if($error) {
	  	 echo $error_message;} 
	 	}  else { echo $success_message; }
	 	?>
			<form action="./" method="post" id="submitform" class="form-horizontal" enctype="multipart/form-data">
				<div class="row">
					<div class="span2">						
						<?php
						 if ($page->image->count() > 0) 
						{
								$logothumb = $page->image->last()->width(160);
								echo "<p><img class='thumbnail' src='{$logothumb->url}' title='Mitarbeiterbild'/></p>";
						}?><span class="help-block"><small>Neues Bild hochladen</small></span> 	
      					<input type="file" name="uploads[]" accept="image/jpg,image/jpeg,image/gif,image/png"/> 
      					
						<ul class="unstyled">
							<li><hr /></li>
							<li><strong>Erstellt durch: </strong><?php  echo $page->createdUser->name; ?></li>
							<li><strong>Erstellt am: </strong><?php echo $erstellt; ?></li>
							<li><hr /></li>
							<li><strong>Gändert am: </strong><?php echo $modified; ?></li>							
							<li><strong>Gändert durch: </strong><?php echo $page->modifiedUser->name; ?></li>
						</ul>
					</div>
					<div class="span6">          			
          	<div class="control-group">
    	<label class="control-label" for="mitarbeitername">Name</label>
    	<div class="controls">
      		<input type="text" id="mitarbeitername" name="mitarbeitername" required value="<?php echo $page->Name; ?>" />
    	</div>
  </div>  
  	<div class="control-group">
    	<label class="control-label" for="mitarbeitervorname">Vorname</label>
    	<div class="controls">
      		<input type="text" id="kmitarbeitervorname" name="mitarbeitervorname" required value="<?php echo $page->Vorname ; ?>"/>
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterstrasse">Straße</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterstrasse" name="mitarbeiterstrasse"  value="<?php echo $page->Strasse ; ?>"/>
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterplz">PLZ</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterplz" name="mitarbeiterplz" value="<?php echo $page->Plz ; ?>" />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterort">Ort</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterort" name="mitarbeiterort" value="<?php echo $page->Ort ; ?>" />
    	</div>
  </div> 
    <div class="control-group">
    	<label class="control-label" for="mitarbeitertelefon">Telefonnummer</label>
    	<div class="controls">
      		<input type="text" id="mitarbeitertelefon" name="mitarbeitertelefon"  value="<?php echo $page->Telefon ; ?>"/>
    	</div>
  </div>
      <div class="control-group">
    	<label class="control-label" for="mitarbeiteremail">E-Mail Adresse</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiteremail" name="mitarbeiteremail"  value="<?php echo $page->email ; ?>"/>
    	</div>
  </div>
   <div class="control-group">
    	<label class="control-label" for="mitarbeiterpasswort">Neues Passwort</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterpasswort" name="mitarbeiterpasswort" />
    	</div>
  </div>			
		</div>
		<div class="span4">
			<h4><strong>Systemberechtigung</strong></h4>
			<hr />
  			<label>Berechtigungen ändern</label> 			
   			 <select id="mitarbeiterrolle" name="mitarbeiterrolle[]" data-placeholder="Berechtigungen wählen" class="input-xlarge chzn-select" multiple="true" >
			<?php 			
			foreach($roles as $role)
    		{
    			if ($role->name !="guest")
				{
					if ($page->hasRole($role))
						{
							echo "<option  selected='true' value='{$role->name}' >{$role->name}</option>";	
						}					
					else
						{
							echo "<option value='{$role->name}' >{$role->name}</option>";													
						}					
				}
			}	
    		 ?>  
			</select><hr />	
		</div>
	</div>
	<hr />	
	<input type="submit" name="submit" value="Änderungen speichern" class="btn btn-primary" />
	<a class="btn btn-danger pull-right" href="<?= $pages->get("/settings/mitarbeiterDel/")->url; ?>?choosen=<?= $page->id?>">Mitarbeiter Löschen</a> 
</form>	
	
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript"> 
	$(".chzn-select").select2(); 
	$(".chzn-select-deselect").select2({allow_single_deselect:true});
</script>
<?php include ("./foot.inc"); ?>