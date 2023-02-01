FILENAME=$(whiptail --inputbox "Enter File Name" 20 80 3>&1 1>&2 2>&3)
COMP_NAME=$(whiptail --inputbox "Enter component to test" 20 80 3>&1 1>&2 2>&3)
AUTHOR=$(whiptail --inputbox "Enter author\'s name" 20 80 3>&1 1>&2 2>&3)
DESCRIPTION=$(whiptail --inputbox "Enter Description" 20 80 3>&1 1>&2 2>&3)
NOTES=$(whiptail --inputbox "Enter notes" 20 80 3>&1 1>&2 2>&3)


# Loop for inputs:

INPUTS=()
SIGNALS=()
EXIT_FLAG=0
while [ $EXIT_FLAG=0 ]
do
	IN_NAME=$(whiptail --inputbox "Enter input name without \"i_\". Leave blank to exit" 20 80 3>&1 1>&2 2>&3)
	if [ -z "$IN_NAME" ]
	then
		break

	IN_DATATYPE=$(whiptail --inputbox "Enter datatype" 20 80 3>&1 1>&2 2>&3)
	IN_DEFAULT=$(whiptail --inputbox "Enter default value in correct VHDL syntax" 20 80 3>&1 1>&2 2>&3)

	$INPUT_LINE="i_${IN_NAME}: $IN_DATATYPE"
	$SIGNAL_LINE="s_i${IN_NAME}: $IN_DATATYPE := $IN_DEFAULT"


TESTBENCH_ENTITY_NAME="tb_"$COMP_NAME


cp template_tb.vhd $FILENAME

sed -i 's/<File_Name>/'"$FILENAME"'/g' $FILENAME
sed -i "s:<Writers_Name>:$AUTHOR:g" $FILENAME
sed -i "s:<Description>:$DESCRIPTION:g" $FILENAME
sed -i "s:<Notes>:$NOTES:g" $FILENAME
sed -i "s:<test_bench_name>:$TESTBENCH_ENTITY_NAME:g" $FILENAME
sed -i "s:<dut_component_name>:$COMP_NAME:g" $FILENAME

