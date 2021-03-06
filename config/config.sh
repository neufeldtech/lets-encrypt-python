# This is the main config file for letsencrypt.sh      #
#                                                      #
# This file is looked for in the following locations:  #
# $SCRIPTDIR/config.sh (next to this script)           #
# /usr/local/etc/letsencrypt.sh/config.sh              #
# /etc/letsencrypt.sh/config.sh                        #
# ${PWD}/config.sh (in current working-directory)      #
#                                                      #
# Default values of this config are in comments        #
########################################################


# E-mail to use during the registration (default: <unset>)
CONTACT_EMAIL=you@yourdomain.tld

# Which public key algorithm should be used? Supported: rsa, prime256v1 and secp384r1
KEY_ALGO=rsa

# Path to certificate authority (default: https://acme-v01.api.letsencrypt.org/directory)
#CA="https://acme-v01.api.letsencrypt.org/directory"
CA="https://acme-staging.api.letsencrypt.org/directory"

# Path to license agreement (default: https://letsencrypt.org/documents/LE-SA-v1.0.1-July-27-2015.pdf)
#LICENSE="https://letsencrypt.org/documents/LE-SA-v1.0.1-July-27-2015.pdf"
LICENSE="https://letsencrypt.org/documents/LE-SA-v1.1.1-August-1-2016.pdf"

# Which challenge should be used? Currently http-01 and dns-01 are supported
CHALLENGETYPE="dns-01"

# Path to a directory containing additional config files, allowing to override
# the defaults found in the main configuration file. Additional config files
# in this directory needs to be named with a '.sh' ending.
# default: <unset>
# CONFIG_D="/var/tmp/le/config"

# Program or function called in certain situations
#
# After generating the challenge-response, or after failed challenge (in this case altname is empty)
# Given arguments: clean_challenge|deploy_challenge altname token-filename token-content
#
# After successfully signing certificate
# Given arguments: deploy_cert domain path/to/privkey.pem path/to/cert.pem path/to/fullchain.pem
#
# BASEDIR and WELLKNOWN variables are exported and can be used in an external program
# default: <unset>
HOOK=/opt/le/le_hook.py


# Base directory for account key, generated certificates and list of domains (default: $SCRIPTDIR -- uses config directory if undefined)
#BASEDIR=$SCRIPTDIR

# Output directory for challenge-tokens to be served by webserver or deployed in HOOK (default: $BASEDIR/.acme-challenges)
#WELLKNOWN="${BASEDIR}/.acme-challenges"

# Location of private account key (default: $BASEDIR/private_key.pem)
#ACCOUNT_KEY="${BASEDIR}/private_key.pem"

# Location of private account registration information (default: $BASEDIR/private_key.json)
#ACCOUNT_KEY_JSON="${BASEDIR}/private_key.json"

# Default keysize for private keys (default: 4096)
#KEYSIZE="4096"

# Path to openssl config file (default: <unset> - tries to figure out system default)
# OPENSSL_CNF=/etc/ssl/openssl.cnf

# Chain clean_challenge|deploy_challenge arguments together into one hook call per certificate (default: no)
#HOOK_CHAIN="no"

# Minimum days before expiration to automatically renew certificate (default: 30)
#RENEW_DAYS="30"

# Regenerate private keys instead of just signing new certificates on renewal (default: no)
#PRIVATE_KEY_RENEW="no"

# Lockfile location, to prevent concurrent access (default: $BASEDIR/lock)
#LOCKFILE="${BASEDIR}/lock"