window.onload = ->
  query = window.location.search.substring(1)
  [_, id, view_id, url] = query.match /id=(\d+)&view=(\d+)&url=(.*)/
  id = parseInt id, 10
  view_id = parseInt view_id, 10
  url = unescape(url).substring(30)
  url = url.replace(/^.*[\\\/]/, '')  # extract filename

  document.getElementById('url').innerHTML = url

  document.getElementById('cancel').addEventListener 'click', ->
    chrome.downloads.erase(id: id)
    window.close()

  #document.getElementById('view').addEventListener 'click', ->
    #chrome.downloads.erase(id: id)
    #chrome.downloads.show view_id
    #window.close()

  document.getElementById('resume').addEventListener 'click', ->
    window.close()
