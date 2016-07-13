use POSIX;
open(IN,"<$ARGV[0]"); #input file

system(mkdir $ARGV[1]); # data directory name
$partition = $ARGV[2]; # number of partition 

$tran = 0;
$edge = 0;
while(<IN>)
{
#    print $_;
    if(/t/)
    {
        $tran = $tran + 1;
    }

}
close(IN);
print "tran =  $tran\n";
print "edge  = $edge\n";

#$partition_size = $tran/$partition;

open(IN,"<$ARGV[0]");
$i=0;
$part=0;
open(OUT,">t");
while(<IN>)
{

    chomp $_;
    if(/t/)
    {
        if($i % floor($partition) == 0)
        { 
            close(OUT);
            $part++;
            open(OUT,">$ARGV[1]/graph_part.$part");
        }
        #@temp = split(" ");
        #$temp[2] = $temp[2] % floor($avgedge);
        #print OUT "$temp[0] $temp[1] $temp[2] $temp[3]\n";
        $i=$i+1;
        #next;   
    }
    print OUT $_."\n";
}
