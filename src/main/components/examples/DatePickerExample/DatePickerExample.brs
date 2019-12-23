' Initialization method for the DatePickerExample component.
sub init()
    m.datePicker = m.top.findNode("datePicker")
    m.top.observeField("focusedChild", "giveFocus")
end sub

' Gives the focus to the date picker when the DatePickerExample panel has focus.
' 
' @param event a roSGNodeEvent
sub giveFocus(event as object)
    if m.top.isInFocusChain() and m.datePicker.hasFocus() = false then
        m.datePicker.setFocus(true)
    end if
end sub