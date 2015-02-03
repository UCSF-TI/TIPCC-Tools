#!/usr/bin/env bash

# Fake
export TRAVIS=true

# Command-line arguments
repos=$1
branch=${2:-master}

path=$repos/builds/$branch
mkdir -p $path

OPWD=$(pwd)
cd $path

git clone --depth=50 --branch=$branch git://github.com/$repos.git

pkg=$(basename $repos)
cd $pkg

# env:
#   global:
export RENV="./pkg-build.sh"
export BOOTSTRAP_LATEX=""
export R_BUILD_ARGS="--no-manual" 
export R_BUILD_ARGS="${R_BUILD_ARGS} --no-build-vignettes"
export R_CHECK_ARGS="--no-manual --as-cran"
export R_CHECK_ARGS="${R_CHECK_ARGS} --no-build-vignettes"

# matrix:
RVERSION=devel

# before_install:
curl -OL https://raw.githubusercontent.com/HenrikBengtsson/r-builder/master/pkg-build.sh
chmod 755 $RENV

# install:
$RENV install_r R.oo

# script:
$RENV run_build
$RENV run_check
make cran

# after_success:


cd $OPWD
