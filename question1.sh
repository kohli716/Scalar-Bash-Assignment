# Check if a file path is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

# Check if the file exists and is readable
if [ ! -r "$1" ]; then
  echo "Error: Log file does not exist or is not readable"
  exit 1
fi

logfile=$1

# Total Requests Count
total_requests=$(wc -l < "$logfile")
echo "Total Requests Count: $total_requests"

# Percentage of Successful Requests (HTTP status codes 200-299)
successful_requests=$(awk '$9 ~ /^[2][0-9][0-9]$/' "$logfile" | wc -l)
percentage_successful=$(echo "scale=2; ($successful_requests / $total_requests) * 100" | bc)
echo "Percentage of Successful Requests: $percentage_successful%"

# Most Active User (IP address making the most requests)
most_active_user=$(awk '{print $1}' "$logfile" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
echo "Most Active User: $most_active_user"