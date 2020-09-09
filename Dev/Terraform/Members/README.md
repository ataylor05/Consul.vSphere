# Dev environment
This project uses Terraform to deploy a development Consul environment.

# Running Terraform
<pre>
cd Consul.vSphere/Dev/Terraform

terraform apply -var="vsphere_password=password" -var="consul_root_password=password"
</pre>
