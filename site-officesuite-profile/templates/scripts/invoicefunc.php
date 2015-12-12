<?php
// check if the form was submitted
if($input->post->invoiceclose1) { //close the invoice without adding it to the accounting module
			$rechnung= $sanitizer->pageName($input->post->rechnungsid);
  			$p = $pages->get($rechnung);
			$p->of(false); // turn off output formatting
  			$p->buchungKontenInaktiv = 1;
  			$p->save(); //save the page
  			$success = true;  				 		
	}
// check if the form was submitted
if($input->post->invoiceclose2) { //close the invoice and add it to the accounting module

  if(!$error) {
  			$tag =date("j") ;
	  		$monat =date("m") ;
	  		$jahr = date("Y");
  			$nameandtitle = "buchung".time();			
			$rechnungswert = $sanitizer->text($input->post->rechnungssumme) ;
			$zwischenwert = $sanitizer->text($input->post->rechnungssumme) ; 
			if ($systemsets->settingsKleinunternehmer == 0) {
				$steuersatz = $systemsets->settingsTax->title/100;
	 			$steuern = $zwischenwert*$steuersatz;
	 			$rechnungswert = $zwischenwert+$steuern;
			}
  			$rechnung= $sanitizer->pageName($input->post->rechnungsid);
  			$p = $pages->get($rechnung);
			$p->of(false); // turn off output formatting
  			$p->buchungKontenInaktiv = 1;
			$p->invoiceInAccounting = 1;
  			$p->save(); //save the page
  			$p = new Page(); // create new page object in accounting
			$p->template = 'buchung'; // set template
			$p->parent = wire('pages')->get('/buchhaltung/buchungen/'); // set the parent 
			$p->name = $nameandtitle; // give it a name used in the url for the page
			$p->title = $nameandtitle; // set page title (not neccessary but recommended)
			$p->save(); //create the page
			// populate fields
			$p->buchungBuchungstext = $sanitizer->text($input->post->rechnungsheadline) ; // Populate a field
			$p->buchungTag = $tag ; // Populate a field
			$p->buchungMonat = $monat ; // Populate a field
			$p->buchungJahr = $jahr ; // Populate a field
			$p->buchungKostenart = $sanitizer->text($input->post->rechnungsbuchkonto) ; // Populate a field
			$p->buchungSteuersatz = $pages->get('/settings/')->settingsTax->id ; // Populate a field
			$p->buchungWert = str_replace(",", ".", $rechnungswert) ; // Populate a field
			$p->buchungArt = E ; // Populate a field
			$p->buchungbelegid = $sanitizer->text($input->post->rechnungsheadline) ; // Populate a field		
			$p->save(); //save the populated fields			
			$success = true; 
			} 				 		
		}
$required_fields = array(
	'kunde' => $sanitizer->text($input->post->title)
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
  		$p = $pages->get("/rechnungen/vorgaenge");  //update the counter fields 
  		$p->of(false); // turn off output formatting	
    		if ($p->counterVg == 0)
			{
				$anzahlvorgaenge = 1;
				$p->counterVg = $anzahlvorgaenge;
				$p->save();
			}	
			else {
				$anzahlvorgaenge = $p->counterVg;
				$anzahlvorgaenge++;
				$p->counterVg = $anzahlvorgaenge;
				$p->save();
			} 		
  		if ($input->post->vorgangsart == R) //look which type of invoice is created, count the special type and give it +1 to form the invoice number
		{
			if ($p->counterRg == 0)
			{
				$vorgangnr = 1;
			}
			else 
			{
				$vorgangnr = $p->counterRg;	
				$vorgangnr++;
			}			
			$p->counterRg = $vorgangnr;
			$p->save();
			$vorgangnr = $rgkreis.$vorgangnr;
		}
		else 
		{
			if ($p->counterAg == 0)
			{
				$vorgangnr = 1;
			}
			else 
			{
				$vorgangnr = $p->counterAg;	
				$vorgangnr++;
			}			
			$p->counterAg = $vorgangnr;
			$p->save();
			$vorgangnr = $agkreis.$vorgangnr;
		}	
		
		$p = new Page(); // create new page object
		$p->template = 'invoiceDetail'; // set template
		$p->parent = wire('pages')->get('/rechnungen/vorgaenge/'); // set the parent 
		$p->name = $sanitizer->text($input->post->title); // give it a name used in the url for the page
		$p->title = $sanitizer->text($input->post->title); // set page title (not neccessary but recommended)
		$p->save(); //create the page
		// populate fields
		$p->invoiceKunde = $sanitizer->text($input->post->kunde);
		
		if ($systemsets->settingsCustomRg==1) // check if own invoice number is wished, if so populate the own number else generate it
		{
			$p->headline = $sanitizer->text($input->setVorgangNr);	
		}
		else 
		{
			$p->headline = $vorgangnr;
		}		
		$p->invoiceBuchungsKonto = $sanitizer->text($input->post->kostenart); 
		$p->invoiceVorgangsart = $sanitizer->text($input->post->vorgangsart);
		$p->save(); //save the populated fields
		$newInvoice = $p->url;
		$success = true; 
		}
	}

		$vorgaenge = $pages->get("/rechnungen/vorgaenge/"); 
		$count = $vorgaenge->counterVg; 
		$count++;	
		if (empty($count))
		{
			$count = 1;
		}

	if(!$success) { 
 		 if($error) {
        	echo $error_message; 
 		}
 		} 
 		else 
 		{
  			echo $success_message; 
		} 

	?>