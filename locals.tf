# ####################################################################################################### #
# Copyright (c) 2024 Oracle and/or its affiliates,  All rights reserved.                                  #
# Licensed under the Universal Permissive License v 1.0 as shown at https: //oss.oracle.com/licenses/upl. #
# Author: Andre Correa                                                                                    #
# Author email: andre.correa@oracle.com                                                                   #
# Last Modified: Wed Feb 21, 2024                                                                         #
# Modified by: andre.correa@oracle.com                                                                    #
# ####################################################################################################### #

locals {
    # compartments_dependency includes the compartments provided by the user as an external dependency and the compartments provisioned by the module. The line below merges these two maps together.
    compartments_dependency = merge({for k, v in coalesce(var.compartments_dependency,{}) : k => {"id" : v.id}}, {for k, v in (length(module.oci_orchestrator_compartments) > 0 ? module.oci_orchestrator_compartments[0].compartments : {}) : k => {"id" : v.id}})
}