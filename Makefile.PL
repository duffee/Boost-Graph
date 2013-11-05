use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $boost_lib;
if ($ENV{BOOST} =~ /^[-._\/\w]+$/ && -e $ENV{BOOST}) {
	$boost_lib = prompt("Do you wish to use your system Boost libraries?", $ENV{BOOST});
}
else {
	$boost_lib = prompt("Do you wish to use the Boost library (v1.54) shipped with the module or a locally installed version?", 
                            '../include/boost'
                        );
}

unless (-e $boost_lib) {
    print "Couldn't find $boost_lib.  Falling back to the shipped Boost library\n";
    $boost_lib = '../include/boost';
}

foreach my $makefile ('Directed/Makefile.PL', 'Undirected/Makefile.PL') {
	open my $fh, '+<', $makefile or die "Couldn't include boost library in $makefile: $!\n";
	my @lines =  <$fh>;
	print "Including $boost_lib in $makefile\n" 
        if grep {s%('INC'\s+=>).+%$1 '-I. -I../include -I$boost_lib',%;} @lines;

	seek($fh, 0, 0)             or die "Seeking: $!\n";
	print $fh @lines            or die "Printing: $!\n";
	truncate($fh, tell($fh))    or die "Truncating: $!\n";
	close $fh;
}

WriteMakefile(
    'NAME'		=> 'Boost::Graph',
    'VERSION_FROM'	=> 'Graph.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Graph.pm', # retrieve abstract from module
       AUTHOR     => 'David Burdick <dburdick@systemsbiology.org>') : ()),
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '-I.',
	# Un-comment this if you add C files to link with later:
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too
    ($ExtUtils::MakeMaker::VERSION >= 6.64 ? ('TEST_REQUIRES' => { "Test::More" => "0.47" }, ) : ()),
    ($ExtUtils::MakeMaker::VERSION >= 6.3002 ? ('LICENSE'  => 'perl', ) : ()),
    #($ExtUtils::MakeMaker::VERSION >= 6.3002 ? ('LICENSE'  => 'open_source' ) : ()), # use this when including the Boost library
    depend => { '$(FIRST_MAKEFILE)' => '$(VERSION_FROM)' }, # prevents "object version does not match bootstrap parameter"
);
