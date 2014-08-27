/**
 * @version v1.0
 * @author Fatih DAMAT <fatihdamat54@gmail.com>
 * @copyright (c) DamatMedya <http://www.damatmedya.com>
 * @license http://opensource.org/licenses/gpl-license.php GNU Public License
 */

// Headers
$header[0] = 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8,application/json';
$header[] = 'Cache-Control: max-age=0';
$header[] = 'Connection: keep-alive';
$header[] = 'Keep-Alive: 300';
$header[] = 'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7';
$header[] = 'Accept-Language: tr-TR,tr;q=0.8';

// User agent
$useragent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13';

// Çerez yolu-dosyası //
$cookie_file = realpath(dirname(__FILE__)). '/cookie' .DIRECTORY_SEPARATOR.'cookie_.txt';

// Oturum Aç Fatura Ziraat
function oturumacfatura_z($musteriNo, $parola){
	global $cookie_file, $header, $useragent;
	
	// Çerez dosyası yoksa boş bir tane oluşturalım
	if ( ! file_exists($cookie_file)){
		touch($cookie_file);
	}
	
	$curl_data = array(
		'musterino' => $musteriNo,
		'sifre' => $parola
	);
	
	/*$cd = '';
	foreach($curl_data AS $key => $val){
		$cd .= $key . '=' . $val . '&';
	}*/
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	curl_setopt($ch, CURLOPT_URL, 'post url adresi');
	curl_setopt($ch, CURLOPT_REFERER, 'referer adresi');
	curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
	curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file);
	curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $curl_data);
	$sx = curl_exec($ch);

}

function sms_ac_z($parola){
	global $cookie_file, $header, $useragent;
	
	$curl_data = array(
		'smssifresi' => $parola
	);
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	curl_setopt($ch, CURLOPT_URL, 'post url adresi');
	curl_setopt($ch, CURLOPT_REFERER, 'referer adresi');
	curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
	curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file);
	curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $curl_data);
	$sx = curl_exec($ch);
}
