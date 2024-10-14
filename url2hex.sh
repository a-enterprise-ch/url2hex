#!/bin/bash
if [[ -z $1 ]]; then
  echo "Argument missing! Use: url2hex url"
  exit 1
fi
echo ""
echo -e "[[[ URL2HEX Converter ]]]\nTR-069 CWMP request ACS URL provisioning on ISC-DHCPD option vendor-encapsulated-options"
echo "URL:$1"
wcount=`echo $1 | wc -m`
tcount=`echo ${wcount}-1 | bc`
length=`printf '%x\n' ${tcount}`
hexurl=`echo -n $1 | xxd -ps | sed 's/[[:xdigit:]]\{2\}/\:&/g'`
echo -e "URL-length:${tcount} HEX:${length}\n\nvalues for CWMP provisioning in dhcpd.conf:\n"
echo "append dhcp-parameter-request-list 43;"
echo "option vendor-encapsulated-options 01:${length}${hexurl};"