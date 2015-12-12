<?php 
	include("./head.inc");   
	$jahr = date('Y');
	$monat = date('n');	
	$vorgaenge =count( $pages->get("/rechnungen/vorgaenge/")->children("include=hidden, buchungKontenInaktiv=0")); 
	$angebote =count( $pages->get("/rechnungen/vorgaenge/")->children("include=hidden,invoiceVorgangsart=A, buchungKontenInaktiv=0")); 
	$rechnungen =count( $pages->get("/rechnungen/vorgaenge/")->children("include=hidden,invoiceVorgangsart=R, buchungKontenInaktiv=0")); 
	$buchungen = count($pages->get("/buchhaltung/buchungen/")->children("buchungJahr=$jahr,buchungMonat=$monat"));
	$einnahmeBuchung = count($pages->get("/buchhaltung/buchungen/")->children("buchungArt=E,buchungJahr=$jahr,buchungMonat=$monat"));
	$ausgabeBuchung = count($pages->get("/buchhaltung/buchungen/")->children("buchungArt=A,buchungJahr=$jahr,buchungMonat=$monat"));  	
	function listIncomingInvoice()
	{
		$faelligrechnung = wire('pages')->get("/rechnungen/vorgaenge/")->children("invoiceVorgangsart=R,buchungKontenInaktiv=0, include=hidden, universalCheck=0");	
		$heute = time();
		foreach ($faelligrechnung as $faellig)
		{
			$datumstring = explode("-", $faellig->datum);
			$datumstring[1]++;
			$formatDatum = $datumstring[2].'-'.$datumstring[0].'-'.$datumstring[1]; //YYYY MM DD				
 			$rechnungsdatum = strtotime($formatDatum) ;
		
			$differenz = $rechnungsdatum-$heute;			
			$diff_tage = $differenz / 86400;
			$tagedifferenz = floor($diff_tage);					
			if($tagedifferenz >= "0" && $tagedifferenz <= "8")
			{
				if ($tagedifferenz == 0) $tagedifferenz = "heute";
				if ($tagedifferenz > 1)
					{	$noch = "in ";
						$tagedifferenz = $noch.$tagedifferenz.=" Tagen";
					}
					if ($tagedifferenz == 1)
					{
						$tagedifferenz ="Morgen";
					}
				echo "<li><a href='$faellig->url'>$faellig->title - $tagedifferenz</a></li>";
			}
		}
	}

