awk -F "\"*,\"*" '{print $2}' textfile.csv|sort|uniq 