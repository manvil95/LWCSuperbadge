public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        List<Contact> listContact = new List<Contact>();
        try {
            listContact = [SELECT FirstName, 
                                    LastName, 
                                    Email
                            FROM Contact
                            WITH USER_MODE
                            ORDER BY LastName
                            ];
        } catch(Exception e) {
            throw new AuraHandledException('Forced error');
        }

        return listContact;
    }
}