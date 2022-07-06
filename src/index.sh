#!/bin/#!/bin/sh

time=$(date +"%Y-%m-%d-%H-%M-%S");
repoPath='./src/repos/'

mkdir -p $repoPath$REPO;

borg --version;

borg init --encryption=repokey-blake2 $repoPath$REPO;

borg create -v -s -p -C lz4 $repoPath$REPO::$time $FILES;

borg list $repoPath$REPO;

echo 'Borg säubern'
borg prune -v $repoPath$REPO --keep-daily=7 --keep-weekly=4 --keep-monthly=6;

chmod 777 $repoPath$REPO -R;

borg info $repoPath$REPO::$time;