?>
<script type="text/javascript" src="<?= $config->urls->templates?>js/jquery.flot.js"></script>
<script type="text/javascript" src="<?= $config->urls->templates?>js/jquery.flot.pie.js"></script>
<script type="text/javascript" src="<?= $config->urls->templates?>js/barchart.js"></script>
<div class="row flots">
	
	<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?>
	<div class="span4">
		<h3 class="center">Offene Vorgänge</h3>
		<div class="innerdonut"><span><a href="<?= $pages->get("/rechnungen/")->url; ?>"><?= $vorgaenge; ?></a></span></div>
		<div id="vorgang" class="flotcontainerSmall"></div>
	</div>
	<?php } ?>
	
	<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?>
	<div class="span4">
		<h3 class="center">Fällige Rechnungen</h3>
		<ul class="nav nav-tabs nav-stacked center"><?= listIncomingInvoice() ?></ul>	
	</div>
	<?php } ?>
	
	<?php if($user->hasRole("buchhaltung") OR $user->isSuperuser()) { ?>
	<div class="span4">
		<h3 class="center">Buchungen<small>" akt. Monat</small></h3>
		<div class="innerdonut"><span><a href="<?= $pages->get("/buchhaltung/")->url; ?>"><?= $buchungen; ?></a></span></div>
		<div id="buchung" class="flotcontainerSmall"></div>
	</div>	
	<?php } ?>
	
	<?php if($user->hasRole("buchhaltung") OR $user->isSuperuser()) { ?>
	<div class="span12">
		<br /><br />
		<h3 class="center">Umsätze <?= $jahr ?></h3>
		
			<div class="chart">
				<table id="data-table" border="1" cellpadding="10" cellspacing="0">
					<thead>
						<tr>
							<td>&nbsp;</td>
							<?php 
							$i = 1;
							while($i < 13)
							{								
								 echo "<th scope='col'>$i</th> \n";$i++;
							}
							;?>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Umsatz</th>
							<?php 
							$i = 1;
							while($i < 13)
								{
								$umsaetze = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E,buchungJahr=$jahr, buchungMonat=$i");  // get the actual income
								foreach ($umsaetze as $umsatz) 
								{
			 						$umsatzMonat += $umsatz->buchungWert;								
								}		
								$gesamtumsatz = str_replace(",", ".", $umsatzMonat);																
								 echo "<td>$gesamtumsatz</td> \n";$i++;
								 $umsatzMonat = 0;
								}						
							?>
						</tr>
						<tr>
							<th scope="row">Ertrag</th>
							<?php 
							$i = 1;
							while($i < 13)
								{
								$einnahmen = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=E, buchungJahr=$jahr, buchungMonat=$i");  // get the actual income
								$ausgaben = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungJahr=$jahr, buchungMonat=$i");
								foreach ($einnahmen as $einnahme) {
			 						$einnahmeSumme += $einnahme->buchungWert;				
								}
								foreach ($ausgaben as $ausgabe) {
			 						$ausgabeSumme += $ausgabe->buchungWert;				
								}							
								$ertrag = $einnahmeSumme - $ausgabeSumme;	
								$monatsErtrag = str_replace(",", ".", $ertrag);									
								 echo "<td>$monatsErtrag</td> \n";$i++;
								 $einnahmeSumme = 0;
								 $ausgabeSumme = 0;
								 $ertrag = 0;
								}								
							?>
						</tr>
						<tr>
							<th scope="row">Ausgaben</th>
							<?php 
							$i = 1;
							while($i < 13)
								{
								$umsaetze = $pages -> get("/Buchhaltung/buchungen/") -> children("buchungArt=A, buchungJahr=$jahr, buchungMonat=$i");  // get the actual income
								foreach ($umsaetze as $umsatz) 
								{
			 						$ausgabeMonat += $umsatz->buchungWert;								
								}		
								$gesamtausgabe = str_replace(",", ".", $ausgabeMonat);								
								 echo "<td>$gesamtausgabe</td> \n";$i++;
								 $ausgabeMonat = 0;
								}								
							?>
						</tr>
					</tbody>
				</table>
			</div> <!-- /chart -->
		</div> <!-- /span12 -->
		<?php } ?>
	</div>	<!-- /row -->


<script>

var d1 = [
		{ label: "Angebote",  data: <?= $angebote; ?>, color: '#D09A47'},
		{ label: "Rechnungen",  data: <?= $rechnungen; ?>, color: '#6E97AA'}
	];
var d2 = [
		{ label: "Einnahmen",  data: <?= $einnahmeBuchung; ?>, color: '#8FAE53'},
		{ label: "Ausgaben",  data: <?= $ausgabeBuchung; ?>, color: '#BA6D6D'}
	];

$.plot($("#vorgang"), d1,
 {
         series: {
             pie: { 
                 innerRadius: 0.5,
                 radius:1,
                 show: true,
                 label: {
                     show: true,
                     radius: 3/4,
                     formatter: function(label, series){
                         return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
                     }
                 }
             }
         },
    legend: {
        show: false
    }
 });
$.plot($("#buchung"), d2, 
 {
         series: {
             pie: { 
                 innerRadius: 0.5,
                 radius:1,
                 show: true,
                 label: {
                     show: true,
                     radius: 3/4,
                     formatter: function(label, series){
                         return '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">'+label+'<br/>'+Math.round(series.percent)+'%</div>';
                     }
                 }
             }
         },
    legend: {
        show: false
    }
 });


</script>
<?php include("./foot.inc"); ?> 
