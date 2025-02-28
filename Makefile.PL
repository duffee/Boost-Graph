use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Boost::Graph',
    'VERSION_FROM'	=> 'Graph.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Graph.pm', # retrieve abstract from module
       AUTHOR     => 'David Burdick <dburdick@systemsbiology.org>') : ()),
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # 'OBJECT'		=> '$(O_FILES)', # link all the C files too
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker'   => 6.52,
        'Alien::Boost::Headers' => '0',
    },
    META_MERGE => {
        no_index => {
            # Module::Metadata is inferring version from $version::VERSION
            # "in" is a PAUSE misparse.
            package   => [ qw(DynaLoader in version) ],
            directory => [ qw(bundled my) ],
        },
        resources => {
            license     => 'http://dev.perl.org/licenses/',
            homepage    => 'https://metacpan.org/release/Boost-Graph',
            bugtracker  => 'https://github.com/duffee/Boost-Graph/issues',
            repository  => 'https://github.com/duffee/Boost-Graph.git',
            IRC         => 'irc://irc.perl.org/#native'
        },
    },
);
