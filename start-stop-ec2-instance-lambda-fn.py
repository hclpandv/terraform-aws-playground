import boto3 
import os 

def get_ec2_instances(region, project, state): 
    ec2_instances = [] 
    ec2 = boto3.resource('ec2',region_name=region) 
    print('>>> I am in get_ec2_instances function') 
    filters = [ 
        { 'Name': 'tag:project', 'Values': [project] }, 
        { 'Name': 'instance-state-name', 'Values' : [state] } 
    ] 
    for instance in ec2.instances.filter(Filters=filters): 
        ip = instance.private_ip_address 
        state_name = instance.state["Name"] 
        print ("IP:{}, state:{}". format(ip,state_name)) 
        ec2_instances.append(instance) 
    return ec2_instances 

def start_ec2_instances(region, project): 
    instances_to_start = get_ec2_instances(region, project,'stopped') 
    instance_state_changed = 0 
    print('>>> I am in start_ec2_instances function') 
    for instance in instances_to_start: 
        instance.start() 
        instance_state_changed += 1 
    return instance_state_changed 

def stop_ec2_instances(region, project): 
    instances_to_stop = get_ec2_instances(region, project,'running') 
    instance_state_changed = 0 
    print('>>> I am in stop_ec2_instances function') 
    for instance in instances_to_stop: 
        instance.stop() 
        instance_state_changed += 1 
    return instance_state_changed 

def lambda_handler(event, context): 
    region = os.getenv('REGION','us-east-2') 
    project = os.getenv('PROJECT','demo') 
    print ('region is : ', region) print ('project is : ' ,project) 
    instance_state_changed = 0 
    p1 = str(event.get('action')) 
    print ('>>> Action is ', p1 ) 
    if (event.get('action') == 'start'): 
        instance_state_changed = start_ec2_instances(region,project) 
    elif (event.get('action') == 'stop'): 
        instance_state_changed = stop_ec2_instances(region,project) 
    return instance_state_changed
