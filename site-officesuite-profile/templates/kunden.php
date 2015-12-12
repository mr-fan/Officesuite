<?php include ("./head.inc"); ?>
<div class="row">
	<div class="span12">		
		<div class="tabbable tabs-below">
  			<ul class="nav nav-tabs">
				<li class="active"><a href="#">Übersicht</a></li>
		<?php				
				$systempages = $pages->get("/kunden/system/functions/")->children("include=hidden"); 		
				foreach($systempages as $child) {
					$class = $child === $page->rootParent ? " class='active'" : '';
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
		<a class='btn btn-success btn-big' data-toggle="collapse" data-target="#neuerKunde"><i class='icon icon-white icon-plus-sign'></i> Neuer Kunde</a>
		<hr />
		<div id="neuerKunde" class="collapse"> 
				<?php include ("./kundenAdd.php"); ?>				
				<br /> 
			</div>
			<?php 
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
			?>			
  <table class="table table-bordered table-condensed table-hover table-striped" id="datenGrid">
	<thead>
	<tr>
		<th>Nr.</th>
		<th>Firma</th>
		<th>Name</th>
		<th>Vorname</th>
		<th>Str. / Nr.</th>
		<th >PLZ</th>
		<th>Ort</th>
		<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?><th class="center">Vorgänge</th><?php } ?>
	</tr>		
	</thead>
<tbody>
	
<?php
$kunden = $pages->get("/kunden/adressen/")->children();
$i = 1;
foreach ($kunden as $kunde) {
$vorgaenge = $pages->find("parent=/Rechnungen/vorgaenge/, invoiceKunde=$kunde->id,buchungKontenInaktiv=0, include=hidden");
$anzahl = count($vorgaenge);
	?>		<tr>
						<td><?= $kunde->kundeNr ?></td>
						<td><a href='<?= $kunde->url ?>'><?= $kunde->settingsFirma ?></a></td>
						<td><a href='<?= $kunde->url ?>'><?= $kunde->Name ?></a></td>
						<td><?= $kunde->Vorname ?></td>
						<td><?= $kunde->Strasse ?></td>
						<td><?= $kunde->Plz ?></td>
						<td><?= $kunde->Ort ?></td>
						<?php if($user->hasRole("rechnungen") OR $user->isSuperuser()) { ?><td class='center'><a href='<?= $kunde->url ?>' class='label label-info'><?= $anzahl ?></a></td><?php } ?>
                    </tr>                         
                           <?php
	$i++;
}
?>
</tbody>
</table>
  </div>
</div>

  	

<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="<?php echo $config->urls->templates?>js/scripts.js"  charset="utf-8"></script>
    
<?php include ("./foot.inc"); ?>