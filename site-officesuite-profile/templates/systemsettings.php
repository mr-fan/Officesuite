<?php include("./head.inc"); ?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Daten</a></li>	
				<?php
					$systempages = $pages -> get("/settings/") -> children("include=hidden");  // draw the sub navigation for this
						foreach ($systempages as $child) {
							$class = $child === $page -> rootParent ? " class='active'" : '';
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
		<hr />
	</div>
</div>

<?php

$required_fields = array(
	'setFirma' => $sanitizer->text($input->post->setFirma),
	'setVorname' => $sanitizer->text($input->post->setVorname),
	'setName' => $sanitizer->text($input->post->setName),
	'setStrasse' => $sanitizer->text($input->post->setStrasse),
	'setPlz' => $sanitizer->text($input->post->setPlz),
	'setOrt' => $sanitizer->text($input->post->setOrt),
	'setBeruf' => $sanitizer->text($input->post->setBeruf),
	'setSteuernr' => $sanitizer->text($input->post->setSteuernr),
	'setBlz' => $sanitizer->text($input->post->setBlz),
	'setKto' => $sanitizer->text($input->post->setKto),
	'setBank' => $sanitizer->text($input->post->setBank),
	'setTax' => $sanitizer->text($input->post->setTax)
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
  			$p = $pages->get("/settings/");
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
			$p->Vorname = $sanitizer->text($input->post->setVorname);
			$p->Name = $sanitizer->text($input->post->setName);
			$p->Strasse = $sanitizer->text($input->post->setStrasse);
			$p->Plz = $sanitizer->text($input->post->setPlz);
			$p->Ort = $sanitizer->text($input->post->setOrt);
			$p->settingsBerufsbezeichnung = $sanitizer->text($input->post->setBeruf);
			$p->settingsSteuernummer = $sanitizer->text($input->post->setSteuernr);
			$p->settingsBlz = $sanitizer->text($input->post->setBlz);
			$p->settingsKto = $sanitizer->text($input->post->setKto);
			$p->settingsBankname = $sanitizer->text($input->post->setBank);
			$p->settingsFirma = $sanitizer->text($input->post->setFirma);
			$p->settingsStyle = $sanitizer->text($input->post->setStyle);
			$p->settingsKleinunternehmer = $sanitizer->text($input->post->setKleinunternehmer);	
			$p->settingsBranding = $sanitizer->text($input->post->setBranding);	
			$p->universalCheck = $sanitizer->text($input->post->setOwnPaper);	
			$p->settingsKundennr = $sanitizer->text($input->post->kundennr);
			$p->settingsRechnungskreis = $sanitizer->text($input->post->rechnungskreis);
			$p->settingsAngebotskreis = $sanitizer->text($input->post->angebotskreis);
			$p->settingsTax = $sanitizer->text($input->post->setTax);
			$p->Fax = $sanitizer->text($input->post->setFax);
			$p->website = $sanitizer->text($input->post->setWeb);
			$p->email = $sanitizer->text($input->post->setEmail);
			$p->Telefon = $sanitizer->text($input->post->setTelefon);
			$p->settingsCustomRg = $sanitizer->text($input->post->customRgKreis);
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

$isChecked2 = '';
if ($page->settingsBranding==1){
	$isChecked2 = "checked";
}
$isChecked3 = '';
if ($page->settingsCustomRg==1){
	$isChecked3 = "checked";
}
if ($page->image) {
	$logothumb = $page->image->last()->width(100);
}	

	?>


<form action="./" method="post" id="submitform" enctype="multipart/form-data">
	<div class="accordion form-horizontal" id="accordion2">
		<div class="accordion-group">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">Persönliche Daten und Adresse</a>
			</div>
			<div id="collapseOne" class="accordion-body collapse in">
				<div class="accordion-inner">
					<div class="control-group">
    					<label class="control-label" for="setFirma">Firma</label>
    					<div class="controls">
      						<input class="span4" type="text" id="setFirma" name="setFirma" value="<?= $page->settingsFirma; ?>" /> 
    					</div>
  					</div>
					<div class="control-group">
    					<label class="control-label" for="setVorname">Vorname</label>
    					<div class="controls">
      						 <input class="span4" type="text" id="setVorname" name="setVorname" value="<?= $page->Vorname; ?>" required /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setName">Nachname</label>
    					<div class="controls">
      						<input class="span4" type="text" id="setName" name="setName" value="<?= $page->Name; ?>" required/> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setStrasse">Straße</label>	
    					<div class="controls">
      						<input class="span4" type="text" id="setStrasse" name="setStrasse" value="<?= $page->Strasse; ?>" required/> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setPlz">PLZ / Ort</label>	
    					<div class="controls">
      						<input class="span1" type="text" id="setPlz" name="setPlz" value="<?= $page->Plz; ?>"required /><input class="span2" type="text" id="setOrt" name="setOrt" value="<?= $page->Ort; ?>" required/>
    					</div>
  					</div>	
  					<div class="control-group">
    					<label class="control-label" for="setWeb">Website</label>	
    					<div class="controls">
      						<input class="span4" type="text" id="setWeb" name="setWeb" value="<?= $page->website; ?>" /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setTelefon">Telefon</label>	
    					<div class="controls">
      						<input class="span4" type="text" id="setTelefon" name="setTelefon" value="<?= $page->Telefon; ?>" /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setEmail">E-Mail</label>	
    					<div class="controls">
      						<input class="span4" type="email" id="setEmail" name="setEmail" value="<?= $page->email; ?>" /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setFax">Fax</label>	
    					<div class="controls">
      						<input class="span4" type="text" id="setFax" name="setFax" value="<?= $page->Fax; ?>" /> 
    					</div>
  					</div>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Berufsbezeichung und StNr.</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse">
			<div class="accordion-inner">
				<div class="control-group">
    					<label class="control-label" for="setBeruf">Berufsbezeichnung</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="setBeruf" name="setBeruf" value="<?= $page->settingsBerufsbezeichnung; ?>" required/> 	
    					</div>
  					</div>	
  				<div class="control-group">
    					<label class="control-label" for="setSteuernr">Steuernummer oder UstID</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="setSteuernr" name="setSteuernr" value="<?= $page->settingsSteuernummer; ?>" required/> 	
    					</div>
  					</div>
			</div>
		</div>
	</div>
		<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse3">Rechnungen</a>
		</div>
		<div id="collapse3" class="accordion-body collapse">
			<div class="accordion-inner">
				<div class="control-group">
    					<label class="control-label">Eigenes Briefpapier?</label>	
    					<div class="controls">
      							<input type="checkbox" id="setOwnPaper" name="setOwnPaper" <?php if($page->universalCheck == 1) { ?> checked <?php }  ?> /><span class="help-inline">Es werden nur Kundenanschrift und Rechnungsposten gedruckt</span>     					
      					</div>
  					</div>
  				<div class="control-group">
    					<label class="control-label" for="wert">Steuersatz für Rechnungen</label>
    					<div class="controls">      		      		
      	 					<select id="steuersatz" name="setTax" class="span1">
      						<?php
								$steuersaetze = $pages->get("/buchhaltung/system/settings/buchhaltungSteuersaetze/")->children("include=hidden");
									foreach ($steuersaetze as $steuersatz) {
									echo " <option value='{$steuersatz->id}' >{$steuersatz->title} %</option>	";
								}?>			
      						</select> 
    					</div>
  					</div>
  				<div class="control-group">
    					<label class="control-label" for="customRgKreis">Eigene Vorgangsnummern verwenden?</label>		
    					<div class="controls">
    						<input type="checkbox" id="customRgKreis" name="customRgKreis" <?= $isChecked3; ?> /><span class="help-inline">Systemeigene Nummernvergabe bei Rechnungen und Angeboten ausschalten und eigene Nummer vergeben.</span>      						   
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="rechnungskreis">Rechnungskreis</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="rechnungskreis" name="rechnungskreis" value="<?= $page->settingsRechnungskreis; ?>" /><span class="help-inline">Wenn gewünscht, können Sie der Rg.Nr. einen Prefix voranstellen</span>   
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="angebotskreis">Angebote</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="angebotskreis" name="angebotskreis" value="<?= $page->settingsAngebotskreis; ?>" /><span class="help-inline">Wenn gewünscht, können Sie der Ang.Nr. einen Prefix voranstellen</span>   
    					</div>
  					</div>
				<div class="control-group">
    					<label class="control-label" for="setBlz">BLZ</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="setBlz" name="setBlz" value="<?= $page->settingsBlz; ?>" required /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setKto">KtoNr.</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="setKto" name="setKto" value="<?= $page->settingsKto; ?>" required /> 
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label" for="setBank">Bankname</label>	
    					<div class="controls">
      						<input class="span4" type="text" id="setBank" name="setBank" value="<?= $page->settingsBankname; ?>" required /> 
    					</div>
  					</div>	
			</div>
		</div>
	</div>	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse4">Unternehmenseinstellungen</a>
		</div>
		<div id="collapse4" class="accordion-body collapse">
			<div class="accordion-inner">					
				  	<div class="control-group">
    					<label class="control-label" >Logo</label>		
    					<div class="controls">
      						<input type="file" name="uploads[]" size="40" accept="image/jpg,image/jpeg,image/gif,image/png"/><span class="help-inline">Das Firmenlogo wird u.a. für Rechnungen benötigt.</span>     						
      						<?php if ($page->image) {	echo "<hr /><p><img src='{$logothumb->url}' title='firmenlogo'/></p>";}?>			
    					</div>
  					</div>
  					<div class="control-group">
    					<label class="control-label">Firmenbranding?</label>	
    					<div class="controls">
      							<input type="checkbox" id="setBranding" name="setBranding" <?= $isChecked2; ?> /><span class="help-inline">zeigt das Firmenlogo in der Menüleiste</span>     					
      					</div>
  					</div>
				<div class="control-group">
    					<label class="control-label" for="setKleinunternehmer">Kleinunternehmer ?</label>		
    					<div class="controls">
      						<input type="checkbox" id="setKleinunternehmer" name="setKleinunternehmer" <?php if($page->settingsKleinunternehmer == 1){ ?>checked<?php } ?> /><span class="help-inline">Haken setzen um Kleinunternehmer Einstellung zu aktivieren</span>
    					</div>
  					</div>	
			</div>
		</div>
	</div>	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse5">Programmeinstellungen</a>
		</div>
		<div id="collapse5" class="accordion-body collapse">
			<div class="accordion-inner">				
				<div class="control-group">
    					<label class="control-label" for="setStyle">Systemgestaltung</label>	
    					<div class="controls">      						
      							<label class="radio">
  									<input type="radio" name="setStyle" value="flatstrap" <?php if($page->settingsStyle == "flatstrap"){ ?>checked<?php } ?>>Keine Runden Ecken  									
								</label>
								<label class="radio">
  									<input type="radio" name="setStyle" value="bootstrap.min"<?php if($page->settingsStyle == "bootstrap.min"){ ?>checked<?php } ?>>Runde Ecken  									
								</label>
    					</div>
  					</div>  					
  					<div class="control-group">
    					<label class="control-label" for="kundennr">Kunden Nr.</label>		
    					<div class="controls">
      						<input class="span4" type="text" id="kundennr" name="kundennr" value="<?= $page->settingsKundennr; ?>" /><span class="help-inline">Wenn gewünscht, können Sie der Kd.Nr. einen Prefix voranstellen</span>   
    					</div>
  					</div>	
			</div>
		</div>
	</div>
</div>
<input type="submit" name="submit" value="Speichern" class="btn btn-info" />
</form>

<?php include("./foot.inc"); ?> 

