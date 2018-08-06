#!/usr/bin/env bash
#TODO: List all envvars in Circle then delete to avoid needing to explicitly name all vars
set -euo pipefail
readonly CIRCLE_API_BASE=https://circleci.com/api/v1.1/project/github/spring-cloud-incubator/spring-cloud-app-broker

delete_envvars(){

 	delete_envvar_from_circle DIRECTOR_SSLCA
	delete_envvar_from_circle JUMPBOX_PRIVATE_KEY
	delete_envvar_from_circle UAA_CERT
	delete_envvar_from_circle CREDHUB_CA
	delete_envvar_from_circle LB_KEY
	delete_envvar_from_circle LB_CERT
	delete_envvar_from_circle DIRECTOR_SSLPRIVATE_KEY
	delete_envvar_from_circle DIRECTOR_SSLCERTIFICATE
	delete_envvar_from_circle DIRECTOR_JUMPBOX_SSH_PRIVATE_KEY
	delete_envvar_from_circle DIRECTOR_USERNAME
	delete_envvar_from_circle DIRECTOR_PASSWORD
	delete_envvar_from_circle DIRECTOR_INTERNAL_IP
	delete_envvar_from_circle DIRECTOR_PORT
	delete_envvar_from_circle JUMPBOX_URL
	delete_envvar_from_circle LB_DOMAIN
	delete_envvar_from_circle DIRECTOR_ADMIN_PASSWORD
	delete_envvar_from_circle CREDHUB_ADMIN_CLIENT_SECRET
	delete_envvar_from_circle BBL_ENV_ID
	delete_envvar_from_circle CIRCLECI_API_KEY
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_API_HOST
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_API_PORT
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_USERNAME
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_PASSWORD
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_DEFAULT_ORG
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_DEFAULT_SPACE
	delete_envvar_from_circle SPRING_CLOUD_APPBROKER_ACCEPTANCETEST_CLOUDFOUNDRY_SKIP_SSL_VALIDATION
	delete_envvar_from_circle TESTS_SAMPLEBROKERAPPPATH

}

delete_envvar_from_circle() {
	local envvar_name=$1
	curl -XDELETE "${CIRCLE_API_BASE}/envvar/${envvar_name}?circle-token=${CIRCLECI_API_KEY}"

}

delete_envvars