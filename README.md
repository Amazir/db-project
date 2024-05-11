# Database for hotel
Project for DB Systems lesson.
It's database for hotel.
There are tables for employees, clients, rooms, reservations, complaints and support tickets, supplies and suppliers with current magazine stock monitoring.

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

## Obsługa klientów
Kolejnym ważnym elementem systemu będzie obsługa klientów. Będzie ona obejmować zarówno rejestrację przybywających gości, udzielanie informacji na temat dostępnych usług i udogodnień. Dzięki temu, hotel będzie mógł zapewnić wysoki standard obsługi, co wpłynie na zadowolenie klientów.

## Monitorowanie dostępności zasobów
Ostatnim, ale równie istotnym elementem systemu będzie możliwość monitorowania dostępności zasobów hotelowych, takich jak pokoje czy usługi dodatkowe. Dzięki temu hotel będzie mógł efektywnie zarządzać swoimi zasobami, unikając sytuacji, w której występuje niedobór lub nadmiar danego zasobu.
W rezultacie, stworzenie tego systemu pozwoli hotelowi na efektywne zarządzanie swoimi zasobami.

## Usługi gastronomiczne
Hotel będzie oferował szeroki zakres usług gastronomicznych, zapewniając wysoką jakość posiłków i napojów, które spełnią oczekiwania nawet najbardziej wymagających gości.

# 2.	Wymagania i funkcje systemu


## Rezerwacja pokojów:
- System umożliwia przeglądanie dostępnych pokoi w określonym terminie.
- Klienci mogą dokonywać rezerwacji online, wybierając preferowane pokoje i okresy pobytu.
- Personel może dodawać, edytować i anulować rezerwacje, zarządzając dostępnością pokoi.

## Obsługa klientów:
- Rejestracja przybywających gości i przypisywanie im pokoi.
- Udzielanie informacji na temat usług i udogodnień dostępnych w hotelu.

## Monitorowanie dostępności zasobów:
- System monitoruje dostępność pokoi, sal konferencyjnych i usług dodatkowych.
- Automatyczne aktualizowanie dostępności na podstawie dokonanych rezerwacji i zmian w stanie zasobów.

## Usługi gastronomiczne
- Usługa room service: Hotel będzie świadczył usługę room service, umożliwiając gościom zamawianie posiłków i napojów bezpośrednio do swojego pokoju.

# 3.	Projekt bazy danych

## Schemat bazy danych

(diagram (rysunek) przedstawiający schemat bazy danych)
[<img src="https://github.com/PoteznySquad/db-project/blob/main/schema.png">]

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

payments:
- Opis: tabela zawierająca płatność

| Nazwa atrybutu   | Typ      | Opis/Uwagi             |
|------------------|----------|------------------------|
| paymentid        | int      | primary key            |
| advance          | bit      | zaliczka               |
| reservationid    | int      | fk dla orders          |
| status           | bit      | zaksięgowana płatność  |
| payment_methodid | int      | fk dla payment_methods |

rooms:
- Opis: tabela zawierająca pokoje

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| roomid           | int          | primary key            |
| roomtypeid       | int          | fk dla roomtypeid      |
| number           | vrachar(255) | numer pokoju           |

payment_methods:
- Opis: tabela zawierająca metody płatności

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| payment_methodid | int          | primary key            |
| name             | varchar(255) | nazwa płatności        |

orders:
- Opis: tabela zawierająca zamówienia

| Nazwa atrybutu   | Typ      | Opis/Uwagi             |
|------------------|----------|------------------------|
| orderid          | int      | primary key            |
| orderdate        | date     | data zamówienia        |
| status           | varchar  | status zamówienia      |
| tip              | decimal  | napiwek                |
| discount         | decimal  | zniżka                 |
| reservationid    | int      | fk dla reservations    |


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

suppliers:
- Opis: tabela zawierająca dostawców

| Nazwa atrybutu   | Typ          | Opis/Uwagi             |
|------------------|--------------|------------------------|
| supplierid       | int          | primary key            |
| companyname      | varchar(255) | nazwa firmy            |

room_type
- Opis: tabela zawierająca typy pokojów

| Nazwa atrybutu   | Typ           | Opis/Uwagi             |
|------------------|---------------|------------------------|
| room_typid       | int           | primary key            |
| beds             | int           | ilość łóżek w pokoju   |
| persons          | int           | ilość osób na pokój    |
| description      | varchar(255)  | opis pokoju            |
| price            | decimal(10,2) | cena pokoju            |

reservated_rooms
- Opis: tabela łącznikowa między rezerwacjami i pokojami

| Nazwa atrybutu     | Typ           | Opis/Uwagi             |
|--------------------|---------------|------------------------|
| reservated_roomid  | int           | primary key            |
| roomid             | int           | fk dla roomid          |
| reservationid      | int           | fk dla reservationid   |
| price              | decimal(10,2) | cena rezerwacji        |


# 4.	Implementacja

## Kod poleceń DDL

(dla każdej tabeli należy wkleić kod DDL polecenia tworzącego tabelę)

```sql
create table customers (
   customerid int,
   firstname varchar(255),
   lastname varchar(255),
   address varchar(255),
   phone varchar(255),
   city varchar(255),
   country varchar(255),
   post_code varchar(255),
   region varchar(255),
   birthdate date,
   pesel int,
   photopath varchar(255),
   notes text,
   fax varchar(255)
)
```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)


