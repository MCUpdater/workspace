#!/bin/sh

BRANCH=`git rev-parse --abbrev-ref HEAD`

BASE=`pwd`
echo "----- ${PWD}:${BRANCH} -----"
git pull

REPOS=`find * -type d -name .git`
for REPO in ${REPOS}; do
	REPO=`dirname ${REPO}`
	echo "----- ${REPO} -----"
	cd ${BASE}/${REPO}

	REPO_BRANCH=`git rev-parse --abbrev-ref HEAD`
	if [ "${REPO_BRANCH}" != "${BRANCH}" ]; then
		git checkout ${BRANCH}
	fi
	git pull
done

