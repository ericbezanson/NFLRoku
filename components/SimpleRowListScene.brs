function init()
    m.theRowList = m.top.FindNode("theRowList")
    m.top.setFocus(true)
    videocontent = createObject("RoSGNode", "ContentNode")
    videocontent.title = "Example Video"
    videocontent.streamformat = "mp4"
    videocontent.url = "http://a.video.nfl.com/films/2014/nfl_com/nflcom/reg/07/141019_dc_highlights_car_at_gb_2000k.mp4"

    video = m.top.findNode("homeVideo")
    video.content = videocontent
    video.control = "play"
    
    m.scrollDown = m.top.FindNode("scrollDown")
    m.scrollUp = m.top.findNode("scrollUp")
   

end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
        if key = "down"
            m.scrollDown.control = "start"
            m.theRowList.setFocus(true)
        else if key = "up"
            m.scrollUp.control = "start"
            m.theRowList.setFocus(false)
            m.top.setFocus(true)
        end if
    end if
return false
    end function