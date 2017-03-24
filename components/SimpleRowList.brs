sub init()
		print "in SimpleRowListPanel init()"
		m.top.itemComponentName = "SimpleRowListItem"
		m.top.numRows = 2
		m.top.itemSize = [196 * 4 + 20 * 3, 213]
		m.top.rowHeights = [213]
		m.top.rowItemSize = [ [196, 213], [196, 213], [196, 213] ] 
		m.top.itemSpacing = [ 0, 100 ]
		m.top.rowItemSpacing = [ [20, 0] ]
		m.top.rowLabelOffset = [ [0, 30] ]
		m.top.rowFocusAnimationStyle = "floatingFocus"
		m.top.showRowLabel = [true, true]
		m.top.rowLabelColor = "0xa0b033ff"
		m.top.visible = true
		m.top.ObserveField("rowItemFocused", "onRowItemFocused")

		m.readJSONContentTask = CreateObject("roSGNode", "ContentReader")
		m.readJSONContentTask.ObserveField("content", "GetRowListContent")
		m.readJSONContentTask.contenturi= "http://www.sdktestinglab.com/Tutorial/content/xmlcontent.xml"
		m.readJSONContentTask.control = "RUN"
		
		
end sub

sub GetRowListContent() as object
	data = CreateObject("roSGNode", "ContentNode")

	for each conf in m.readJSONContentTask.content.conf
		row = data.CreateChild("ContentNode")
		row.title = conf.name
		for each division in conf.divisions
			header = row.CreateChild("SimpleRowListItemData")
			header.posterUrl = division.img
			header.teamName = "CHAMPION: "
			header.teamRecord = division.champion
			for each team in division.teams
				teamData = division.teams[team]
				item = row.CreateChild("SimpleRowListItemData")
				item.posterUrl = teamData.img
				item.teamName = teamData.name
				item.teamRecord = teamData.record
			end for
		end for
	end for
	m.top.content = data
end sub

sub onRowItemFocused() as void
	row = m.top.rowItemFocused[0]
	col = m.top.rowItemFocused[1]

	print "Row Focused: " + stri(row)
	print "Col Focused: " + stri(col)
end sub