use 5.008;
use ExtUtils::MakeMaker;
$CC = 'g++ -O';
use Alien::Base::Wrapper qw( Alien::Boost::Headers );
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Boost::Graph::Undirected',
    'VERSION_FROM'	=> 'Undirected.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Undirected.pm', # retrieve abstract from module
       AUTHOR     => 'David Burdick <dburdick@systemsbiology.org>') : ()),
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'CC'                => $CC,
    'LD'                => '$(CC)',
    'XSOPT'             => '-C++',
    'TYPEMAPS'          => ['perlobject.map' ],
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker'   => 6.52,
        'Alien::Boost::Headers' => '0',
    },
    Alien::Base::Wrapper->mm_args,
);
