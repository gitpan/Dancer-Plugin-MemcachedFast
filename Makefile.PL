
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Cache things using Cache::Memcached::Fast',
  'AUTHOR' => 'Marco Fontani <MFONTANI@cpan.org>',
  'BUILD_REQUIRES' => {
    'Dancer' => '0',
    'Dancer::Test' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Dancer-Plugin-MemcachedFast',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Dancer::Plugin::MemcachedFast',
  'PREREQ_PM' => {
    'Cache::Memcached::Fast' => '0',
    'Dancer' => '1.2000',
    'Dancer::Plugin' => '0'
  },
  'VERSION' => '0.110770',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);


