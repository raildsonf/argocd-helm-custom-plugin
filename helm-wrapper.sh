#!/bin/bash
if [ -e /app/cluster.properties ]
then
	for i in $(cat /app/cluster.properties)
	do
	  HELM_CLUSTER_PROP+=$(echo "--set $i ")
	done
else
	exec helm.bin $@
	exit 0
fi

if [ $1 = "template" ] || [ $1 = "install" ] || [ $1 = "upgrade" ] || [ $1 = "lint" ] || [ $1 = "diff" ]
then
	exec helm.bin $@ $HELM_CLUSTER_PROP
else
    exec helm.bin $@
fi

unset HELM_CLUSTER_PROP