# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).bind 'ready pjax:complete', ->
	$('.logo').hover(
		->
			$('#moon').css(left: '-200px', top: '-175px')
		, ->
			$('#moon').css(left: '-160px', top: '-160px')

	)

	$('.learn-more').live 'click', ->
		$('#learn-more').slideto(
			highlight: false
		)

	$('textarea').autoResize()
