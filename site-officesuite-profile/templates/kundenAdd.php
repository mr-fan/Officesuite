<?php 

$required_fields = array(
	'title' => $sanitizer->text($input->post->title),
	'strasse' => $sanitizer->text($input->post->kundestreet),
	'plz' => $sanitizer->text($input->post->kundeplz),
	'ort' => $sanitizer->text($input->post->kundeort)
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
		$p = new Page(); // create new page object
		$p->template = 'kunde'; // set template
		$p->parent = wire('pages')->get('/kunden/adressen/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->Name = $sanitizer->text($input->post->kundename) ; // Populate a field
		$p->Vorname = $sanitizer->text($input->post->kundevorname) ; // Populate a field
		$p->Strasse = $sanitizer->text($input->post->kundestreet) ; // Populate a field
		$p->Plz = $sanitizer->text($input->post->kundeplz) ; // Populate a field
		$p->Ort = $sanitizer->text($input->post->kundeort) ; // Populate a field
		$p->kundeNr = $sanitizer->text($input->post->kundeNr) ; // Populate a field
		$p->kundeAnrede = $sanitizer->text($input->post->kundeAnrede) ; // Populate a field
		$p->email = $sanitizer->text($input->post->kundeemail) ; // Populate a field
		$p->Telefon = $sanitizer->text($input->post->kundetelefon) ; // Populate a field
		$p->settingsFirma = $sanitizer->text($input->post->firmenname) ; // Populate a field
		$p->save(); //save the populated fields
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
	} 
$kunden = $pages->get("/kunden/adressen/")->children(); //count the clients to form the clients number
$count = count($kunden); 
$count++;		
	?>
<form action="./" method="post" id="submitform" class="form-horizontal">
	<div class="control-group">
    	<label class="control-label" for="kundeAnrede">Anrede</label>
    	<div class="controls">
      		<select id="kundeAnrede" name="kundeAnrede" class="span1">
      			<option value="Herr">Herr</option>
      			<option value="Frau">Frau</option>
      			<option value="Firma">Firma</option>
      		</select>
    	</div>
  </div>  
	<div class="control-group">
    	<label class="control-label" for="firmenname">Firmenname</label>
    	<div class="controls">
      		<input type="text" id="firmenname" name="firmenname" />
    	</div>
  </div>
	<div class="control-group">
    	<label class="control-label" for="kundename">Name</label>
    	<div class="controls">
      		<input type="text" id="kundename" name="kundename" />
    	</div>
  </div>  
  	<div class="control-group">
    	<label class="control-label" for="kundevorname">Vorname</label>
    	<div class="controls">
      		<input type="text" id="kundevorname" name="kundevorname" />
    	</div>
  </div> 
  <hr />
  	<div class="control-group">
    	<label class="control-label" for="kundestreet">Straße</label>
    	<div class="controls">
      		<input type="text" id="kundestreet" name="kundestreet" required />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="kundeplz">PLZ</label>
    	<div class="controls">
      		<input type="text" id="kundeplz" name="kundeplz" required />
    	</div>
  </div> 
  	<div class="control-group">
    	<label class="control-label" for="kundeort">Ort</label>
    	<div class="controls">
      		<input type="text" id="kundeort" name="kundeort" required />
    	</div>
  </div> 
  <hr />
      <div class="control-group">
    	<label class="control-label" for="kundetelefon">Telefonnummer</label>
    	<div class="controls">
      		<input type="text" id="kundetelefon" name="kundetelefon"  value="<?php echo $page->Telefon ; ?>"/>
    	</div>
  </div>
      <div class="control-group">
    	<label class="control-label" for="kundeemail">E-Mail Adresse</label>
    	<div class="controls">
      		<input type="email" id="kundeemail" name="kundeemail"  value="<?php echo $page->email ; ?>"/>
    	</div>
  </div>	
<hr />
	<input type="hidden" name="kundeNr" id="kundeNr" value="<?php echo $kdkreis.$count; ?>" /> 
  <input type="hidden" name="title" id="title" value="Kunde<?php echo time(); ?>" />  
    	<div class="control-group">
    	<label class="control-label"></label>
    	<div class="controls">
      		<input type="submit" name="submit" value="Kunden speichern" class="btn btn-info" />
    	</div>
  </div> 
	
</form>