set -eu
: "${LUCIDSERUM_METRICS_TOKEN:?LUCIDSERUM_METRICS_TOKEN must be set in Railway}"
umask 077
printf '%s' "$LUCIDSERUM_METRICS_TOKEN" > /tmp/lucidserum-metrics-token
exec /bin/prometheus "$@"
