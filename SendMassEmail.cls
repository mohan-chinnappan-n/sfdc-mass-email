public with sharing class SendMassEmail {
    public String accountName {get;set;}
    public String templateId {get;set;}

    public void sendEmail() {

        System.assertNotEquals(null, accountName);
        System.assertNotEquals(null, templateId);

        // assemble the contactIds to send the email to: LIMIT: 250 IDs per email.
        // Do not specify the IDs of records that have the Email Opt Out option selected.
        List<Contact> contacts =  [SELECT Id FROM Contact WHERE Contact.AccountId IN
                                    (SELECT Id FROM Account WHERE Name  LIKE :accountName)
                                  ];

        System.assertNotEquals(0, contacts.size());

        Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
        mail.setDescription('Mail Description here');

        List<Id> contactIds = new List<Id>();
        for (Contact c: contacts){
            contactIds.add(c.Id);
        }
        System.assertNotEquals(0, contactIds.size());
        mail.setTargetObjectIds(contactIds);

        // set the email template
        mail.setTemplateID(templateId);
        // send it
        List<Messaging.SendEmailResult> results =
                Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});
        Messaging.sendEmail(new Messaging.MassEmailMessage[] {mail});

        System.assertEquals(1, results.size());
        System.assertEquals(true, results[0].success);

        
    }
}
