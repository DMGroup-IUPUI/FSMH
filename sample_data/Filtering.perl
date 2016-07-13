open("IN","<$ARGV[0]"); #input file name 

%non_frequent = ();
%id_to_label = ();

$minsup = $ARGV[1]; #support value
$_ = <IN>;
#print $_;
while(1)
{
	chomp $_;
	if(/t/)
	{
		$flag=0;
		while(<IN>)
		{
			chomp $_;
			#print $_."\n";
			if(/v/)
			{
				@v_temp = split(" ");
				if(!exists($id_to_label{$v_temp[1]}))
				{
					$id_to_label{$v_temp[1]} = $v_temp[2];
				}
			}
			if(/e/)
			{
				@e_temp = split(" ");
				if($id_to_label{$e_temp[1]} <= $id_to_label{$e_temp[2]})
				{
					$e = "$e_temp[0] $id_to_label{$e_temp[1]} $id_to_label{$e_temp[2]} $e_temp[3]";
				}
				else
				{
					$e = "$e_temp[0] $id_to_label{$e_temp[2]} $id_to_label{$e_temp[1]} $e_temp[3]";
				}
				#print $e."\n";
				if(!exists($non_frequent{$e}))
				{
					$non_frequent{$e} = 1;
				}
				else
				{
					$non_frequent{$e} = $non_frequent{$e} + 1;
				}
			}
			if(/t/)
			{
				%id_to_label = ();
				$flag=1;
				last;				
			}
		}
		
	}
	if($flag==0)
	{
		last;
	}

}

print "minsup = $minsup\n";
for (keys %non_frequent)
{
	print $_." and ".$non_frequent{$_}."\n";
	if($non_frequent{$_} >= $minsup)
	{
		delete $non_frequent{$_};
	}
}

close(IN);
open("IN","<$ARGV[0]");
open("OUT",">$ARGV[0].filtered");

%id_to_label = ();
$_ = <IN>;
#print $_;
while(1)
{
	chomp $_;
	print OUT $_."\n";
	if(/t/)
	{
		$flag=0;
		while(<IN>)
		{
			chomp $_;
			#print OUT $_."\n";
			if(/v/)
			{
				print OUT $_."\n";
				@v_temp = split(" ");
				if(!exists($id_to_label{$v_temp[1]}))
				{
					$id_to_label{$v_temp[1]} = $v_temp[2];
				}
			}
			if(/e/)
			{
				@e_temp = split(" ");
				if($id_to_label{$e_temp[1]} <= $id_to_label{$e_temp[2]})
				{
					$e = "$e_temp[0] $id_to_label{$e_temp[1]} $id_to_label{$e_temp[2]} $e_temp[3]";
				}
				else
				{
					$e = "$e_temp[0] $id_to_label{$e_temp[2]} $id_to_label{$e_temp[1]} $e_temp[3]";
				}
				#print $e."\n";
				if(!exists($non_frequent{$e}))
				{
					print OUT $_."\n";
				}
				
			}
			if(/t/)
			{
				%id_to_label = ();
				$flag=1;
				last;				
			}
		}
		
	}
	if($flag==0)
	{
		last;
	}

}


close(IN);
close(OUT);


