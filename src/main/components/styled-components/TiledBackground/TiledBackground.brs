sub init()
end sub

sub onImageSet(event as object)
    m.firstPoster = createObject("roSGNode", "Poster")
    m.firstPoster.uri = m.top.imgUri
    m.top.appendChild(m.firstPoster)
    m.firstPoster.observeField("bitmapWidth", "onImageLoad")
    m.firstPoster.observeField("bitmapHeight", "onImageLoad")
end sub

sub onImageLoad(event as object)
    'do nothing if all appropriate fields are not initialized yet
    if areFieldsInitialized() = false then return
    m.imgHeight = m.firstPoster.bitmapHeight
    m.imgWidth = m.firstPoster.bitmapWidth
    m.rectWidth = m.top.width
    m.rectHeight = m.top.height

    for x = 0 to m.rectWidth step m.imgWidth
        for y = 0 to m.rectHeight step m.imgHeight
            bgPoster = createObject("roSGNode", "Poster")
            bgPoster.uri = m.top.imgUri
            bgPoster.translation = [x,y]
            m.top.appendChild(bgPoster)
        end for
    end for
    m.top.removeChild(m.firstPoster)
end sub

function areFieldsInitialized() as boolean
    return m.firstPoster.bitmapWidth > 0 and m.firstPoster.bitmapHeight > 0
end function