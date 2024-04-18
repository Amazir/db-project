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
Celem projektu jest stworzenie systemu obsługi hotelowej działającego w oparciu o relacyjną bazę danych. System ten ma za zadanie usprawnić zarządzanie różnymi aspektami funkcjonowania hotelu, takimi jak rezerwacje pokojów, zarządzanie personelem, obsługa klientów oraz monitorowanie dostępności zasobów.

## Rezerwacja pokojów
Głównym elementem systemu jest moduł rezerwacji pokojów, który umożliwia zarówno klientom jak i personelowi dokonywanie i zarządzanie rezerwacjami. Klienci będą mieli możliwość przeglądania dostępnych pokoi, sprawdzania ich dostępności w określonym terminie oraz dokonywania rezerwacji online. Personel będzie mógł zarządzać istniejącymi rezerwacjami, tworzyć nowe oraz monitorować obłożenie hotelu w różnych okresach czasowych.

## Obsługa klientów
Kolejnym ważnym elementem systemu będzie obsługa klientów. Będzie ona obejmować zarówno rejestrację przybywających gości, udzielanie informacji na temat dostępnych usług i udogodnień, jak również obsługę zgłoszeń i reklamacji. Dzięki temu, hotel będzie mógł zapewnić wysoki standard obsługi, co wpłynie na zadowolenie klientów i ich lojalność.

## Monitorowanie dostępności zasobów
Ostatnim, ale równie istotnym elementem systemu będzie możliwość monitorowania dostępności zasobów hotelowych, takich jak pokoje, sale konferencyjne czy usługi dodatkowe. Dzięki temu hotel będzie mógł efektywnie zarządzać swoimi zasobami, unikając sytuacji, w której występuje niedobór lub nadmiar danego zasobu.
W rezultacie, stworzenie tego systemu pozwoli hotelowi na efektywne zarządzanie swoimi zasobami. Dodatkowo, umożliwi on gromadzenie i analizę danych, co pozwoli na podejmowanie lepszych decyzji zaopatrzeniowych w przyszłości.

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
- Obsługa zgłoszeń, reklamacji i pytań gości.

## Monitorowanie dostępności zasobów:
- System monitoruje dostępność pokoi, sal konferencyjnych i usług dodatkowych.
- Automatyczne aktualizowanie dostępności na podstawie dokonanych rezerwacji i zmian w stanie zasobów.

## Usługi gastronomiczne
- Restauracje: Hotel będzie dysponować różnymi restauracjami, które serwują potrawy kuchni lokalnej i międzynarodowej. Goście będą mieli możliwość wyboru spośród restauracji o różnych charakterach i atmosferze, aby dostosować swoje doświadczenie gastronomiczne do swoich preferencji.
- Bufety: Hotel może organizować bufety tematyczne lub bufety śniadaniowe, które zapewnią gościom szeroki wybór potraw i napojów na różne porze dnia.
- Bar i kawiarnia: Dla osób poszukujących relaksu i chwili wytchnienia, hotel może oferować bar oraz kawiarnię, gdzie goście mogą delektować się różnorodnymi napojami, przekąskami i deserami.
- Usługa room service: Hotel będzie świadczył usługę room service, umożliwiając gościom zamawianie posiłków i napojów bezpośrednio do swojego pokoju, aby mogli cieszyć się wygodą i prywatnością podczas spożywania posiłków.
- Katering i bankiety: Hotel może organizować katering dla różnych wydarzeń, takich jak spotkania biznesowe, konferencje czy uroczyste bankiety, zapewniając wysokiej jakości jedzenie i profesjonalną obsługę.

# 3.	Projekt bazy danych

## Schemat bazy danych

(diagram (rysunek) przedstawiający schemat bazy danych) 

## Opis poszczególnych tabel

customers: 
- Opis: tabela zawierające dane klientów.

| Nazwa atrybutu | Typ     | Opis/Uwagi       |
|----------------|---------|------------------|
| customerid     | int     | primary key      |
| firstname      | varchar | imię klienta     |
| lastname       | varchar | nazwisko klienta |
| address        | varchar | adres klienta    |

reservations: 
- Opis: tabela zawierające rezerwacje.

| Nazwa atrybutu | Typ  | Opis/Uwagi        |
|----------------|------|-------------------|
| reservationid  | int  | primary key       |
| roomid         | int  | fk dla rooms      |
| customerid     | int  | fk dla customers  |
| start_date     | date | data zameldowania |
| end_date       | date | data wymeldowania |
| paymentid      | int  | fk dla payments   |

# 4.	Implementacja

## Kod poleceń DDL

(dla każdej tabeli należy wkleić kod DDL polecenia tworzącego tabelę)

```sql
create table tab1 (
   a int,
   b varchar(10)
)
```

## Widoki

(dla każdego widoku należy wkleić kod polecenia definiującego widok wraz z komentarzem)

## Procedury/funkcje

(dla każdej procedury/funkcji należy wkleić kod polecenia definiującego procedurę wraz z komentarzem)

## Triggery

(dla każdego triggera należy wkleić kod polecenia definiującego trigger wraz z komentarzem)


