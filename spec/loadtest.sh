SITE="http://logbook.dream.org/api/v2/people"
#SITE="http://logbook.dream.org/logbook/dashboard"
TRIALS=1000
CONCURRENCY=50
COOKIE="S3RhQmlvd0hBM1JOeTZxaVNFVUF5TC9zckFySTlvSDVhTW1aYys4alhwRy9WMnlRR0h6UGhEYXg3c0kvVzNGRGVhZDlJZGlkRnNHQTJTUVZyRmhrVG9PMkZGR0lIaHJFcUFJTWJCdzAxcU9kZXJ1TTBXaUxDSlFLVThtRUhsWnkveGliVktObEdCejlFVDVNRElnOXZZRm5uRzhBRGNpdDBNWThUM1I1bk5GWEgxbmxzVjR4VTBYckV4TXRKcWtmLS11cENKSEJ1eVhrZlRkejg1VlI4RTBBPT0%3D--b4a272e4284a94c08dc203746ca0ff1e525e2808;auth_token=thenepotist;"
ab -n $TRIALS -c $CONCURRENCY -C $COOKIE $SITE
