#!/usr/bin/ksh

# Script used to collect various data sets for Zabbix processing and monitoring


# Test if this script is already running, if so exit
if [ -f /tmp/zabbix_data_collect.pid ]

        then

                exit

        else

                # Write pid file
                echo "$$" > /tmp/zabbix_data_collect.pid        

                ###### Storage Data Collection ######
                /usr/local/zabbix/scripts/hdisk_discov.ksh > /usr/local/zabbix/data_collect/hdisk_discov.out    
                /usr/sbin/sar -d 1 2 > /usr/local/zabbix/data_collect/storage_sar.out
                
                ###### Network Data Collection ######
                /usr/local/zabbix/scripts/veth_discov.ksh > /usr/local/zabbix/data_collect/veth_discov.out    

                # Cleanup and remove pid file
                rm -rf /tmp/zabbix_data_collect.pid

fi