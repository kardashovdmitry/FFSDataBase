public with sharing class BooksController {

    public String SearchBookKeyword { get; set; }
    public Integer noOfRecords{get; set;}
    public Integer size{get;set;}

    public List<Book__c> Books { get{
        return (List<Book__c>)setCon.getRecords();
    } set; }

    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 10;
                string queryString = 'SELECT Id, Name, ISBN__c, Date_Of_Publication__c, (SELECT Id, Author__c, Author__r.Name FROM Book_Author__r) FROM Book__c WHERE Name LIKE \'%'+(SearchBookKeyword == null ? '' : SearchBookKeyword)+'%\'';
                SYSTEM.DEBUG('queryString - '+queryString);
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }

    public void SearchBooks() {
        setCon = null;
        setCon.setPageNumber(1);
    }

}