# CardRotator

### Description
A card rotary which moves on the y axis.
To utilize this tool,
 - Include a CardRotator component in your xml.
 - In brightscript, asign focus as outlined under 'Initial Setup & Focus Control' in the CardRotatorExample.brs file.
 - In the same brightscript file, dynamically genearte a ContentNode containing relevent content, which may include title, SDPosterUrl, textColor, rectColor and textCords.
    - | Field | Type | Default | Options | Required | Access Permission | Description |
      | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
      | id | string | none | any string | true | READ_WRITE | The id of the component. |
 - In the same brightscript file, create and assign dimensions to the three spots on the screen you want rectangles to display in a TargetSet object on the targetRects property.
 - Assign the TargetSet and ContentNode onto the CardRotator.

### Usage
| Field | Type | Default | Options | Required | Access Permission | Description |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| id | string | none | any string | true | READ_WRITE | The id of the component. |