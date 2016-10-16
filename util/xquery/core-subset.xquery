declare variable $core-titles := ('Dubliners', 'Mrs Dalloway', 'The Sun Also Rises', 'Pointed Roofs', 'Sparkenbrooke');

let $borrowers := distinct-values(//row[regularized_title = $core-titles]/borrowerid)
let $borrowed-books :=
for $borrower in $borrowers
return //row[borrowerid = $borrower]/regularized_title

return
    <core-data>
        <core-borrowers count="{count($borrowers)}">
            { for $b in $borrowers order by $b return <borrower count="{count(//row[borrowerid = $b])}">{$b}</borrower> }
        </core-borrowers>
        
        <core-titles count="{count(distinct-values($borrowed-books))}">
            { for $b in distinct-values($borrowed-books) order by $b return <book>{$b}</book> }
        </core-titles>
    </core-data>