<?php

include_once( "adodb/adodb-exceptions.inc.php" );
include_once( "adodb/adodb.inc.php" );
$DB=&NewADOConnection( "postgres://postgres:@localhost/ip_stat?persist" );
if( !$DB ) 
{
	print "Error\n";
	exit;
}

//system( "wget ftp://ftp.arin.net/pub/stats/arin/delegated-arin-latest" );
$date=new DateTime( "2003-01-01" );
$last=new DateTime( "2004-01-01" );

while( $date<$last )
{
	$file="ripencc.".$date->format( "Ymd" );
	print $file."\n";
	system( "wget ftp://ftp.ripe.net/ripe/stats/old-format/$file 2>/dev/null" );
	
	print ">> ".date( "h:i:s a" )."\n";
	parse_delegated( $date->format("Y-m-d"),$file,false );
	print "<< ".date( "h:i:s a" )."\n";
	
	unlink( "$file" );
	
	$date->modify( "1 week" );
}


function parse_delegated( $on_date, $file, $new_format=true )
{
	global $DB;
	$file=fopen( $file, 'r' );
	if( !$file ) exit;
	while( !feof($file) )
	{
		$data=fgetcsv( $file, 5000, "|" );
		
		//ripencc|NL|ipv4|24.132.0.0|32768|19971013|allocated ^M
		if( $data[2]!="ipv4" || $data[1]=='*' ) continue;
	
		$block_size=$data[4];
		$rir    =$data[0];
		$country=$data[1];
		$ip_base=$data[3];
		
		if( $new_format )
		{
			$RIR_date="'".substr($data[5],0,4)."-".substr($data[5],4,2)."-".substr($data[5],6,2)."'";
		}
		else
		{
			$RIR_date="'".$data[5]."'";
		}

		if( $RIR_date=="'0000-00-00'" ) $RIR_date="NULL";
		
		$type   =$data[6];
		
		$repeat='f';
		$offset=0;
		while( $block_size>0 )
		{
			$prefix=32-floor( log($block_size,2) );
	
			$sql="INSERT INTO ipv4 (on_date,rir,country,ip,is_adhoc,rir_date,type) VALUES(".
			"'$on_date','$rir','$country','$ip_base/$prefix'::inet+$offset,'$repeat',$RIR_date,'$type')";
	
	//		print $sql."\n";
			try {
			$DB->Execute( $sql );
			}
			catch( Exception $e )
			{
				print ".";
//				print $e->getMessage();
			}
			
			$block_size-=pow( 2, 32-$prefix );
			$offset+=pow( 2, 32-$prefix );
	
			$repeat='t';
		}
		
	}
}

?>

