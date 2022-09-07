echo "\033[0;31mStarting load test...\033[0m"
end=$((SECONDS+20))

while [ $SECONDS -lt $end ]; do
    for ((i=0; i<100; i++)); do
        curl -s -o /dev/null http://localhost
    done
done

wait
echo "\033[0;31mLoad test is completed...\033[0m"