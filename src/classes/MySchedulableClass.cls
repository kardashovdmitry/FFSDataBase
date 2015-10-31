global class MySchedulableClass implements Schedulable {
    global void execute(SchedulableContext ctx){
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                         FROM CronTrigger WHERE Id = :ctx.getTriggerId()];
        System.debug(ct.CronExpression);
        System.debug(ct.TimesTriggered);
        
        Merchandise__c m = new Merchandise__c(
        			Name = 'Scheduled Job Item',
            		Price__c = 12,
            		Quantity__c = 100);
        insert m;
    }
}