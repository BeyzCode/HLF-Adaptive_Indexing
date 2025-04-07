start_time=$(date +%s)
for i in {1..1000}; do
  peer chaincode invoke -C mychannel -n ledger -c '{"Args":["CreateAsset", "rm$i", "Product rm$i", "100", "Warehouse1", "Responsible1", "Available"]}'
done
end_time=$(date +%s)
total_time=$((end_time - start_time))
tps=$(echo "1000 / $total_time" | bc -l)
echo "TPS: $tps"