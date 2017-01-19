#!/bin/sh

BASE=`pwd`
echo "----- ${PWD} -----"
git pull

REPOS=`find * -type d -name .git`
for REPO in ${REPOS}; do
	REPO=`dirname ${REPO}`
	echo "----- ${REPO} -----"
	cd ${BASE}/${REPO}

	git pull
done

