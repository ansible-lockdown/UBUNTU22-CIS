#Ami ubuntu 2004 
ami_id        = "ami-051dcca84f1edfff1"
ami_os        = "ubuntu22"
ami_username  = "ubuntu"
ami_user_home = "/home/ubuntu"
instance_tags = {
  Name        = "UBUNTU22-CIS"
  Environment = "github_test_pipeline"
}
