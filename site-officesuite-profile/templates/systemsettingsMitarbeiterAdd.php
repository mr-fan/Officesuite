<?php include ("./head.inc"); ?>
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
$required_fields = array(
	'title' => $sanitizer->text($input->post->title),
	'name' => $sanitizer->text($input->post->mitarbeitername),
	'passwort' => $sanitizer->text($input->post->mitarbeiterpasswort),
	'email' => $sanitizer->text($input->post->mitarbeiteremail),
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
// if no errors, create a new page
  if(!$error) {  		
			$mitarbeiter = new User();
	  		$mitarbeiter->name = $sanitizer->text($input->post->mitarbeitername).$sanitizer->text($input->post->mitarbeitervorname);
			$mitarbeiter->pass = $sanitizer->text($input->post->mitarbeiterpasswort);
			$mitarbeiter->email = $sanitizer->text($input->post->mitarbeiteremail);
			$mitarbeiter->save();
	  		$mitarbeiter->of(false); // turn off output formatting
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
            	$mitarbeiter->image = $upload_path . $filename;
        	}		
		$mitarbeiter->Name = $sanitizer->text($input->post->mitarbeitername) ; // Populate a field		
		$mitarbeiter->Vorname = $sanitizer->text($input->post->mitarbeitervorname) ; // Populate a field
		$mitarbeiter->Strasse = $sanitizer->text($input->post->mitarbeiterstrasse) ; // Populate a field
		$mitarbeiter->Plz = $sanitizer->text($input->post->mitarbeiterplz) ; // Populate a field
		$mitarbeiter->Ort = $sanitizer->text($input->post->mitarbeiterort) ; // Populate a field
		$mitarbeiter->Telefon = $sanitizer->text($input->post->mitarbeitertelefon) ; // Populate a field
		$roles = $input->post->mitarbeiterrolle;
  		foreach ($roles as $role){
  			$mitarbeiter->addRole($sanitizer->text($role));
  		};		
		$mitarbeiter->save();
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
		}
	}
	if(!$success) 
	{ 
  		if($error) 
  		{
        	echo $error_message; 
  		} 
	}  
	else 
	{
  echo $success_message;
  echo '<h4>Login : '.$mitarbeiter->name.'</h4>'; 
  echo '<h5>Passwort : Ihr gewähltes Passwort</h5>'; 
	} ?>

<form action="./" method="post" class="form-horizontal" enctype="multipart/form-data"> 
	<div class="control-group">
    	<label class="control-label" for="mitarbeitername">Name</label>
    	<div class="controls">
      		<input type="text" id="mitarbeitername" name="mitarbeitername" required />
    	</div>
  </div>  
  	<div class="control-group">
    	<label class="control-label" for="mitarbeitervorname">Vorname</label>
    	<div class="controls">
      		<input type="text" id="kmitarbeitervorname" name="mitarbeitervorname" required />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterstrasse">Straße</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterstrasse" name="mitarbeiterstrasse"  />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterplz">PLZ</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterplz" name="mitarbeiterplz"  />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="mitarbeiterort">Ort</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterort" name="mitarbeiterort"  />
    	</div>
  </div> 
    <div class="control-group">
    	<label class="control-label" for="mitarbeitertelefon">Telefonnummer</label>
    	<div class="controls">
      		<input type="text" id="mitarbeitertelefon" name="mitarbeitertelefon"  />
    	</div>
  </div>
      <div class="control-group">
    	<label class="control-label" for="mitarbeiteremail">E-Mail</label>
    	<div class="controls">
      		<input type="email" id="mitarbeiteremail" name="mitarbeiteremail" required /><span class="help-inline">Diese Angabe ist zwingend erforderlich für das Rechte Management</span>
    	</div>
  </div>
   <div class="control-group">
    	<label class="control-label" for="mitarbeiterpasswort">Passwort</label>
    	<div class="controls">
      		<input type="text" id="mitarbeiterpasswort" name="mitarbeiterpasswort"  required/>
    	</div>
  </div>
  <hr /> 
  <div class="control-group">
    	<label class="control-label" >Bild</label>		
    	<div class="controls">
      			<input type="file" name="uploads[]" size="40" accept="image/jpg,image/jpeg,image/gif,image/png"/>   			
    	</div>
 </div>   
  <div class="control-group"> 
  	<label class="control-label" >Systemberechtigungen</label>	   			
    	<div class="controls">
    		<select id="mitarbeiterrolle" name="mitarbeiterrolle[]" data-placeholder="Berechtigungen wählen" class="input-xlarge chzn-select" multiple="true" >
				<?php foreach($roles as $role)
    		{
    			if ($role->name != guest)
    			{
    				echo "<option value='$role->name' >$role->name</option>";	}  } ?>  
			</select>
    		 	
    	</div>
  </div>		
  <input type="hidden" name="title" id="title" value="Mitarbeiter<?php echo time(); ?>" />  
	  <div class="control-group">  
	  	<label class="control-label"></label>  			
    	<div class="controls">
    		<input type="submit" name="submit" value="Mitarbeiter anlegen" class="btn btn-info" />    		 	
    	</div>
  </div>	
</form>

  </div>
</div>

<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/select2.min.js"></script>
<script type="text/javascript"> 
	$(".chzn-select").select2(); 
	$(".chzn-select-deselect").select2({allow_single_deselect:true});
</script>
<?php include ("./foot.inc"); ?>