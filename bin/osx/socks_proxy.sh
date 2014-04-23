if [ $# -eq 0 ]; then
	echo "usage: $0 REMOTE_HOST"
	exit 1
fi

REMOTE_HOST=$1

sudo networksetup -setsocksfirewallproxy "Wi-Fi" 127.0.0.1 1080 &&
ssh -D 1080 $REMOTE_HOST -N
sudo networksetup -setsocksfirewallproxystate "Wi-Fi" off
