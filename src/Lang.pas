{
unit Lang

  ES: unidad para facilitar el cambio de idioma en los errores
  EN: unit to facilitate the change of language of the errors

=========================================================================
History:

ver 1.3.2
  ES:
    mejora: se mejora la traducción al francés (gracias Fred)
  EN:
    improvement: best translation for French language (thanks Fred)

ver 1.3.1
  ES:
    error: la traducción al ruso estaba mal codificada (GC: issue 35)
  EN:
    bug: Russian translation is not read, incorrect encoding of the language resources file. (GC: issue 35)

ver 1.2.0
  ES:
    nuevo: añadido el idioma Húngaro (gracias Bógáncs Sándor)
    nuevo: añadido el idioma italiano (gracias Vincenzo Scarpellino)
  EN:
    new: added Hungarian language (thanks Bógáncs Sándor)
    new: added Italian language (thanks Vincenzo Scarpellino)

ver 1.0.0
  ES:
    nuevo: (issue GC4) añadido el idioma alemán (gracias Sascha)
    error: corregido error en función GetTranslateText
    nuevo: añadido el idioma ruso (gracias Teltikov Aleksandr)
  EN:
    new: (issue GC4) added German language (thanks Sascha)
    bug: bug fixed in function GetTranslateText
    new: added russian language (thanks Teltikov Aleksandr)

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: añadido el idioma danés (gracias Hugo Pedersen)
  EN:
    new: documentation
    new: added danish language (thanks Hugo Pedersen)

ver 0.1.7
  ES:
    nuevo: añadido el idioma portugués (gracias Moacir Fortes)
  EN:
    new: added portuguese language (thanks Moacir Fortes)

ver 0.1.6
  ES:
    nuevo: añadido el idioma francés (gracias Stéphane)
  EN:
    new: added french language (thanks Stéphane)

ver 0.1:
  ES: primera versión
  EN: first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  Lang unit contains strings messages error displayed by the components and a function to do the translation.
  To add a new language you must be to do these steps:
  - create a new constant array with all translations
  - add the new language to set GMConstants.TLang
  - change the GetTranslateText function by adding new language

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit Lang contiene las cadenas de los mensajes de error mostrados por los componentes y una función para realizar la traducción.
  Para añadir un nuevo idioma se tendrán que hacer estos pasos:
  - crear una nueva constante de tipo array con todas las traducciones
  - añadir el nuevo idioma al conjunto GMConstants.TLang
  - modificar la función GetTranslateText añadiendo el nuevo idioma del conjunto

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit Lang;

interface

uses
  GMConstants;

const
  {*------------------------------------------------------------------------------
    Array with messages in Spanish
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en español
  -------------------------------------------------------------------------------}
  Lang_ESP: array[0..15] of string = (
      'No se ha especificado el objeto WebBrowser',    // 0
      'Página inicial aun no cargada',      // 1
      'El mapa todavía no ha sido creado',  // 2
      'No está activo',                     // 3
      'No se ha podido cargar el recurso',  // 4
      'Este objeto no tiene relación en JavaScript',  // 5
      'Id de JavaScript incorrecto',        // 6
      'Id de JavaScript inexistente',       // 7
      'Número de parámetros incorrecto',    // 8
      'Tipo de parámetro incorrecto',       // 9
      'Valor de parámetro incorrecto',      // 10
      'Índice fuera de rango',              // 11
      'Mapa no asignado',                   // 12
      'El fichero no existe',               // 13
      'El número de columna es incorrecto', // 14
      'Campo "%s" no encontrado en la tabla.' // 15
      );

  {*------------------------------------------------------------------------------
    Array with messages in English
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en inglés
  -------------------------------------------------------------------------------}
  Lang_ENG: array[0..15] of string = (
      'WebBrowser not defined',             // 0
      'Initial page not loaded',            // 1
      'The map is not yet created',         // 2
      'Not active',                         // 3
      'Can''t load resource',               // 4
      'This object has no relation in JavaScript', // 5
      'Id from JavaScript incorrect',       // 6
      'JavaScript Id does not exist',       // 7
      'Incorrect number of parameters',     // 8
      'Incorrect type parameter',           // 9
      'Incorrect value parameter',          // 10
      'Index out of range',                 // 11
      'Map not assigned',                   // 12
      'File does not exist',                // 13
      'The col number is incorrect',        // 14
      'Field "%s" not found into table.'    // 15
      );

  {*------------------------------------------------------------------------------
    Array with messages in French
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en francés
  -------------------------------------------------------------------------------}
  Lang_FRE: array[0..15] of string = (
      'Navigateur Web non défini',          // 0
      'Page initiale non chargée',          // 1
      'La carte n''est pas encore créée',   // 2
      'Inactif',                            // 3
      'Impossible de charger la ressource', // 4
      'Cet object n''a pas de relation dans JavaScript', // 5
      'Id JavaScript incorrect',            // 6
      'Id JavaScript inexistant',           // 7
      'Nombre incorrecte de paramètres',    // 8
      'Type de paramètre incorrect',        // 9
      'Valeur de paramètre incorrecte',     // 10
      'Indice hors limites',                // 11
      'Carte non attribuée',                // 12
      'Le fichier n''existe pas',           // 13
      'Le numéro de colonne est incorrect', // 14
      'Champ "%s" introuvable dans la table.'// 15
      );

  {*------------------------------------------------------------------------------
    Array with messages in Brazilian Portuguese
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en portugués de Brasil
  -------------------------------------------------------------------------------}
  Lang_PTBR: array[0..15] of string = (
      'Navegador Web não definido',                // 0
      'Página inicial não foi carregada',          // 1
      'O mapa ainda não foi criado',               // 2
      'Inativo',                                   // 3
      'Não é possível carregar recursos',          // 4
      'Este objeto não tem relação em JavaScript', // 5
      'Id do JavaScript incorreto',                // 6
      'Id do JavaScript não existe',               // 7
      'Número incorreto de parâmetros',            // 8
      'Tipo de parâmetro incorreto',               // 9
      'Valor do parâmetro incorreto',              // 10
      'Índice fora do intervalo',                  // 11
      'Mapa não atribuído',                        // 12
      'O arquivo não existe',                      // 13
      'O número da coluna está errado',            // 14
      ''
      );

  {*------------------------------------------------------------------------------
    Array with messages in Danish
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en danés
  -------------------------------------------------------------------------------}
  Lang_DAN: array[0..15] of string = (
      'WebBrowser ikke defineret',                      // 0
      'Første side er ikke hentet',                     // 1
      'Kortet er ikke dannet endnu',                    // 2
      'Ikke aktiv',                                     // 3
      'Kan ikke hente ressource',                       // 4
      'Dette object har ingen relation i JavaScript',   // 5
      'Id fra JavaScript er forkert',                   // 6
      'JavaScript Id findes ikke',                      // 7
      'Forkert antal parametre',                        // 8
      'Forkert parameter type',                         // 9
      'Forkert værdi parameter',                        // 10
      'Index uden for område',                          // 11
      'Kort ikke angivet',                              // 12
      'Filen findes ikke',                              // 13
      'Antal kolonner er forkert',                      // 14
      ''
      );

  {*------------------------------------------------------------------------------
    Array with messages in German
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en alemán
  -------------------------------------------------------------------------------}
  Lang_GER: array[0..15] of string = (
      'Webbrowser nicht definiert',                      // 0
      'Initialisierungswebseite nicht geladen',          // 1
      'Die Karte wurde noch nicht erzeugt',              // 2
      'Nicht aktiv',                                     // 3
      'Kann die Resourcen nicht laden',                  // 4
      'Dieses Objekt hat in JavaScript keine Zuordnung', // 5
      'ID in JavaScript ungültig',                       // 6
      'JavaScript ID existiert nicht',                   // 7
      'Anzahl der Parameter ungültig',                   // 8
      'Nicht korrketer Parametertyp',                    // 9
      'Ungültiger Wert im Parameter',                    // 10
      'Index ausserhalb des zulässigen Bereichs',        // 11
      'Karte nich zugewiesen',                           // 12
      'Datei existiert nicht',                           // 13
      'Die Spaltennummer ist ungültig',                  // 14
      ''
      );

  {*------------------------------------------------------------------------------
    Array with messages in Russian
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en ruso
  -------------------------------------------------------------------------------}
  Lang_RUS: array[0..15] of string = (
      'WebBrowser не определен',            // 0
      'Начальная страница не загружается',  // 1
      'Карта еще не создана',               // 2
      'Не активно',                         // 3
      'Не могу загрузить ресурс',           // 4
      'Этот объект не JavaScript',          // 5
      'Id из JavaScript неверно',           // 6
      'JavaScript Id не существует',        // 7
      'Неверное количество параметров',     // 8
      'Неверный Тип параметра',             // 9
      'Неверное значение параметра',        // 10
      'Выход за границы индекса',           // 11
      'Карта не присвоен на уровне',        // 12
      'Файл не существует',                 // 13
      'Неверный номер столбца',             // 14
      'Поле "%s" не найден в таблице.'      // 15
      );

  {*------------------------------------------------------------------------------
    Array with messages in Hungarian
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en Húngaro
  -------------------------------------------------------------------------------}
  Lang_HUN: array[0..15] of string = (
      'WebBrowser nincs definiálva',                        // 0
      'A kezdő oldal nincs betöltve',                       // 1
      'A térkép még nem jött létre',                        // 2
      'Nem aktív',                                          // 3
      'Nem lehet betölteni az erőforrást',                  // 4
      'Ennek az objektumnak nincs JavaScript hivatkozása',  // 5
      'Érvénytelen JavaScript Id',                          // 6
      'A JavaScript Id nem létezik',                        // 7
      'Érvénytelen számú paraméter',                        // 8
      'Érvénytelen paraméter típus',                        // 9
      'Érvénytelen paraméter érték',                        // 10
      'Tartományon kívüli index érték',                     // 11
      'Nincs térkép kapcsolva',                             // 12
      'A fájl nem létezik',                                 // 13
      'Hibás oszlop szám',                                  // 14
      ''
      );

  {*------------------------------------------------------------------------------
    Array with messages in Italian
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en Italiano
  -------------------------------------------------------------------------------}
  Lang_ITA: array[0..15] of string = (
      'WebBrowser non definito',                              // 0
      'La pagina iniziziale non è stata caricata',            // 1
      'La mappa non è ancora creata',                         // 2
      'Non attivo',                                           // 3
      'Impossibile caricare la risorsa',                      // 4
      'Questo oggetto non ha alcuna relazione in JavaScript', // 5
      'Id da JavaScript non corretto',                        // 6
      'Id da JavaScript inesistente',                         // 7
      'Numero errato di parametri',                           // 8
      'Tipo di parametro errato',                             // 9
      'Valore del parametro errato',                          // 10
      'Indice fuori intervallo',                              // 11
      'Mappa non assegnata',                                  // 12
      'Il file non esiste',                                   // 13
      'Il numero di colonna è errato',                        // 14
      ''
      );

  {*------------------------------------------------------------------------------
    GetTranslateText fucntion retrieves a translated string into the Lang language
    @param Text string to translate
    @param Lang destination language
    @return translated string
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    La función GetTranslateText devuelve una cadena traducida al idioma Lang
    @param Text cadena a traducir
    @param Lang lenguaje destino
    @return cadena traducida
  -------------------------------------------------------------------------------}
  function GetTranslateText(Text: string; Lang: TLang): string;

implementation

{ TLanguage }

function GetTranslateText(Text: string; Lang: TLang): string;
  function GetIndex(Text: string): Integer;
  begin
    Result := 0;
    while Result <= High(Lang_ESP) do
    begin
      if Text = Lang_ESP[Result] then Break;
      Inc(Result);
    end;
    if Result > High(Lang_ESP) then Result := -1;
  end;
var
  Idx: Integer;
begin
  Idx := GetIndex(Text);
  if Idx = -1 then Result := Text
  else
  begin
    case Lang of
      English: Result := Lang_ENG[Idx];
      French: Result := Lang_FRE[Idx];
      PortuguesBR: Result := Lang_PTBR[Idx];
      Danish: Result := Lang_DAN[Idx];
      German: Result := Lang_GER[Idx];
      Russian: Result := Lang_RUS[GetIndex(Text)];
      Hungarian: Result := Lang_HUN[GetIndex(Text)];
      Italian: Result := Lang_ITA[GetIndex(Text)];
      else Result := Text;
    end;
    if Result = '' then Result := Text;
  end;
end;

end.
