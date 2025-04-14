#!/bin/bash

QUERY_STRING=$1

if [ -z "$QUERY_STRING" ]; then
  echo "Usage: $0 '<JSON query selector>'"
  echo 'Example: $0 "{\"selector\":{\"docType\":\"inventory\",\"warehouse\":\"SakuraTex\"}}"'
  exit 1
fi

# Escape JSON selector untuk dijadikan string dalam string JSON
ESCAPED_QUERY=$(printf '%s' "$QUERY_STRING" | jq -aRs .)

# Bangun perintah
CMD="peer chaincode query -C mychannel -n ledger -c '{\"Args\":[\"ManualQuery\", $ESCAPED_QUERY]}'"

# Run benchmark
echo "[🚀] Running ManualQuery with selector: $QUERY_STRING"
eval "/usr/bin/time -v $CMD | jq length"
