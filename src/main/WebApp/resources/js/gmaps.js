var map;
function initialize () {
    var lat = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lat').innerHTML : document.getElementById ('address_lat').value ;
    var lng = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lon').innerHTML : document.getElementById ('address_lon').value ;
    if(lat > 0 && lng > 0)
    {
	var mapOptions = {
	    zoom: 11,
	    center: new google.maps.LatLng (lat, lng)
	};
    }
    else
    {
	var mapOptions = {
	    zoom: 11,
	    center: new google.maps.LatLng (42.69606265394371, 23.322601318359375)
	};
    }

    map = new google.maps.Map (document.getElementById ('map-canvas'), mapOptions);
   

    var input = (document.getElementById ('address_street'));

    var autocomplete = new google.maps.places.Autocomplete (input);
    autocomplete.bindTo ('bounds', map);

    google.maps.event.addListener (map, 'click', function (event) {
	if (typeof marker !== 'undefined') {
	    marker.setMap (null);
	}
	document.getElementById ('address_lat').value = event.latLng.k;
	document.getElementById ('address_lon').value = event.latLng.D;
	codeLatLng ();
    });
    geocoder = new google.maps.Geocoder ();
    var infowindow = new google.maps.InfoWindow ();
    marker = new google.maps.Marker ({
	map: map,
	draggable: true
    });
    
    google.maps.event.addListener (autocomplete, 'place_changed', function () {
	infowindow.close ();
	marker.setVisible (false);
	var place = autocomplete.getPlace ();
	if (!place.geometry) {
	    return;
	}
	if (place.geometry.viewport) {
	    map.fitBounds (place.geometry.viewport);
	} else {
	    //map.setCenter(place.geometry.location);
	}
	marker.setIcon (({
	    url: place.icon,
	    size: new google.maps.Size (71, 71),
	    origin: new google.maps.Point (0, 0),
	    anchor: new google.maps.Point (17, 34),
	    scaledSize: new google.maps.Size (35, 35)
	}));
	document.getElementById ('address_lat').value = place.geometry.location.k.toFixed (6);
	document.getElementById ('address_lon').value = place.geometry.location.B.toFixed (6);

	marker.setPosition (place.geometry.location);
	marker.setVisible (true);

	var address = '';
	if (place.address_components) {
	    console.log (place.address_components);
	    street = getComponents (place.address_components);
	}
	infowindow.setContent ('<div><strong>' + place.name + '</strong><br>' + address);
	infowindow.open (map, marker);
	document.getElementById ('address_street').value = street;
    });
    setMarker();
}
google.maps.event.addDomListener (window, 'load', initialize);
 

function getComponents (arrAddress)
{
    var itemRoute = '';
    var itemNumber = '';

    $.each (arrAddress, function (i, address_component) {

	if (address_component.types[0] == "route") {
	    itemRoute = address_component.long_name;
	}

	if (address_component.types[0] == "locality") {
	    itemLocality = address_component.long_name;
	}

	if (address_component.types[0] == "country") {
	    itemCountry = address_component.long_name;
	}

	if (address_component.types[0] == "postal_code_prefix") {
	    itemPc = address_component.long_name;
	}

	if (address_component.types[0] == "street_number") {
	    itemNumber = address_component.long_name;
	}
    });
    var result = itemRoute;
    if (itemNumber)
    {
	result += ', ' + itemNumber;
    }
    return result;
}
function codeLatLng () {
    var lat = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lat').innerHTML : document.getElementById ('address_lat').value ;
    var lng = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lon').innerHTML : document.getElementById ('address_lon').value ;
    var input = document.getElementById (lat, lng);
    var latlng = new google.maps.LatLng (lat, lng);
    geocoder.geocode ({'latLng': latlng}, function (results, status) {
	if (status === google.maps.GeocoderStatus.OK) {
	    if (results[1]) {
		marker = new google.maps.Marker ({
		    position: latlng,
		    map: map
		});
		var street = getComponents (results[0].address_components);
		document.getElementById ('address_street').value = street;
	    } else {
		console.log ('Няма намерени резултати');
	    }
	} else {
	    console.log ('Възника грешка със статус: ' + status);
	}
    });
}

function setMarker()
{
    var lat = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lat').innerHTML : document.getElementById ('address_lat').value ;
    var lng = (typeof document.getElementById ('address_lat').value === 'undefined')? document.getElementById ('address_lon').innerHTML : document.getElementById ('address_lon').value ;
    if(lat > 0 && lng > 0)
    {
	var input = document.getElementById (lat, lng);
	var latlng = new google.maps.LatLng (lat, lng);
	marker = new google.maps.Marker ({
	    position: latlng,
	    map: map
	});
    }
}