#= require jquery
#= require jquery_ujs
#= require jquery.ui.draggable
#= require jquery.ui.droppable
#= require jquery.ui.sortable
#= require foundation

updateAllVideos = (el) ->
  $.post '/admin/videos/sort', "_method=put&#{el.sortable('serialize')}"

jQuery ->

  $('#video_vimeoid').change ->
    id = $(this).val().match(/(\d{3,10})/)[0]
    $(this).val id
    url = "http://vimeo.com/api/v2/video/#{$(this).val()}.json?callback=?"
    $('#vimeo-holder').html "<iframe src='http://player.vimeo.com/video/#{id}' width='400' height='300' frameborder='0'></iframe>"
    unless $('#video_name').val()
      $.getJSON url, (data) ->
        if data[0]
          $('#video_name').val( data[0].title )
          $('#video_description').val( data[0].description.replace(/(<([^>]+)>)/ig,"") )
  .trigger 'change'

  $('ul.all-videos').disableSelection().sortable
    items:'li.video'
    placeholder: 'placeholder'
    axis: 'y'
    containment: 'parent'
    update: -> updateAllVideos $(this)

  $('ul.videos').disableSelection().sortable
    items:'li.video'
    connectWith: 'ul.videos'
    placeholder: 'placeholder'
    update: (event, element) ->
      all = $(this).closest('.category').find('ul.all-videos').first()
      if all.find( $("li[data-id='#{element.item.data('id')}']") ).length == 0
        all.append( $("ul.all-videos li[data-id='#{element.item.data('id')}']").first() )
        updateAllVideos all
      # element.item.closest('ul.all-videos').append $("ul.all-videos li[data-id='#{element.item.data('id')}']")
      # # window.updateInitialPosition()
      tag = $(this).data('tag') || 0
      $.post '/admin/videos/sort', "_method=put&#{$(this).sortable('serialize')}&tag_id=#{tag}"

  $('tr.tags').disableSelection().sortable
    items:'td.tag'
    axis: 'x'
    containment: 'parent'
    placeholder: 'placeholder'
    update: ->
      # window.updateInitialPosition()
      $.post '/admin/tags/sort', "_method=put&#{$(this).sortable('serialize')}"

  $('#clients').disableSelection().sortable
    items:'li.client'
    axis: 'y'
    placeholder: 'placeholder'
    update: ->
      # window.updateInitialPosition()
      $.post '/admin/clients/sort', "_method=put&#{$('#clients').sortable('serialize')}"


  $(document).foundation()
