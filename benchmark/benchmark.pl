require Devel::SymNames;
require Devel::Symdump;

use SDBM_File;
use POSIX;
use File::Find;

require Benchmark;

sub Benchmark::AUTOLOAD {
    package Benchmark;
    use Carp;
    confess $AUTOLOAD;
}

sub Benchmark::DESTROY {}

Benchmark::timethese(50,{
'1 (tchrist)' => '@main::t = Devel::SymNames::subroutines();',
'2 (andreas)' => '@main::a = Devel::Symdump->code;'
});

package main;

@a{@a}=@a;
@t = map { if (/::/){$_}else{"main\:\:$_"} } @t;
@t{@t}= @t;
foreach $foo (keys %a){print "$foo in a, not in t\n" unless $t{$foo};}
foreach $foo (keys %t){print "$foo in t, not in a\n" unless $a{$foo};}



