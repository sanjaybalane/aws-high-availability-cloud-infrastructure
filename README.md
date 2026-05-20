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

## Technologies

AWS • VPC • EC2 • ALB • RDS • IAM • Route Tables • NAT Gateway • Flask • Linux

## Author

Sanjay Balane
https://github.com/sanjaybalane
