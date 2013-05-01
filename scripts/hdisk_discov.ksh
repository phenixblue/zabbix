#!/usr/bin/ksh

TOT=`lsdev -c disk -F name:subclass | wc -l`

print "{\n"
print "\t\"data\":[\n\n"

for hdisk in `lsdev -c disk -S a -F name:subclass`

        do

                HDISKNAME=`echo $hdisk | awk -F : '{print $1}'`
                HDISKTYPE=`echo $hdisk | awk -F : '{print $2}'`

# Uncomment next line for testing only
#               echo $TOT

                if [ ${TOT} -eq  1 ]
                        then

                                print "\t{ \"{#HDISKNAME}\":\"${HDISKNAME}\",\t\"{#HDISKTYPE}\":\"${HDISKTYPE}\" }\n"

                        else

                                print "\t{ \"{#HDISKNAME}\":\"${HDISKNAME}\",\t\"{#HDISKTYPE}\":\"${HDISKTYPE}\" },\n"

                fi

                ((TOT=${TOT}-1))
done

print "\n\t]\n"
print "}\n"