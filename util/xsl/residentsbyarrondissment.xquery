declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace local="mep.princeton.edu";

declare function local:addresses-to-csv($addresses)
{
    for $address in $addresses
    let $lastName := $address/ancestor::tei:person/tei:persName/tei:surname/text()
    let $street   := $address/tei:street/text()
    let $postCode := $address/tei:postCode/text()
    let $geo      := concat("&quot;" , $address/ancestor::tei:residence[1]/tei:geo/text(), "&quot;")
    return concat(string-join(($lastName, $postCode, $street, $geo), ','), codepoints-to-string(10))
};
    
    let $sixteenth := ('75016', '75116')
    let $lq-odeon := ('75005', '75006')
    
    let $sixteenth-residents := //tei:address[tei:postCode = $sixteenth]
    let $lq-residents := //tei:address[tei:postCode = $lq-odeon]
    
    let $header := concat(string-join(("LastName", "postCode", "street", "geo"), ','), codepoints-to-string(10))
    
    return
    ($header, local:addresses-to-csv($sixteenth-residents),
    local:addresses-to-csv($lq-residents))