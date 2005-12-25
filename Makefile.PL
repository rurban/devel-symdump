use lib "./lib";
use Devel::Symdump ();
use ExtUtils::MakeMaker;

WriteMakefile(
	      NAME => "Devel::Symdump",
	      DISTNAME => "Devel-Symdump",
	      VERSION_FROM => "lib/Devel/Symdump.pm",
	      'clean' => {FILES => '*/*/*~'},
	      'dist' => {DIST_DEFAULT => 'ci tardist'},
	     );
