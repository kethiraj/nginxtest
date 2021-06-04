sed -i -e 's/variable1/'$1'/g' index.html
sed -i -e 's/variable2/Build Number is '$2'/g' index.html
sed -i -e 's/variable3/Job Name is '$3'/g' index.html
