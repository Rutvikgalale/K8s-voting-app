#!/bin/sh

# create 3000 votes (2000 for option a, 1000 for option b)
# ab → ApacheBench, a tool for benchmarking HTTP servers
# -n 1000 → send 1000 requests total.
# -c 50 → send up to 50 requests at the same time
# -p posta → use the contents of the file posta as the POST body.
# (This file probably contains something like vote=a.)
# -p postb → use the file postb as the POST body.
# (Likely contains vote=b.)
# -T "application/x-www-form-urlencoded" → sets the Content-Type header to match form submission

ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://vote/
ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://vote/
ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://vote/

