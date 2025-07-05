variable "project" {
    default = "expense"
}

variable "environment" {
    
}

variable "instances" {
    default = ["mysql","backend","frontend"]
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform = "true"
    }
}

variable "zone_id" {
    default = "Z07583031PEET0FZTRC5C"
}

variable "domain_name" {
    default = "jobsearchindia.online"
}