function fingerprints() {
   ssh-keygen -l -f /etc/ssh/ssh_host_dsa_key.pub
   ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key.pub
   ssh-keygen -l -f /etc/ssh/ssh_host_ecdsa_key.pub
}
