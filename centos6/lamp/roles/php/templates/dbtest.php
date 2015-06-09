<?php
$link = mysql_connect ( "localhost", "root", "", "test");

if (!$link) {
    printf("Connect Error: %s\n", mysqli_connect_error());
    exit();
}

printf("Connect Success: %s\n", mysql_get_host_info($link));

mysql_close($link);
?>