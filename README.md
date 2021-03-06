## Synopsis

This project uses Lukas2511's letsencrypt.sh shell script as the basis for deploying certificates to an F5 BIG-IP.

It utilizes the DNS challenge and reaches out to UltraDNS's API (currently beta) for the challenge setup and teardown. Major (below reference) has example for Rackspace DNS that this is based on.

It utilizes F5's iControl REST interface to upload and configure the certificates into a clientssl profile for SSL offloading capability.

## Setup
### BigIP 11.5.1
- SSH to F5
- `mkdir -p /var/config/rest/downloads/tmp`  

## Docker
In order to reduce the pain of installing the required python modules, and setting up a virtual environment, you can use the below Docker instructions for deployment of this script.

- Set your `CONTACT_EMAIL` in [config/config.sh](./config/config.sh)
```
...
# E-mail to use during the registration (default: <unset>)
CONTACT_EMAIL=you@yourdomain.tld
...
```

- Configure staging or production Certificate Authority in [config/config.sh](./config/config.sh) (use staging until you have tested and verified that everything is working)
```
# Path to certificate authority (default: https://acme-v01.api.letsencrypt.org/directory)
#CA="https://acme-v01.api.letsencrypt.org/directory"
CA="https://acme-staging.api.letsencrypt.org/directory"
``` 

- Add your desired domains/subdomains to [config/domains.txt](./config/domains.txt)
  - For each line in `config/domains.txt`, this script will create one SAN certificate and one SSL Client profile on your F5
```
mydomain.com server1.mydomain.com
example.com www.example.com server1.example.com
```

- Set up your variables in `config/config.json`
```
{
  "f5_host":"172.16.0.10",
  "f5_user": "admin",
  "f5_password": "admin",
  "udns_username": "udnsadmin",
  "udns_password": "udnsadmin"
}
```

- Build the container 
```
cd lets-encrypt-python
docker build -t le .
```

- Run the container in ad-hoc mode (Script will execute immediately with no recurring no cron job)
```
cd lets-encrypt-python
docker run -it -v $(pwd):/opt/le le /opt/le/letsencrypt.sh --cron -f /opt/le/config/config.sh 
```

- TODO (currently broken): Run the container in cron mode (Script will run once at 5AM daily)
```
cd lets-encrypt-python
docker run -d -v $(pwd):/opt/le le
```

## Contributors

Much of this project is based on the work of these projects:

* https://devcentral.f5.com/codeshare/lets-encrypt-on-a-big-ip
* https://github.com/lukas2511/letsencrypt.sh
* https://github.com/sporky/letsencrypt-dns
* https://github.com/major/letsencrypt-rackspace-hook