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