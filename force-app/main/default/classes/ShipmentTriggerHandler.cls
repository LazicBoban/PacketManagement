public with sharing class ShipmentTriggerHandler {
    
    // Metoda koja se poziva iz "before insert" konteksta
    public static void handleBeforeInsert(List<Shipment__c> newShipments) {
        // Uzimam ID trenutno ulogovanog korisnika koji kreira paket
        Id currentUserId = UserInfo.getUserId();
        
        // Prolazim kroz Trigger.new listu paketa pomocu for petlje
        for (Shipment__c ship : newShipments) {
            // Ako korisnik nije rucno izabrao vozaca, automatski dodeljujem njega
            if (ship.Driver__c == null) {
                ship.Driver__c = currentUserId;
            }
        }
    }
}
