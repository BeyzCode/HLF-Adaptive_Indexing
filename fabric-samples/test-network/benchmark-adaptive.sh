#!/bin/bash

QUERY_NAME=$1
FIELD1=$2
FIELD2=$3

if [ -z "$QUERY_NAME" ] || [ -z "$FIELD1" ]; then
  echo "Usage: $0 <SmartQueryType> <QueryValue1> [<QueryValue2>]"
  echo "Example (1 field): $0 QueryByWarehouse SakuraTex"
  echo "Example (2 fields): $0 QueryByWarehouseAndStatus SakuraTex Dikirim"
  exit 1
fi

# Build JSON args depending on number of fields
if [ -z "$FIELD2" ]; then
  JSON_ARGS='["SmartQuery", "[\"'$QUERY_NAME'\", \"'$FIELD1'\"]"]'
else
  JSON_ARGS='["SmartQuery", "[\"'$QUERY_NAME'\", \"'$FIELD1'\", \"'$FIELD2'\"]"]'
fi

CMD="peer chaincode query -C mychannel -n ledger -c '{\"Args\":$JSON_ARGS}'"

# Run benchmark
echo "Running benchmark for: $QUERY_NAME - $FIELD1 $FIELD2"
eval "/usr/bin/time -v $CMD | jq length"
