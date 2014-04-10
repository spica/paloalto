# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ -> 
  $('.btn_show_detail').click () ->
    qid = $(this).attr('data-qidx')
    aid = $(this).attr('data-aidx')
    url = "/admins/index/question/#{qid}/#{aid}"
    window.open("#{url}", "_blank", "scrollbars=1,resizable=1,height=700,width=1024")
