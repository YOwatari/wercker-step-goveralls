#!/bin/bash

# Environmental variable
COVERALLS_TOKEN="$WERCKER_GOVERALLS_TOKEN"

# Check and Set Default value
if [ -z "${COVERALLS_TOKEN}" ]; then
    fail "Please set your Coveralls token."
fi

go get github.com/axw/gocov/gocov
go get github.com/mattn/goveralls


prof=${1:-".profile.cov"}
echo "mode: count" > $prof
gopath1=$(echo $GOPATH | cut -d: -f1)
for pkg in $(go list ./...); do
  tmpprof=$gopath1/src/$pkg/profile.tmp
  go test -covermode=count -coverprofile=$tmpprof $pkg
  if [ -f $tmpprof ]; then
    cat $tmpprof | tail -n +2 >> $prof
    rm $tmpprof
  fi
done


GIT_BRANCH=$WERCKER_GIT_BRANCH
goveralls -coverprofile=profile.cov -service=wercker.com -repotoken $COVERALLS_TOKEN


