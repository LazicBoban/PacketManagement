public with sharing class ShipmentCalloutService {
    
    // @AuraEnabled omogucava  buducoj LWC komponenti da pozove ovu metodu
    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getLiveTrackingDetails(String shipmentId) {
        
        // 1. Inicijalizacija HTTP zahteva
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // besplatan testni API koji vraca lazne podatke o lokaciji paketa
        request.setEndpoint('https://jsonplaceholder.typicode.com'); 
        request.setMethod('GET');
        
        Map<String, Object> resultData = new Map<String, Object>();
        
        try {
            // 2. Slanje zahteva i prijem odgovora
            HttpResponse response = http.send(request);
            
            // Ako je status kod 200 (Success - Uspešno)
            if (response.getStatusCode() == 200) {
                // test API vraća genericke podatke pa cu simulirati 
                //  pravu lokaciju i status za projekat
                resultData.put('status', 'Success');
                resultData.put('currentLocation', 'Logistički Centar - Beograd');
                resultData.put('estimatedArrival', System.now().addDays(2));
            } else {
                resultData.put('status', 'Error');
                resultData.put('message', 'Spoljni sistem je vratio grešku: ' + response.getStatus());
            }
        } catch(Exception e) {
            resultData.put('status', 'Error');
            resultData.put('message', 'Problem sa povezivanjem: ' + e.getMessage());
        }
        
        return resultData;
    }
}
