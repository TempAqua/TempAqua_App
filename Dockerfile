FROM postgis/postgis:15-3.3 as postgis
COPY ./cert/certificate.key /var/lib/postgresql/server.key
COPY ./cert/certificate.crt /var/lib/postgresql/server.crt
RUN chown postgres:postgres /var/lib/postgresql/server.*
RUN chmod 600 /var/lib/postgresql/server.*
