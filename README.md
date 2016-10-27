##Send Mass Email
We can send emails to the all the Contacts associated with the given Account Name.

Account Name can be partial (e.g: Grand Hotels%)

Email Template Id is the template you want to use for this email


### Screenshot
![](https://github.com/mohan-chinnappan-n/sfdc-mass-email/blob/master/SendEmail.png)



### Sequence Diagram
![Sequence Diagram  ](https://github.com/mohan-chinnappan-n/sfdc-mass-email/blob/master/email-seq-dwg.png)

MW: Middleware

MW will upsert  DL (Account; Account.Name will have DL Name) and Contacts for this Account. These Contacts will have the email of the DL members.

Example:

```
Account.Name = DL134143414

This Account 1 or many Contacts

Each of these Contacts will have email of DL members
```
