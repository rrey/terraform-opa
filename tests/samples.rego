package terraform.samples

gen_firewall(source_ranges) = res {
    res = {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "address": "google_compute_firewall.default",
                        "mode": "managed",
                        "type": "google_compute_firewall",
                        "name": "default",
                        "provider_name": "google",
                        "schema_version": 1,
                        "values": {
                            "source_ranges": source_ranges
                        }
                    }
                ]
            }
        }
    }
}

gen_firewall_with_allow(allowed) = res {
    res = {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "address": "google_compute_firewall.default",
                        "mode": "managed",
                        "type": "google_compute_firewall",
                        "name": "default",
                        "provider_name": "google",
                        "schema_version": 1,
                        "values": {
                          "allow": allowed
                       }
                    }
                ]
            }
        }
    }
}

gen_instance(labels) = res {
    res = {
        "planned_values": {
            "root_module": {
                "resources": [
                    {
                        "address": "google_compute_instance.gitlab",
                        "mode": "managed",
                        "type": "google_compute_instance",
                        "name": "gitlab",
                        "provider_name": "google",
                        "schema_version": 6,
                        "values": {
                            "labels": labels,
                        },
            	    },
                ],
            },
        },
    }
}
