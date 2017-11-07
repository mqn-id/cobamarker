<?php

include ('inc/config.php');
?>

<!DOCTYPE html>
<html lang="en">
 <head>
  <title>Maps</title>
  <!-- <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script> --> <!-- old version, doesnt work in localhost --> 
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVRz2-HEmWnOQTkxr6hSOHN6RLeiGIrLg&sensor=false" type="text/javascript"></script>

  <script>
    var marker;
      function initialize() {
        // Variabel untuk menyimpan informasi (desc)
        var infoWindow = new google.maps.InfoWindow;
        //  Variabel untuk menyimpan peta Roadmap
        var mapOptions = {
          mapTypeId: google.maps.MapTypeId.ROADMAP
        } 
        // Pembuatan petanya
        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        // Variabel untuk menyimpan batas kordinat
        var bounds = new google.maps.LatLngBounds();

        // Pengambilan data dari database
        <?php

            $kueri=$conn->query("SELECT c.* , p.* FROM client c,penanda p WHERE c.id_client=p.id_client");
            while ($data = mysqli_fetch_array($kueri))
            {
                $status_client = $data['status_client'];
                $nama_halte = $data['nama_halte'];
                $koridor = $data['koridor'];
                $live = $data['image'];
                $lat = $data['latitude'];
                $lon = $data['longitude'];

                if($status_client == 'Connected'){
                  $image = 'images/conn.png';
                }
                else if($status_client == 'Disconnected'){
                  $image = 'images/dco.png';
                }
                else if($status_client == 'Destination host unreachable'){
                  $image = 'images/dhu.png';
                }
                else if($status_client == 'Destination net unreachable'){
                  $image = 'images/dnu.png';
                }
                else{
                  $image = 'images/rto.png';
                }
                
                echo ("addMarker($lat, $lon, '$image','Jaringan : $status_client<br/>Nama Halte : $nama_halte<br/>koridor : $koridor<br/>live : <img src=$live>');\n");                      
            }

           
          ?>
          
        // Proses membuat marker 
        function addMarker(lat, lng, img, info) {
            var lokasi = new google.maps.LatLng(lat, lng);
            bounds.extend(lokasi);
            var marker = new google.maps.Marker({
                map: map,
                position: lokasi,
                icon: img
            });       
            map.fitBounds(bounds);
            bindInfoWindow(marker, map, infoWindow, info);
         }
        
        // Menampilkan informasi pada masing-masing marker yang diklik
        function bindInfoWindow(marker, map, infoWindow, html) {
          google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setContent(html);
            infoWindow.open(map, marker);
          });
        }
 
        }
      google.maps.event.addDomListener(window, 'load', initialize);
   </script>

 </head>
 <body>
<div id="map-canvas" style="width:100%;height:700px;"></div>
  
 <script type="text/javascript" src="inc/jquery-1.11.3.min.js"></script>
  <img src="images/LoaderIcon.gif" id="loaderIcon" style="display:none" />
  <script>
$(document).ready(function() {
    $("#loaderIcon").show();
    var interval = setInterval(function() {
        $.ajax({
             url: 'ping-daop3.php',
             success: function(data) {
                $("#loaderIcon").hide();
                $("ping-daop3.php").hide();
             }
        });
    }, 3000);
});
</script>
      
 </body>
</html>
