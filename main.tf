terraform {
    required_providers {
          aws = {
                  source  = "hashicorp/aws"
                        version = "~> 5.0"
                            }
                              }
                            }

                            provider "aws" {
                                region = "us-east-1"
                              }

                              resource "aws_security_group" "demo_sg" {
                                  name = "terraform-demo-sg"

                                    ingress {
                                          description = "SSH"
                                              from_port   = 22
                                                  to_port     = 22
                                                      protocol    = "tcp"
                                                          cidr_blocks = ["0.0.0.0/0"]
                                                            }

                                                              ingress {
                                                                    description = "HTTP"
                                                                        from_port   = 80
                                                                            to_port     = 80
                                                                                protocol    = "tcp"
                                                                                    cidr_blocks = ["0.0.0.0/0"]
                                                                                      }

                                                                                        egress {
                                                                                              from_port   = 0
                                                                                                  to_port     = 0
                                                                                                      protocol    = "-1"
                                                                                                          cidr_blocks = ["0.0.0.0/0"]
                                                                                                            }
                                                                                                          }

                                                                                                          resource "aws_instance" "demo" {
                                                                                                              ami           = "ami-0c02fb55956c7d316"
                                                                                                                instance_type = "t3.micro"

                                                                                                                  security_groups = [aws_security_group.demo_sg.name]

                                                                                                                    tags = {
                                                                                                                          Name = "terraform-free-tier-demo"
                                                                                                                            }
                                                                                                                          }

                                                                                                                          output "public_ip" {
                                                                                                                              value = aws_instance.demo.public_ip
                                                                                                                            }
