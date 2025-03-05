variable "instances" {
  
  default     = ["mysql","frontend","backend"]
  
}

variable "project" {
  type        = string
  default     = "expense"
}



variable "instance_type" {
  
}

variable "environment" {

}


variable "zone_id" {
 
  default     = "Z09576191Z5VQH6BJ1P7O"
  
}

variable "domain_name" {
  default     = "jobsearchindia.online"
 
}

