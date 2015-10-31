trigger Card_Item on Card_Item__c (before delete, before insert, before update) {

  if (Trigger.isInsert) {
    Set<Id> BookIds = new Set<Id>();
    for (Card_Item__c ci : Trigger.new) {
      BookIds.add(ci.Book__c);
    }
    List<Card_Item__c> AvailableCardItems = [SELECT Id, Book__c FROM Card_Item__c WHERE Book__c in :BookIds AND Status__c in ('In progress', 'Expired', 'Missing')];
    Set<Id> BooksInCardsIds = new Set<Id>();
    for (Card_Item__c ci : AvailableCardItems) {
      BooksInCardsIds.add(ci.Book__c);
    }
    for (Card_Item__c ci : Trigger.new) {
      if (BooksInCardsIds.contains(ci.Book__c)) {
        ci.Book__c.addError('This book is not available');
      }
      ci.Status__c = 'In progress';
    }
  }

}