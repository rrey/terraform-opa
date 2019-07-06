package terraform.test

import data.terraform.samples as samples

import data.terraform.analysis


test_valid_instance_with_label {
        result := analysis.deny_instance_without_owner_label with input as samples.gen_instance({"owner": "rre"})
        count(result) == 0
}

test_invalid_instance_with_no_label {
        result := analysis.deny_instance_without_owner_label with input as samples.gen_instance({"trololo": "rre"})
        count(result) == 1
}

test_valid_firewall {
        result := analysis.deny_firewall_ingress_openbar with input as samples.gen_firewall(["8.8.8.8/32"])
        count(result) == 0
}

test_invalid_firewall_openbar {
        result := analysis.deny_firewall_ingress_openbar with input as samples.gen_firewall(["0.0.0.0/0"])
        count(result) == 1
}

test_valid_firewall_allow {
        result := analysis.deny_firewall_ingress_icmp with input as samples.gen_firewall_with_allow([{"ports": ["80"], "protocol": "tcp"}])
        count(result) == 0
}

test_invalid_firewall_allow {
        result := analysis.deny_firewall_ingress_icmp with input as samples.gen_firewall_with_allow([{"ports": [], "protocol": "icmp"}])
        count(result) == 1
}
