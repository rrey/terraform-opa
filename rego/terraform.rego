package terraform.analysis

import data.terraform.library as lib

deny_instance_without_owner_label[{ "msg": msg, "resource_name": resource_name }] {
    instance := lib.get_resources_by_type("google_compute_instance")
    resource_name := instance.name
    not lib.resource_contains_label(instance, "owner")
    msg = "Label owner is missing from google compute instance"
}

deny_firewall_ingress_openbar[{ "msg": msg, "resource_name": resource_name }] {
    firewall := lib.get_resources_by_type("google_compute_firewall")
    resource_name := firewall.name
    not lib.hash_contains_keys(firewall.values.source_ranges, "0.0.0.0/0")
    msg = "Firewall must not be opened to source_ranges 0.0.0.0/0"
}

deny_firewall_ingress_icmp[{ "msg": msg, "resource_name": resource_name }] {
    firewall := lib.get_resources_by_type("google_compute_firewall")
    resource_name := firewall.name
    allowed_items := firewall.values.allow
    not lib.hash_contains_keys(allowed_items, "icmp")
    msg = "Firewall must not allow icmp"
}

deny_credentials_provider[{ "msg": msg, "resource_name": resource_name }] {
    firewall := lib.get_resources_by_type("google_compute_firewall")
    resource_name := firewall.name
    allowed_items := firewall.values.allow
    not lib.hash_contains_keys(allowed_items, "icmp")
    msg = "Firewall must not allow icmp"
}
