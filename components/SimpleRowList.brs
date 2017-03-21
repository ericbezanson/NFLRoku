function init()
		print "in SimpleRowListPanel init()"
		m.top.itemComponentName = "SimpleRowListItem"
		m.top.numRows = 8
		m.top.itemSize = [196 * 4 + 20 * 3, 213]
		m.top.rowHeights = [213]
		m.top.rowItemSize = [ [196, 213], [196, 213], [196, 213] ] 
		m.top.itemSpacing = [ 0, 80 ]
		m.top.rowItemSpacing = [ [20, 0] ]
		m.top.rowLabelOffset = [ [0, 30] ]
		m.top.rowFocusAnimationStyle = "floatingFocus"
		m.top.showRowLabel = [true, true]
		m.top.rowLabelColor="0xa0b033ff"
		m.top.content = GetRowListContent()
		m.top.visible = true
		m.top.SetFocus(true)
		m.top.ObserveField("rowItemFocused", "onRowItemFocused")
end function

Function LoadJSONFile() as void
		jsonAsString = ReadAsciiFile("pkg:/resources/teams.json")
		nfl = ParseJSON(jsonAsString)
End Function

function GetRowListContent() as object
	'Populate the RowList content here
	data = CreateObject("roSGNode", "ContentNode")

	for numRows = 1 to 8
		row = data.CreateChild("ContentNode")
		row.title = "ROW"
		for i = 0 to 3
			item = row.CreateChild("SimpleRowListItemData")
			item.posterUrl = "http://devtools.web.roku.com/samples/images/Landscape_1.jpg"
			item.labelText = "This is item" + stri(numRows*3 + i)
		end for
	end for
return data
end function

function onRowItemFocused() as void
	row = m.top.rowItemFocused[0]
	col = m.top.rowItemFocused[1]

	print "Row Focused: " + stri(row)
	print "Col Focused: " + stri(col)
end function