## Deploying a multi-tier application on AWS with High Availabilty and maintaining high security.

####  This is a demo project where I delpoyed a fullstack(Frontend + backend + Database) app on AWS using their resources. I created a VPC from scratch and then configure various services to host my application. I tried to maintain security practices and configure High Availabilty and Auto Scalling feature for hosting. A detailed explanation of the project is given below.

#### Resources used in this project:
-   VPC ( Public & Private Subnets, Route table, IGW, NAT GW)
-   Route53 ( Public & Private Hosted Zone, Simple Routing Policies )
-   ALB ( Target Groups, Host Header Routing )
-   EC2 Instances ( Security groups, NACL )
- Bastion Host
-   RDS ( Multi AZ, Replicas )
- CloudFront
-   ACM ( SSL )
-   ASG
-   EFS
-   S3
-   IAM
- 
### Project Architecture:
![Project Diagram](https://github.com/faysalmehedi/aws-ha-app-deployment-demo/blob/main/ha-web-app-diagram.svg)

### What I did:

After logging to AWS console I created a custom VPC for this project.  Then I created two public subnets and four private subnets; total 6 subnets in two availabilty zones. Two public subnet was created for connecting the internet and that's why I need to create a IGW (Internet Gateway) for this purpose. Then in the routing table I have to configure the route from public subnets to the IGW. As my private subnets will be used for backend application hosting and database hosting, I don't want to access them from the internet directly. So I need NAT gateway for updates, security patches or any download purpose. So I created NAT GW 
for this puposes. Note: NAT GW charges per hour I will only use them when needed them otherwise they will remain down. I set up BASTION HOST for accessing my instances in the private subnets as I can't access them from public internet. I applied some security for the bastion host like change the `ssh port` 22 to another custom port[from instances and from security group also]. change the security group for the ssh connection which will only connect from home networks.

Now it's time to deploy! First I deployed my frontend app wriiten in React.js on s3 bucket as static website hosting. I uploaded the npm build files in s3 bucket and enable public access. Then I configrued AWS cloudfront services as the CDN(Content delivery network). Also set up SSL for security from AWS Certificate Manger. Then I configured Route53 service for DNS which is public hosted. The overall architecture for frontend app is users will hit via public internet through route53 then it will be routed to the cloudfront service. With the SSL connection verified by browser and ACM-Cloud front it will be deliver the static files from S3 bucket to users browser. 

#### Not finished, I will due contents soon....
