#=====================================================================
# Purpose: Run the build server, run a jenkins job.
# Author: github:blank-blank
#=====================================================================

import boto3


#get instance

ec2 = boto3.client('ec2', 'us-west-2')



filters = [{  
    'Name': 'tag:Name',
    'Values': ['build']
    }]

reservations = ec2.describe_instances(Filters=filters)

#start instance
build_id = reservations['Reservations'][0]['Instances'][0]['InstanceId']

res = ec2.start_instances(InstanceIds=[build_id])
print res

#do build

#stop instance

