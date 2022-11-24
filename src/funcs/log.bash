#! /bin/bash
#
# log.sh -- ログに関する定義
#
function _msg() {
    shift;
    echo  $@ >&2; 
}

if_true BASH_BOOST_LOGGING && {
    # logger.bash の中で動いているときは日時付きでログを出力する。
    # (_msg() をオーバーライドする）
    function _msg() {
	echo "$(now)" $@; >&2;
    }
}

function error() { _msg "ERROR:" $@; }
function warn()  { _msg "WARN:"  $@; }
function info()  { _msg "INFO:"  $@; }
function debug() { :; }
if_debug && {
    # デバッグモードの時のみメッセージを出力する。
    # (debug() をオーバーライドする）
    function debug() { _msg "DEBUG:" $@; }
}

function die() {
    local msg="$1";
    local exit_status="${2-1}" # 第二引数が指定されていなかったら 1
    error "exit_status=${exit_status}: ${msg}";
    __on_die;
    exit ${exit_status};
}

# __on_die() は die() 実行時に実行されるフック関数。
# デフォルトでは、デバッグモードの時にスタックトレースをダンプする。
# (これ以外の動作をさせたいときは、__on_die() をオーバーライドする)
function __on_die() {
    if_debug && stacktrace error;
}
