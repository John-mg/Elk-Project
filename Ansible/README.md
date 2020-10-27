## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Playbook file may be used to install only certain pieces of it, such as Filebeat.

  - Pentest.yml
  - Filebeat_playbook.yml
  - Metricbeat_playbook.yml
  - Elk_install.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly availible, in addition to restricting unwanted IPs to the network.
- Helps move data more efficiently, prevent server overloads, restrict access, and integrity 

- A Jumpbox allows for instant running of apps, work can be done easily which allows for more focus on important activities, allows for easy upgrading, quick evaluations of applications, and can protect data since you need to go through jumpbox

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the metrics and system logs.
- Monitors log files, helps generate and organize logs files to send to Logstash/Elasticserver
- It records system level metrics for various and platforms

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     |    Function      | IP Address | Operating System |
|----------|------------------|------------|------------------|
| Jump Box |     Gateway      |  10.0.0.1  |     Linux        |
| Web1     | Redundant Server |  10.0.0.5  |     Linux        |
| Web2     | Redundant Server |  10.0.0.6  |     Linux        |
| Web3     | Redundant Server |  10.0.0.8  |     Linux        |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Personal IP is allowed access to jumpbox once configured

Machines within the network can only be accessed by Jumpbox.
- IP allowed 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses        |
|----------|---------------------|-----------------------------|
| Jump Box |       NO            | 10.0.0.5 10.0.0.6 10.0.0.8  |
|          |                     |                             |
|          |                     |                             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Simplifiying and taking out human error when setting up systems. As well as, allowing for easier updates later

The playbook implements the following tasks:
- Create a Elk-install.yml. The yml will adder docker.io
- python3-pip
- elk docker conatiner image

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Elk-dockerps](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 (10.0.0.5) Web2(10.0.0.6) Web3 (10.0.0.8)

We have installed the following Beats on these machines:
- Metric and Filebeat have been installed

These Beats allow us to collect the following information from each machine:
- Filebeat collects log data and Metricbeats collect machine metics

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the metricbeat.config file to /etc/ansible/roles.
- Update the config file to include Elk VM
- Run the playbook, and navigate to Kibana data page to check that the installation worked as expected.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
Run playbook:  ansible-playbook “yml file name”
Update playbook: nano “yml file”
Download beat config file: curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml

Connect to Jumpbox: ssh username@ipaddress
sudo su “commands after need sudo”
List container: docker container list -a
Start container: docker start “container name”
Start Elk: docker start elk
Check if its running: docker ps
Connect to container: docker attach “container name”