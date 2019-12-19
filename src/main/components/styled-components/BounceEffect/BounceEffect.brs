sub init()
end sub

' when the image is passed, which is the one field that is required, everything is kicked off
sub imageUriSet()
    m.ItemMover = m.top.findNode("ItemMover")
    m.BouncingItem = m.top.findNode("BouncingItem")
    m.BouncingItem.uri = m.top.imageUri
    animationSet()
    durationSet()
    repeatSet()
    m.ItemMover.control = "start"
    m.top.setFocus(true)
end sub

' whenever a field is changed on the interface this update function is called
sub animationSet()
    if m.top.bounceType = "ascending"
        ascendingPattern()
    else if m.top.bounceType = "descending"
        descendingPattern()
    else if m.top.bounceType = "steady"
        steadyPattern()
    end if
end sub

' called for ascending bounce animation
sub ascendingPattern()
    ' initial variable declarations
    totalBounces = m.top.totalBounces
    startPoint = m.top.startPoint
    maxHeight = m.top.maxHeight
    keyArray = []
    keyValueArray = []
    startHeight = startPoint[1]
    constWidth = startPoint[0]
    ' set up number modifyers
    increment = (1 / totalBounces) / 2
    current = increment
    decheight = maxHeight / totalBounces
    chopHeight = startHeight - decheight
    'add first value to key/val arrays
    keyArray.push(0)
    keyValueArray.push([constWidth, startHeight])
    ' dynamically populate key/val arrays
    for x = 1 to (2 * totalBounces)
        keyArray.push(current)
        keyValueArray.push([constWidth, chopHeight])
        chopHeight = chopHeight - decheight
        current = current + increment
        keyArray.push(current)
        keyValueArray.push([constWidth, startHeight])
        current = current + increment
        x = x + 1
    end for
    ' set key and keyval arrays
    m.ItemInterp = m.top.findNode("ItemInterp")
    m.ItemInterp.key = keyArray
    m.ItemInterp.keyValue = keyValueArray
end sub

' called for descending bounce animation
sub descendingPattern()
    ' initial variable declarations
    totalBounces = m.top.totalBounces
    startPoint = m.top.startPoint
    maxHeight = m.top.maxHeight
    keyArray = []
    keyValueArray = []
    startHeight = startPoint[1]
    constWidth = startPoint[0]
    ' set up number modifyers
    increment = (1 / totalBounces) / 2
    current = increment
    chopHeight = startHeight - maxHeight
    decheight = maxHeight / totalBounces
    'add first value to key/val arrays
    keyArray.push(0)
    keyValueArray.push([constWidth, startHeight])
    ' dynamically populate key/val arrays
    for x = 1 to (2 * totalBounces)
        keyArray.push(current)
        keyValueArray.push([constWidth, chopHeight])
        chopHeight = chopHeight + decheight
        current = current + increment
        keyArray.push(current)
        keyValueArray.push([constWidth, startHeight])
        current = current + increment
        x = x + 1
    end for
    ' set key and keyval arrays
    m.ItemInterp = m.top.findNode("ItemInterp")
    m.ItemInterp.key = keyArray
    m.ItemInterp.keyValue = keyValueArray
end sub

' called for steady bounce animation
sub steadyPattern()
    ' initial variable declarations
    totalBounces = m.top.totalBounces
    startPoint = m.top.startPoint
    maxHeight = m.top.maxHeight
    keyArray = []
    keyValueArray = []
    startHeight = startPoint[1]
    constWidth = startPoint[0]
    ' set up number modifyers
    increment = (1 / totalBounces) / 2
    current = increment
    'add first value to key/val arrays
    keyArray.push(0)
    keyValueArray.push([constWidth, startHeight])
    ' dynamically populate key/val arrays
    for x = 1 to (2 * totalBounces)
        keyArray.push(current)
        keyValueArray.push([constWidth, startHeight - maxHeight])
        current = current + increment
        keyArray.push(current)
        keyValueArray.push([constWidth, startHeight])
        current = current + increment
        x = x + 1
    end for
    ' set key and keyval arrays
    m.ItemInterp = m.top.findNode("ItemInterp")
    m.ItemInterp.key = keyArray
    m.ItemInterp.keyValue = keyValueArray
end sub

' Calls when duration changes from interface
sub durationSet()
    m.ItemMover = m.top.findNode("ItemMover")
    m.ItemMover.duration = m.top.duration
end sub

' Calls when repeat changes from interface
sub repeatSet()
    m.ItemMover = m.top.findNode("ItemMover")
    m.ItemMover.repeat = m.top.repeat
end sub