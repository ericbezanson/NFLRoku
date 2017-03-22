sub init()
    m.top.functionName = "getcontent"
end sub

sub getcontent()
    readInternet = createObject("roUrlTransfer")
    readInternet.setUrl(m.top.contenturi)
    m.top.content = parseJSON(readInternet.GetToString())
    print "Content REC"
end sub