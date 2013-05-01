#!/usr/bin/ksh

TOT=`lsdev -S a -c adapter -s vdevice -t IBM,l-lan | awk '{print $1}' | wc -l`

print "{\n"
print "\t\"data\":[\n\n"

for veth in `lsdev -S a -c adapter -s vdevice -t IBM,l-lan | awk '{print $1}'`

        do

                VETHNAME=`echo $veth`
                VETHTYPE=`lsdev -l $veth -F description`

# Uncomment next line for testing only
#               echo $TOT

                if [ ${TOT} -eq  1 ]
                        then

                                print "\t{ \"{#VETHNAME}\":\"${VETHNAME}\",\t\"{#VETHTYPE}\":\"${VETHTYPE}\" }\n"

                        else

                                print "\t{ \"{#VETHNAME}\":\"${VETHNAME}\",\t\"{#VETHTYPE}\":\"${VETHTYPE}\" },\n"
                                
                fi

                ((TOT=${TOT}-1))
done

print "\n\t]\n"
print "}\n"