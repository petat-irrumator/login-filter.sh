 #!/usr/bin/bash 
 
echo "Total number of files given: ${#}";

number=1;

for log_file in "$@" 
do
	echo "$number: $log_file"
	number=$(expr $number + 1);
	
done

touch /home/user/Desktop/catted.txt

for i in "$@"
do
	cat "$i" >> "/home/user/Desktop/catted.txt" 
done
read
clear


grep -v -E "PPP|192.168.0" "/home/user/Desktop/catted.txt" >> /home/user/Desktop/half_filtered.txt

echo "Type all the mac addresses you want to filter in the text file,then save and exit the nano."
echo "Be carefull there should not be any extra spaces ONE PATTERN PER LINE"
read
touch /home/user/Desktop/mac_addr.txt
nano mac_addr.txt
grep -f mac_addr.txt -v /home/user/Desktop/half_filtered.txt >> /home/user/Desktop/full_filtered.txt
echo "lines		filename"
wc -l /home/user/Desktop/full_filtered.txt 
echo "Total number of lines / filename : $(wc -l /home/user/Desktop/catted.txt)"
read	
rm /home/user/Desktop/half_filtered.txt /home/user/Desktop/mac_addr.txt

echo "the orignal catted file will not be deleted in case you need it"
echo "----------DONE----------"
read

	


