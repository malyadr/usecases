network            = "vpc-dev"
subnetwork         = "subnet-dev"
subnetwork_project = "samad-410909"
startup_script = <<-EOT
#!/bin/bash
sudo apt update
sudo apt install -y jq
export VAULT_ADDR=https://vault.real-world.tk
export ROLE=ansible-samad
export JOB_ID=34
PUBLIC_IP=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
echo "Public IP: $PUBLIC_IP"
JWT=$(curl -H "Metadata-Flavor: Google" -s "http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=$VAULT_ADDR/vault/$ROLE&format=full")
cat > payload.json <<EOF
{
  "role":"$ROLE",
  "jwt":"$JWT"
}
EOF
TOKEN=$(curl -s --request POST --data @payload.json $VAULT_ADDR/v1/auth/gcp/login | jq .auth.client_token | xargs)
AWX_TOKEN=$(curl  --header "X-Vault-Token: $TOKEN"  --request GET  $VAULT_ADDR/v1/kv/data/ansible | jq .data.data.token | xargs)
#launch the template
cat > payload.json <<EOF
{
  "limit":"$PUBLIC_IP"
}
EOF
curl -X POST -H "Authorization: Bearer $AWX_TOKEN" -H "Content-Type: application/json" -d @payload.json https://awx.bootcamp64.tk/api/v2/job_templates/$JOB_ID/launch/
rm payload.json
EOT
