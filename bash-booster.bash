#! /bin/bash
#
# bash-booster.sh -- 
#
set -u

progname=$(basename ${0});
 progdir=$(cd "`dirname $0`" && pwd);
progargs=($@);

        top_dir=$(dirname ${progdir});
      funcs_dir="${top_dir}/funcs";
extra_funcs_dir="${funcs_dir}/extra";
    modules_dir="${top_dir}/modules";
      class_dir="${top_dir}/class";
        log_dir="${top_dir}/log";
       docs_dir="${top_dir}/docs";

hostname=$(hostname);
_hostname=$(hostname | sed -e 's/-/_/g');

source $(${funcs_dir}/FILES);
source $(${extra_funcs_dir}/FILES);
