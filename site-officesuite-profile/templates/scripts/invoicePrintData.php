<style type="text/css">
<!--
table { vertical-align: top; }
tr    { vertical-align: top; }
td    { vertical-align: top; }
p {margin:2px 0; padding:0; }
h3 {margin:0;padding:0}
}
-->
</style>
<page backtop="0" backbottom="30mm" backleft="11mm" backright="11mm" footer="page" style="font-size: 12pt">
<?php if($systemsets->universalCheck == 0) { ?>  	<!-- Check if own Paper is wished -->
	<page_footer>	
	<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
    	<p style="text-align: center">gem. § 19 UStG wird die Umsatzsteuer nicht auf der Rechnung ausgewiesen.</p><br />
    <?php } ?>
       <table style="width:100%; color:gray; border-top:1px solid gray; font-size:9pt">
       		<tr>
       			<td style="width:25%;">
       				<strong>Anschrift</strong>
       				<?php if ($systemsets->settingsFirma){ ?> 
       				<p><?= $systemsets->settingsFirma ?></p>
       				<p><?= $systemsets->Vorname ?> <?= $systemsets->Name ?></p>
       				<?php } else { ?>
       				<p><?= $systemsets->Vorname ?> <?= $systemsets->Name ?></p>
       				<?php } ?>
       				<p><?= $systemsets->Strasse ?></p>
       				<p><?= $systemsets->Plz ?> <?= $systemsets->Ort ?></p>
       			</td>       		
       			<td style="width:25%;">
       				<strong>Kontakt</strong>
       				<p>Website: <?= $systemsets->website ?></p>
       				<p>E-Mail: <?= $systemsets->email ?></p>
       				<p>Phone: <?= $systemsets->Telefon ?></p>
       				<p>Fax: <?= $systemsets->Fax ?></p>
       			</td>       		
       			<td style="width:25%;">
       				<strong>Bankverbindung</strong>
       				<p><?= $systemsets->settingsBankname ?></p>
       				<p>Blz: <?= $systemsets->settingsBlz ?></p>
       				<p>KtoNr: <?= $systemsets->settingsKto ?></p>       				
       			</td>       		
       			<td style="width:25%;">
       				<strong>Identifikation</strong>
       				<p>Steuernummer: <?= $systemsets->settingsSteuernummer ?></p>
       			</td>
       		</tr>
       	</table>
       </page_footer>
 
	    <table cellspacing="0" style="width: 100%;height:45mm;"> <!-- Top Logo -->
	    	<tr>	    
            <td style="width:100%;text-align: center;">
         		<img src="<?= $logothumb->filename ?>" alt="Logo">
            </td>                       
        </tr>
    	</table> 	
  <?php } else { ?>
  	<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
  		<page_footer>
    		<p style="text-align: center">gem. § 19 UStG wird die Umsatzsteuer nicht auf der Rechnung ausgewiesen.</p><br />
    	</page_footer>
    	<?php } ?>
  		<br /><br /><br /><br /><br /><br /> <!-- Breaks to catch the missing head -->  
  	<?php } ?>
  	
    	<br /><br /><br /><br />
    	
	    <table cellspacing="0" style="width: 100%; text-align: left; font-size: 11pt; color:#333333"><!-- Client Adress -->	    	
        	<tr>
            	<td style="width:60%">
            		<br />
            		<p><small style="font-size: 8pt; color:gray"><?= $systemsets->Vorname; ?> &middot; <?= $systemsets->Name; ?> &middot; <?= $systemsets->Strasse; ?> &middot; <?= $systemsets->Plz; ?> &middot; <?= $systemsets->Ort; ?></small></p>
            		<p><?= $rechnung->invoiceKunde->settingsFirma; ?> <?= $rechnung->invoiceKunde->Vorname; ?> <?= $rechnung->invoiceKunde->Name; ?></p>            	
            		<p><?= $rechnung->invoiceKunde->Strasse; ?></p>            
                	<p><?= $rechnung->invoiceKunde->Plz; ?> <?= $rechnung->invoiceKunde->Ort; ?></p>             
            	</td> 
            	<td style="width:40%; text-align:right">
            		<br />
            		<p style="text-align:left"><h3><?= $vorgangsartHead ?></h3></p>
            		<table style="width:100%; font-size:10pt">
            			<tr style="width:100%">
            				<td style="text-align:left; width:50%" ><strong>Datum</strong></td>
            				<td style="width:50%"><?= date('d.m.Y'); ?></td>
            			</tr>
            			<tr style="width:100%">
            				<td style="text-align:left; width:50%" ><strong>Kundennummer:</strong></td>
            				<td style="width:50%"><?= $rechnung->invoiceKunde->kundeNr ?></td>
            			</tr>
            			<tr style="width:100%">
            				<td style="text-align:left; width:50%" ><strong><?= $vorgangart ?></strong></td>
            				<td style="width:50%"><?= $rechnung->headline; ?></td>
            			</tr>
            		</table>
            	</td>                      
        	</tr>
    	</table> 


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />	
    <br />	
	<br />
	
	<table cellspacing="0" style="width: 100%; border-bottom: solid 1px gray; padding-bottom:5px; text-align: center; font-size: 11pt;">
        <tr>
            <th style="width: 15%; text-align: center">Position</th>
            <th style="width: 45%; text-align: left">Leistungsbeschreibung</th>
            <th style="width: 10%; text-align: center">Menge</th>
            <th style="width: 15%; text-align: center">Einzelpreis</th>
            <th style="width: 15%; text-align: center">Gesamtpreis</th>
        </tr>
    </table>
    
