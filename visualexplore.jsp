<link href="svec.cdf" rel="stylesheet">
<%@page import="java.sql.*"%>
<%@ include file="common.jsp" %>

<%
String str ="";
         try 
        {

String s = "select distinct lati,longt from data";

ResultSet rs = st.executeQuery(s);
while(rs.next())
{
str= str + "[''," + rs.getString(1)  + "," + rs.getString(2) + "],"; 
}

str = "[" + str + "['',12.9716,77.5946]]";

  } 
catch (Exception e) 
{ out.println("<h1>Error Occured<BR>"+e);  }
%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-dEp2-qz9etAD1iPJ5mrlq1kaAjC9LLA"></script>

<script>
function initMap() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
                    
    // Display a map on the web page
    map = new google.maps.Map(document.getElementById("mapCanvas"), mapOptions);
    map.setTilt(50);
        
    // Multiple markers location, latitude, and longitude
  var markers =<%=str%>;


     var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Place each marker on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });
        
        // Add info window to marker    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Center the map to fit all markers on the screen
        map.fitBounds(bounds);
    }
    // Set zoom level
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(7);
        google.maps.event.removeListener(boundsListener);
    });
    
}
google.maps.event.addDomListener(window, 'load', initMap);
</script>
</head>

<body>
<div id="mapContainer">
    <div id="mapCanvas" style="height:500px; width:900px"></div>
</div>

</body>
</html>