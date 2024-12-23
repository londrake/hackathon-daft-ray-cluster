#!/bin/bash

# mkdir -p /tmp/shared/ray
# # Configura il cron job per copiare il file ogni 5 minuti
# (crontab -l 2>/dev/null; echo "*/1 * * * * cp /tmp/ray/prom_metrics_service_discovery.json /tmp/shared/ray/prom_metrics_service_discovery.json && chmod 644 /tmp/shared/ray/prom_metrics_service_discovery.json") | crontab -

# service cron start

# Aggiungi un timeout per l'avvio
MAX_RETRIES=5
RETRY_INTERVAL=5

for ((i=1; i<=MAX_RETRIES; i++)); do
    # Pulizia di eventuali processi Ray residui
    pkill -f "ray" || true
    
    # Pulizia delle directory temporanee di Ray
    rm -rf /tmp/ray/* || true
    
    ray start --head \
        --num-cpus 1 \
        --dashboard-host 0.0.0.0 \
        --include-dashboard true \
        --dashboard-port=${DASHBOARDPORT} \
        --port=${REDISPORT} \
        --redis-password=${REDISPASSWORD} \
        --metrics-export-port=${METRICS_EXPORT_PORT} \
        --block &
    
    # Aspettiamo che Ray si avvii completamente
    sleep 15

    # Verifichiamo che il cluster sia attivo
    if ray status > /dev/null 2>&1; then
        if [ -f "/tmp/ray/prom_metrics_service_discovery.json" ]; then
            # cp /tmp/ray/prom_metrics_service_discovery.json /tmp/shared/ray/prom_metrics_service_discovery.json
            # chmod 644 /tmp/shared/ray/prom_metrics_service_discovery.json
            echo 'Ray started successfully'
            tail -f /dev/null
            exit 0
        fi
    fi

    echo "Attempt $i failed. Retrying in $RETRY_INTERVAL seconds..."
    sleep $RETRY_INTERVAL
done

echo "Failed to start Ray after $MAX_RETRIES attempts"
exit 1
