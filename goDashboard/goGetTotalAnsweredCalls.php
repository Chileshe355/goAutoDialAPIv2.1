<?php
    #######################################################
    #### Name: goGetTotalAnsweredCalls.php             ####
    #### Description: API to get total answered calls  ####
    #### Version: 0.9                                  ####
    #### Copyright: GOAutoDial Inc. (c) 2011-2016      ####
    #### Written by: Jeremiah Sebastian V. Samatra     ####
    ####             Demian Lizandro A. Biscocho       ####
    #### License: AGPLv2                               ####
    #######################################################
    
    include_once("../goFunctions.php");
    
    $groupId = go_get_groupid($goUser);
    
    if (!checkIfTenant($groupId)) {
        $ul='';
    } else { 
        $stringv = go_getall_allowed_users($groupId);
        $stringv .= "'j'";
        $ul = " and campaign_id IN ($stringv) and user_level != 4";
    }

    $NOW = date("Y-m-d");

    $query = "SELECT sum(answers_today) as getTotalAnsweredCalls from vicidial_campaign_stats where calls_today > -1 and update_time BETWEEN '$NOW 00:00:00' AND '$NOW 23:59:59'  $ul"; 
    $rsltv = mysqli_query($link, $query);
    $data = mysqli_fetch_assoc($rsltv);
    $apiresults = array("result" => "success", "data" => $data);
?>
