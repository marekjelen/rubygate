#!/bin/sh

export PATH=~/bin:$PATH

[[ ! -f `pwd`/cef/automate ]] && svn checkout http://chromiumembedded.googlecode.com/svn/trunk/cef1/tools/automate `pwd`/cef/automate

python2 `pwd`/cef/automate/automate.py --download-dir=`pwd`/cef/download --url=http://chromiumembedded.googlecode.com/svn/branches/1453/cef3