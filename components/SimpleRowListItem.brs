function init() as void
  print "Inside init"
  m.itemImage = m.top.findNode("itemImage") 
  m.itemText = m.top.findNode("itemText")
  m.itemText2 = m.top.findNode("itemText2")
  print "Leaving init"
end function

function itemContentChanged() as void
  itemData = m.top.itemContent
  m.itemImage.uri = itemData.posterUrl
  m.itemText.text = itemData.teamName
  m.itemText2.text = itemData.teamRecord
end function
    
