<?php 
if (!$input->get->jahr){
	$jahr = date("Y");
}
else {
	$jahr = $sanitizer->text($input->get->jahr);
};
$systemsets = $pages->get("/settings");
$heute = date('d.m.Y');
    // get the HTML
    ob_start();
    include('./scripts/buchhaltungjahrPrintData.php');
    $content = ob_get_clean();

    // convert to PDF
    require_once('./scripts/html2pdf.php');
    try
    {
        $html2pdf = new HTML2PDF('L', 'A4', 'de');
        $html2pdf->pdf->SetDisplayMode('fullpage');
		$html2pdf->pdf->SetProtection(array('print'), '');
        $html2pdf->writeHTML($content);
        $html2pdf->Output('buchungsjournal-'.$jahr.'.pdf', D);
    }
    catch(HTML2PDF_exception $e) {
        echo $e;
        exit;
    }
?>