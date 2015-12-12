<?php

	$logothumb = $pages->get("/settings/")->image->last()->height(40);

	$rechnungsNr = $sanitizer->text($input->get->invoice);
	$rechnung = $pages->get("id=$rechnungsNr"); 
	$datumstring = explode("-", $rechnung->datum);
	$displayform = $datumstring[1].'.'.$datumstring[0].'.'.$datumstring[2];
	$systemsets = $pages->get("/settings/"); 
	$rechnungposten = $rechnung->children("include=hidden");
	$vorgangsartHead = "Angebot"; // catch the type of the invoice
	$vorgangart = "Angebotsnummer:";
	if ($rechnung->invoiceVorgangsart == "R")
	{
		$vorgangart = "Rechnungsnummer:";
		$vorgangsartHead = "Rechnung";
	}
    // get the HTML
    ob_start();
    include('./scripts/invoicePrintData.php');
    $content = ob_get_clean();

    // convert to PDF
    require_once('./scripts/html2pdf.php');
    try
    {
        $html2pdf = new HTML2PDF('P', 'A4', 'de');
        $html2pdf->pdf->SetDisplayMode('fullpage');
		$html2pdf->pdf->SetProtection(array('print'), '');
        $html2pdf->writeHTML($content);
        $html2pdf->Output($vorgangsartHead. $rechnung->headline .'.pdf', D);
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
