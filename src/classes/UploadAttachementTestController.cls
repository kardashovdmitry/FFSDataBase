public with sharing class UploadAttachementTestController {

	public Attachment attachment {
		get {
			  if (attachment == null)
				attachment = new Attachment();
			  return attachment;
			}
		set;
	}

	public PageReference upload() {

		attachment.OwnerId = UserInfo.getUserId();
		attachment.ParentId = 'a00d000000AWM1z'; // the record the file is attached to
		attachment.IsPrivate = false;

		try {
			insert attachment;
		} catch (DMLException e) {
			ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
			return null;
		} finally {
			attachment = new Attachment();
		}

		ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
		return null;
	}

}