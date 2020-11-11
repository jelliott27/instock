#!/bin/bash

wget URL-GOES-HERE -O output.html -q	            # Retrieves HTML source of page you're watching and quietly outputs it
idCount=`cat output.html | grep -o '$' | wc -l`     # It counts the number of unique symbols or keywords to help identify deviation from norm 
file=./checkMark	

if test -f "$file"		                            # Checks to see if the 'checkMark' file was created to act as a conditional checkmark to prevent continual alerting 
then
    rm output.html                                  # Cleanup 
    echo "Alert has already triggered"
    exit 0
else
    if [ $idCount -gt 2 ]		                    # If the unique is above a certain value indicating the item is back in stock  
    then
        echo "Item is back in stock!"
        swaks --to recipient@gmail.com --from youraddress@localhost.localdomain -s smtp.gmail.com:587 -tls -au username -ap password --header "Subject: Inventory Alert!" --body "Item X is back in STOCK!"
        touch checkMark		                        # Create the file for the conditional checkmark to prevent continual alerting
        rm output.html                              # Cleanup  
    fi
fi

# Cronjob example to run it every 5-minutes: 	5 * * * * /opt/instock.sh >/dev/null 2>&1