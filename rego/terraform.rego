package terraform.analysis

import data.terraform.library as lib

deny_instance_without_owner_label[{ "msg": msg, "resource_name": resource_name }] {
#deny[msg] {
    instance := lib.get_resources_by_type("google_compute_instance")
    resource_name := instance.name
    not lib.resource_contains_label(instance, "owner")
#    msg = "Label owner is missing from google compute instance"
    msg = sprintf("[%s.%s] Label owner is missing", [instance.type, resource_name])
}

deny_firewall_ingress_openbar[{ "msg": msg, "resource_name": resource_name }] {
#deny[msg] {
    firewall := lib.get_resources_by_type("google_compute_firewall")
    resource_name := firewall.name
    lib.list_contains_value(firewall.values.source_ranges, "0.0.0.0/0")
#    msg = "Firewall must not be opened to source_ranges 0.0.0.0/0"
    msg = sprintf("[%s.%s] Firewall must not be opened to 0.0.0.0/0", [firewall.type, resource_name])
}

deny_firewall_ingress_icmp[{ "msg": msg, "resource_name": resource_name }] {
#deny[msg] {
    firewall := lib.get_resources_by_type("google_compute_firewall")
    resource_name := firewall.name
    allows := firewall.values.allow[_]
    protocol := allows.protocol
    protocol ==  "icmp"
#    msg = "Firewall must not allow icmp"
    msg = sprintf("[%s.%s] ICMP traffic should not be allowed", [firewall.type, resource_name])
}
