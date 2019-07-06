package terraform.test

import data.terraform.analysis

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

test_valid_instance_with_label {
        result := analysis.deny_instance_without_owner_label with input as gen_instance({"owner": "rre"})
        count(result) == 0
}

test_invalid_instance_with_no_label {
        result := analysis.deny_instance_without_owner_label with input as gen_instance({"trololo": "rre"})
        count(result) == 1
}
