module ApplicationHelper

  def map_chart_styles
    {
      mapType: 'styledMap',
      showTip: true,
      useMapTypeControl: true,
      maps: {
        styledMap: {
          name: 'SPA Style',
          styles: [
            {featureType: 'poi.attraction', stylers: [{color: '#fce8b2'}]},
            {featureType: 'road.highway', stylers: [{hue: '#0277bd'}, {saturation: -50}]},
            {featureType: 'road.highway', elementType: 'labels.icon', stylers: [{hue: '#000'}, {saturation: 100}, {lightness: 50}]},
            {featureType: 'landscape', stylers: [{hue: '#74aa50'}, {saturation: 10}, {lightness: -22}]}
          ]
        }
      }
    }
  end

end
