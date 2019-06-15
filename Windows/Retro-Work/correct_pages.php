<?php
// Author Carsten Jensen aka Tomse
// Copyright (c) 2013 Carsten Jensen
// Released under GNU GPL v2

// Corrects page numbers from scanned full-paper pages
// which has been split into 2, and been edited in scan tailor

$ext = '.tif';
$files = glob('*.tif');

// set to 0 if back page lies first, or 1 if frontpage lies first
$up = 0;
$down = count($files);
$dest = 'newpages';
$pad = strlen($down)+1;
@mkdir($dest);

$again = 1;
$back = true;

foreach($files as $k => $v)
{

	
	if($back === true)
	{
	
		copy($v, $dest . DIRECTORY_SEPARATOR . 'page' . padding($down, $pad) . $ext);
		$down--;
		if ($again > 2 OR $k == 0)
		{
			$again = 1;
			$back = false;
		}
		echo "$k => $down \n";
		$again++;
	}
	else
	{
		copy($v, $dest . DIRECTORY_SEPARATOR . 'page' . padding($up, $pad) . $ext);
		$up++;
		if ($again > 2)
		{
			$again = 1;
			$back = true;
		}
		echo "$k => $up \n";
		$again++;
	}
}


/**
 * Pads a number with zeroes to make a nice even lenghted result
 * Author Carsten Jensen
 * @param int $int number to be padded
 * @param int $length of padding
 * @return int padded number
*/
function padding($int, $length = 2)
{
	return str_pad($int, $length, 0, STR_PAD_LEFT);
}
?>