<table cellspacing="0" style="width: 100%; border-bottom: solid 1px gray; padding-bottom:5px; text-align: center; font-size: 10pt;">
<?php
$i = 1;
$rechnungsumme = 0;
foreach ($rechnungposten as $posten) {
	$postengesamt = $posten->buchungWert*$posten->invoiceAddedPostenPage->buchungWert;
?>
		<tr style="">
			<td style="width: 15%; text-align: center;"><?= $i ?></td>
            <td style="width: 45%; text-align: left;"><?= $posten->invoiceAddedPostenPage->title ?></td>
            <td style="width: 10%; text-align: center;"><?= $posten->buchungWert ?></td>
            <td style="width: 15%; text-align: center"><?= number_format($posten->invoiceAddedPostenPage->buchungWert, 2, ',', '.') ?> &euro;</td>
            <td style="width: 15%; text-align: right;"><?= number_format($postengesamt, 2, ',', '.') ?> &euro;</td>
		</tr>  
<?
	 $i++;$rechnungsumme +=$postengesamt;
	 }
	 
	 $steuersatz = $systemsets->settingsTax->title/100;
	 $steuern = $rechnungsumme*$steuersatz;
	 $bruttowert = $rechnungsumme+$steuern;
?>
 </table>   
 <br />
 	<table cellspacing="0" style="width: 100%; text-align: center; font-size: 12pt;">
 		<?php if ($systemsets->settingsKleinunternehmer == 1){ ?>
 			<tr style="padding:6px 0">
            <th style="width: 85%; text-align: right;"><br />Summe &nbsp;</th>
            <th style="width: 15%; text-align: right; border-bottom: solid 1px gray"><br /><?= number_format($rechnungsumme, 2, ',', '.') ?> &euro;</th>
        </tr>
 		<?php }else{ ?> 	 		
        <tr style="padding:6px 0">
            <td style="width: 85%; text-align: right;">Summe (netto) &nbsp;</td>
            <td style="width: 15%; text-align: right"><?= number_format($rechnungsumme, 2, ',', '.') ?> &euro;</td>
        </tr>
        <tr style="padding:6px 0">
            <td style="width: 85%; text-align: right;">zzgl. <?= $systemsets->settingsTax->title ?>% Ust&nbsp;</td>
            <td style="width: 15%; text-align: right"><?= number_format($steuern, 2, ',', '.') ?> &euro;</td>
        </tr>
        <tr style="padding:2px 0">
            <th style="width: 85%; text-align: right;"><br />Summe (brutto) &nbsp;</th>
            <th style="width: 15%; text-align: right; border-bottom: solid 1px gray"><br /><?=number_format($bruttowert, 2, ',', '.')  ?> &euro;</th>
        </tr>
        <?php } ?>
    </table>
</page>