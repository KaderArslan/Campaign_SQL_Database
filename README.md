# KaderArslan_Homework_1
# CRM Yönetim Sistemi UML Diagram'ın MSSQL de Veritabanını Oluşturma

### Senaryo
---
* CRM Yönetim Sistemi UML Diyagramı, bir CRM Yönetim Sistemi sınıflarının yapısını, bunların niteliklerini, işlemlerini (veya yöntemlerini) ve nesneler arasındaki ilişkileri açıklar. 

* CRM Yönetim Sisteminin ana sınıfları; Campaign (Kampanya), CampaignMember (Kampanya Üyesi), Lead (Öncülük), Case (Kampanya Durumu), Contact (İletişim), Account (Hesap), AccountContactRole (Hesap İletişim Rolü), Opportunity (Fırsat), OpportunityContactRole (Fırsat İletişim Rolü), Contract (Sözleşme).

### Amaç
---
1. [Örnekte](https://www.google.com/imgres?imgurl=https%3A%2F%2Fsoft-builder.com%2Fwp-content%2Fuploads%2F2020%2F06%2FCRM-er-diagram.jpg&imgrefurl=https%3A%2F%2Fsoft-builder.com%2Fcrm-database-model-example%2F&tbnid=ypU4LSo4GUPAwM&vet=12ahUKEwjI0tG3q5j3AhVn7rsIHQ6UCLgQMygBegUIARCzAQ..i&docid=nGG6yVxJASl6yM&w=1100&h=530&q=crm%20database%20uml%20diagram&hl=tr&ved=2ahUKEwjI0tG3q5j3AhVn7rsIHQ6UCLgQMygBegUIARCzAQ "Satış ve Envanter Yönetim Sistemi Sınıf Diyagramı") verilen **CRM Veritabanı UML Diagramına** göre MSSQL'de veri tabanını oluşturarak ilişkilerin oluşturulması amaçlanmaktadır.

1. Class Diyagram ve UML diyagram okuma alışkanlığı kazanmak, veri tabanı ilişkilerini kurabilmek.(Birincil anahtar, ikincil anahtar, auto increment vb...)

### CRM Yönetim Sistemi Veritabanı Şeması:
---
* Campaign Table : Kampanyanın tüm işlemlerini yönetir,
* Campaign Member Table : Kampanya Üyesi'nin tüm operasyonlarını yönetir,
* Lead Table : Öncülük tablosunun tüm işlemlerini yönetir,
* Case Table : Kampanya Durumu'nun tüm operasyonlarını yönetir,
* Contact Table : İletişim'in tüm operasyonlarını yönetir,
* Account Table : Hesap'ın tüm operasyonlarını yönetir,
* Account Contact Role Table : Hesap İletişim Rolü'nün tüm operasyonlarını yönetir,
* Opportunity Table : Fırsat'ın tüm operasyonlarını yönetir,
* Opportunity Contact Role Table : Fırsat İletişim Rolü'nün tüm operasyonlarını yönetir,
* Contract Table : Sözleşme'nin tüm operasyonlarını yönetir.

### CRM Yönetim Sistemi UML Diyagramının sınıfları ve nitelikleri:
---
* Campaign Attributes : Campaign_ID, Campaign_name, Campaign_objectives, Campaign_sponsor, Campaign_start_date, Campaign_end_date, Campaign_details.
* CampaignMember Attributes : CampaignMember_ID, Campaign_ID, Lead_ID, Contact_ID.
* Lead Attributes : Lead_ID, Lead_firestname, Lead_surname, Lead_other_details.
* Case Attributes : Case_ID, Contact_ID.
* Contact Attributes : Contact_ID, Account_ID, Contact_address, Contact_contact_details.
* Account Attributes : Account_ID, Account_name, Account_description, Account_phone, Biling_address.
* AccountContactRole Attributes : AccountContactRole_ID, Contact_ID, Account_ID.
* Opportunity Attributes : Opportunity_ID, Account_ID, Opportunity_description, Opportunity_details, Opportunity_stage.
* OpportunityContactRole Attributes : OpportunityContactRole_ID, Contact_ID, Opportunity_ID, Date_time, Other_details.
* Contract Attributes : Contract_ID, Account_ID, Contract_status, Contract_approval.

### CRM Yönetim Sistemi UML Diyagramı :
---
#### UML Diagram:
---
![UML Diagramı](https://github.com/GelecekVarlik-FullStack-Bootcamp/odev-1-KaderArslan/blob/main/UML_Diagram/Campaign_UML_Diagram.jpg)

### MSSQL'de Oluşturulan Database Diagramı:
---
![Database Diagramı](https://github.com/GelecekVarlik-FullStack-Bootcamp/odev-1-KaderArslan/blob/main/UML_Diagram/Campaign_Database_Diagram.png)
