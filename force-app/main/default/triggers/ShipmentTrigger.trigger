trigger ShipmentTrigger on Shipment__c (before insert) {
    // Kada se desi before insert, pozivam handler klasu i saljem joj Trigger.new
    if (Trigger.isBefore && Trigger.isInsert) {
        ShipmentTriggerHandler.handleBeforeInsert(Trigger.new);
    }
}
