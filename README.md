# Samy Billing - QBCore Fatura Sistemi

Bu script, **QBCore** tabanlı sunucularda oyuncuların birbirine fatura kesebilmesini sağlar.  
Faturalar **gksphone** üzerinden gönderilir ve belirlenen meslekler dışında kimse fatura kesemez.  

## 🔧 Özellikler
- ✅ Yakındaki oyuncuların isim ve ID bilgilerini listeleme  
- ✅ Fatura nedeni ve tutarı girme  
- ✅ Sadece belirlenen mesleklerin fatura kesebilmesi (örnek: polis, ems)  
- ✅ Fatura kesen oyuncuya % komisyon ödemesi  
- ✅ Çoklu dil desteği (Türkçe & İngilizce, config üzerinden ayarlanır)  
- ✅ ox_lib ile modern menü ve bildirim desteği  

---

## 📥 Kurulum
1. Scripti `resources/[qb]/samy_billing` klasörüne ekleyin.  
2. `server.cfg` içine aşağıdaki satırı ekleyin:  


📌 Kullanım

/faturakes komutu ile menüyü açabilirsiniz.

Menüyü açtığınızda yakındaki oyuncular listelenir.

Fatura tutarı ve nedenini girip onayladığınızda, hedef oyuncuya fatura gönderilir.

Fatura kestiğinizde belirlenen komisyon oranında para hesabınıza yatırılır.
<img width="707" height="574" alt="image" src="https://github.com/user-attachments/assets/42650240-5ee5-420c-bd0e-ef47ac4a8270" />
