<?php

/**
 * Search template
 *
 */

$out = '';

if($q = $sanitizer->selectorValue($input->get->q)) {

	// Send our sanitized query 'q' variable to the whitelist where it will be
	// picked up and echoed in the search box by the head.inc file.
	$input->whitelist('q', $q); 

	// Search the title, body and sidebar fields for our query text.
	// Limit the results to 50 pages. 
	// Exclude results that use the 'admin' template. 
	$matches = $pages->find("title|Name|Vorname|Ort|headline|kundeNr|Strasse%=$q, limit=50"); 

	$count = count($matches); 

	if($count) {
		$out .= "<h3 class='alert alert-success'>$count Ergebnisse die Ihrer Suche entsprechen:</h3>" . 
			"<table class='table table-striped table-bordered table-condensed'>";

		foreach($matches as $m) {
			$out .= "<tr><td><a href='{$m->url}'>{$m->name}</a></td></tr>";
		}

		$out .= "</table>";

	} else {
		$out .= "<h3 class='alert alert-danger'>Keine Einträge vorhanden.</h3>";
	}
} else {
	$out .= "<h4>Bitte geben Sie einen Suchbegriff in die Suchmaske ein (obere rechte Ecke)</h4>";
}

// Note that we stored our output in $out before printing it because we wanted to execute
// the search before including the header template. This is because the header template 
// displays the current search query in the search box (via the $input->whitelist) and 
// we wanted to make sure we had that setup before including the header template. 

include("./head.inc"); 

echo $out; 

include("./foot.inc"); 
