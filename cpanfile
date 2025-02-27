# https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod

recommends 'Data::Dumper::Concise';
recommends 'Feature::Compat::Try';

on test => sub {
    requires 'Test2::V0';
    #requires 'Test2::Tools::Compare' => '1.302196'; # number_gt available Apr 2023
};

on 'develop' => sub {
  requires 'perl' => '5.026'; # postfix deref, hash slices, Test2, indented here-docs

  #requires 'Dist::Zilla';
};
