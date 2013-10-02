LoadGmaps = ->
  myLatlng = new google.maps.LatLng(53.48367, -2.23718)

  grayStyles = [
    featureType: "all"
    stylers: [
      { saturation: -100 }
      { lightness: 20 }
      { weight: 0.4 }
    ]
  ]

  myOptions =
    zoom: 16
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

jQuery ->
  LoadGmaps()
