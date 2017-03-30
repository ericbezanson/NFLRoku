sub init()
		print "sidePanel init()"
		m.top.itemComponentName = "SimpleRowListItem"
		m.top.rowFocusAnimationStyle = "floatingFocus"
		m.top.showRowLabel = true
		m.top.rowLabelColor = "0xa0b033ff"
		m.top.visible = true
		m.poster = m.top.findNode("itemImage")
		m.caption = m.top.findNode("itemText")
end sub

sub itemContentChanged()

	m.poster.uri = m.top.itemcontent.posterUrl
	m.caption.text = m.top.itemcontent.caption
	
end sub