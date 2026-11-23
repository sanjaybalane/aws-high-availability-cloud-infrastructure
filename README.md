# AWS High Availability Cloud Infrastructure

Production-style AWS cloud infrastructure project implementing high availability, load balancing, Multi-AZ database deployment, networking, and application hosting.

## Architecture

- Custom VPC (10.0.0.0/16)
- Public + Private subnets across 2 Availability Zones
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM Roles
- EC2 Web Servers (Multi-AZ)
- Application Load Balancer (ALB)
- RDS PostgreSQL Multi-AZ
- Flask application deployment
- Route53 / CloudFront design considerations

## Infrastructure Flow

```txt
Internet
↓
Route53 / CloudFront
↓
Application Load Balancer
↙              ↘
EC2 Web A       EC2 Web B
(AZ-1a)         (AZ-1b)
↓                ↓
Private Database Layer
RDS PostgreSQL Multi-AZ
```

## Key Concepts Demonstrated

- High Availability
- Multi-AZ Architecture
- Network Segmentation
- Private vs Public Subnets
- Security Group Design
- Load Balancing
- Database Redundancy
- Web Application Deployment
- AWS Networking Fundamentals

## Deployment Scripts

Scripts available inside:

```txt
scripts/
```

- ec2-app-a.sh
- ec2-app-b.sh

## Network and security design

- Public subnets route 0.0.0.0/0 to the Internet Gateway. Private subnets route 0.0.0.0/0 to the NAT Gateway, so they can reach the internet for updates but cannot be reached from it. Traffic inside the VPC stays on the local route (10.0.0.0/16).
- Auto-assign public IP is on for the public subnets only. The database sits in the private subnets with no public IP.
- Security groups are chained: the load balancer accepts web traffic from the internet, and the EC2 instances accept TCP 8000 only from the load balancer's security group.

## What I checked

- Each EC2 instance runs the Flask app on port 8000 and answers with a message naming its own Availability Zone. I tested each one with curl on localhost:8000, then opened the load balancer DNS name in a browser.
- From an EC2 instance I checked that the database port was reachable with nc -zv on 5432, then connected with psql and ran a query.

## What broke

- The load balancer returned a 502 error. Instance B had no application running, so the target had nothing to answer. I installed Flask on instance B, started the app with nohup so it keeps running after the session closes, and confirmed it with curl on localhost:8000.

## Technologies

AWS • VPC • EC2 • ALB • RDS • IAM • Route Tables • NAT Gateway • Flask • Linux

## Author

Sanjay Balane
https://github.com/sanjaybalane
