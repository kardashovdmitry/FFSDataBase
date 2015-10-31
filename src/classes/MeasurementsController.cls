public with sharing class MeasurementsController {

    public String SearchMeasurementKeyword { get; set; }
    public Integer noOfRecords{get; set;}
    public Integer size{get;set;}

    public String name {get; set;}
    public Decimal count {get; set;}
    public Decimal binTime {get; set;}
    public String linkToFile {get; set;}
    public Decimal temperature {get; set;}
    public Decimal viscosity {get; set;}
    public Decimal concentration {get; set;} 
    public Date dateOfMeasurement {get; set;}

    public List<Measurement__c> Measurements { get{
        return (List<Measurement__c>)setCon.getRecords();
    } set; }

    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 10;
                string queryString = 'SELECT Id, Name, Count__c, BinTime__c, LinkToFile__c, Viscosity__c, Temperature__c, Concentration__c,DateOfMeasurement__c FROM Measurement__c WHERE Name LIKE \'%'+(SearchMeasurementKeyword == null ? '' : SearchMeasurementKeyword)+'%\'';
                SYSTEM.DEBUG('queryString - ' + queryString);
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }

    public void SearchMeasurements() {
        setCon = null;
        setCon.setPageNumber(1);
    }
    
    public void setNull(){
        name = null;
        count = null; 
        binTime = null;
        linkToFile = null;
        temperature = null;
        viscosity = null;
        concentration = null;
        dateOfMeasurement = null;
    }

    public void addMeasurement() {
        Measurement__c m = new Measurement__c();
        m.Name = name;
        m.Count__c = count; 
        m.BinTime__c = binTime;
        m.LinkToFile__c = linkToFile;
        m.Temperature__c = temperature;
        m.Viscosity__c = viscosity;
        m.Concentration__c = concentration;
        m.DateOfMeasurement__c = dateOfMeasurement;
        insert m;
        setNull();
        
    }

}