/**
 * @version $Id$
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
		'__EVENTTARGET' => 'ctl00$c$BtnLogin',
		'__EVENTARGUMENT' => '',
		'__VSTATE' => 'H4sIAAAAAAAEAOy9B2AcSZYlJi9tynt/SvVK1+B0oQiAYBMk2JBAEOzBiM3mkuwdaUcjKasqgcplVmVdZhZAzO2dvPfee++999577733ujudTif33/8/XGZkAWz2zkrayZ4hgKrIHz9+fB8/Iv7vX/M3/e1+zV/3F/z+v/9JtWzrqmxe5b9oXdT5y6ppn2TTt79Xfv37//6/za/56/7W07bc2fndpr/byfztF9WkKPPXxcXyN/11f+zh7t6n93Z3P937TWe/za91jn9+rV+H/v11fq1fm/79jej33+bX+gW//k8WTTEp8/ns1/p1f1P64Hf5NeZo92vi91/w67zJ37X5bPZr/Qb8FXX1uFlly6PHd/nH5//Y3/TqH/ub/vG/gBok3P43/nJ5Uhb5sqV/p29/3b/g17wqlrPqalyt8uXWx/O2XTWP7t6tlmWxzMc/KOosayfZ8u14Wi3GbX13dbe6O103bbXI61+0zuvrcdas3n08+vj3n5TU7ONR+nHTZu26+ew6b0bNlGhSTrJa/qzzpvhBRiPhv66KWTv/7OGDh6N5XlzM288e7N37+M5hWuftul6m51nZ5IeE92/EA/u1ft2/7L1R/cHdV3mbFeWJIvwTHsKpxfgbR/g3MZM0o/mTSfmtgkk5ffH587PX357N/p8AAAD//+zMg70/AgAA',
		'__VIEWSTATE' => '',
		'rdLng' => '',
		'ctl00$NavigationHiddenInput' => '',
		'__EVENTVALIDATION' => '/wEWCgL+raDpAgLms+z+DALmnqPPCQKIs66gBgKqncmwCgL5n/D4CgLFzeyqCgLDsdSVAQKK5fLOBwLykLDxB7CyOJ9J0gy2hrqk/oJOkyqTHZ1W',
		'ctl00$c$TxtCustomerId' => $musteriNo,
		'ctl00$c$TxtPin' => $parola
	);
	
	/*$cd = '';
	foreach($curl_data AS $key => $val){
		$cd .= $key . '=' . $val . '&';
	}*/
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	curl_setopt($ch, CURLOPT_URL, 'https://esube.ziraatbank.com.tr/Transactions/Login/FirstLogin.aspx');
	curl_setopt($ch, CURLOPT_REFERER, 'https://esube.ziraatbank.com.tr/Transactions/Login/FirstLogin.aspx');
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
		'__EVENTTARGET' => 'ctl00$c$BtnLogin',
		'__EVENTARGUMENT' => '',
		'__VSTATE' => 'H4sIAAAAAAAEAOy9B2AcSZYlJi9tynt/SvVK1+B0oQiAYBMk2JBAEOzBiM3mkuwdaUcjKasqgcplVmVdZhZAzO2dvPfee++999577733ujudTif33/8/XGZkAWz2zkrayZ4hgKrIHz9+fB8/Iv7vX/M3nf2mv26yvbe7e7C/v7+3/5vOfptf6xz//Fq/Dv376/xavzb9+xv8Wr/Wb/qb/ja/1i/4dd7k79pf97d9/cXr9B//C4vzOm+KZZFeFDX9+MF4NqPG1OrHiuUyr+ftovx1f6vX2fU/9jcv02fHb/6xv+nb6dPjL47fjGa/1q/P0H7jL5cnZZEvW/p3+vbX/ct/zatiOauuxtUqX259PG/bVfPo7t1qWRbLfPyDos6ydpIt346n1WLc1ndXd39w91XeZkV5sm7aapHXP7HO6+tx1qzefTxKP/79JyW1xm9Nm7Xr5rPrvBk107oqy0lWy58YwQ+ySZnzX1fFrJ1/9vDBw9E8Ly7m7WcP9u59fOcwrfN2XS/T86xs8kMa5W8A9H+XX+PX/a0fN6tsefT4Lv/4/B/7m179Y3/TP/4XUINfRxv8VkGD0xefPz97/e3Z7P8JAAD//yiSLHt0AQAA',
		'__VIEWSTATE' => '',
		'__EVENTVALIDATION' => '/wEWBgL+raDpAgLms+z+DALmnqPPCQLdn4CKBQK92u3DDwLDsdSVAZDoCOc3JWsJK+n7pd+eIc+mQQ0K',
		'ctl00$NavigationHiddenInput' => '',
		'rdLng' => '',
		'ctl00$c$TxtSMS' => $parola
	);
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	curl_setopt($ch, CURLOPT_URL, 'https://esube.ziraatbank.com.tr/Transactions/Login/SecondLogin.aspx');
	curl_setopt($ch, CURLOPT_REFERER, 'https://esube.ziraatbank.com.tr/default.aspx');
	curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 0);
	curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie_file);
	curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $curl_data);
	$sx = curl_exec($ch);
	$_SESSION['oturumacfatura'] = 'ok';
}
