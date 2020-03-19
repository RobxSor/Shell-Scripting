MY_INPUT='../home/bahay.csv'
declare -a A_NAME
declare -a A_USERNAME
while IFS=, read -r COL1 COL2 TRASH; do
    A_NAME+=("$COL2")
    A_USERNAME+=("$COL1")
done <"$MY_INPUT"
clear
for index in "${!A_USERNAME[@]}"; do
	echo "Creating ${A_USERNAME[$index]}..."
    #useradd -m -d "/home/${A_USERNAME[$index]}" -s /bin/bash -p "$(echo "platform" | passwd -stdin)" "${A_USERNAME[$index]}"
    #chmod
    useradd -m -d "/home/${A_USERNAME[$index]}" -s /bin/bash -p "$(echo "username:newpassword" | chpasswd)" "${A_USERNAME[$index]}"
done
