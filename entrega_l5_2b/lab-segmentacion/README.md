# Laboratorio 5: Patrón de segmentación de red (Equipo 2b)

La guía completa está en l5_2b.pdf. Resumen de ejecución:

1. Generar el certificado:   sh nginx/generar-certs.sh
2. Red plana (insegura):     docker compose -f docker-compose.plano.yml up -d --build
3. Red segmentada:           docker compose up -d --build
4. Captura de tráfico:       docker compose run --rm sniffer tcpdump -l -i br-dmz -nn -A -s0 'tcp port 80'
5. Limpieza:                 docker compose --profile captura down -v --remove-orphans
                             docker compose -f docker-compose.plano.yml down -v
