sub init()
end sub

' Sets the file path for the image, and divides logic for either setting up
'   an image now or waiting for an image to be ready for setup
sub setPath ()
    m.triangleChopPoster = m.top.findNode("triangleChopPoster")
    m.triangleChopPoster.uri = m.top.imageUri
    if m.triangleChopPoster.bitmapHeight <> 0 then
        onImageLoad()
    else
        m.triangleChopPoster.observeField("bitmapHeight", "onImageLoad")
    end if
end sub

' When an image is loaded, if the m.top.height field is equal to 0, being default with no bounds set,
'   set the mask up in accordance with the images normal height/width
sub onImageLoad ()
    if m.top.height = 0 then
        m.triangleChopMaskGroup = m.top.findNode("triangleChopMaskGroup")
        m.imgWidth = m.triangleChopPoster.bitmapWidth
        m.imgHeight = m.triangleChopPoster.bitmapHeight
        m.triangleChopMaskGroup.masksize = [m.imgWidth, m.imgHeight]
    end if
    m.triangleChopPoster.unobserveField("bitmapHeight")
end sub

' On m.top.height change set the images height in accordance
sub setHeight()
    m.triangleChopMaskGroup = m.top.findNode("triangleChopMaskGroup")
    if (m.top.width <> 0) ' On the observer function when both height and with are set, set the masksize
        m.triangleChopMaskGroup.masksize = [m.top.width, m.top.height]
    end if
    m.triangleChopPoster = m.top.findNode("triangleChopPoster")
    m.triangleChopPoster.height = m.top.height
end sub

' On m.top.width change set the images width in accordance
sub setWidth()
    m.triangleChopMaskGroup = m.top.findNode("triangleChopMaskGroup")
    if (m.top.height <> 0) ' On the observer function when both height and with are set, set the masksize
        m.triangleChopMaskGroup.masksize = [m.top.width, m.top.height]
    end if
    m.triangleChopPoster = m.top.findNode("triangleChopPoster")
    m.triangleChopPoster.width = m.top.width
end sub

' On m.top.rightAnglePosition change the triangle overlay in accordance
sub setPosition()
    position = m.top.rightAnglePosition
    m.triangleChopMaskGroup = m.top.findNode("triangleChopMaskGroup")
    if position = "topRight"
        m.triangleChopMaskGroup.maskuri = "pkg:/images/topRightClip.png"
    else if position = "topLeft"
        m.triangleChopMaskGroup.maskuri = "pkg:/images/topLeftClip.png"
    else if position = "bottomLeft"
        m.triangleChopMaskGroup.maskuri = "pkg:/images/bottomLeftClip.png"
    else position = "bottomRight"
        m.triangleChopMaskGroup.maskuri = "pkg:/images/bottomRightClip.png"
    end if
end sub