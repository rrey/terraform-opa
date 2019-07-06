package terraform.library

import input as tfplan

get_resources_by_type(resource_type) = res {
    res := tfplan.planned_values.root_module.resources[_]
    res.type == resource_type
}

get_configurationresources_by_type(resource_type) = res {
    res := tfplan.planned_values.root_module.resources[_]
    res.type == resource_type
}

resource_contains_label(resource, label) {
    hash_contains_keys(resource.values.labels, label)
}

hash_contains_keys(hash, item) {
    _ = hash[key]
    key = item
}

list_contains_value(list, item) {
    list_item = list[_]
    list_item == item
}
