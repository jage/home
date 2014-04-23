REMOTE_HOST=$1

function usage() {
	echo "$0 REMOTE_HOST"
}

sudo networksetup -setsocksfirewallproxy "Wi-Fi" 127.0.0.1 1080 &&
ssh -D 1080 $REMOTE_HOST -N
sudo networksetup -setsocksfirewallproxystate "Wi-Fi" off
