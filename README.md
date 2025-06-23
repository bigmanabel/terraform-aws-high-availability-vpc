# 🏗️ Terraform AWS Highly Available Multi-AZ VPC

This project sets up a **highly available Virtual Private Cloud (VPC)** on AWS
using Terraform. It includes:

- A custom VPC with DNS hostnames enabled
- Public and private subnets distributed across multiple Availability Zones
- Internet Gateway for public internet access
- NAT Gateway with Elastic IP for private subnet internet access
- Route Tables with proper associations for public and private subnets
- Security Groups:
  - **Public SG**: Allows HTTP (80) and HTTPS (443) inbound traffic
  - **Private SG**: Allows PostgreSQL (5432) traffic from within the VPC

---

<!-- ## 📐 Architecture Diagram -->
<!--  -->
<!-- **Title**: *Highly Available Multi-AZ VPC Architecture on AWS (Terraform)* -->
<!--  -->
<!-- [🔗 View Interactive Diagram in Eraser.io](https://eraser.io/board/your-diagram-link) -->
<!--  -->
<!-- ![HA VPC Architecture](./diagrams/ha-vpc-diagram.png) -->
<!--  -->
<!-- > The diagram shows a VPC with 2 public and 2 private subnets across 2 AZs, Internet Gateway, NAT Gateway, and security groups. -->
<!--  -->
<!-- --- -->

## 📁 Project Structure

```bash
terraform-aws-high-availability-vpc/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.tfvars.example
├── provider.tf
├── LICENSE
├── README.md
└── modules/
    └── vpc/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## � Requirements

- **Terraform**: Version ~> 1.7
- **AWS Provider**: Version ~> 5.0
- **AWS CLI**: For authentication and configuration

---

## �🛠 Setup Instructions

Before deploying, follow these steps to set up your environment:

1. **Install Terraform**

   Download and install from:  
   https://developer.hashicorp.com/terraform/downloads

2. **Install AWS CLI**

   Install from:  
   https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html

3. **Configure AWS Credentials**

   **Option A: AWS CLI Configuration**

   ```bash
   aws configure
   ```

   **Option B: Environment Variables**

   Create a `.env` file in your project root:

   ```bash
   # .env
   export AWS_ACCESS_KEY_ID="your-access-key-id"
   export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
   export AWS_DEFAULT_REGION="us-east-1"
   ```

   Then source the file:

   ```bash
   source .env
   ```

4. **Clone This Repository**

   ```bash
   git clone https://github.com/bigmanabel/terraform-aws-high-availability-vpc.git
   cd terraform-aws-high-availability-vpc
   ```

5. **Review and Customize Variables**

   Open `terraform.tfvars` and update values such as:

   ```hcl
   aws_region   = "us-east-1"
   project_name = "tf-aws-vpc"
   vpc_cidr     = "10.0.0.0/16"
   azs          = ["us-east-1a", "us-east-1b"]
   ```

6. _(Optional)_ Set up Remote State with S3 & DynamoDB  
   (for production-grade infrastructure and collaboration)

---

## 🚀 Deployment

```bash
# Initialize Terraform
terraform init

# Preview the infrastructure changes
terraform plan

# Apply the configuration
terraform apply
```

---

## ⚙️ Inputs

| Variable       | Description                    | Type           | Default     | Example                        |
| -------------- | ------------------------------ | -------------- | ----------- | ------------------------------ |
| `aws_region`   | AWS region to deploy resources | `string`       | `us-east-1` | `"us-east-1"`                  |
| `project_name` | Name prefix for all resources  | `string`       | -           | `"tf-aws-vpc"`                 |
| `vpc_cidr`     | CIDR block for the VPC         | `string`       | -           | `"10.0.0.0/16"`                |
| `azs`          | List of AZs to deploy into     | `list(string)` | -           | `["us-east-1a", "us-east-1b"]` |

---

## 📤 Outputs

| Output               | Description                |
| -------------------- | -------------------------- |
| `vpc_id`             | ID of the created VPC      |
| `public_subnet_ids`  | List of public subnet IDs  |
| `private_subnet_ids` | List of private subnet IDs |
| `public_sg_id`       | Public Security Group ID   |
| `private_sg_id`      | Private Security Group ID  |

---

## 📌 Notes

- This project is designed to be modular and extensible.
- It forms the foundation for adding ALBs, EC2s, RDS, ECS, etc.
- Best suited for scalable, secure, and highly available workloads.

---

## 🧠 Inspiration

This architecture follows AWS best practices for high availability and security,
and is built to showcase real-world infrastructure-as-code skills for DevOps and
cloud engineers.
