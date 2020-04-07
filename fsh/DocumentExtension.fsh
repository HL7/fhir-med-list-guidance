/*
  EXTENSION DEFINITIONS 
*/
Extension: AdditionalDocumentInformation
Description: "A set of information to indicate what additional documentation exists."
* extension contains availableFlag 1..1 MS and document 0..* MS
* extension[availableFlag].value[x] only boolean
* extension[document].value[x] only Attachment
* extension[document].valueAttachment.contentType MS
* extension[document].valueAttachment.url 1..1 MS
* extension[document].valueAttachment.title 1..1 MS

