<?php
include 'inc/config.php';
$d_koridor=$conn->query("SELECT (id_blok) FROM blok WHERE pusat_client='1'")->fetch_assoc();
$id_st = $d_koridor['id_blok'];
$limit = 20; // jumlah Ip per Halaman
$start = 1;
$slice = 9;
$self_server = "superadmin.php?page=kelola&id=$id_st";
$q = "SELECT * FROM client WHERE id_blok='$id_st'";
$r = $conn->query($q);
$totalrows = $r->num_rows;

if(!isset($_GET['pn']) || !is_numeric($_GET['pn'])){
    $page = 1;
} else {
    $page = $_GET['pn'];
}

$numofpages = ceil($totalrows / $limit);
$limitvalue = $page * $limit - ($limit);

$q = "SELECT * FROM client WHERE id_blok='$id_st' LIMIT $limitvalue, $limit";
//jika user nakal paging lebih dari data yg dimiliki
$cek_page = $conn->query($q);
if ($cek_page->num_rows != 0) {
    if ($r = $conn->query($q)) {

    //Outputnya disini
   
    if ($r->num_rows!==0) {
           
            $no=0;
            
            while ($client=$r->fetch_assoc()) {
                extract($client);
                $ip=  "$ip_client";
                // Query untuk update status client
                $sql = "UPDATE client SET status_client=? WHERE id_client='$id_client'";
                exec("ping -n 1 $ip_client", $output['ke'.$ip_client],$status);
                //exec("/bin/ping -c2 -w2 $ip", $output, $status); //untuk os linux 
                if($status==0) {
                    $cut = explode(":", $output['ke'.$ip_client]['2']);
                    $hasil = trim($cut['0'], " .");
                    switch ($hasil) {
                        case 'Request timed out':
                            $log = "Request timed out";
                            if ($status_client !== "$log") {
                                // Eksekusi query update status client
                                if ($statement = $conn->prepare($sql)) {
                                    $statement->bind_param("s", $log);
                                    $statement->execute();
                                    //echo "Dirubah";
                                }
                            }
                            $status="<img src='./assets/img/rto'>$log</font>";
                            break;
                        
                        default:
                        $hasil1 = trim($cut['1'], " .");
                            switch ($hasil1) {
                                case 'Destination net unreachable':
                                    $log =  "Destination net unreachable";
                                    if ($status_client !== "$log") {
                                        // Eksekusi query update status client
                                        if ($statement = $conn->prepare($sql)) {
                                            $statement->bind_param("s", $log);
                                            $statement->execute();
                                            //echo "Dirubah";
                                        }
                                    }
                                    $status="<img src='./assets/img/dnu'>$log</font>";
                                    break;
                                case 'Destination host unreachable':
                                    $log = "Destination host unreachable";
                                    // Eksekusi query update status client
                                    if ($status_client !== "$log") {
                                        // Eksekusi query update status client
                                        if ($statement = $conn->prepare($sql)) {
                                            $statement->bind_param("s", $log);
                                            $statement->execute();
                                            //echo "Dirubah";
                                        }
                                    }
                                    $status="<img src='./assets/img/dhu'>$log</font>";
                                    break;
                                
                                default:
                                    $log = "Connected";
                                    if ($status_client !== "$log") {
                                        // Eksekusi query update status client
                                        if ($statement = $conn->prepare($sql)) {
                                            $statement->bind_param("s", $log);
                                            $statement->execute();
                                            //echo "Dirubah";
                                        }
                                    }
                                    $status = "<img src='./assets/img/conn'>$log</font>";
                                    break;
                                }
                            break;
                        }
                    }else{
                        $log = "Disconnected";
                        if ($status_client !== "$log") {
                            // Eksekusi query update status client
                            if ($statement = $conn->prepare($sql)) {
                                $statement->bind_param("s", $log);
                                $statement->execute();
                            }
                        }
                        $status="<img src='./assets/img/dco'>$log</font>";
                    }
                    $no++;
                    
                //print_r($status);
               

            }
           
        } 

    } 
    $sql_cek_row = "SELECT*FROM client WHERE id_blok='$id_st'";
    $q_cek = $conn->query($sql_cek_row);
    $hitung = $q_cek->num_rows;
    if ($hitung >= $limit) {
        echo "<hr><ul class='pagination'>";
       if($page!= 1){
            $pageprev = $page - 1;
            echo '<li><a href="'.$self_server.'&pn='.$pageprev.'"><i class="fa fa-chevron-left"></i></a></li>';
        }else{
            echo "<li><li><a href='#'><i class='fa fa-chevron-left'></i></a></li>";
        }

        if (($page + $slice) < $numofpages) {
            $this_far = $page + $slice;
        } else {
            $this_far = $numofpages;
        }

        if (($start + $page) >= 10 && ($page - 10) > 0) {
            $start = $page - 10;
        }

        for ($i = $start; $i <= $this_far; $i++){
            if($i == $page){
                echo "<li class='active'><a href='#'>".$i."</a></li> ";
            }else{
                echo '<li><a href="'.$self_server.'&pn='.$i.'">'.$i.'</a></li> ';
            }
        }

        if(($totalrows - ($limit * $page)) > 0){
            $pagenext = $page + 1;
            echo '<li><a href="'.$self_server.'&pn='.$pagenext.'"><i class="fa fa-chevron-right"></i></a></li>';
        }else{
            echo "<li><li><a href='#'><i class='fa fa-chevron-right'></i></a></li>";
        }
        echo "</ul>";
    }
} else {
    include '../not_data.php';
}
?>