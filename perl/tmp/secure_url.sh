#!/usr/bin/env bash


url="http://crm.orlov.dev.fonmix.ru/interface/red/secure";
now=$(perl -E 'say time');
path2="/task/activation/add?project=acrm&time=${now}";
path=`echo -n "${path2}" | md5sum | cut -d' ' -f1`;
echo "$url/$path$path2";

# eebf5cb849d51c52fed80f18969c336a/task/activation/add?project=acrm&time=1599051227