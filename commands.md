# Task 1
set


MY_LOCAL_VAR="local_var_value"
echo $MY_LOCAL_VAR


echo 'export MY_SHELL_VAR="shell_var_value"' >> ~/.bashrc
source ~/.bashrc
echo $MY_SHELL_VAR


sudo sh -c 'echo "MY_GLOBAL_VAR=\"global_var_value\"" >> /etc/environment'
source /etc/environment
echo $MY_GLOBAL_VAR
python3 -c 'import os; print(os.getenv("MY_GLOBAL_VAR"))'



# Task 2
groups

sudo gpasswd new_group
mkdir ~/my_project && cd ~/my_project
echo "Hello World" > test_file.txt

chmod o-rwx test_file.txt
sudo chown root:new_group test_file.txt
ls -l test_file.txt

echo "New data" >> test_file.txt
sudo usermod -aG new_group $USER
newgrp new_group
echo "User currently in the group" >> test_file.txt


# Task 3
sudo ln -s $(pwd)/test_file.txt /usr/local/bin/tf
sudo chmod -h go-rwx /usr/local/bin/tf
sudo chown -h root:root /usr/local/bin/tf

alias ll="ls -l"
ll

echo 'alias ll="ls -l"' >> ~/.bashrc
source ~/.bashrc

# Task 4
jobs
ps
cat
fg %1

tmux new-session -d -s session1 'cat'
tmux new-session -d -s session2 'echo "the second session"; read'
tmux attach-target -t session1
tmux kill-session -t session1
exit
tmux attach-target -t session2
