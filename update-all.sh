#!/bin/sh

BASE=`pwd`

REPOS=`find * -type d -name .git`
for REPO in ${REPOS}; do
	REPO=`dirname ${REPO}`
	echo "----- ${REPO} -----"
	cd ${BASE}/${REPO}

	git pull
done

