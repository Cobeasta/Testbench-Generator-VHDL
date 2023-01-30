file_name=$(whiptail --inputbox "Enter File Name" 20 80 3>&1 1>&2 2>&3)
component_name=$(whiptail --inputbox "Enter component to test" 20 80 3>&1 1>&2 2>&3)

cp template_tb.vhd $file_name
sed -i 's/<File_Name>/'"$file_name"'/g' $file_name

