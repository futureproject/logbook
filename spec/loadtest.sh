SITE="http://my.dream.org/logbook/people"
TRIALS=1000
CONCURRENCY=50
COOKIE="_dream_os_session=WVlTK2ZiL0VqMkQveDVTQnl2ZnIvRWpRS3pmamxuSkdpR29JQ1pXa3BoM0lyQysxcEs3WU9Ka0xZRFZib2lmVFM2c0lIZzJ0RCswbmtTR3VMeUFKNHZwbHpRRU1UU1NWT3NDRnI3T29oR2prQTVHblBoYWZRNnhlRGdEQzkwRmhxZFpnS0JGc3h4c0xPL0lIREdiSjFyb016dDhOcWRVMU5tMGxOZUVadWZ4U2FJRzI5ZmtaRG0wQVYxOW4wby8wLS02aThnclBiSWtTK2hibFlGbWloV1VRPT0;auth_token=thenepotist;"
ab -n $TRIALS -c $CONCURRENCY -C $COOKIE $SITE
