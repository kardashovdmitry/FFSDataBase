@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseManager{
	@HttpGet
	global static Merchandise__c getMerchandiseById(){
		RestRequest req = RestContext.request;
		String merchId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
		Merchandise__c result =[SELECT Name,Price__c,Quantity__c
								FROM Merchandise__c
								WHERE Id = :merchId];
		return result;
	}
	
    @HttpPost
	global static String createMerchandise(String name, Decimal price, Integer quantity){
		Merchandise__c m = new Merchandise__c(Name=name, Price__c=price, Quantity__c = quantity);
		insert m;
		return m.Id;
	}
}