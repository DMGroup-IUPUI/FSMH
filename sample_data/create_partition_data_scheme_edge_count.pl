use POSIX;
open(IN,"<$ARGV[0]"); #input file name

system(mkdir $ARGV[1]); #data directory name

$multiply_factor = $ARGV[2]; #multiply_factor to multiply with average edge count to detemine the number of edge count in each partition
$tran = 0;
$edge = 0;
while(<IN>)
{
#    print $_;
    if(/e/)
    {
        $edge = $edge + 1;
    }
    if(/t/)
    {
        $tran = $tran + 1;
    }

}
close(IN);
print "tran =  $tran\n";
print "edge  = $edge\n";

$avgedge = $edge/$tran;
print "avgedge  = $avgedge\n";
$transaction_length = $avgedge*$multiply_factor;
open(IN,"<$ARGV[0]");
$i=0;
$part=0;
open(OUT,">t");
while(<IN>)
{

    chomp $_;
    if(/t/)
    {
        if($i % floor($transaction_length) == 0)
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
