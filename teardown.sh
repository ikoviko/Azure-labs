#!/bin/bash

# Delete the entire resource group and everything in it
# WARNING: This is irreversible


az group delete \
  --name rg-vmcli-lab \
  --yes \
  --no-wait
