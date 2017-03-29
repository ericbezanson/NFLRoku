sub init()
		print "sidePanel init()"
		m.top.itemComponentName = "SimpleRowListItem"
		m.top.rowFocusAnimationStyle = "floatingFocus"
		m.top.showRowLabel = true
		m.top.rowLabelColor = "0xa0b033ff"
		m.top.visible = true
		m.top.ObserveField("rowItemFocused", "onRowItemFocused")

		m.readJSONContentTask = CreateObject("roSGNode", "ContentReader")
		m.readJSONContentTask.ObserveField("content", "setPanel")
		m.readJSONContentTask.contenturi= "http://www.sdktestinglab.com/Tutorial/content/xmlcontent.xml"
		m.readJSONContentTask.control = "RUN"
		
		
end sub

sub setPanel() as object
	data = CreateObject("roSGNode", "ContentNode")

    for each conf in m.readJSONContentTask.content.conf
		panel = data.CreateChild("ContentNode")
		for each division in conf.divisions
			for each team in division.teams
				teamData = division.teams[team]
				item = panel.CreateChild("SidePanelData")
				item.posterUrl = teamData.img
				item.teamName = teamData.caption
			end for
		end for
	end for
	m.top.content = data
end sub

sub onRowItemFocused() as void
'to use later
end sub