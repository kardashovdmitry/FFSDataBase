trigger RestrictInvoiceDeletion on Invoice__c (before delete) {
	for(Invoice__c invoice:
				[SELECT Id
				FROM Invoice__c
				WHERE Id IN (SELECT Invoice__c FROM Line_Item__c) AND
				Id IN :Trigger.old]){
		Trigger.oldMap.get(invoice.Id).addError(
            'Cannot delete invoice statement with line items');
}
}