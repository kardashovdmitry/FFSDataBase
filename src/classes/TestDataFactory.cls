@isTest
public class TestDataFactory {
    public static Invoice__c createOneInvoiceStatement(Boolean withLineItem){
        Invoice__c testInvoice = createInvoice();
        if(withLineItem == true){
            Merchandise__c m = createMerchandiseItem('Nexus 4');
            AddLineItem(testInvoice, m);
        }
        return testInvoice;
    }
    
    private static Merchandise__c createMerchandiseItem(String merchName){
		Merchandise__c m = new Merchandise__c(
				Name=merchName,
				Price__c=2,
				Quantity__c=1000);
		insert m;
		return m;
	}
	
    private static Invoice__c createInvoice(){
		Invoice__c inv = new Invoice__c(
			Status__c='Open');
		insert inv;
		return inv;
	}
    
	private static Line_Item__c AddLineItem(Invoice__c inv, Merchandise__c m){
		Line_Item__c lineItem = new Line_Item__c(
					Invoice__c = inv.Id,	
					Merchandise__c = m.Id);
					//Invoice_Total__c = (Double)(10*Math.random()+1));
		insert lineItem;
		return lineItem;
}
}