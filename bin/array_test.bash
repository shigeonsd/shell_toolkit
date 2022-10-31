#! /bin/bash
#
# array.sh -- 
#
#
set -u;
progname=$(basename ${0});
progdir=$(cd "`dirname $0`" && pwd);
progargs=$@

# モジュールの初期化
top_dir=$(dirname ${progdir});
modules_dir="${top_dir}/modules";
source "${modules_dir}/setup.sh";

# 使用クラスの宣言
use Array;

declare -a foo=(a b c d e);
declare -a bar=();
declare -a baz=();

echo Array foo
Array foo = [ a b c "d e f" ];
declare -q foo;

echo Array bar
Array bar = foo;

echo Array baz
Array baz 

bar = foo;
baz = bar;

dump foo;
dump bar;
dump baz;

echo foo.class
foo.class

echo foo.foreach echo ;
foo.foreach echo ;
echo foo.exists 4;
foo.exists 4;
echo $?;
echo foo.exists 7;
foo.exists 7;
echo $?;
echo foo.length;
foo.length;
echo foo.keys;
foo.keys;

echo foo.push 1323
foo.push 1323

echo foo.unshift 256
foo.unshift 256

echo foo.set 1 512;
foo.set 1 512;

echo foo.foreach echo ;
foo.foreach echo ;

echo foo.get 1;
foo.get 1;

echo foo.reverse;
foo.reverse;

echo Array bar;
Array bar $(foo.reverse)

echo bar.foreach echo
bar.foreach echo

echo foo.pop;
foo.pop;
echo foo.foreach echo ;
foo.foreach echo ;

echo foo.shift;
foo.shift;
echo foo.foreach echo ;
foo.foreach echo ;

echo foo.clear;
foo.clear;
echo foo.length;
foo.length;

echo foo.exists "value";
foo.exists "value";
echo $?;

echo foo.exists "512";
foo.exists "512";
echo $?;

echo delete foo bar;
delete foo bar baz;


