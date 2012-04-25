# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).bind 'ready pjax:complete', ->
  nearBottomOfPage = ->
    $(window).scrollTop() > $(document).height() - $(window).height() - 200
  page = 1
  loading = false
  $(window).scroll ->
    return  if loading
    if nearBottomOfPage()
      loading = true
      page++
      $.ajax
        url: "/dreams?page=" + page
        type: "get"
        dataType: "html"
        success: (dreams) ->
          loading = false
          dreams = $(dreams).find('#dreams-list li')

          if dreams.length > 0
            $(window).sausage "draw"
            $('#dreams-list').append("<div class='page'></div>")
            $(dreams).each (i, dream) ->
              $('.page').last().append(dream)

  $(window).sausage()