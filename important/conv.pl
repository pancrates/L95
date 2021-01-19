my $root = undef;
while (my $line = <>) {
    unless ($line =~ /^\d+/) {
        print $line;
        $root = undef;
        next;
    }
    my ($id, $before, $parent, $label, $after) = $line =~ m/^([^\t]+)\t([^\t]+\t[^\t]+\t[^\t]+\t[^\t]+\t[^\t]+)\t([^\t]+)\t([^\t]+)\t(.+)$/;
    $label = "root" if ($label eq "ROOT");
    if ($label eq "root") {
        $label = "dep" if $root;
        $parent = $root if $root;
        $root = $id unless $root;
    }
    print "$id\t$before\t$parent\t$label\t$after\n";
}
