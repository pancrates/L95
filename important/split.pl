while (<>) {
    next unless /\d+\t([^\s]+)/;
    print "$1";
    print " $1" while (<> =~ /^\d+\t([^\s]+)/);
    print "\n";
}
