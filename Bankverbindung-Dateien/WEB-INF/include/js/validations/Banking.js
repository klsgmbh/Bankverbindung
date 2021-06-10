// $Revision: 28646 $

// isValidBIC: Liefert true, wenn die BIC lexikalisch plausibel ist.

function isValidBIC(value) {
    if (!(value && value.match)) {
        return false;
    }
    // siehe: https://de.wikipedia.org/wiki/ISO_9362#Aufbau
    // $1 Bank, $2 Land, $3 Ort, $4 Filiale
    return !!value.match(/^([A-Z]{4})([A-Z]{2})([A-Z2-9]{1}[A-NP-Z0-9]{1})([A-WYZ0-9][A-Z0-9]{2}|XXX)?$/);
}

// isValidIBAN: Liefert true, wenn die IBAN lexikalisch plausibel ist und die Pruefsumme stimmt.

// Prueft NICHT,
// - ob das Laenderkuerzel existiert,
// - ob die Laenge/Konstruktion der IBAN fuer das betreffende Land plausibel ist,
// - ob die Bankleitzahl dort existiert oder
// - ob die Kontonummer eine Pruefsumme enthaelt und diese fuer die betreffende Bank plausibel ist.

function isValidIBAN(value) {

    function transformLetters(string) { // replaces "A" with "10", "B" with "11" etc.
        var offset = 10 - "A".charCodeAt(0);
        var result = "";
        for (var i = 0; i < string.length; i++) {
            var c = string[i];
            if ("A" <= c && c <= "Z") {
                result += (c.charCodeAt(0) + offset).toString();
            } else {
                result += c;
            }
        }
        return result;
    }

    function hasValidChecksum(string) {
        var src = transformLetters(string.substr(4) + string.substr(0, 4));
        var wrk = src.substr(0, 1);
        var n = 0;

        for (var i = 1; i < src.length; i += 8) {
            wrk = wrk + src.substr(i, 8);
            n = parseInt(wrk, 10) % 97;
            wrk = n.toString();
        }

        return n == 1;
    }

    if (!(value && value.match)) {
        return false;
    }
    if (!value.match(/^([A-Z]{2})([0-9]{2})([A-Z0-9]{11,30})$/)) {
        return false;
    }

    return hasValidChecksum(value);
}
