.SILENT:

help:
	echo "make help - show this help"
	echo "make build - build the docker image"
	echo "make run - run the docker image"
	echo "make stop - stop the docker image"
	echo "make clean - clean the docker image"

setup: #terraform setup
	    ./make.sh setup

validate: #terraform format + validate
	    ./make.sh validate

apply: #terraform plan + apply (deploy)
	    ./make.sh apply

ec2-connect: #connect to ec2 instance
	    ./make.sh ec2-connect

bastion-create: #create bastion host
	    ./make.sh bastion-create

bastion-info: #get bastion + database endpoints
	    ./make.sh bastion-info

bastion-terminate: #terminate bastion host
	    ./make.sh bastion-terminate

ssh-tunnel-create: #create ssh tunnel
	    ./make.sh ssh-tunnel-create

ssh-tunnel-close: #close ssh tunnel
	    ./make.sh ssh-tunnel-close

destroy: #terraform destroy (destroys all resources)
	    ./make.sh destroy