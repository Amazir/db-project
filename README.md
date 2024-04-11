# db-project
Project for DB Systems lesson.



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


**Temat:** 
Baza danych dla hotelu

**Autorzy:** 
- Michał Romaszewski
- Robert Kania
- Kamil Rydarowicz
- Michał Karelus
---


# 1.  Zakres i krótki opis systemu

Zakres i krótki opis systemu
Celem projektu jest stworzenie kompleksowego systemu obsługi hotelowej działającego w oparciu o relacyjną bazę danych. System ten ma za zadanie usprawnić zarządzanie różnymi aspektami funkcjonowania hotelu, takimi jak rezerwacje pokojów, zarządzanie personelem, obsługa klientów oraz monitorowanie dostępności zasobów.

Rezerwacja pokojów
Centralnym elementem systemu jest moduł rezerwacji pokojów, który umożliwia zarówno klientom jak i personelowi dokonywanie i zarządzanie rezerwacjami. Klienci będą mieli możliwość przeglądania dostępnych pokoi, sprawdzania ich dostępności w określonym terminie oraz dokonywania rezerwacji online. Personel będzie mógł zarządzać istniejącymi rezerwacjami, tworzyć nowe oraz monitorować obłożenie hotelu w różnych okresach czasowych.

Zarządzanie personelem
System będzie również zawierał moduł do zarządzania personelem hotelowym. Będzie on umożliwiał rejestrowanie danych pracowników, przypisywanie im odpowiednich obowiązków oraz monitorowanie czasu pracy. Ponadto, będzie zawierał funkcje generowania raportów dotyczących wydajności personelu oraz analizy potrzeb kadrowych w różnych okresach roku.

Obsługa klientów
Kolejnym ważnym elementem systemu będzie obsługa klientów. Będzie ona obejmować zarówno rejestrację przybywających gości, udzielanie informacji na temat dostępnych usług i udogodnień, jak również obsługę zgłoszeń i reklamacji. Dzięki temu, hotel będzie mógł zapewnić wysoki standard obsługi, co wpłynie na zadowolenie klientów i ich lojalność.

Monitorowanie dostępności zasobów

Ostatnim, ale równie istotnym elementem systemu będzie możliwość monitorowania dostępności zasobów hotelowych, takich jak pokoje, sale konferencyjne czy usługi dodatkowe. Dzięki temu hotel będzie mógł efektywnie zarządzać swoimi zasobami, unikając sytuacji, w której występuje niedobór lub nadmiar danego zasobu.
W rezultacie, stworzenie tego systemu pozwoli hotelowi na efektywne zarządzanie swoimi zasobami, zwiększenie rentowności działalności oraz poprawę jakości obsługi klienta. Dodatkowo, umożliwi on gromadzenie i analizę danych, co pozwoli na podejmowanie lepiej ugruntowanych decyzji biznesowych w przyszłości.

# 2.	Wymagania i funkcje systemu


## Rezerwacja pokojów:
System umożliwia przeglądanie dostępnych pokoi w określonym terminie.
Klienci mogą dokonywać rezerwacji online, wybierając preferowane pokoje i okresy pobytu.
Personel może dodawać, edytować i anulować rezerwacje, zarządzając dostępnością pokoi.

## Zarządzanie personelem:
System umożliwia rejestrację danych personalnych pracowników.
Personel może przypisywać zadania i harmonogramy pracy pracownikom.
Generowanie raportów dotyczących wydajności pracowników i analiza potrzeb kadrowych.

## Obsługa klientów:
Rejestracja przybywających gości i przypisywanie im pokoi.
Udzielanie informacji na temat usług i udogodnień dostępnych w hotelu.
Obsługa zgłoszeń, reklamacji i pytań gości.

## Monitorowanie dostępności zasobów:
System monitoruje dostępność pokoi, sal konferencyjnych i usług dodatkowych.
Automatyczne aktualizowanie dostępności na podstawie dokonanych rezerwacji i zmian w stanie zasobów.

## Wydajność:
System powinien być responsywny i umożliwiać szybkie przetwarzanie rezerwacji oraz operacji związanych z zarządzaniem personelem i klientami.
Minimalizacja czasu przestoju systemu oraz szybka odpowiedź na zapytania użytkowników.

##Bezpieczeństwo:
Zapewnienie poufności danych klientów i personelu poprzez odpowiednie mechanizmy uwierzytelniania i autoryzacji.
Zabezpieczenie przed atakami typu SQL injection, cross-site scripting itp.

##Skalowalność:
System powinien być łatwo skalowalny, umożliwiając dostosowanie się do zmieniającej się liczby klientów i zasobów hotelu.
Minimalizacja wpływu skalowania na wydajność i dostępność systemu.

## Integracja:
Możliwość integracji z innymi systemami hotelowymi, takimi jak systemy płatności, systemy zarządzania obiektami czy systemy monitoringu.

## Łatwość obsługi:
Interfejs użytkownika powinien być intuicyjny i łatwy w obsłudze zarówno dla personelu, jak i klientów.
Dostępność dokumentacji i wsparcia technicznego dla użytkowników systemu.






# 3.	Projekt bazy danych

## Schemat bazy danych

(diagram (rysunek) przedstawiający schemat bazy danych) 

## Opis poszczególnych tabel

(Dla każdej tabeli opis w formie tabelki)


Nazwa tabeli: (nazwa tabeli)
- Opis: (opis tabeli, komentarz)

| Nazwa atrybutu | Typ  | Opis/Uwagi |
|----------------|------|------------|
| Atrybut 1 …    |      |            |
| Atrybut 2 …    |      |            |


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


