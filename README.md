1. Create scripts folder in ~.
2. Create logs folder in ~.
3. Create secrets folder in ~.
4. For logs and secrets folder chmod 700.
5. For logs and secrets file chmod 600.
6. ensure script is executable: chmod +x /path/to/your/script.sh
7. crontab -e
8. 0 * * * * /path/to/your/script.sh


