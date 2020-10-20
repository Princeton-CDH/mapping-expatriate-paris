(: 
XQuery to find <bibl> entries with a corresp attribute that are not contained in a borrowing event.
Generates CSV output of filename, MEP id, book title, book author.
:)

declare namespace tei="http://www.tei-c.org/ns/1.0";

(: path is relative to file location in utils/xquery :) 
for $book in collection('../../transcriptions/cards?select=*.xml;recurse=yes')//tei:bibl[@corresp][not(parent::tei:ab[@ana="#borrowingEvent"])]
let $filename := base-uri($book/node()[1])
return concat(escape-html-uri(string-join(($filename,
                                          $book/@corresp,
                                          normalize-space($book/tei:title)
                                          ),
                                        ",")
                             ),
             codepoints-to-string(10))
             