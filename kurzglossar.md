% Kurzglossar Linked Data

*Dieses Kurzglossar wurde ursprünglich von Jakob Voß erstellt. Es steht ebenso
wie das [Glossar zu Linked Open Data in Bibliotheken](https://github.com/dini-ag-kim/glossar)
als [CC0] zur Verfügung.*

# Allgemeines

Linked Data
  : basiert auf der Bereitstellung von _RDF-Daten_ unter _HTTP-URIs_ und ggf.
    _SPARQL_.

Open Data
  : bezeichnet die Weitergabe von Daten zur freien Nutzung. explizit kann die
    freie Nutzung durch die Lizenz [CC0] ausgedrückt werden, unter Umständen
    auch [CC-BY] oder [CC-BY-SA].

Linked Open Data (LOD)
  : bezeichnet die Bereitstellung von frei nutzbaren Daten (_Open Data_) als
    _Linked Data_.

# Grundlagen

HTTP-URI
  : ist eine URI in Form einer URL, die als dauerhafter Identifikator 
    ("[cool uri](http://www.w3.org/provider/style/uri)“) für eine _Ressource_
    angelegt ist. Die Anforderung nach Dauerhaftigkeit und Eindeutigkeit geht 
    teilweise über normale [Permalinks](http://de.wikipedia.org/wiki/Permanentlink)
    hinaus.

Uniform Resource Identifier (URI) 
  : dienen zur eindeutigen Referenzierung von _Ressourcen_. Gleiche URIs 
    müssen immer auf die gleiche Ressource verweisen (Persistenz) und es 
    sollten möglichst keine neuen URIs für Ressourcen mit vorhandenen URIs
    geschaffen werden.

Ressource 
  : kann jedes beliebige Objekte oder Konzept sein das mittels _RDF-Daten_ 
    beschrieben werden soll. Ressourcen sollten möglichst eine oder wenige 
    verschiedene _URIs_ haben. Ist keine URI bekannt, muss mit einem 
    _Blank Node_ darauf verwiesen werden. Verweisen mehrere URIs auf die 
    gleiche Ressource, sollten die URIs mit dem _Prädikat_ `owl:sameAs` 
    untereinander verknüpft werden.

Namensraum 
  : (auch **Präfix**) zur Abkürzung einer _URI_. Beispielsweise steht 
    `foaf:Person` für die uri `http://xmlns.com/foaf/0.1/Person` wenn `foaf` 
    als Präfix für den Namensraum `http://xmlns.com/foaf/0.1/` festgelegt 
    wurde. unter [prefix.cc](http://prefix.cc) können bekannte 
    Namensraum-Präfixe von _Ontologien_ nachgeschlagen werden.

# RDF-Modell

RDF-Daten 
  : (auch **RDF-Graphen*) sind Daten, die dem Resource Description Framework 
    entsprechen. Das heisst, dass die Daten aus einer Menge von _Tripeln_ 
    bestehen, die in einer beliebigen _RDF-Serialisierung_ ausgedrückt sind.
    Die Tripel werden als gerichtete Kanten eines Graphen aufgefasst. 
    Verschiedene RDF-Graphen lassen sich dank der _Open World Assumption_
    in jedem Fall zusammenführen.

Tripel 
  : (auch **Aussage**) Grundeinheit von RDF-Daten bestehend aus einem
    _Subjekt_, einem _Prädikat_ und einem _Objekt_.

Subjekt 
  : eines _Tripels_ kann ein _URI_ oder ein _Blank Node_ sein.

Prädikat 
  : (auch **property**) eines _Tripels_ ist eine URI, die die Art der 
    Verknüpfung zwischen _Subjekt_ und _Prädikat_ angibt. Häufig verwendete 
    Prädikate sind in _Ontologien_ zusammengefasst.

Objekt 
  : eines _Tripels_ kann ein _URI_, ein _Blank Node_ oder ein _Literal_ sein.

Literale 
  : sind Unicode-Zeichenketten, die optional mit einem eine _Datentyp_ oder 
    einem _Sprachcode_ markiert sind.

Datentypen 
  : sind _URI_s, die angeben, dass ein _Literal_ aus einer definierten Menge 
    von Werten stammt, z.B. `xsd:integer` für den Wertebereich 
    (... `-2`, `-1`, `0`, `1` ...). In den meisten Fällen sollten sich 
    Datentypen auf die [Standard-Datentypen aus XML-Schema](http://www.w3.org/TR/xmlschema-2/#built-in-datatypes)
    beschränken.

Sprachcode 
  : Kürzel zur Identifikation einer Sprache oder eines Dialekts. Sprachcodes
    müssen dem Standard [RFC 3066](http://tools.ietf.org/html/rfc3066) bzw.
    [BCP 47](http://tools.ietf.org/html/bcp47) entsprechen (`de`, `en`, `en-US`, `fr` ...).

Blank Nodes 
  : stehen in _RDF-Daten_ für _Ressourcen_ für die keine bekannte _URI_ vorliegt.
    Wenn möglicht sollten Blank Nodes vermieden werden, da sie sich nicht 
    automatisch zusammenführen lassen und so die Nutzbarkeit von RDF-Daten 
    einschränken.

# Technik

RDF-Serialisierung 
  : konkretes Datenformat, in dem die _Tripel_ eines _RDF-Graphen_ ausgedrückt 
    werden können. Übliche Serialisierungen sind _RDF/XML_, _N-Triples_,
    _RDF/JSON_ und _Turtle_, wobei [Turtle](http://www.w3.org/TeamSubmission/turtle/)
    die am Besten lesbare Darstellung bietet. Grundsätzlich sind die Formate
    beliebig miteinander austauschbar.

SPARQL 
  : Abfragesprache für _RDF-Daten_. Mit SPARQL lassen sich beispielsweise in 
    einem _Tripel-Store_ Teilgraphen finden, die eine vorgegebene Struktur 
    aufweisen.

Tripel-Store 
  : zur Speicherung und Verwaltung von _RDF-Daten_ optimierte Datenbank.

# Semantik

Ontologie 
  : (auch *Vokabular*) dokumentierte Sammlung von _URIs_ und _Regeln_ zur Verwendung
    in _RDF-Daten_. Die meisten Ontologien konzentrieren sich auf eine spezielle Art 
    von _Ressourcen_, z.B. auf Personen (FOAF) oder Normdaten (SKOS, MADS) für die 
    sie URIs für _Prädikate_ und _Klassen_ und ggf. _Datentypen_ definieren.
    Durch die Verwendung gemeinsamer Ontologien und durch Mappings zwischen Ontologien
    lassen sich _RDF-Daten_ aus verschiedenen Quellen besser zusammenführen. 
    Eine Übersicht häufig verwendeter Ontologien [gibt es hier](http://labs.mondeca.com/dataset/lov/).

Klasse 
  : _Ressource_ bzw. _URI_ einer Ressource zum Zusammenfassen von Ressourcen
    einer Art oder eines Typs. Beispielsweise steht die Klasse `foaf:Person`
    für die Klasse aller Personen nach Definition der FOAF-_Ontologie_. Zur
    Angabe der Klasse einer Ressource dient das _Prädikat_ `rdf:type` (in 
    _Turtle_ mit `a` abgekürzt). So drückt beispielsweise das _Tripel_
    `http://example.org a foaf:Person` aus, dass die mit
    `http://example.org` identifizierte Ressource eine (FOAF-)Person ist.

Regeln
  : formallogische Angaben zur Schlussfolgerung (Inferenz) und Konsistenzprüfung
    (Validierung) von _RDF-Daten_. Die meisten _Ontologien_ beinhalten zumindest
    implizit solche Regeln, z.B. um aus der Verwendung eines _Prädikat_ auf die 
    Zugehörigkeit einer _Ressource_ zu einer _Klasse_ zu schließen. 
    Zusammengehörige Regeln werden auch als **Entailment-Regime** bezeichnet. 
    Da die Auswertung von RDF-Regeln sehr aufwändig sein kann, ist nicht 
    allgemein festgelegt, wann welches Entailment-Regime angewandt wird.

Open World Assumption (OWA) 
  : Grundannahme bei der Interpretation von _RDF-Daten_. Sie besagt, dass das 
    Nicht-Vorhandensein eines _Tripels_ nicht bedeutet, dass dessen Aussage 
    unmöglich oder unwahr ist. Steht beispielsweise in _RDF-Daten_ das Tripel
    `http://example.org a foaf:Person` ist damit nicht ausgeschlossen, dass
    `http://example.org` gleichzeitg etwas ganz anderes als eine Person ist.
    Grundsätzlich können _Ressourcen_ beliebig miteinander über Tripel 
    verknüpft werden, selbst wenn dies zu (vermeindlichen) Widersprüchen
    führt. Eine Beschränkung der OWA ist teilweise durch _Regeln_ möglich.

[CC0]: http://creativecommons.org/publicdomain/zero/1.0/deed.de
[CC-BY]: http://creativecommons.org/licenses/by/2.0/de/
[CC-BY-SA]: http://creativecommons.org/licenses/by-sa/2.0/de/


