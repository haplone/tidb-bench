
if [ $# != 9 ]; then
	echo "Usage: $0 host port dbuser dbpasswd tables-count table-size num-threads max-requests out-log"
	exit 1
fi

host=$1
port=$2
user=$3
password=$4
tcount=$5
tsize=$6
threads=$7
requests=$8
output=$9

sysbench --test=./lua-tests/db/insert.lua --mysql-host=${host} --mysql-port=${port} \
 --mysql-user=${user} --mysql-password=${password} --oltp-tables-count=${tcount} \
 --oltp-table-size=${tsize} --num-threads=${threads} --report-interval=60 \
 --max-requests=${requests} --percentile=99 run >> ${output}

