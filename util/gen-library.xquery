xquery version "3.0";

declare namespace tei = "http://www.tei-c.org/ns/1.0";

let $bibls :=
for $titleid in distinct-values(/root/row/titleid)
let $title := xs:string(/root/row[titleid = $titleid][1]/regularized_title)
order by $title
return
    <bibl xmlns="http://www.tei-c.org/ns/1.0" xml:id="{$titleid}">
        <title>{$title}</title>
    </bibl>

return
    <TEI
        xmlns="http://www.tei-c.org/ns/1.0">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>Title</title>
                </titleStmt>
                <publicationStmt>
                    <p>Publication Information</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Information about the source</p>
                </sourceDesc>
            </fileDesc>
        </teiHeader>
        <text>
            <body>
                <listBibl>
                { $bibls }
                </listBibl>
            </body>
        </text>
    </TEI>
