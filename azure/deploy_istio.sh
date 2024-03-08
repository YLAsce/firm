az aks mesh enable --resource-group ryax_ops --name mlintra --revision asm-1-18
az aks show --resource-group ryax_ops --name mlintra  --query 'serviceMeshProfile.mode'   # "Istio"
cd ../trace-grapher
# docker-compose run stack-builder
# now a shell pops as root in the project directory of the stack-builder container
cd deploy-trace-grapher
make prepare-trace-grapher-namespace
make install-components
