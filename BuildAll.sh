#!/bin/bash

oc new-project mol-invoiceninja \
    --description="MoL InvoiceNinja" \
    --display-name="MoL InvoiceNinja"

echo "pgAdmin"
oc create -f invoiceninja/BuildConfig.yaml
oc create -f invoiceninja/ImageStream.yaml
oc create -f invoiceninja/DeploymentConfig.yaml
oc create -f invoiceninja/Services.yaml
oc create -f invoiceninja/Route.yaml
oc start-build invoiceninja
