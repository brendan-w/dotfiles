function find-ssh --description mostly\ for\ finding\ my\ RPi\'s
	nmap $argv -p 22 -sV --open
end
