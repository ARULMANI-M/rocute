sub init()
    ' Initial Setup & Focus Control
    m.CardRotatorExample = m.top.findNode("CardRotatorExample")
    m.CardRotatorExample.setFocus(true)
    m.top.observeField("focusedChild", "handleFocus")
    ' Content Generation
    contentRoot = createObject("roSGNode", "ContentNode")
    child1 = contentRoot.createChild("ContentNode")
    child1.title = "Item 1"
    child2 = contentRoot.createChild("ContentNode")
    child2.title = "Item 2"
    child3 = contentRoot.createChild("ContentNode")
    child3.title = "Item 3"
    child4 = contentRoot.createChild("ContentNode")
    child4.title = "Item 4"
    child5 = contentRoot.createChild("ContentNode")
    child5.title = "Item 5"
    ' TargetSet Size Setup
    focusedTargetSet = createObject("roSGNode", "TargetSet")
    focusedTargetSet.targetRects = [
        { x: 0, y: 0, width: 200, height: 100 },
        { x: 200, y: 200, width: 200, height: 100 },
        { x: 0, y: 400, width: 200, height: 100 },
    ]
    ' Assign Content and TargetSet
    m.CardRotatorExample.listContents = contentRoot
    m.CardRotatorExample.targetSet = focusedTargetSet
    m.top.CardRotatorExample = m.CardRotatorExample
end sub

sub handleFocus(event as object)
    ' Focus Control
    if m.top.isInFocusChain() then
        m.CardRotatorExample.setFocus(true)
    end if
end sub