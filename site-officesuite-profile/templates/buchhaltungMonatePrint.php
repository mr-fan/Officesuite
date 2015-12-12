<?php
	$systemsets = $pages->get("/settings");
	$heute = date('d.m.Y');
	if ($input->get->jahr == 0 )
{
	$jahr = date("Y");
}
else {
	$jahr = $sanitizer->text($input->get->jahr);
};
if ($input->get->monat == 0 )
{
	$monat = date("m");
}
else {
	$monat = $sanitizer->text($input->get->monat);
};
						
					//check if its January, if so grab the sum from the past year
					if ($monat == 1)
					{
						$jahr2=$jahr;
						$monat2 = 13;
						$jahr2--;
						$einnahmenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat<$monat2,buchungJahr=$jahr2"); // get income from the passed years
						$ausgabenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat<$monat2,buchungJahr=$jahr2");	 // get expense from the passed years	
					}
					else {
						$einnahmenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat<$monat,buchungJahr=$jahr"); // get income from the passed years
						$ausgabenVormonat = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat<$monat,buchungJahr=$jahr");	 // get expense from the passed years
					};
					// go trough our entries and sum them
					foreach ($einnahmenVormonat as $einnahmeVormonat) {
			 			$einnahmeSummeVormonat += $einnahmeVormonat->buchungWert;							
					}	
					foreach ($ausgabenVormonat as $ausgabeVormonat) {
			 			$ausgabeSummeVormonat += $ausgabeVormonat->buchungWert;								
					}				
				$saldoVormonat = $einnahmeSummeVormonat - $ausgabeSummeVormonat; // get the sum from the passed years
				$uebertrag = $uebertrag + $saldoVormonat;	

				$ustEinnahmen = 0;
				$vorsteuer = 0;
				foreach($pages->get("/Buchhaltung/system/settings/buchhaltungSteuersaetze/")->children("include=hidden") as $steuersatz)
				{
					$ustSatz = $steuersatz->title +100;
					$mwstSatz = $steuersatz->title +100;
					foreach ($pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat=$monat,buchungJahr=$jahr,buchungSteuersatz=$steuersatz->id") as $einnahme ) 
					{
						$summeEBrutto = $einnahme->buchungWert;
						$einnahmeSumme = $einnahme->buchungWert * 100;
						$summeUstNetto = $einnahmeSumme / $ustSatz;
						$gesamtUstNetto = $summeEBrutto - $summeUstNetto;
						$ustEinnahmen+=$gesamtUstNetto;						
					};
					foreach ($pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat=$monat,buchungJahr=$jahr,buchungSteuersatz=$steuersatz->id") as $ausgabe ) 
					{
						$summeABrutto = $ausgabe->buchungWert;
						$ausgabeSumme = $ausgabe->buchungWert * 100;
						$summeMwstNetto = $ausgabeSumme / $mwstSatz;
						$gesamtMwstNetto = $summeABrutto - $summeMwstNetto;
						$vorsteuer+=$gesamtMwstNetto;						
					};
					$zahllast = $ustEinnahmen - $vorsteuer;
					};
					//Get our money earned this month
					$einnahmen = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungMonat=$monat,buchungJahr=$jahr"); 
					$ausgaben = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungMonat=$monat,buchungJahr=$jahr");
					$einnahmeSumme = 0;
					$ausgabeSumme = 0;
					foreach ($einnahmen as $einnahme) {
			 			$einnahmeSumme += $einnahme->buchungWert;				
					}
					foreach ($ausgaben as $ausgabe) {
			 			$ausgabeSumme += $ausgabe->buchungWert;				
					}							
					$ertrag = $einnahmeSumme - $ausgabeSumme;
    // get the HTML
    ob_start();
    include('./scripts/buchhaltungmonatePrintData.php');
    $content = ob_get_clean();

    // convert to PDF
    require_once('./scripts/html2pdf.php');
    try
    {
        $html2pdf = new HTML2PDF('L', 'A4', 'de');
        $html2pdf->pdf->SetDisplayMode('fullpage');
		$html2pdf->pdf->SetProtection(array('print'), '');
        $html2pdf->writeHTML($content);
        $html2pdf->Output('buchungsjournal'.$monat.'-'.$jahr.'.pdf', D);
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }