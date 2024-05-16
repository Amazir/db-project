# Database for hotel
Projekt z systemów baz danych na labolatoria.
Baza danych dla hotelu, przedstawiająca implementację systemu płatności, rezerwacji pokojów oraz room-service.

<!-- <style>
 p,li {
    font-size: 12pt;
  }
</style>  -->

<!-- <style>
 pre {
    font-size: 8pt;
  }
</style>  -->


---

**Autorzy:**
- Michał Romaszewski
- Robert Kania
- Kamil Rydarowicz
---


# 1.  Zakres i krótki opis systemu

## Zakres i krótki opis systemu
Celem projektu jest stworzenie systemu obsługi hotelowej działającego w oparciu o relacyjną bazę danych. System ten ma za zadanie usprawnić zarządzanie różnymi aspektami funkcjonowania hotelu, takimi jak rezerwacje pokojów, obsługa klientów oraz monitorowanie dostępności zasobów.

## Rezerwacja pokojów
Głównym elementem systemu jest moduł rezerwacji pokojów, który umożliwia zarówno klientom jak i personelowi dokonywanie i zarządzanie rezerwacjami. Klienci będą mieli możliwość przeglądania dostępnych pokoi, sprawdzania ich dostępności w określonym terminie oraz dokonywania rezerwacji online. Personel będzie mógł zarządzać istniejącymi rezerwacjami oraz tworzyć nowe.

## Płatność
Nasz system umożliwiać będzie dokonanie płatności w po staci kilku części np. zaliczki oraz reszty kwoty rezerwacji (w skład której będą wchodzić dodatkowe usługi takie jak barek itd czy też ewentualne szkody). Dodatkowo klient będzie mógł zapłacić w wybrany przez siebie sposób - będzie mieć kilka rodzajów płatności (np karta, gotówka).Dla jego wygody każdą część wpłaty będzie mógł dokonać innym sposobem - zaliczkę kartą, a resztę np w hotelu gotówką.

## Obsługa klientów
Kolejnym ważnym elementem systemu będzie obsługa klientów. Będzie ona obejmować zarówno rejestrację przybywających gości, udzielanie informacji na temat dostępnych usług i udogodnień. Dzięki temu, hotel będzie mógł zapewnić wysoki standard obsługi, co wpłynie na zadowolenie klientów.

## Monitorowanie dostępności zasobów
Ostatnim, ale równie istotnym elementem systemu będzie możliwość monitorowania dostępności zasobów hotelowych, takich jak pokoje czy usługi dodatkowe. Dzięki temu hotel będzie mógł efektywnie zarządzać swoimi zasobami, unikając sytuacji, w której występuje niedobór lub nadmiar danego zasobu.
W rezultacie, stworzenie tego systemu pozwoli hotelowi na efektywne zarządzanie swoimi zasobami.

## Usługi gastronomiczne
Hotel będzie oferował usługi gastronomicznych takie jak room-service, zapewniając wysoką jakość posiłków i napojów, które spełnią oczekiwania nawet najbardziej wymagających gości.

# 2.	Wymagania i funkcje systemu

## Rezerwacja pokojów:
- System umożliwia przeglądanie dostępnych pokoi w określonym terminie.
- Klienci mogą dokonywać rezerwacji online, wybierając preferowane pokoje (rodzaje) i okresy pobytu.
- Personel może dodawać, edytować i anulować rezerwacje, zarządzając dostępnością pokoi.

## Obsługa klientów:
- Rejestracja przybywających gości i przypisywanie im pokoi.
- Udzielanie informacji na temat usług i udogodnień dostępnych w hotelu.

## Monitorowanie dostępności zasobów:
- System monitoruje dostępność pokoi i usług dodatkowych.
- Automatyczne aktualizowanie dostępności na podstawie dokonanych rezerwacji i zmian w stanie zasobów.

## Usługi gastronomiczne
- Usługa room service: Hotel będzie świadczył usługę room service, umożliwiając gościom zamawianie posiłków i napojów bezpośrednio do swojego pokoju.

## System płatności
- System umożliwia kilka rodzajów płatności
- Klienci będą mogli opłacić należną kwotę w kilku częściach (choćby zaliczka i reszta kwoty)
- Każda płatność może być wykonana innym sposobem płatności

# 3.	Projekt bazy danych

## Schemat bazy danych

<img src="https://github.com/PoteznySquad/db-project/blob/main/schema.png">

## Opis poszczególnych tabel

customers:
- Opis: tabela zawierające dane klientów.

| Nazwa atrybutu | Typ          | Opis/Uwagi            |
|----------------|--------------|-----------------------|
| customerid     | int          | primary key           |
| firstname      | varchar(255) | imię klienta          |
| lastname       | varchar(255) | nazwisko klienta      |
| address        | varchar(255) | adres klienta         |
| phone          | varchar(255) | telefon klienta       |
| city           | varchar(255) | miasto klienta        |
| country        | varchar(255) | kraj klienta          |
| post_code      | varchar(255) | kod pocztowy klienta  |
| region         | varchar(255) | region klienta        |
| birthdate      | date         | data urodzin klienta  |
| pesel          | int          | pesel klienta         |
| photopath      | varchar(255) | zdjęcie klienta       |
| notes          | text         | notatka o kliencie    |
| fax            | varchar(255) | fax klienta           |

orders:
- Opis: tabela zawierająca zamówienia

| Nazwa atrybutu   | Typ            | Opis/Uwagi             |
|------------------|----------------|------------------------|
| orderid          | int            | primary key            |
| orderdate        | date           | data zamówienia        |
| status           | varchar(255)   | status zamówienia      |
| tip              | decimal(10,2)  | napiwek                |
| discount         | decimal(10,2)  | zniżka                 |
| reservationid    | int            | fk dla reservations    |

payment_methods:
- Opis: tabela zawierająca metody płatności

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| payment_methodid | int          | primary key            |
| name             | varchar(255) | nazwa płatności        |

payments:
- Opis: tabela zawierająca płatność

| Nazwa atrybutu   | Typ      | Opis/Uwagi             |
|------------------|----------|------------------------|
| paymentid        | int      | primary key            |
| advance          | bit      | zaliczka               |
| reservationid    | int      | fk dla orders          |
| status           | bit      | zaksięgowana płatność  |
| payment_methodid | int      | fk dla payment_methods |

products:
- Opis: tabela zawierająca produkty

| Nazwa atrybutu   | Typ           | Opis/Uwagi                  |
|------------------|---------------|-----------------------------|
| productid        | int           | primary key                 |
| supplierid       | int           | fk dla supplierid           |
| unitprice        | decimal(10,2) | cena produktu               |
| unitsinstock     | int           | ilość produktów             |
| unitsinorder     | int           | ilość zamówionych produktów |
| prouctname       | int           | nazwa produktu              |
| orderid          | int           | fk dla orderid              |

reservated_rooms
- Opis: tabela łącznikowa między rezerwacjami i pokojami

| Nazwa atrybutu     | Typ           | Opis/Uwagi             |
|--------------------|---------------|------------------------|
| reservated_roomid  | int           | primary key            |
| roomid             | int           | fk dla roomid          |
| reservationid      | int           | fk dla reservationid   |
| price              | decimal(10,2) | cena rezerwacji        |

reservations:
- Opis: tabela zawierająca rezerwacje.

| Nazwa atrybutu | Typ            | Opis/Uwagi        |
|----------------|----------------|-------------------|
| reservationid  | int            | primary key       |
| customerid     | int            | fk dla customers  |
| start_date     | date           | data zameldowania |
| end_date       | date           | data wymeldowania |
| note           | varchar(255)   | uwagi             |
| additional     | decimal(10,2)  | cena za uwagi     |

room_type
- Opis: tabela zawierająca typy pokojów

| Nazwa atrybutu   | Typ           | Opis/Uwagi             |
|------------------|---------------|------------------------|
| room_typid       | int           | primary key            |
| beds             | int           | ilość łóżek w pokoju   |
| persons          | int           | ilość osób na pokój    |
| description      | varchar(255)  | opis pokoju            |
| price            | decimal(10,2) | cena pokoju            |

rooms:
- Opis: tabela zawierająca pokoje

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| roomid           | int          | primary key            |
| room_typeid      | int          | fk dla roomtypeid      |
| number           | varchar(255) | numer pokoju           |

suppliers:
- Opis: tabela zawierająca dostawców

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| supplierid       | int          | primary key            |
| companyname      | varchar(255) | nazwa firmy            |

# 4.	Implementacja

## Kod poleceń DDL

```sql
CREATE TABLE customers (
    customerid int  NOT NULL,
    firstname varchar(255)  NOT NULL,
    lastname varchar(255)  NOT NULL,
    address varchar(255)  NOT NULL,
    phone varchar(255)  NOT NULL,
    city varchar(255)  NOT NULL,
    country varchar(255)  NOT NULL,
    post_code varchar(255)  NOT NULL,
    region varchar(255),
    birthdate date  NOT NULL,
    pesel int  NOT NULL,
    photopath varchar(255),
    notes text,
    fax varchar(255),
    CONSTRAINT customers_pk PRIMARY KEY  (customerid)
)
```

```sql
CREATE TABLE orders (
    orderid int  NOT NULL,
    orderdate date  NOT NULL,
    status bit  NOT NULL,
    tip decimal(10,2)  NOT NULL,
    discount decimal(10,2)  NOT NULL,
    reservationid int  NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY  (orderid)
)
```

```sql
CREATE TABLE payment_methods (
    payment_methodid int  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT payment_methodid PRIMARY KEY  (payment_methodid)
)
```

```sql
CREATE TABLE payments (
    paymentid int  NOT NULL,
    advance bit  NOT NULL,
    reservationid int  NOT NULL,
    status bit  NOT NULL,
    payment_methodid int  NOT NULL,
    CONSTRAINT payments_pk PRIMARY KEY  (paymentid)
)
```

```sql
CREATE TABLE products (
    productid int  NOT NULL,
    supplierid int  NOT NULL,
    unitprice decimal(10,2)  NOT NULL,
    unitsinstock int  NOT NULL,
    unitsinorder int  NOT NULL,
    productname int  NOT NULL,
    orderid int  NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY  (productid)
)
```

```sql
CREATE TABLE reservated_rooms (
    reservated_roomid int  NOT NULL,
    roomid int  NOT NULL,
    reservationid int  NOT NULL,
    price decimal(10,2)  NOT NULL,
    CONSTRAINT reservated_rooms_pk PRIMARY KEY  (reservated_roomid)
)
```

```sql
CREATE TABLE reservations (
    reservationid int  NOT NULL,
    customerid int  NOT NULL,
    start_date date  NOT NULL,
    end_date date  NOT NULL,
    note varchar(255),
    additional decimal(10,2)  NOT NULL,
    CONSTRAINT reservations_pk PRIMARY KEY  (reservationid)
)
```

```sql
CREATE TABLE room_type (
    room_typeid int  NOT NULL,
    beds int  NOT NULL,
    persons int  NOT NULL,
    description varchar(255),
    price decimal(10,2)  NOT NULL,
    CONSTRAINT room_type_pk PRIMARY KEY  (room_typeid)
)
```

```sql
CREATE TABLE rooms (
    roomid int  NOT NULL,
    roomtype_id int  NOT NULL,
    number varchar(255)  NOT NULL,
    CONSTRAINT rooms_pk PRIMARY KEY  (roomid)
)
```

```sql
CREATE TABLE suppliers (
    supplierid int  NOT NULL,
    companyname varchar(255)  NOT NULL,
    CONSTRAINT suppliers_pk PRIMARY KEY  (supplierid)
)
```

```sql
ALTER TABLE orders ADD CONSTRAINT orders_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);
```

```sql
ALTER TABLE payments ADD CONSTRAINT payments_payment_methods
    FOREIGN KEY (payment_methodid)
    REFERENCES payment_methods (payment_methodid);
```

```sql
ALTER TABLE payments ADD CONSTRAINT payments_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);
```

```sql
ALTER TABLE products ADD CONSTRAINT products_orders
    FOREIGN KEY (orderid)
    REFERENCES orders (orderid);
```

```sql
ALTER TABLE products ADD CONSTRAINT products_suppliers
    FOREIGN KEY (supplierid)
    REFERENCES suppliers (supplierid);
```

```sql
ALTER TABLE reservated_rooms ADD CONSTRAINT reservated_rooms_reservations
    FOREIGN KEY (reservationid)
    REFERENCES reservations (reservationid);
```

```sql
ALTER TABLE reservated_rooms ADD CONSTRAINT reservated_rooms_rooms
    FOREIGN KEY (roomid)
    REFERENCES rooms (roomid);
```

```sql
ALTER TABLE reservations ADD CONSTRAINT reservations_customers
    FOREIGN KEY (customerid)
    REFERENCES customers (customerid);
```

```sql
ALTER TABLE rooms ADD CONSTRAINT rooms_room_type
    FOREIGN KEY (roomtype_id)
    REFERENCES room_type (room_typeid);
```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)


