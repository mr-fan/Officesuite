<?php
$heute = date('j-m-Y');
$required_fields = array(
	'termintext' => $sanitizer->text($input->post->termintext)
);
// check if the form was submitted
if($input->post->terminnew) {
	$datumstring = explode("-", $input->post->termindatum);
	$calendarioform = $datumstring[1].'-'.$datumstring[0].'-'.$datumstring[2];
// determine if any fields were ommitted or didn't validate
  	foreach($required_fields as $key => $value) {
        if( trim($value) == '' ) {
          $error = true;
        }
  }
// if no errors, create a new page
  if(!$error) {
	if($pages->get("include=hidden,name=$calendarioform")->name == $sanitizer->text($calendarioform))
	{
		$p = new Page();
		$p->template = 'basic-page';		
		$parent = wire('pages')->get("name=$calendarioform");
		$p->parent = $parent->id;
		$p->name = $sanitizer->text($input->post->termintext);
		$p->title = $sanitizer->text($input->post->termintext);
		$p->addStatus(Page::statusHidden);
		$p->save();
		$success = true; 
		}
	else {
		$p = new Page();
		$p->template = 'basic-page';	
		$p->parent = wire('pages')->get("/kalender/termine/");
		$p->title = $sanitizer->text($calendarioform);
		$p->name = $sanitizer->text($calendarioform);
		$p->addStatus(Page::statusHidden);
		$p->save();
		$p = new Page();
		$p->template = 'basic-page';
		$parent = wire('pages')->get("name=$calendarioform");
		$p->parent = $parent->id;
		$p->name = $sanitizer->text($input->post->termintext);
		$p->title = $sanitizer->text($input->post->termintext);
		$p->addStatus(Page::statusHidden);
		$p->save(); 
		$success = true;
	}
	}
	}
function getTermine()
{
	$termine = wire('pages')->get("/kalender/termine/")->children("include=hidden, sort=title");	
	$rechnungen = wire('pages')->get("/rechnungen/vorgaenge")->children("include=hidden, invoiceVorgangsart=R,buchungKontenInaktiv=0, sort=datum");
	$lastdatum = "01-01-1970";
	$count = 0;
	
	foreach ($termine as $termin)
	{
		echo "'$termin->title' : '";
		$eintraege = $termin->children("include=hidden");
		foreach ($eintraege as $eintrag)
		{
			echo "<span><p>$eintrag->title</p></span>";	
		}
		echo "', \n";
	}
	if(wire('user')->hasRole("rechnungen") OR wire('user')->isSuperuser()) { 
	foreach ($rechnungen as $rechnung)
	{
		$termin = wire('pages')->get("/kalender/termine/")->child("include=hidden, sort=title, title=$rechnung->datum");			
		if ($lastdatum != $rechnung->datum)			
		{
			if($count > 0) echo "</span>', \n";
			$count = 0;
			echo "'$rechnung->datum' : '<span class=\"badge badge-warning\"><i class=\"icon-warning-sign icon-white\"></i></span><span><a href=\"$rechnung->url\" >Fälligkeit: Rechnung Nr. $rechnung->headline</a>";				
			$eintraege = $termin->children("include=hidden");
			foreach ($eintraege as $eintrag)
			{
				echo "<p>$eintrag->title</p>";	
			}
		}
		else 
		{			
			echo "<a href=\"$rechnung->url\" >Fälligkeit: Rechnung Nr. $rechnung->headline</a>";			
		}
		$count++;
		$lastdatum = $rechnung->datum;
	}		
	if ($count >0) echo "</span>', \n";	
	}
} 
?>