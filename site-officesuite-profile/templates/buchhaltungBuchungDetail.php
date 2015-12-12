<?php include ("./head.inc"); 
include ("./buchhaltungNavigation.php");
$datum = date("d.m.Y",$page->created);
?>
<div class="row">
	<div class="span12">
		<hr />
		<h2>Details der Buchung</h2>
	<div class="row">
		<div class="span3">          	
          	<table class="table table-bordered table-hover table-striped table-condensed">
          		<tr>
          			<td><strong>Gebucht am: </strong> </td> 
          			<td><?php echo $datum; ?></td>         			
          		</tr>
          		<tr>
          			<td><strong>Datum der Buchung:</strong></td>
          			<td><?php echo $page->buchungTag .' . '. $page->buchungMonat.' . '. $page->buchungJahr ?></td>
          		</tr>
          		<tr>
          			<td><strong>Wert: </strong></td>
          			<td><?php echo number_format($page->buchungWert, 2, ',', '.'); ?> EUR</td>
          		</tr>
          		<tr>
          			<td><strong>Gebucht durch: </strong></td>
          			<td><?php  echo $page->createdUser->name; ?></td>
          		</tr>
          	</table>  
          	<hr />    		          	
			<a href="../../system/functions/buchungdel/?delpage=<?php echo $page->title; ?>" class="badge badge-important">Buchung löschen</a> 
		</div>
	</div>
  </div>
</div>
    
<?php include ("./foot.inc"); ?>