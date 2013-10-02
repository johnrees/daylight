LoadGmaps = ->
  myLatlng = new google.maps.LatLng(53.48367, -2.23718)

  grayStyles = [
    {
      featureType: 'all',
      stylers: [
        { hue: '#000000' },
        { saturation: -100 }
      ]
    },
    {
      featureType: 'transit.station.rail',
      stylers: [
        { hue: '#F9A518' },
        { saturation: 100 }
      ]
    }
  ]

  myOptions =
    zoom: 15
    center: myLatlng
    # disableDefaultUI: false
    zoomControl: false
    # zoomControlOptions:
    #   style: google.maps.ZoomControlStyle.LARGE

    mapTypeControl: true
    mapTypeControlOptions:
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU

    streetViewControl: false
    mapTypeId: google.maps.MapTypeId.ROADMAP

    styles: grayStyles

  map = new google.maps.Map(document.getElementById("MyGmaps"), myOptions)
  marker = new google.maps.Marker(
    position: myLatlng
    map: map
    title: "M4 1DW"
    icon: 'http://i.imgur.com/nbWzSfo.png'
  )

  google.maps.event.addDomListener window, 'resize', ->
    map.setCenter myLatlng

jQuery ->
  LoadGmaps()
